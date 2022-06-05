::#############################################################################
::# DIRECTORY SYMLINK (HTTPS) - Create new symbolic link DIRECTORY to Remote  #
::#                                                                           #
::# LICENSE  = MIT                                                            #
::# VERSION  = 0.0.1                                                          #
::# FILENAME = sysinternals-path_https.cmd                                    #
::# GITREPO  = https://github.com/cloudcodenyc/sysinternals-smartlink,git     #
::#                                                                           #
::#############################################################################
::# Copyright (c) 2022 Matthew Simon                                          #
::#                                                                           #
::# Permission is hereby granted, free of charge, to any person obtaining     #
::# a copy of this software and associated documentation files (the           #
::# "Software"), to deal in the Software without restriction, including       #
::# without limitation the rights to use, copy, modify, merge, publish,       #
::# distribute, sublicense, and/or sell copies of the Software, and to        #
::# permit persons to wh.om the Software is furnished to do so, subject to    #
::# the following conditions:                                                 #
::#                                                                           #
::# The above copyright notice and this permission notice shall be            #
::# included in all copies or substantial portions of the Software.           #
::#                                                                           #
::# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,           #
::# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF        #
::# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                     #
::# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE    #
::# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION    #
::# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION     #
::# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.           #
::#############################################################################
@echo OFF

	set SNAME=sysinternals_https
	set SLIVE=\\live.sysinternals.com@SSL\DavWWWRoot\tools\
	set SPATH=%~dp0%SNAME%

IF EXIST "%SPATH%" (rmdir /F /S /Q "%SPATH%") 2>nul
IF NOT EXIST "%SPATH%" (cd "%~dp0" && mklink /D %SNAME% "%SLIVE%" 2>nul) ELSE (echo "PARENT DIRECTORY NOT FOUND" && exit 1) 2>nul
IF NOT EXIST "%SPATH%\psexec.exe" (exit 1)
IF EXIST "%SPATH%\psexec.exe" (exit 0)