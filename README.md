# libmesos
Allows running tests (or any other client software) that needs libmesos
```
docker run --rm -v /usr/bin/docker:/usr/bin/docker \
                -v /var/run/docker.sock:/var/run/docker.sock:rw \
                -v ~/.gradle/:/root/.gradle/:rw \
                -v `pwd`:/app:rw \
       containersol/libmesos clean build
```
