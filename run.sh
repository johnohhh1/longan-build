docker run --privileged -it \
    --hostname android \
    -v /media:/media \
    -v /etc/localtime:/etc/localtime \
    longanpi/build-env:ubuntu20.04 /bin/bash
