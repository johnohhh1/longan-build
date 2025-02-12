# Longan Pi Android BSP Build Environment

This Docker environment provides all necessary tools and dependencies to build Android BSP for the Longan Pi board with Allwinner H618 SoC.

## Prerequisites

- Docker installed on your system
- Git
- At least 100GB of free disk space
- Ubuntu 20.04 or later recommended as host OS

## Quick Start

### Building the Docker Image

```bash
docker build -t longanpi/build-env:ubuntu20.04 \
    --build-arg USER_ID=$(id -u) \
    --build-arg GROUP_ID=$(id -g) .
```

### Running the Container

```bash
docker run --privileged -it \
    --hostname android \
    -v /media:/media \
    -v /etc/localtime:/etc/localtime \
    longanpi/build-env:ubuntu20.04 /bin/bash
```

## Features

- Ubuntu 20.04 base image
- Pre-installed development tools and dependencies
- ARM cross-compilation toolchain
- Android build tools
- Proper permissions setup with user 'longanpi'

## Included Tools & Dependencies

- Java Development Kit 8
- Python 3 with necessary packages
- Git and version control tools
- Build essentials and compilers
- ARM cross-compilation tools
- Android development utilities
- Various system utilities

## Directory Structure

When running the container:
- `/media`: Mounted from host for external device access
- System time synced with host

## Building Android BSP

Once inside the container, you can proceed with the standard Android BSP build process for Longan Pi.

## Troubleshooting

1. If you encounter permission issues, make sure to build the image with your current user's UID and GID
2. For USB device access issues, verify that the container is running with the --privileged flag

## Support

For issues and questions, please open a ticket in the GitHub repository.

## License

[Your License Here]
