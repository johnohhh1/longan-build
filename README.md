# Longan Pi Android Build Environment

Basic Docker build environment for Longan Pi Android BSP development.

## Building and Running

1. Build the container:
```bash
docker build -t longanpi/build-env:ubuntu20.04 --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` .
```

2. Run the container:
```bash
docker run --privileged -it --hostname android -v /media:/media -v /etc/localtime:/etc/localtime longanpi/build-env:ubuntu20.04 /bin/bash
```

## Additional Tools

Once inside the container, you can install additional tools as needed:

1. Install editor and common tools:
```bash
sudo apt-get update && sudo apt-get install -y nano vim
```

2. Install ARM cross-compilation tools:
```bash
sudo apt-get install -y gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf
```

3. Install QEMU for ARM emulation (if needed):
```bash
sudo apt-get install -y qemu-user-static
```

4. Install additional development tools:
```bash
sudo apt-get install -y android-tools-adb android-tools-fastboot
```

## Mounting Additional Directories

To mount your BSP directory, add it to the run command:
```bash
docker run --privileged -it --hostname android \
    -v /media:/media \
    -v /etc/localtime:/etc/localtime \
    -v /path/to/your/bsp:/home/longanpi/bsp \
    longanpi/build-env:ubuntu20.04 /bin/bash
```
