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
CMAKE_SOURCE_DIR = /mnt/c/Codes/PDV/tutorial_04

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/Codes/PDV/tutorial_04

# Include any dependencies generated for this target.
include CMakeFiles/main.bin.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/main.bin.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/main.bin.dir/flags.make

CMakeFiles/main.bin.dir/main.cpp.o: CMakeFiles/main.bin.dir/flags.make
CMakeFiles/main.bin.dir/main.cpp.o: main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Codes/PDV/tutorial_04/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/main.bin.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.bin.dir/main.cpp.o -c /mnt/c/Codes/PDV/tutorial_04/main.cpp

CMakeFiles/main.bin.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.bin.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Codes/PDV/tutorial_04/main.cpp > CMakeFiles/main.bin.dir/main.cpp.i

CMakeFiles/main.bin.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.bin.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Codes/PDV/tutorial_04/main.cpp -o CMakeFiles/main.bin.dir/main.cpp.s

CMakeFiles/main.bin.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/main.bin.dir/main.cpp.o.requires

CMakeFiles/main.bin.dir/main.cpp.o.provides: CMakeFiles/main.bin.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/main.bin.dir/build.make CMakeFiles/main.bin.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/main.bin.dir/main.cpp.o.provides

CMakeFiles/main.bin.dir/main.cpp.o.provides.build: CMakeFiles/main.bin.dir/main.cpp.o


# Object files for target main.bin
main_bin_OBJECTS = \
"CMakeFiles/main.bin.dir/main.cpp.o"

# External object files for target main.bin
main_bin_EXTERNAL_OBJECTS =

main.bin: CMakeFiles/main.bin.dir/main.cpp.o
main.bin: CMakeFiles/main.bin.dir/build.make
main.bin: CMakeFiles/main.bin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Codes/PDV/tutorial_04/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable main.bin"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/main.bin.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/main.bin.dir/build: main.bin

.PHONY : CMakeFiles/main.bin.dir/build

CMakeFiles/main.bin.dir/requires: CMakeFiles/main.bin.dir/main.cpp.o.requires

.PHONY : CMakeFiles/main.bin.dir/requires

CMakeFiles/main.bin.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/main.bin.dir/cmake_clean.cmake
.PHONY : CMakeFiles/main.bin.dir/clean

CMakeFiles/main.bin.dir/depend:
	cd /mnt/c/Codes/PDV/tutorial_04 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Codes/PDV/tutorial_04 /mnt/c/Codes/PDV/tutorial_04 /mnt/c/Codes/PDV/tutorial_04 /mnt/c/Codes/PDV/tutorial_04 /mnt/c/Codes/PDV/tutorial_04/CMakeFiles/main.bin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/main.bin.dir/depend

