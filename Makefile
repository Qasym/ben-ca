MONGODB_IMAGE = mongodb/mongodb-community-server:7.0.14
MONGODB_DEFAULT_PORT = 27017

REWARDS_DB = rewards_db
REWARDS_DB_PORT = 27001

QUESTS_DB = quests_db
QUESTS_DB_PORT = 27002

USERS_DB = users_db
USERS_DB_PORT = 27003

prepare_users_db:
	docker run -d -p $(USERS_DB_PORT):$(MONGODB_DEFAULT_PORT) --name $(USERS_DB) $(MONGODB_IMAGE)

prepare_quests_db:
	docker run -d -p $(QUESTS_DB_PORT):$(MONGODB_DEFAULT_PORT) --name $(QUESTS_DB) $(MONGODB_IMAGE)

prepare_rewards_db:
	docker run -d -p $(REWARDS_DB_PORT):$(MONGODB_DEFAULT_PORT) --name $(REWARDS_DB) $(MONGODB_IMAGE)

clean:
	docker stop $(REWARDS_DB) $(QUESTS_DB) $(USERS_DB)
	docker rm $(REWARDS_DB) $(QUESTS_DB) $(USERS_DB)