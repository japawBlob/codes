# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.15

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

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2019.3.4\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2019.3.4\bin\cmake\win\bin\cmake.exe" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\FCKING_linux\PDV\sem01

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\FCKING_linux\PDV\sem01\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/search.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/search.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/search.dir/flags.make

CMakeFiles/search.dir/main.cpp.obj: CMakeFiles/search.dir/flags.make
CMakeFiles/search.dir/main.cpp.obj: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\FCKING_linux\PDV\sem01\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/search.dir/main.cpp.obj"
	C:\TDM-GCC-64\bin\g++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\search.dir\main.cpp.obj -c C:\FCKING_linux\PDV\sem01\main.cpp

CMakeFiles/search.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/search.dir/main.cpp.i"
	C:\TDM-GCC-64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\FCKING_linux\PDV\sem01\main.cpp > CMakeFiles\search.dir\main.cpp.i

CMakeFiles/search.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/search.dir/main.cpp.s"
	C:\TDM-GCC-64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\FCKING_linux\PDV\sem01\main.cpp -o CMakeFiles\search.dir\main.cpp.s

CMakeFiles/search.dir/algorithms/bfs.cpp.obj: CMakeFiles/search.dir/flags.make
CMakeFiles/search.dir/algorithms/bfs.cpp.obj: ../algorithms/bfs.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\FCKING_linux\PDV\sem01\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/search.dir/algorithms/bfs.cpp.obj"
	C:\TDM-GCC-64\bin\g++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\search.dir\algorithms\bfs.cpp.obj -c C:\FCKING_linux\PDV\sem01\algorithms\bfs.cpp

CMakeFiles/search.dir/algorithms/bfs.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/search.dir/algorithms/bfs.cpp.i"
	C:\TDM-GCC-64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\FCKING_linux\PDV\sem01\algorithms\bfs.cpp > CMakeFiles\search.dir\algorithms\bfs.cpp.i

CMakeFiles/search.dir/algorithms/bfs.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/search.dir/algorithms/bfs.cpp.s"
	C:\TDM-GCC-64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\FCKING_linux\PDV\sem01\algorithms\bfs.cpp -o CMakeFiles\search.dir\algorithms\bfs.cpp.s

CMakeFiles/search.dir/algorithms/iddfs.cpp.obj: CMakeFiles/search.dir/flags.make
CMakeFiles/search.dir/algorithms/iddfs.cpp.obj: ../algorithms/iddfs.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\FCKING_linux\PDV\sem01\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/search.dir/algorithms/iddfs.cpp.obj"
	C:\TDM-GCC-64\bin\g++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\search.dir\algorithms\iddfs.cpp.obj -c C:\FCKING_linux\PDV\sem01\algorithms\iddfs.cpp

CMakeFiles/search.dir/algorithms/iddfs.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/search.dir/algorithms/iddfs.cpp.i"
	C:\TDM-GCC-64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\FCKING_linux\PDV\sem01\algorithms\iddfs.cpp > CMakeFiles\search.dir\algorithms\iddfs.cpp.i

CMakeFiles/search.dir/algorithms/iddfs.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/search.dir/algorithms/iddfs.cpp.s"
	C:\TDM-GCC-64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\FCKING_linux\PDV\sem01\algorithms\iddfs.cpp -o CMakeFiles\search.dir\algorithms\iddfs.cpp.s

# Object files for target search
search_OBJECTS = \
"CMakeFiles/search.dir/main.cpp.obj" \
"CMakeFiles/search.dir/algorithms/bfs.cpp.obj" \
"CMakeFiles/search.dir/algorithms/iddfs.cpp.obj"

# External object files for target search
search_EXTERNAL_OBJECTS =

search.exe: CMakeFiles/search.dir/main.cpp.obj
search.exe: CMakeFiles/search.dir/algorithms/bfs.cpp.obj
search.exe: CMakeFiles/search.dir/algorithms/iddfs.cpp.obj
search.exe: CMakeFiles/search.dir/build.make
search.exe: CMakeFiles/search.dir/linklibs.rsp
search.exe: CMakeFiles/search.dir/objects1.rsp
search.exe: CMakeFiles/search.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\FCKING_linux\PDV\sem01\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable search.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\search.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/search.dir/build: search.exe

.PHONY : CMakeFiles/search.dir/build

CMakeFiles/search.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\search.dir\cmake_clean.cmake
.PHONY : CMakeFiles/search.dir/clean

CMakeFiles/search.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\FCKING_linux\PDV\sem01 C:\FCKING_linux\PDV\sem01 C:\FCKING_linux\PDV\sem01\cmake-build-debug C:\FCKING_linux\PDV\sem01\cmake-build-debug C:\FCKING_linux\PDV\sem01\cmake-build-debug\CMakeFiles\search.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/search.dir/depend
