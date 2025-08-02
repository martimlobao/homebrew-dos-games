//***********************************************************************
//
//               Brøderbund 32-Bit Generic Product Installer
//
//						        HEADER FILE
//
//     This header contains keys for references in "setup.INI".  This
//     information is shared by the install script, the autoplay
//     "launcher", and is available for READ ONLY use by any appli-
//     cation that may need to construct a key to query information
//     in the registry.
//
//     As an example, information relating to the installed app. may
//     be stored in the registry under HKEY_LOCAL_MACHINE\SOFTWARE\
//     Company\Product\Version, with the "Company", "Product" and
//     "Version" components of the registry key replaced by actual
//     values of those references in "Setup.INI".
//
//
//                               IMPORTANT !!
//
//     Developers for a particular application should NOT assume that
//     they may freely add items to this file, as this may conflict
//     with references required by future features of the install
//     script or autorun launcher.
//
//
//                                                  -Andy L.
//                                              Sapien Technologies
//                                                   10/25/95
//
//
//***********************************************************************


#ifndef __SETUP_H__

	#define __SETUP_H__ TRUE  // InstallShield requires that
	                          // #define assignment be explicit
	

	// General Info
	#define INIFILE               "Setup.INI"
	#define INI_FROMFLAG          "$Install_FromDrive$"
	#define INI_TOFLAG            "$Install_ToDirectory$"
	#define INI_TESTDIRFLAG       "$SetupEXE_AutorunEXE_Directory$"
	#define CMDLINE_ARGMARKER     "/"


	// Section Headings
	#define INISECTION_GENERAL       "General Info"
	#define INISECTION_STARTMENU     "Start Menu Items"
	#define INISECTION_LAUNCHER      "Launcher Items"
	#define INISECTION_3RDPARTYEXES	 "Third Party Executables"
	#define INISECTION_DOCTYPES      "Associations"


	// Registry Key Components
	#define INIKEY_CONAME       "Company"
	#define INIKEY_PRODTITLE    "ProductTitle"
	#define INIKEY_PRODVERSION  "ProductVersion"
	#define INIKEY_EXEFILE      "ExecutableFile"
	#define REGKEY_PATHINFO     "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\App Paths\\"
	#define REGKEY_GENLINFO     "SOFTWARE\\"
	#define REGKEY_DOCINFO      "SOFTWARE\\Classes\\"
	#define REGKEY_DOC_OPENEXE  "shell\\open\\command"
	#define REGKEY_DOC_ICON     "DefaultIcon"
	#define REG_DIALOGDISABLE   "Disable Autorun Dialog (Y/N)?"


	//********* [ .INI file entry keys  ] *********

	// Start Menu Items
	#define INIKEY_FOLDER              "Folder"
	#define INIKEY_ITEMPREFIX          "Item"
	#define INIKEY_ITEMSUFFIX_CAPTION  "_Caption"
	#define INIKEY_ITEMSUFFIX_CMDLINE  "_CmdLine"
	#define INIKEY_ITEMSUFFIX_WRKDIR   "_WrkDir"
	
	// Third-Party executables
	#define INIKEY_ITEMSUFFIX_3RDPARTYDESC   "_Description" 
	#define INIKEY_ITEMSUFFIX_3RDPARTYEXE    "_Executable"

	// Document Types ( Default Icon and File Extension )
	#define INIKEY_ITEMSUFFIX_DOCEXTENSION    "_FileExtension"
	#define INIKEY_ITEMSUFFIX_DOCTYPE         "_FileType"
	#define INIKEY_ITEMSUFFIX_DOCDESCRIPTION  "_TypeDescription"	
	#define INIKEY_ITEMSUFFIX_DOCEXECUTABLE   "_AssocExecutable" 
	#define INIKEY_ITEMSUFFIX_DOCICON         "_DefaultIcon"

	
	// Configuration File Items
	// (installer and launcher must edit/create items in a .CFG file)
	#define CFG_EXTENSION       ".cfg"
	#define CFGSECTION_INSTALL  "install"
	#define CFGSECTION_DIRS     "directories"
	#define CFGKEY_SOURCEDIR    "InstallFromDir"
	#define CFGKEY_TARGETDIR    "InstallToDir"
	#define CFGKEY_SOURCEDRIVE  "InstallFromDrive"
	#define CFGKEY_TARGETDRIVE  "InstallToDrive"

	
	// Other Miscellaneous
	#define INIKEY_SPACEREQD     "DiskSpaceReqd_KB"
	#define INIKEY_DLGBITMAP     "DialogBitmap"
	#define INIKEY_BKGRNDBITMAP  "BackgroundBitmap"
	#define INIKEY_256COLORS     "Allow_256Colors"
	
	#define INIKEY_SOURCEDIR     "XferFiles_Source"
	#define INIKEY_TARGETDIR     "XferFiles_Destination"

	#define INIKEY_OTHEREXE_MIDI  "MIDI_Installer"
	#define INIKEY_OTHEREXE_QTFW  "QuickTime_Installer"
	#define INIKEY_ONLINEREG      "On-line Registration"
	#define INIKEY_REBOOT         "Reboot_System"
	
	#define INIKEY_COPYRIGHT      "Copyright Blurb"
	
	// Launcher-Specific
	#define INIKEY_REGISTRYKEY            "registrykey"
	#define INIKEY_LAUNCHER_BITMAP        "bitmap"
	#define INIKEY_LAUNCHER_VERTBUTTONS   "vertical_buttons"	
	#define INIKEY_LAUNCHER_BITMAPOFFSET  "bitmap_offset"
	#define INIKEY_LAUNCHER_APPWORKINGDIR "ExecutableWorkingDir"



#endif  // __SETUP_H__
