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
include CMakeFiles/hello.bin.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/hello.bin.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/hello.bin.dir/flags.make

CMakeFiles/hello.bin.dir/hello.cpp.o: CMakeFiles/hello.bin.dir/flags.make
CMakeFiles/hello.bin.dir/hello.cpp.o: hello.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Codes/PDV/tutorial_01/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/hello.bin.dir/hello.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/hello.bin.dir/hello.cpp.o -c /mnt/c/Codes/PDV/tutorial_01/hello.cpp

CMakeFiles/hello.bin.dir/hello.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/hello.bin.dir/hello.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Codes/PDV/tutorial_01/hello.cpp > CMakeFiles/hello.bin.dir/hello.cpp.i

CMakeFiles/hello.bin.dir/hello.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/hello.bin.dir/hello.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Codes/PDV/tutorial_01/hello.cpp -o CMakeFiles/hello.bin.dir/hello.cpp.s

CMakeFiles/hello.bin.dir/hello.cpp.o.requires:

.PHONY : CMakeFiles/hello.bin.dir/hello.cpp.o.requires

CMakeFiles/hello.bin.dir/hello.cpp.o.provides: CMakeFiles/hello.bin.dir/hello.cpp.o.requires
	$(MAKE) -f CMakeFiles/hello.bin.dir/build.make CMakeFiles/hello.bin.dir/hello.cpp.o.provides.build
.PHONY : CMakeFiles/hello.bin.dir/hello.cpp.o.provides

CMakeFiles/hello.bin.dir/hello.cpp.o.provides.build: CMakeFiles/hello.bin.dir/hello.cpp.o


# Object files for target hello.bin
hello_bin_OBJECTS = \
"CMakeFiles/hello.bin.dir/hello.cpp.o"

# External object files for target hello.bin
hello_bin_EXTERNAL_OBJECTS =

hello.bin: CMakeFiles/hello.bin.dir/hello.cpp.o
hello.bin: CMakeFiles/hello.bin.dir/build.make
hello.bin: CMakeFiles/hello.bin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Codes/PDV/tutorial_01/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable hello.bin"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hello.bin.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/hello.bin.dir/build: hello.bin

.PHONY : CMakeFiles/hello.bin.dir/build

CMakeFiles/hello.bin.dir/requires: CMakeFiles/hello.bin.dir/hello.cpp.o.requires

.PHONY : CMakeFiles/hello.bin.dir/requires

CMakeFiles/hello.bin.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/hello.bin.dir/cmake_clean.cmake
.PHONY : CMakeFiles/hello.bin.dir/clean

CMakeFiles/hello.bin.dir/depend:
	cd /mnt/c/Codes/PDV/tutorial_01 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Codes/PDV/tutorial_01 /mnt/c/Codes/PDV/tutorial_01 /mnt/c/Codes/PDV/tutorial_01 /mnt/c/Codes/PDV/tutorial_01 /mnt/c/Codes/PDV/tutorial_01/CMakeFiles/hello.bin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/hello.bin.dir/depend

