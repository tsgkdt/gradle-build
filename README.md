# gradle-build

## how to use

### print gradle version

```
docuker run --rm tsgkadot/gradle-build:latest gradle -v
```

console output

```
Welcome to Gradle 4.8!

Here are the highlights of this release:
 - Dependency locking
 - Maven Publish and Ivy Publish plugins improved and marked stable
 - Incremental annotation processing enhancements
 - APIs to configure tasks at creation time

For more details see https://docs.gradle.org/4.8/release-notes.html


------------------------------------------------------------
Gradle 4.8
------------------------------------------------------------

Build time:   2018-06-04 10:39:58 UTC
Revision:     9e1261240e412cbf61a5e3a5ab734f232b2f887d

Groovy:       2.4.12
Ant:          Apache Ant(TM) version 1.9.11 compiled on March 23 2018
JVM:          1.8.0_151 (Oracle Corporation 25.151-b12)
OS:           Linux 4.10.0-37-generic amd64

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