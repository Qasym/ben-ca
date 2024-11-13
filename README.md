# Documentation

## Requirements

- Docker - for running all the images
- Postman - to test api endpoints
- Java 17 - to run our apps inside jar files
- Make - to run commands inside Makefile with simple `make all` and/or `make clean`
- MongoDB Compass - to check & edit the database

You need to pull following docker images to successfully run mircroservices
``` bash
docker pull mongodb/mongodb-community-server:7.0.14-ubi8
docker pull nginx:1.27.2-alpine-slim
```


## How to test

After installing all the necessities, you can simply run
``` bash
make all
```

This command will prepare all the database containers and will run jar files on the background

Open the MongoDB Compass and connect to ports `27001`, `27002`, `27003`, `27004`
The `Makefile` will help you if you're curios which one is which

### Note

My machine is Ubuntu 24.04, if you're using a different machine, you should change some configurations
Inside the `Makefile` you should remove `--network="host"` line, since it works on Linux only
Also, inside the `nginx.conf` you should uncomment upstreams for Windows/macOS and comment Linux ones
(All of this is specified using comments)

## Sources

1. Code for authentication management [https://github.com/Qasym/ben-ca-auth](https://github.com/Qasym/ben-ca-auth)
2. Code for quests management [https://github.com/Qasym/ben-ca-quest-catalog](https://github.com/Qasym/ben-ca-quest-catalog)
3. Code for rewards management [https://github.com/Qasym/ben-ca-rewards](https://github.com/Qasym/ben-ca-rewards)
4. Code for quest processing [https://github.com/Qasym/ben-ca-quest-processor](https://github.com/Qasym/ben-ca-quest-processor)

[This](https://ben-coding-test.postman.co/workspace/BEN---Coding-test-Workspace~a9f04117-f90d-4a4e-b862-5b0612c47404/collection/39611273-cc658b59-445e-477b-8b31-f0b92f35b124?action=share&creator=39611273) is the invite link for the Postman workspace to check the APIs

### Notes

- You should register before testing any of the APIs
- When testing the APIs, you should use your username & password (used for registration) and use login API, it will give you the Access Token
- Do not forget to set Authorization as Bearer in Postman, and put the Access Token obtained from login API
- Some of the APIs will return 403, despite you properly assigning the access token. It happens
because those very endpoints are protected 
- To remove protection, use MongoDB Compass and open up database at port 27003, find your account and change role from `USER` to `ADMIN`.
Make sure that they are all capital