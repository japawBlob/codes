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
CMAKE_SOURCE_DIR = /mnt/c/Codes/PDV/tutorial_01

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/Codes/PDV/tutorial_01

# Utility rule file for false_sharing.

# Include the progress variables for this target.
include CMakeFiles/false_sharing.dir/progress.make

CMakeFiles/false_sharing: false_sharing.bin
	./false_sharing.bin

false_sharing: CMakeFiles/false_sharing
false_sharing: CMakeFiles/false_sharing.dir/build.make

.PHONY : false_sharing

# Rule to build all files generated by this target.
CMakeFiles/false_sharing.dir/build: false_sharing

.PHONY : CMakeFiles/false_sharing.dir/build

CMakeFiles/false_sharing.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/false_sharing.dir/cmake_clean.cmake
.PHONY : CMakeFiles/false_sharing.dir/clean

CMakeFiles/false_sharing.dir/depend:
	cd /mnt/c/Codes/PDV/tutorial_01 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Codes/PDV/tutorial_01 /mnt/c/Codes/PDV/tutorial_01 /mnt/c/Codes/PDV/tutorial_01 /mnt/c/Codes/PDV/tutorial_01 /mnt/c/Codes/PDV/tutorial_01/CMakeFiles/false_sharing.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/false_sharing.dir/depend

