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
CMAKE_SOURCE_DIR = /mnt/c/codes/tutorial_07

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/codes/tutorial_07

# Include any dependencies generated for this target.
include CMakeFiles/prob.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/prob.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/prob.dir/flags.make

CMakeFiles/prob.dir/prob.cpp.o: CMakeFiles/prob.dir/flags.make
CMakeFiles/prob.dir/prob.cpp.o: prob.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/codes/tutorial_07/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/prob.dir/prob.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/prob.dir/prob.cpp.o -c /mnt/c/codes/tutorial_07/prob.cpp

CMakeFiles/prob.dir/prob.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/prob.dir/prob.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/codes/tutorial_07/prob.cpp > CMakeFiles/prob.dir/prob.cpp.i

CMakeFiles/prob.dir/prob.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/prob.dir/prob.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/codes/tutorial_07/prob.cpp -o CMakeFiles/prob.dir/prob.cpp.s

CMakeFiles/prob.dir/prob.cpp.o.requires:

.PHONY : CMakeFiles/prob.dir/prob.cpp.o.requires

CMakeFiles/prob.dir/prob.cpp.o.provides: CMakeFiles/prob.dir/prob.cpp.o.requires
	$(MAKE) -f CMakeFiles/prob.dir/build.make CMakeFiles/prob.dir/prob.cpp.o.provides.build
.PHONY : CMakeFiles/prob.dir/prob.cpp.o.provides

CMakeFiles/prob.dir/prob.cpp.o.provides.build: CMakeFiles/prob.dir/prob.cpp.o


# Object files for target prob
prob_OBJECTS = \
"CMakeFiles/prob.dir/prob.cpp.o"

# External object files for target prob
prob_EXTERNAL_OBJECTS =

prob: CMakeFiles/prob.dir/prob.cpp.o
prob: CMakeFiles/prob.dir/build.make
prob: CMakeFiles/prob.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/codes/tutorial_07/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable prob"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/prob.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/prob.dir/build: prob

.PHONY : CMakeFiles/prob.dir/build

CMakeFiles/prob.dir/requires: CMakeFiles/prob.dir/prob.cpp.o.requires

.PHONY : CMakeFiles/prob.dir/requires

CMakeFiles/prob.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/prob.dir/cmake_clean.cmake
.PHONY : CMakeFiles/prob.dir/clean

CMakeFiles/prob.dir/depend:
	cd /mnt/c/codes/tutorial_07 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/codes/tutorial_07 /mnt/c/codes/tutorial_07 /mnt/c/codes/tutorial_07 /mnt/c/codes/tutorial_07 /mnt/c/codes/tutorial_07/CMakeFiles/prob.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/prob.dir/depend

