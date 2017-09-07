# Microsoft Developer Studio Generated NMAKE File, Format Version 4.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=Test - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to Test - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "Test - Win32 Release" && "$(CFG)" != "Test - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "Test.mak" CFG="Test - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Test - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "Test - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 
################################################################################
# Begin Project
# PROP Target_Last_Scanned "Test - Win32 Debug"
CPP=cl.exe
RSC=rc.exe
MTL=mktyplib.exe

!IF  "$(CFG)" == "Test - Win32 Release"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
OUTDIR=.\Release
INTDIR=.\Release

ALL : "$(OUTDIR)\Test.exe"

CLEAN : 
	-@erase ".\Release\Test.exe"
	-@erase ".\Release\StdAfx.obj"
	-@erase ".\Release\matrix.obj"
	-@erase ".\Release\Test.pch"
	-@erase ".\Release\TestDlg.obj"
	-@erase ".\Release\Test.obj"
	-@erase ".\Release\Test.res"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /Yu"stdafx.h" /c
CPP_PROJ=/nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL"\
 /D "_MBCS" /Fp"$(INTDIR)/Test.pch" /Yu"stdafx.h" /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x415 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x415 /d "NDEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x415 /fo"$(INTDIR)/Test.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/Test.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:I386
# ADD LINK32 /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=/nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/Test.pdb" /machine:I386 /out:"$(OUTDIR)/Test.exe" 
LINK32_OBJS= \
	"$(INTDIR)/StdAfx.obj" \
	"$(INTDIR)/matrix.obj" \
	"$(INTDIR)/TestDlg.obj" \
	"$(INTDIR)/Test.obj" \
	"$(INTDIR)/Test.res"

"$(OUTDIR)\Test.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Test - Win32 Debug"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
OUTDIR=.\Debug
INTDIR=.\Debug

ALL : "$(OUTDIR)\Test.exe"

CLEAN : 
	-@erase ".\Debug\vc40.pdb"
	-@erase ".\Debug\Test.pch"
	-@erase ".\Debug\vc40.idb"
	-@erase ".\Debug\Test.exe"
	-@erase ".\Debug\Test.obj"
	-@erase ".\Debug\matrix.obj"
	-@erase ".\Debug\StdAfx.obj"
	-@erase ".\Debug\TestDlg.obj"
	-@erase ".\Debug\Test.res"
	-@erase ".\Debug\Test.ilk"
	-@erase ".\Debug\Test.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /Yu"stdafx.h" /c
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /D "_AFXDLL" /D "_MBCS" /Fp"$(INTDIR)/Test.pch" /Yu"stdafx.h" /Fo"$(INTDIR)/"\
 /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x415 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x415 /d "_DEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x415 /fo"$(INTDIR)/Test.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/Test.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=/nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/Test.pdb" /debug /machine:I386 /out:"$(OUTDIR)/Test.exe" 
LINK32_OBJS= \
	"$(INTDIR)/Test.obj" \
	"$(INTDIR)/matrix.obj" \
	"$(INTDIR)/StdAfx.obj" \
	"$(INTDIR)/TestDlg.obj" \
	"$(INTDIR)/Test.res"

"$(OUTDIR)\Test.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

################################################################################
# Begin Target

# Name "Test - Win32 Release"
# Name "Test - Win32 Debug"

!IF  "$(CFG)" == "Test - Win32 Release"

!ELSEIF  "$(CFG)" == "Test - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\ReadMe.txt

!IF  "$(CFG)" == "Test - Win32 Release"

!ELSEIF  "$(CFG)" == "Test - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\Test.cpp
DEP_CPP_TEST_=\
	".\StdAfx.h"\
	".\Test.h"\
	".\TestDlg.h"\
	".\matrix.h"\
	

"$(INTDIR)\Test.obj" : $(SOURCE) $(DEP_CPP_TEST_) "$(INTDIR)"\
 "$(INTDIR)\Test.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\TestDlg.cpp

!IF  "$(CFG)" == "Test - Win32 Release"

DEP_CPP_TESTD=\
	".\StdAfx.h"\
	".\Test.h"\
	".\TestDlg.h"\
	".\matrix.h"\
	

"$(INTDIR)\TestDlg.obj" : $(SOURCE) $(DEP_CPP_TESTD) "$(INTDIR)"\
 "$(INTDIR)\Test.pch"


!ELSEIF  "$(CFG)" == "Test - Win32 Debug"

DEP_CPP_TESTD=\
	".\StdAfx.h"\
	".\Test.h"\
	".\TestDlg.h"\
	".\matrix.h"\
	
NODEP_CPP_TESTD=\
	".\}"\
	".\m_Wh"\
	

"$(INTDIR)\TestDlg.obj" : $(SOURCE) $(DEP_CPP_TESTD) "$(INTDIR)"\
 "$(INTDIR)\Test.pch"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\StdAfx.cpp
DEP_CPP_STDAF=\
	".\StdAfx.h"\
	

!IF  "$(CFG)" == "Test - Win32 Release"

# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL"\
 /D "_MBCS" /Fp"$(INTDIR)/Test.pch" /Yc"stdafx.h" /Fo"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\StdAfx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\Test.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "Test - Win32 Debug"

# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /D "_AFXDLL" /D "_MBCS" /Fp"$(INTDIR)/Test.pch" /Yc"stdafx.h" /Fo"$(INTDIR)/"\
 /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\StdAfx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\Test.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\Test.rc
DEP_RSC_TEST_R=\
	".\res\Test.ico"\
	".\res\Test.rc2"\
	

"$(INTDIR)\Test.res" : $(SOURCE) $(DEP_RSC_TEST_R) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\matrix.cpp
DEP_CPP_MATRI=\
	".\StdAfx.h"\
	".\matrix.h"\
	

"$(INTDIR)\matrix.obj" : $(SOURCE) $(DEP_CPP_MATRI) "$(INTDIR)"\
 "$(INTDIR)\Test.pch"


# End Source File
# End Target
# End Project
################################################################################
################################################################################
# Section Test : {2E618091-802A-11D1-B27C-000000000000}
# 	2:5:Class:CMatrix
# 	2:10:HeaderFile:matrix.h
# 	2:8:ImplFile:matrix.cpp
# End Section
################################################################################
################################################################################
# Section OLE Controls
# 	{2E618093-802A-11D1-B27C-000000000000}
# End Section
################################################################################
################################################################################
# Section Test : {2E618093-802A-11D1-B27C-000000000000}
# 	0:10:Matrix.cpp:D:\praca\NEURON\cyfry\Test\Matrix.cpp
# 	0:8:Matrix.h:D:\praca\NEURON\cyfry\Test\Matrix.h
# 	2:21:DefaultSinkHeaderFile:matrix.h
# 	2:16:DefaultSinkClass:CMatrix
# End Section
################################################################################
