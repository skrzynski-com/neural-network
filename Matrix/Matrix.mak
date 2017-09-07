# Microsoft Developer Studio Generated NMAKE File, Format Version 4.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

!IF "$(CFG)" == ""
CFG=Matrix - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to Matrix - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "Matrix - Win32 Release" && "$(CFG)" != "Matrix - Win32 Debug"\
 && "$(CFG)" != "Matrix - Win32 Unicode Debug" && "$(CFG)" !=\
 "Matrix - Win32 Unicode Release"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "Matrix.mak" CFG="Matrix - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Matrix - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Matrix - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Matrix - Win32 Unicode Debug" (based on\
 "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Matrix - Win32 Unicode Release" (based on\
 "Win32 (x86) Dynamic-Link Library")
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
# PROP Target_Last_Scanned "Matrix - Win32 Debug"
CPP=cl.exe
RSC=rc.exe
MTL=mktyplib.exe

!IF  "$(CFG)" == "Matrix - Win32 Release"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP BASE Target_Ext "ocx"
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# PROP Target_Ext "ocx"
OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\Matrix.ocx" "$(OUTDIR)\regsvr32.trg"

CLEAN : 
	-@erase ".\Release\Matrix.lib"
	-@erase ".\Release\MatrixCtl.obj"
	-@erase ".\Release\Matrix.pch"
	-@erase ".\Release\StdAfx.obj"
	-@erase ".\Release\Matrix.obj"
	-@erase ".\Release\MatrixPpg.obj"
	-@erase ".\Release\Matrix.res"
	-@erase ".\Release\Matrix.tlb"
	-@erase ".\Release\Matrix.exp"
	-@erase ".\Release\regsvr32.trg"
	-@erase ".\Release\Matrix.ocx"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /Yu"stdafx.h" /c
CPP_PROJ=/nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL"\
 /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /Fp"$(INTDIR)/Matrix.pch" /Yu"stdafx.h"\
 /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x415 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x415 /d "NDEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x415 /fo"$(INTDIR)/Matrix.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/Matrix.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 /nologo /subsystem:windows /dll /machine:I386
LINK32_FLAGS=/nologo /subsystem:windows /dll /incremental:no\
 /pdb:"$(OUTDIR)/Matrix.pdb" /machine:I386 /def:".\Matrix.def"\
 /out:"$(OUTDIR)/Matrix.ocx" /implib:"$(OUTDIR)/Matrix.lib" 
DEF_FILE= \
	".\Matrix.def"
LINK32_OBJS= \
	"$(INTDIR)/MatrixCtl.obj" \
	"$(INTDIR)/StdAfx.obj" \
	"$(INTDIR)/Matrix.obj" \
	"$(INTDIR)/MatrixPpg.obj" \
	"$(INTDIR)/Matrix.res"

"$(OUTDIR)\Matrix.ocx" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

# Begin Custom Build - Registering OLE control...
OutDir=.\Release
TargetPath=.\Release\Matrix.ocx
InputPath=.\Release\Matrix.ocx
SOURCE=$(InputPath)

"$(OutDir)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   regsvr32 /s /c "$(TargetPath)"
   echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg"

# End Custom Build

!ELSEIF  "$(CFG)" == "Matrix - Win32 Debug"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP BASE Target_Ext "ocx"
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
# PROP Target_Ext "ocx"
OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\Matrix.ocx" "$(OUTDIR)\regsvr32.trg" "$(OUTDIR)\Matrix.bsc"

CLEAN : 
	-@erase ".\Debug\vc40.pdb"
	-@erase ".\Debug\Matrix.pch"
	-@erase ".\Debug\vc40.idb"
	-@erase ".\Debug\Matrix.ilk"
	-@erase ".\Debug\MatrixPpg.obj"
	-@erase ".\Debug\MatrixCtl.obj"
	-@erase ".\Debug\StdAfx.obj"
	-@erase ".\Debug\Matrix.obj"
	-@erase ".\Debug\Matrix.res"
	-@erase ".\Debug\Matrix.tlb"
	-@erase ".\Debug\Matrix.lib"
	-@erase ".\Debug\Matrix.exp"
	-@erase ".\Debug\Matrix.pdb"
	-@erase ".\Debug\regsvr32.trg"
	-@erase ".\Debug\Matrix.ocx"
	-@erase ".\Debug\Matrix.bsc"
	-@erase ".\Debug\StdAfx.sbr"
	-@erase ".\Debug\Matrix.sbr"
	-@erase ".\Debug\MatrixCtl.sbr"
	-@erase ".\Debug\MatrixPpg.sbr"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR /Yu"stdafx.h" /c
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)/"\
 /Fp"$(INTDIR)/Matrix.pch" /Yu"stdafx.h" /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=.\Debug/
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x415 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x415 /d "_DEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x415 /fo"$(INTDIR)/Matrix.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/Matrix.bsc" 
BSC32_SBRS= \
	"$(INTDIR)/StdAfx.sbr" \
	"$(INTDIR)/Matrix.sbr" \
	"$(INTDIR)/MatrixCtl.sbr" \
	"$(INTDIR)/MatrixPpg.sbr"

