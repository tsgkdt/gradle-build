# gradle-build

## how to use

### print gradle version

```
docuker run --rm tsgkadot/gradle-build:latest gradle -v
```

console output

```
------------------------------------------------------------
Gradle 4.0
------------------------------------------------------------

Build time:   2017-06-14 15:11:08 UTC
Revision:     316546a5fcb4e2dfe1d6aa0b73a4e09e8cecb5a5

Groovy:       2.4.11
Ant:          Apache Ant(TM) version 1.9.6 compiled on June 29 2015
JVM:          1.8.0_131 (Oracle Corporation 25.131-b11)
OS:           Linux 4.8.0-39-generic amd64
```

### mount host dir & gradle task

- build.gradle file is in Docker host directory. (ex $pwd)
- use volume mount  `-v` option.
- specify setting file path and call gradle tasks. (ex taskname=hello)

```
docker run --rm -v $(pwd):/tmp_dir tsgkadot/gradle-build:latest gradle -b /tmp_dir/build.gradle -q hello
```

## Using in gitlab-ci

examples.

```yaml
build_job:
  image: tsgkadot/gradle-build:latest
  stage: build
  only:
    - master
  script:
    - cd target_dir
    - gradle build
  artifacts:
    expire_in: 1 week
    paths:
      - target_dir/*.*
  tags:
    - docker

```