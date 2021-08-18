# The Ur-Quan Masters CMake project

This branch contains an experimental CMake build system for _The Ur-Quan Masters_. It also contains some minor portability bugfixes, optional package management using [vcpkg](https://github.com/microsoft/vcpkg), and a GitHub Actions CI system.

## Building

In general, to configure the build system:

```
cmake -S [uqm_project_root] -B [output_dir]
```

To build the project after configuring:

```
cmake --build [output_dir]
```

### MSYS2 Windows Build

To build a Windows build in a way equivalent to the original build system's
MSYS2 instructions, with the same toolchain (but with CMake and Ninja),
follow these steps.

Start with the instructions from sc2/INSTALL, except instead of the listed
MSYS2 packages, install:

```
pacman -S cmake ninja pkg-config mingw-w64-i686-gcc mingw-w64-i686-libogg \
          mingw-w64-i686-libpng mingw-w64-i686-libsystre \
          mingw-w64-i686-libvorbis mingw-w64-i686-SDL2 mingw-w64-i686-zlib
```

Then, instead of running build.sh, in a MSYS2 MinGW32 shell, run the
following from the UQM project root (the same directory as this file):

```
cmake --preset uqm-msys2-mingw32-release
cmake --build --preset uqm-msys2-mingw32-release
```

TODO: Windows installer instructions
## Advanced Configuration

TODO