"$(OUTDIR)\Matrix.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /dll /debug /machine:I386
# ADD LINK32 /nologo /subsystem:windows /dll /debug /machine:I386
LINK32_FLAGS=/nologo /subsystem:windows /dll /incremental:yes\
 /pdb:"$(OUTDIR)/Matrix.pdb" /debug /machine:I386 /def:".\Matrix.def"\
 /out:"$(OUTDIR)/Matrix.ocx" /implib:"$(OUTDIR)/Matrix.lib" 
DEF_FILE= \
	".\Matrix.def"
LINK32_OBJS= \
	"$(INTDIR)/MatrixPpg.obj" \
	"$(INTDIR)/MatrixCtl.obj" \
	"$(INTDIR)/StdAfx.obj" \
	"$(INTDIR)/Matrix.obj" \
	"$(INTDIR)/Matrix.res"

"$(OUTDIR)\Matrix.ocx" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

# Begin Custom Build - Registering OLE control...
OutDir=.\Debug
TargetPath=.\Debug\Matrix.ocx
InputPath=.\Debug\Matrix.ocx
SOURCE=$(InputPath)

"$(OutDir)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   regsvr32 /s /c "$(TargetPath)"
   echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg"

# End Custom Build

!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Debug"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "DebugU"
# PROP BASE Intermediate_Dir "DebugU"
# PROP BASE Target_Dir ""
# PROP BASE Target_Ext "ocx"
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "DebugU"
# PROP Intermediate_Dir "DebugU"
# PROP Target_Dir ""
# PROP Target_Ext "ocx"
OUTDIR=.\DebugU
INTDIR=.\DebugU
# Begin Custom Macros
OutDir=.\DebugU
# End Custom Macros

ALL : "$(OUTDIR)\Matrix.ocx" "$(OUTDIR)\regsvr32.trg"

CLEAN : 
	-@erase ".\DebugU\vc40.pdb"
	-@erase ".\DebugU\Matrix.pch"
	-@erase ".\DebugU\vc40.idb"
	-@erase ".\DebugU\Matrix.ilk"
	-@erase ".\DebugU\StdAfx.obj"
	-@erase ".\DebugU\Matrix.obj"
	-@erase ".\DebugU\MatrixPpg.obj"
	-@erase ".\DebugU\MatrixCtl.obj"
	-@erase ".\DebugU\Matrix.res"
	-@erase ".\DebugU\Matrix.tlb"
	-@erase ".\DebugU\Matrix.lib"
	-@erase ".\DebugU\Matrix.exp"
	-@erase ".\DebugU\Matrix.pdb"
	-@erase ".\DebugU\regsvr32.trg"
	-@erase ".\DebugU\Matrix.ocx"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /Yu"stdafx.h" /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_USRDLL" /D "_UNICODE" /Yu"stdafx.h" /c
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /D "_WINDLL" /D "_AFXDLL" /D "_USRDLL" /D "_UNICODE" /Fp"$(INTDIR)/Matrix.pch"\
 /Yu"stdafx.h" /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\DebugU/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x415 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x415 /d "_DEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x415 /fo"$(INTDIR)/Matrix.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/Matrix.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /dll /debug /machine:I386
# ADD LINK32 /nologo /subsystem:windows /dll /debug /machine:I386
LINK32_FLAGS=/nologo /subsystem:windows /dll /incremental:yes\
 /pdb:"$(OUTDIR)/Matrix.pdb" /debug /machine:I386 /def:".\Matrix.def"\
 /out:"$(OUTDIR)/Matrix.ocx" /implib:"$(OUTDIR)/Matrix.lib" 
DEF_FILE= \
	".\Matrix.def"
