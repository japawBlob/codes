# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/c/Codes/PDV/openmp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/Codes/PDV/openmp

# Utility rule file for hw.

# Include the progress variables for this target.
include CMakeFiles/hw.dir/progress.make

CMakeFiles/hw: hw.bin
	./hw.bin

hw: CMakeFiles/hw
hw: CMakeFiles/hw.dir/build.make

.PHONY : hw

# Rule to build all files generated by this target.
CMakeFiles/hw.dir/build: hw

.PHONY : CMakeFiles/hw.dir/build

CMakeFiles/hw.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/hw.dir/cmake_clean.cmake
.PHONY : CMakeFiles/hw.dir/clean

CMakeFiles/hw.dir/depend:
	cd /mnt/c/Codes/PDV/openmp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Codes/PDV/openmp /mnt/c/Codes/PDV/openmp /mnt/c/Codes/PDV/openmp /mnt/c/Codes/PDV/openmp /mnt/c/Codes/PDV/openmp/CMakeFiles/hw.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/hw.dir/depend

