# Documentation

## Requirements

- Docker - for running all the images
- Postman - to test api endpoints
- Java 17 - to run our apps inside jar files
- Make - to run commands inside Makefile with simple `make all` and/or `make clean`

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

### Note

My machine is Ubuntu 24.04, if you're using a different machine, you should change some configurations
Inside the `Makefile` you should remove `--network="host"` line, since it works on Linux only
Also, inside the `nginx.conf` you should uncomment upstreams for Windows/macOS and comment Linux ones
(All of this is specified using comments)