LINK32_OBJS= \
	"$(INTDIR)/StdAfx.obj" \
	"$(INTDIR)/Matrix.obj" \
	"$(INTDIR)/MatrixPpg.obj" \
	"$(INTDIR)/MatrixCtl.obj" \
	"$(INTDIR)/Matrix.res"

"$(OUTDIR)\Matrix.ocx" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

# Begin Custom Build - Registering OLE control...
OutDir=.\DebugU
TargetPath=.\DebugU\Matrix.ocx
InputPath=.\DebugU\Matrix.ocx
SOURCE=$(InputPath)

"$(OutDir)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   regsvr32 /s /c "$(TargetPath)"
   echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg"

# End Custom Build

!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Release"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "ReleaseU"
# PROP BASE Intermediate_Dir "ReleaseU"
# PROP BASE Target_Dir ""
# PROP BASE Target_Ext "ocx"
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "ReleaseU"
# PROP Intermediate_Dir "ReleaseU"
# PROP Target_Dir ""
# PROP Target_Ext "ocx"
OUTDIR=.\ReleaseU
INTDIR=.\ReleaseU
# Begin Custom Macros
OutDir=.\ReleaseU
# End Custom Macros

ALL : "$(OUTDIR)\Matrix.ocx" "$(OUTDIR)\regsvr32.trg"

CLEAN : 
	-@erase ".\ReleaseU\Matrix.lib"
	-@erase ".\ReleaseU\StdAfx.obj"
	-@erase ".\ReleaseU\Matrix.obj"
	-@erase ".\ReleaseU\Matrix.pch"
	-@erase ".\ReleaseU\MatrixPpg.obj"
	-@erase ".\ReleaseU\MatrixCtl.obj"
	-@erase ".\ReleaseU\Matrix.res"
	-@erase ".\ReleaseU\Matrix.tlb"
	-@erase ".\ReleaseU\Matrix.exp"
	-@erase ".\ReleaseU\regsvr32.trg"
	-@erase ".\ReleaseU\Matrix.ocx"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /Yu"stdafx.h" /c
# ADD CPP /nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_AFXDLL" /D "_USRDLL" /D "_UNICODE" /Yu"stdafx.h" /c
CPP_PROJ=/nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL"\
 /D "_AFXDLL" /D "_USRDLL" /D "_UNICODE" /Fp"$(INTDIR)/Matrix.pch" /Yu"stdafx.h"\
 /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\ReleaseU/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x415 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x415 /d "NDEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x415 /fo"$(INTDIR)/Matrix.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/Matrix.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 /nologo /subsystem:windows /dll /machine:I386
LINK32_FLAGS=/nologo /subsystem:windows /dll /incremental:no\
 /pdb:"$(OUTDIR)/Matrix.pdb" /machine:I386 /def:".\Matrix.def"\
 /out:"$(OUTDIR)/Matrix.ocx" /implib:"$(OUTDIR)/Matrix.lib" 
DEF_FILE= \
	".\Matrix.def"
LINK32_OBJS= \
	"$(INTDIR)/StdAfx.obj" \
	"$(INTDIR)/Matrix.obj" \
	"$(INTDIR)/MatrixPpg.obj" \
	"$(INTDIR)/MatrixCtl.obj" \
	"$(INTDIR)/Matrix.res"

"$(OUTDIR)\Matrix.ocx" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

# Begin Custom Build - Registering OLE control...
OutDir=.\ReleaseU
TargetPath=.\ReleaseU\Matrix.ocx
InputPath=.\ReleaseU\Matrix.ocx
SOURCE=$(InputPath)

"$(OutDir)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   regsvr32 /s /c "$(TargetPath)"
   echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg"

# End Custom Build

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

# Name "Matrix - Win32 Release"
# Name "Matrix - Win32 Debug"
# Name "Matrix - Win32 Unicode Debug"
# Name "Matrix - Win32 Unicode Release"

!IF  "$(CFG)" == "Matrix - Win32 Release"

!ELSEIF  "$(CFG)" == "Matrix - Win32 Debug"

!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Debug"

!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Release"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\ReadMe.txt

!IF  "$(CFG)" == "Matrix - Win32 Release"

!ELSEIF  "$(CFG)" == "Matrix - Win32 Debug"

!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Debug"

!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Release"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\StdAfx.cpp
DEP_CPP_STDAF=\
	".\StdAfx.h"\
	

