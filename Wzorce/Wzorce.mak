# Microsoft Developer Studio Generated NMAKE File, Format Version 4.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=Wzorce - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to Wzorce - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "Wzorce - Win32 Release" && "$(CFG)" != "Wzorce - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "Wzorce.mak" CFG="Wzorce - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Wzorce - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "Wzorce - Win32 Debug" (based on "Win32 (x86) Application")
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
# PROP Target_Last_Scanned "Wzorce - Win32 Debug"
CPP=cl.exe
RSC=rc.exe
MTL=mktyplib.exe

!IF  "$(CFG)" == "Wzorce - Win32 Release"

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

ALL : "$(OUTDIR)\Wzorce.exe"

CLEAN : 
	-@erase ".\Release\Wzorce.exe"
	-@erase ".\Release\StdAfx.obj"
	-@erase ".\Release\WzorceDlg.obj"
	-@erase ".\Release\Wzorce.pch"
	-@erase ".\Release\matrix.obj"
	-@erase ".\Release\Wzorce.obj"
	-@erase ".\Release\Wzorce.res"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /Yu"stdafx.h" /c
CPP_PROJ=/nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL"\
 /D "_MBCS" /Fp"$(INTDIR)/Wzorce.pch" /Yu"stdafx.h" /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x415 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x415 /d "NDEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x415 /fo"$(INTDIR)/Wzorce.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/Wzorce.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:I386
# ADD LINK32 /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=/nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/Wzorce.pdb" /machine:I386 /out:"$(OUTDIR)/Wzorce.exe" 
LINK32_OBJS= \
	"$(INTDIR)/StdAfx.obj" \
	"$(INTDIR)/WzorceDlg.obj" \
	"$(INTDIR)/matrix.obj" \
	"$(INTDIR)/Wzorce.obj" \
	"$(INTDIR)/Wzorce.res"

"$(OUTDIR)\Wzorce.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Wzorce - Win32 Debug"

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

ALL : "$(OUTDIR)\Wzorce.exe" "$(OUTDIR)\Wzorce.bsc"

CLEAN : 
	-@erase ".\Debug\vc40.pdb"
	-@erase ".\Debug\Wzorce.pch"
	-@erase ".\Debug\vc40.idb"
	-@erase ".\Debug\Wzorce.bsc"
	-@erase ".\Debug\WzorceDlg.sbr"
	-@erase ".\Debug\Wzorce.sbr"
	-@erase ".\Debug\matrix.sbr"
	-@erase ".\Debug\StdAfx.sbr"
	-@erase ".\Debug\Wzorce.exe"
	-@erase ".\Debug\StdAfx.obj"
	-@erase ".\Debug\WzorceDlg.obj"
	-@erase ".\Debug\Wzorce.obj"
	-@erase ".\Debug\matrix.obj"
	-@erase ".\Debug\Wzorce.res"
	-@erase ".\Debug\Wzorce.ilk"
	-@erase ".\Debug\Wzorce.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /FR /Yu"stdafx.h" /c
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /D "_AFXDLL" /D "_MBCS" /FR"$(INTDIR)/" /Fp"$(INTDIR)/Wzorce.pch" /Yu"stdafx.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=.\Debug/
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x415 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x415 /d "_DEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x415 /fo"$(INTDIR)/Wzorce.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/Wzorce.bsc" 
BSC32_SBRS= \
	"$(INTDIR)/WzorceDlg.sbr" \
	"$(INTDIR)/Wzorce.sbr" \
	"$(INTDIR)/matrix.sbr" \
	"$(INTDIR)/StdAfx.sbr"

"$(OUTDIR)\Wzorce.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=/nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/Wzorce.pdb" /debug /machine:I386 /out:"$(OUTDIR)/Wzorce.exe" 
LINK32_OBJS= \
	"$(INTDIR)/StdAfx.obj" \
	"$(INTDIR)/WzorceDlg.obj" \
	"$(INTDIR)/Wzorce.obj" \
	"$(INTDIR)/matrix.obj" \
	"$(INTDIR)/Wzorce.res"

"$(OUTDIR)\Wzorce.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "Wzorce - Win32 Release"
# Name "Wzorce - Win32 Debug"

!IF  "$(CFG)" == "Wzorce - Win32 Release"

!ELSEIF  "$(CFG)" == "Wzorce - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\ReadMe.txt

