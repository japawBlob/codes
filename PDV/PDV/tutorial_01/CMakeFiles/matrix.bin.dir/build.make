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

# Include any dependencies generated for this target.
include CMakeFiles/matrix.bin.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/matrix.bin.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/matrix.bin.dir/flags.make

CMakeFiles/matrix.bin.dir/matrix.cpp.o: CMakeFiles/matrix.bin.dir/flags.make
CMakeFiles/matrix.bin.dir/matrix.cpp.o: matrix.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Codes/PDV/tutorial_01/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/matrix.bin.dir/matrix.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/matrix.bin.dir/matrix.cpp.o -c /mnt/c/Codes/PDV/tutorial_01/matrix.cpp

CMakeFiles/matrix.bin.dir/matrix.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/matrix.bin.dir/matrix.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Codes/PDV/tutorial_01/matrix.cpp > CMakeFiles/matrix.bin.dir/matrix.cpp.i

CMakeFiles/matrix.bin.dir/matrix.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/matrix.bin.dir/matrix.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Codes/PDV/tutorial_01/matrix.cpp -o CMakeFiles/matrix.bin.dir/matrix.cpp.s

CMakeFiles/matrix.bin.dir/matrix.cpp.o.requires:

.PHONY : CMakeFiles/matrix.bin.dir/matrix.cpp.o.requires

CMakeFiles/matrix.bin.dir/matrix.cpp.o.provides: CMakeFiles/matrix.bin.dir/matrix.cpp.o.requires
	$(MAKE) -f CMakeFiles/matrix.bin.dir/build.make CMakeFiles/matrix.bin.dir/matrix.cpp.o.provides.build
.PHONY : CMakeFiles/matrix.bin.dir/matrix.cpp.o.provides

CMakeFiles/matrix.bin.dir/matrix.cpp.o.provides.build: CMakeFiles/matrix.bin.dir/matrix.cpp.o


# Object files for target matrix.bin
matrix_bin_OBJECTS = \
"CMakeFiles/matrix.bin.dir/matrix.cpp.o"

# External object files for target matrix.bin
matrix_bin_EXTERNAL_OBJECTS =

matrix.bin: CMakeFiles/matrix.bin.dir/matrix.cpp.o
matrix.bin: CMakeFiles/matrix.bin.dir/build.make
matrix.bin: CMakeFiles/matrix.bin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Codes/PDV/tutorial_01/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable matrix.bin"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/matrix.bin.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/matrix.bin.dir/build: matrix.bin

.PHONY : CMakeFiles/matrix.bin.dir/build

CMakeFiles/matrix.bin.dir/requires: CMakeFiles/matrix.bin.dir/matrix.cpp.o.requires

.PHONY : CMakeFiles/matrix.bin.dir/requires

CMakeFiles/matrix.bin.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/matrix.bin.dir/cmake_clean.cmake
.PHONY : CMakeFiles/matrix.bin.dir/clean

CMakeFiles/matrix.bin.dir/depend:
	cd /mnt/c/Codes/PDV/tutorial_01 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Codes/PDV/tutorial_01 /mnt/c/Codes/PDV/tutorial_01 /mnt/c/Codes/PDV/tutorial_01 /mnt/c/Codes/PDV/tutorial_01 /mnt/c/Codes/PDV/tutorial_01/CMakeFiles/matrix.bin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/matrix.bin.dir/depend