!IF  "$(CFG)" == "Matrix - Win32 Release"

# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL"\
 /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /Fp"$(INTDIR)/Matrix.pch" /Yc"stdafx.h"\
 /Fo"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\StdAfx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\Matrix.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "Matrix - Win32 Debug"

# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /D "_USRDLL" /FR"$(INTDIR)/"\
 /Fp"$(INTDIR)/Matrix.pch" /Yc"stdafx.h" /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c\
 $(SOURCE) \
	

"$(INTDIR)\StdAfx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\StdAfx.sbr" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\Matrix.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Debug"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /D "_WINDLL" /D "_AFXDLL" /D "_USRDLL" /D "_UNICODE" /Fp"$(INTDIR)/Matrix.pch"\
 /Yc"stdafx.h" /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\StdAfx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\Matrix.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Release"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL"\
 /D "_AFXDLL" /D "_USRDLL" /D "_UNICODE" /Fp"$(INTDIR)/Matrix.pch" /Yc"stdafx.h"\
 /Fo"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\StdAfx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\Matrix.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\Matrix.cpp
DEP_CPP_MATRI=\
	".\StdAfx.h"\
	".\Matrix.h"\
	

!IF  "$(CFG)" == "Matrix - Win32 Release"


"$(INTDIR)\Matrix.obj" : $(SOURCE) $(DEP_CPP_MATRI) "$(INTDIR)"\
 "$(INTDIR)\Matrix.pch"


!ELSEIF  "$(CFG)" == "Matrix - Win32 Debug"


"$(INTDIR)\Matrix.obj" : $(SOURCE) $(DEP_CPP_MATRI) "$(INTDIR)"\
 "$(INTDIR)\Matrix.pch"

"$(INTDIR)\Matrix.sbr" : $(SOURCE) $(DEP_CPP_MATRI) "$(INTDIR)"\
 "$(INTDIR)\Matrix.pch"


!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Debug"


"$(INTDIR)\Matrix.obj" : $(SOURCE) $(DEP_CPP_MATRI) "$(INTDIR)"\
 "$(INTDIR)\Matrix.pch"


!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Release"


"$(INTDIR)\Matrix.obj" : $(SOURCE) $(DEP_CPP_MATRI) "$(INTDIR)"\
 "$(INTDIR)\Matrix.pch"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\Matrix.def

!IF  "$(CFG)" == "Matrix - Win32 Release"

!ELSEIF  "$(CFG)" == "Matrix - Win32 Debug"

!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Debug"

!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Release"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\Matrix.rc

!IF  "$(CFG)" == "Matrix - Win32 Release"

DEP_RSC_MATRIX=\
	".\MatrixCtl.bmp"\
	
NODEP_RSC_MATRIX=\
	".\Release\Matrix.tlb"\
	

"$(INTDIR)\Matrix.res" : $(SOURCE) $(DEP_RSC_MATRIX) "$(INTDIR)"\
 "$(INTDIR)\Matrix.tlb"
   $(RSC) /l 0x415 /fo"$(INTDIR)/Matrix.res" /i "Release" /d "NDEBUG" /d\
 "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Matrix - Win32 Debug"

DEP_RSC_MATRIX=\
	".\MatrixCtl.bmp"\
	
NODEP_RSC_MATRIX=\
	".\Debug\Matrix.tlb"\
	

"$(INTDIR)\Matrix.res" : $(SOURCE) $(DEP_RSC_MATRIX) "$(INTDIR)"\
 "$(INTDIR)\Matrix.tlb"
   $(RSC) /l 0x415 /fo"$(INTDIR)/Matrix.res" /i "Debug" /d "_DEBUG" /d\
 "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Debug"

DEP_RSC_MATRIX=\
	".\MatrixCtl.bmp"\
	
NODEP_RSC_MATRIX=\
	".\DebugU\Matrix.tlb"\
	

"$(INTDIR)\Matrix.res" : $(SOURCE) $(DEP_RSC_MATRIX) "$(INTDIR)"\
 "$(INTDIR)\Matrix.tlb"
   $(RSC) /l 0x415 /fo"$(INTDIR)/Matrix.res" /i "DebugU" /d "_DEBUG" /d\
 "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Release"

DEP_RSC_MATRIX=\
	".\MatrixCtl.bmp"\
	
NODEP_RSC_MATRIX=\
	".\ReleaseU\Matrix.tlb"\
	

