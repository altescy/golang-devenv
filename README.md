golang-devenv
---

Portable Build Environment for Golang


### Build on Docker

Docker is all you need to build an application.

First, you need to initialize project.
This operation builds docker image and initialize dep.
```
$ make docker-init
```

You can write a program at `src/app/main.go` like this:
```go
package main

import "github.com/gin-gonic/gin"

func main() {
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})
	r.Run()
}
```

Now, we'll build this application via:
```
$ make docker
```
This command downloads dependent packages at the same time.

A single binary file is created at the current directory.
You can run `./main`, and application will be started.

If you want to remove the binary, run this:
```
$ make clean
````


### Build on local environment

If you have Golang environment on your local machine, you can also build your application via following instruction.

The command below initializes the project and downloads dependencies if `Gopkg.toml` exists.
```
$ make init
```

You can download dependencies and build an application via:
```
$ make
```


### Start with a new project

Create new project directory:
```
$ mkdir foobar; cd $_
```

Following command downloads `Makefile`, `Dockerfile` and `.gitignore`.
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/altescy/golang-devenv/master/install.sh)"
```

Initialize project via:
```
$ make docker    # on local: make
```

All requirements are installed:
```
foobar
├── Dockerfile
├── Makefile
├── pkg
│   └── dep
│       └── sources
└── src
    └── app
        ├── Gopkg.lock
        ├── Gopkg.toml
        └── vendor

```