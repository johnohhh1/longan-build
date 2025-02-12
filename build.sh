docker build -t longanpi/build-env:ubuntu20.04 \
    --build-arg USER_ID=$(id -u) \
    --build-arg GROUP_ID=$(id -g) .