"$(INTDIR)\Matrix.res" : $(SOURCE) $(DEP_RSC_MATRIX) "$(INTDIR)"\
 "$(INTDIR)\Matrix.tlb"
   $(RSC) /l 0x415 /fo"$(INTDIR)/Matrix.res" /i "ReleaseU" /d "NDEBUG" /d\
 "_AFXDLL" $(SOURCE)


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\Matrix.odl

!IF  "$(CFG)" == "Matrix - Win32 Release"


"$(OUTDIR)\Matrix.tlb" : $(SOURCE) "$(OUTDIR)"
   $(MTL) /nologo /D "NDEBUG" /tlb "$(OUTDIR)/Matrix.tlb" /win32 $(SOURCE)


!ELSEIF  "$(CFG)" == "Matrix - Win32 Debug"


"$(OUTDIR)\Matrix.tlb" : $(SOURCE) "$(OUTDIR)"
   $(MTL) /nologo /D "_DEBUG" /tlb "$(OUTDIR)/Matrix.tlb" /win32 $(SOURCE)


!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Debug"


"$(OUTDIR)\Matrix.tlb" : $(SOURCE) "$(OUTDIR)"
   $(MTL) /nologo /D "_DEBUG" /tlb "$(OUTDIR)/Matrix.tlb" /win32 $(SOURCE)


!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Release"


"$(OUTDIR)\Matrix.tlb" : $(SOURCE) "$(OUTDIR)"
   $(MTL) /nologo /D "NDEBUG" /tlb "$(OUTDIR)/Matrix.tlb" /win32 $(SOURCE)


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\MatrixCtl.cpp
DEP_CPP_MATRIXC=\
	".\StdAfx.h"\
	".\Matrix.h"\
	".\MatrixCtl.h"\
	".\MatrixPpg.h"\
	

!IF  "$(CFG)" == "Matrix - Win32 Release"


"$(INTDIR)\MatrixCtl.obj" : $(SOURCE) $(DEP_CPP_MATRIXC) "$(INTDIR)"\
 "$(INTDIR)\Matrix.pch"


!ELSEIF  "$(CFG)" == "Matrix - Win32 Debug"


"$(INTDIR)\MatrixCtl.obj" : $(SOURCE) $(DEP_CPP_MATRIXC) "$(INTDIR)"\
 "$(INTDIR)\Matrix.pch"

"$(INTDIR)\MatrixCtl.sbr" : $(SOURCE) $(DEP_CPP_MATRIXC) "$(INTDIR)"\
 "$(INTDIR)\Matrix.pch"


!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Debug"


"$(INTDIR)\MatrixCtl.obj" : $(SOURCE) $(DEP_CPP_MATRIXC) "$(INTDIR)"\
 "$(INTDIR)\Matrix.pch"


!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Release"


"$(INTDIR)\MatrixCtl.obj" : $(SOURCE) $(DEP_CPP_MATRIXC) "$(INTDIR)"\
 "$(INTDIR)\Matrix.pch"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\MatrixPpg.cpp
DEP_CPP_MATRIXP=\
	".\StdAfx.h"\
	".\Matrix.h"\
	".\MatrixPpg.h"\
	

!IF  "$(CFG)" == "Matrix - Win32 Release"


"$(INTDIR)\MatrixPpg.obj" : $(SOURCE) $(DEP_CPP_MATRIXP) "$(INTDIR)"\
 "$(INTDIR)\Matrix.pch"


!ELSEIF  "$(CFG)" == "Matrix - Win32 Debug"


"$(INTDIR)\MatrixPpg.obj" : $(SOURCE) $(DEP_CPP_MATRIXP) "$(INTDIR)"\
 "$(INTDIR)\Matrix.pch"

"$(INTDIR)\MatrixPpg.sbr" : $(SOURCE) $(DEP_CPP_MATRIXP) "$(INTDIR)"\
 "$(INTDIR)\Matrix.pch"


!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Debug"


"$(INTDIR)\MatrixPpg.obj" : $(SOURCE) $(DEP_CPP_MATRIXP) "$(INTDIR)"\
 "$(INTDIR)\Matrix.pch"


!ELSEIF  "$(CFG)" == "Matrix - Win32 Unicode Release"


"$(INTDIR)\MatrixPpg.obj" : $(SOURCE) $(DEP_CPP_MATRIXP) "$(INTDIR)"\
 "$(INTDIR)\Matrix.pch"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
