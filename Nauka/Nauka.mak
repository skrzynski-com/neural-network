# Microsoft Developer Studio Generated NMAKE File, Format Version 4.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=Nauka - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to Nauka - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "Nauka - Win32 Release" && "$(CFG)" != "Nauka - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "Nauka.mak" CFG="Nauka - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Nauka - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "Nauka - Win32 Debug" (based on "Win32 (x86) Application")
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
# PROP Target_Last_Scanned "Nauka - Win32 Debug"
CPP=cl.exe
RSC=rc.exe
MTL=mktyplib.exe

!IF  "$(CFG)" == "Nauka - Win32 Release"

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

ALL : "$(OUTDIR)\Nauka.exe"

CLEAN : 
	-@erase ".\Release\Nauka.exe"
	-@erase ".\Release\Nauka.obj"
	-@erase ".\Release\Nauka.pch"
	-@erase ".\Release\StdAfx.obj"
	-@erase ".\Release\NaukaDlg.obj"
	-@erase ".\Release\Nauka.res"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /Yu"stdafx.h" /c
CPP_PROJ=/nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL"\
 /D "_MBCS" /Fp"$(INTDIR)/Nauka.pch" /Yu"stdafx.h" /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x415 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x415 /d "NDEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x415 /fo"$(INTDIR)/Nauka.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/Nauka.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:I386
# ADD LINK32 /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=/nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/Nauka.pdb" /machine:I386 /out:"$(OUTDIR)/Nauka.exe" 
LINK32_OBJS= \
	"$(INTDIR)/Nauka.obj" \
	"$(INTDIR)/StdAfx.obj" \
	"$(INTDIR)/NaukaDlg.obj" \
	"$(INTDIR)/Nauka.res"

"$(OUTDIR)\Nauka.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Nauka - Win32 Debug"

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

ALL : "$(OUTDIR)\Nauka.exe"

CLEAN : 
	-@erase ".\Debug\vc40.pdb"
	-@erase ".\Debug\Nauka.pch"
	-@erase ".\Debug\vc40.idb"
	-@erase ".\Debug\Nauka.exe"
	-@erase ".\Debug\Nauka.obj"
	-@erase ".\Debug\NaukaDlg.obj"
	-@erase ".\Debug\StdAfx.obj"
	-@erase ".\Debug\Nauka.res"
	-@erase ".\Debug\Nauka.ilk"
	-@erase ".\Debug\Nauka.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /Yu"stdafx.h" /c
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /D "_AFXDLL" /D "_MBCS" /Fp"$(INTDIR)/Nauka.pch" /Yu"stdafx.h" /Fo"$(INTDIR)/"\
 /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x415 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x415 /d "_DEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x415 /fo"$(INTDIR)/Nauka.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/Nauka.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=/nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/Nauka.pdb" /debug /machine:I386 /out:"$(OUTDIR)/Nauka.exe" 
LINK32_OBJS= \
	"$(INTDIR)/Nauka.obj" \
	"$(INTDIR)/NaukaDlg.obj" \
	"$(INTDIR)/StdAfx.obj" \
	"$(INTDIR)/Nauka.res"

"$(OUTDIR)\Nauka.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "Nauka - Win32 Release"
# Name "Nauka - Win32 Debug"

!IF  "$(CFG)" == "Nauka - Win32 Release"

!ELSEIF  "$(CFG)" == "Nauka - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\ReadMe.txt

!IF  "$(CFG)" == "Nauka - Win32 Release"

!ELSEIF  "$(CFG)" == "Nauka - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\Nauka.cpp
DEP_CPP_NAUKA=\
	".\StdAfx.h"\
	".\Nauka.h"\
	".\NaukaDlg.h"\
	

"$(INTDIR)\Nauka.obj" : $(SOURCE) $(DEP_CPP_NAUKA) "$(INTDIR)"\
 "$(INTDIR)\Nauka.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\NaukaDlg.cpp

!IF  "$(CFG)" == "Nauka - Win32 Release"

DEP_CPP_NAUKAD=\
	".\StdAfx.h"\
	".\Nauka.h"\
	".\NaukaDlg.h"\
	
NODEP_CPP_NAUKAD=\
	".\m_iNoXX"\
	

"$(INTDIR)\NaukaDlg.obj" : $(SOURCE) $(DEP_CPP_NAUKAD) "$(INTDIR)"\
 "$(INTDIR)\Nauka.pch"


!ELSEIF  "$(CFG)" == "Nauka - Win32 Debug"

DEP_CPP_NAUKAD=\
	".\StdAfx.h"\
	".\Nauka.h"\
	".\NaukaDlg.h"\
	

"$(INTDIR)\NaukaDlg.obj" : $(SOURCE) $(DEP_CPP_NAUKAD) "$(INTDIR)"\
 "$(INTDIR)\Nauka.pch"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\StdAfx.cpp
DEP_CPP_STDAF=\
	".\StdAfx.h"\
	

!IF  "$(CFG)" == "Nauka - Win32 Release"

# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MD /W3 /GX /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL"\
 /D "_MBCS" /Fp"$(INTDIR)/Nauka.pch" /Yc"stdafx.h" /Fo"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\StdAfx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\Nauka.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "Nauka - Win32 Debug"

# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /D "_AFXDLL" /D "_MBCS" /Fp"$(INTDIR)/Nauka.pch" /Yc"stdafx.h" /Fo"$(INTDIR)/"\
 /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\StdAfx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\Nauka.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\Nauka.rc
DEP_RSC_NAUKA_=\
	".\res\Nauka.ico"\
	".\res\net.ico"\
	".\res\Nauka.rc2"\
	

"$(INTDIR)\Nauka.res" : $(SOURCE) $(DEP_RSC_NAUKA_) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
# End Target
# End Project
################################################################################