!IF  "$(CFG)" == "Wzorce - Win32 Release"

!ELSEIF  "$(CFG)" == "Wzorce - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\Wzorce.cpp
DEP_CPP_WZORC=\
	".\StdAfx.h"\
	".\Wzorce.h"\
	".\WzorceDlg.h"\
	".\matrix.h"\
	

!IF  "$(CFG)" == "Wzorce - Win32 Release"


"$(INTDIR)\Wzorce.obj" : $(SOURCE) $(DEP_CPP_WZORC) "$(INTDIR)"\
 "$(INTDIR)\Wzorce.pch"


!ELSEIF  "$(CFG)" == "Wzorce - Win32 Debug"


"$(INTDIR)\Wzorce.obj" : $(SOURCE) $(DEP_CPP_WZORC) "$(INTDIR)"\
 "$(INTDIR)\Wzorce.pch"

"$(INTDIR)\Wzorce.sbr" : $(SOURCE) $(DEP_CPP_WZORC) "$(INTDIR)"\
 "$(INTDIR)\Wzorce.pch"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\WzorceDlg.cpp
DEP_CPP_WZORCE=\
	".\StdAfx.h"\
	".\Wzorce.h"\
	".\WzorceDlg.h"\
	".\matrix.h"\
	

!IF  "$(CFG)" == "Wzorce - Win32 Release"


"$(INTDIR)\WzorceDlg.obj" : $(SOURCE) $(DEP_CPP_WZORCE) "$(INTDIR)"\
 "$(INTDIR)\Wzorce.pch"


!ELSEIF  "$(CFG)" == "Wzorce - Win32 Debug"


"$(INTDIR)\WzorceDlg.obj" : $(SOURCE) $(DEP_CPP_WZORCE) "$(INTDIR)"\
 "$(INTDIR)\Wzorce.pch"

"$(INTDIR)\WzorceDlg.sbr" : $(SOURCE) $(DEP_CPP_WZORCE) "$(INTDIR)"\
 "$(INTDIR)\Wzorce.pch"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\StdAfx.cpp
DEP_CPP_STDAF=\
	".\StdAfx.h"\
	

!IF  "$(CFG)" == "Wzorce - Win32 Release"

# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL"\
 /D "_MBCS" /Fp"$(INTDIR)/Wzorce.pch" /Yc"stdafx.h" /Fo"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\StdAfx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\Wzorce.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "Wzorce - Win32 Debug"

# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /D "_AFXDLL" /D "_MBCS" /FR"$(INTDIR)/" /Fp"$(INTDIR)/Wzorce.pch" /Yc"stdafx.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\StdAfx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\StdAfx.sbr" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\Wzorce.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\Wzorce.rc
DEP_RSC_WZORCE_=\
	".\res\Wzorce.ico"\
	".\res\Wzorce.rc2"\
	

"$(INTDIR)\Wzorce.res" : $(SOURCE) $(DEP_RSC_WZORCE_) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\matrix.cpp
DEP_CPP_MATRI=\
	".\StdAfx.h"\
	".\matrix.h"\
	

!IF  "$(CFG)" == "Wzorce - Win32 Release"


"$(INTDIR)\matrix.obj" : $(SOURCE) $(DEP_CPP_MATRI) "$(INTDIR)"\
 "$(INTDIR)\Wzorce.pch"


!ELSEIF  "$(CFG)" == "Wzorce - Win32 Debug"


"$(INTDIR)\matrix.obj" : $(SOURCE) $(DEP_CPP_MATRI) "$(INTDIR)"\
 "$(INTDIR)\Wzorce.pch"

"$(INTDIR)\matrix.sbr" : $(SOURCE) $(DEP_CPP_MATRI) "$(INTDIR)"\
 "$(INTDIR)\Wzorce.pch"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
################################################################################
# Section Wzorce : {2E618091-802A-11D1-B27C-000000000000}
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
# Section Wzorce : {2E618093-802A-11D1-B27C-000000000000}
# 	0:10:Matrix.cpp:D:\TEMP\Wzorce\Matrix.cpp
# 	0:8:Matrix.h:D:\TEMP\Wzorce\Matrix.h
# 	2:21:DefaultSinkHeaderFile:matrix.h
# 	2:16:DefaultSinkClass:CMatrix
# End Section
################################################################################
