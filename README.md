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

## Setting Up Inside Container

1. Go to home directory and fix permissions:
```bash
cd ~
sudo chown longanpi:longanpi /home/longanpi
```

2. Install nano:
```bash
sudo apt-get update && sudo apt-get install -y nano
```

3. Create and run setup script:
```bash
nano setup-extras.sh
# Copy the script content into nano
chmod +x setup-extras.sh
./setup-extras.sh
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
