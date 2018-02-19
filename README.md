# gradle-build

## how to use

### print gradle version

```
docuker run --rm tsgkadot/gradle-build:latest gradle -v
```

console output

```
------------------------------------------------------------
Gradle 4.5.1
------------------------------------------------------------

Build time:   2018-02-05 13:22:49 UTC
Revision:     37007e1c012001ff09973e0bd095139239ecd3b3

Groovy:       2.4.12
Ant:          Apache Ant(TM) version 1.9.9 compiled on February 2 2017
JVM:          1.8.0_151 (Oracle Corporation 25.151-b12)
OS:           Linux 4.4.0-1049-aws amd64
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