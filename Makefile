MONGODB_IMAGE = mongodb/mongodb-community-server:7.0.14-ubi8
MONGODB_DEFAULT_PORT = 27017

NGINX_IMAGE = nginx:1.27.2-alpine-slim
NGINX = nginx-gateway

REWARDS_DB = rewards_db
REWARDS_DB_PORT = 27001
REWARDS_SERVICE = rewards-service.jar

QUESTS_DB = quests_db
QUESTS_DB_PORT = 27002
QUESTS_SERVICE = q-catalog.jar

USERS_DB = users_db
USERS_DB_PORT = 27003
USERS_SERVICE = auth-service.jar

USER_REWARDS_DB = user_rewards_db
USER_REWARDS_DB_PORT = 27004

all: activate_all_databases activate_microservices

activate_microservices:
	java -jar ./java-env/$(USERS_SERVICE) &
	java -jar ./java-env/$(REWARDS_SERVICE) &
	java -jar ./java-env/$(QUESTS_SERVICE) &

activate_all_databases: prepare_quests_db prepare_rewards_db prepare_users_db prepare_user_rewards_db prepare_api_gateway

prepare_api_gateway:
	# --network="host" is linux only, remove it on windows/macos
	docker run -d --name $(NGINX) -p 80:80 -v ./nginx.conf:/etc/nginx/nginx.conf:ro --network="host" $(NGINX_IMAGE)

prepare_users_db:
	docker run -d -p $(USERS_DB_PORT):$(MONGODB_DEFAULT_PORT) --name $(USERS_DB) $(MONGODB_IMAGE)

prepare_quests_db:
	docker run -d -p $(QUESTS_DB_PORT):$(MONGODB_DEFAULT_PORT) --name $(QUESTS_DB) $(MONGODB_IMAGE)

prepare_rewards_db:
	docker run -d -p $(REWARDS_DB_PORT):$(MONGODB_DEFAULT_PORT) --name $(REWARDS_DB) $(MONGODB_IMAGE)

prepare_user_rewards_db:
	docker run -d -p $(USER_REWARDS_DB_PORT):$(MONGODB_DEFAULT_PORT) --name $(USER_REWARDS_DB) $(MONGODB_IMAGE)

clean:
	docker stop $(REWARDS_DB) $(QUESTS_DB) $(USERS_DB) $(USER_REWARDS_DB) $(NGINX)
	docker rm $(REWARDS_DB) $(QUESTS_DB) $(USERS_DB) $(USER_REWARDS_DB) $(NGINX)
