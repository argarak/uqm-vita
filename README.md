# The Ur-Quan Masters CMake project

This branch contains an experimental CMake build system for _The Ur-Quan Masters_. It also contains some minor portability bugfixes, optional package management using [vcpkg](https://github.com/microsoft/vcpkg), and a GitHub Actions CI system.

## Building

To configure the build system:

```
cmake -S [uqm_project_root] -B [output_dir]
```

To build the project after configuring:

```
cmake --build [output_dir]
```

## Advanced Configuration

TODO
