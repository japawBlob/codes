# CMAKE generated file: DO NOT EDIT!
# Generated by "NMake Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE
NULL=nul
!ENDIF
SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2019.3.4\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2019.3.4\bin\cmake\win\bin\cmake.exe" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = D:\codes

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\codes\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles\codes.dir\depend.make

# Include the progress variables for this target.
include CMakeFiles\codes.dir\progress.make

# Include the compile flags for this target's objects.
include CMakeFiles\codes.dir\flags.make

CMakeFiles\codes.dir\main.c.obj: CMakeFiles\codes.dir\flags.make
CMakeFiles\codes.dir\main.c.obj: ..\main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\codes\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/codes.dir/main.c.obj"
	C:\PROGRA~2\MICROS~2\2019\COMMUN~1\VC\Tools\MSVC\1420~1.275\bin\Hostx86\x86\cl.exe @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) /FoCMakeFiles\codes.dir\main.c.obj /FdCMakeFiles\codes.dir\ /FS -c D:\codes\main.c
<<

CMakeFiles\codes.dir\main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/codes.dir/main.c.i"
	C:\PROGRA~2\MICROS~2\2019\COMMUN~1\VC\Tools\MSVC\1420~1.275\bin\Hostx86\x86\cl.exe > CMakeFiles\codes.dir\main.c.i @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\codes\main.c
<<

CMakeFiles\codes.dir\main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/codes.dir/main.c.s"
	C:\PROGRA~2\MICROS~2\2019\COMMUN~1\VC\Tools\MSVC\1420~1.275\bin\Hostx86\x86\cl.exe @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) /FoNUL /FAs /FaCMakeFiles\codes.dir\main.c.s /c D:\codes\main.c
<<

# Object files for target codes
codes_OBJECTS = \
"CMakeFiles\codes.dir\main.c.obj"

# External object files for target codes
codes_EXTERNAL_OBJECTS =

codes.exe: CMakeFiles\codes.dir\main.c.obj
codes.exe: CMakeFiles\codes.dir\build.make
codes.exe: CMakeFiles\codes.dir\objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=D:\codes\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable codes.exe"
	"C:\Program Files\JetBrains\CLion 2019.3.4\bin\cmake\win\bin\cmake.exe" -E vs_link_exe --intdir=CMakeFiles\codes.dir --rc=C:\PROGRA~2\WI3CF2~1\10\bin\100177~1.0\x86\rc.exe --mt=C:\PROGRA~2\WI3CF2~1\10\bin\100177~1.0\x86\mt.exe --manifests  -- C:\PROGRA~2\MICROS~2\2019\COMMUN~1\VC\Tools\MSVC\1420~1.275\bin\Hostx86\x86\link.exe /nologo @CMakeFiles\codes.dir\objects1.rsp @<<
 /out:codes.exe /implib:codes.lib /pdb:D:\codes\cmake-build-debug\codes.pdb /version:0.0  /machine:X86 /debug /INCREMENTAL /subsystem:console kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib 
<<

# Rule to build all files generated by this target.
CMakeFiles\codes.dir\build: codes.exe

.PHONY : CMakeFiles\codes.dir\build

CMakeFiles\codes.dir\clean:
	$(CMAKE_COMMAND) -P CMakeFiles\codes.dir\cmake_clean.cmake
.PHONY : CMakeFiles\codes.dir\clean

CMakeFiles\codes.dir\depend:
	$(CMAKE_COMMAND) -E cmake_depends "NMake Makefiles" D:\codes D:\codes D:\codes\cmake-build-debug D:\codes\cmake-build-debug D:\codes\cmake-build-debug\CMakeFiles\codes.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles\codes.dir\depend
