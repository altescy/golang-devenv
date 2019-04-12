golang-devenv
---

Portable Build Environment for Golang


### Build on Docker

Docker is all you need to build an application.

You can download dependencies and build an application via:
```
$ make docker-build
```

A single binary file is created at the current directory.
You can run `./main`, and application will be started.

You can also remove the binary via:
```
$ make clean
````


### Build on local environment

If you have Golang environment on your local machine, you can also build your application via following instruction.

The command below initializes the project and downloads dependencies if `Gopkg.toml` exists.
```
$ make init
```

If you add some new dependencies, you will need:
```
$ make deps
```

Now, we'll build the application:
```
$ make
```