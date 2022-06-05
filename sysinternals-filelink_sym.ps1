###############################################################################
# INDIVIDUAL FILE SYMLINK (HTTP) - Make new directoy that CONTAINS symlinks   #
#                                                                             #
# LICENSE  = MIT                                                              #
# VERSION  = 0.0.1                                                            #
# FILENAME = sysinternals-filesym_smb.ps1                                     #
# GITREPO  = https://github.com/cloudcodenyc/sysinternals-smartlink.git       #
#                                                                             #
###############################################################################
# Copyright (c) 2022 Matthew Simon                                            #
#                                                                             #
# Permission is hereby granted, free of charge, to any person obtaining       #
# a copy of this software and associated documentation files (the             #
# "Software"), to deal in the Software without restriction, including         #
# without limitation the rights to use, copy, modify, merge, publish,         #
# distribute, sublicense, and/or sell copies of the Software, and to          #
# permit persons to wh.om the Software is furnished to do so, subject to      #
# the following conditions:                                                   #
#                                                                             #
# The above copyright notice and this permission notice shall be              #
# included in all copies or substantial portions of the Software.             #
#                                                                             #
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,             # 
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF          #
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                       #
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE      #
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION      #
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION       #
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.             #
###############################################################################

	$STYPE="symlink"
	$SPATH=".\sysinternals-$STYPE"
	$SLIVE="\\live.sysinternals.com\tools\"
	$HTTPS="$(Test-Path -Path "$SLIVE" -ErrorAction continue)"
	$EXIST="$(Test-Path -Path "$SPATH" -ErrorAction continue)"
	
if ($HTTPS -eq "False") {echo 'ERROR: NO REMOTE ACCESS' ; exit 1}
if ($EXIST -eq "False") {New-Item -ItemType Directory -Path "$SPATH" -Force -ErrorAction continue ; cd "$SPATH"}

Get-ChildItem $SLIVE | ForEach-Object -Process {if (!$_.PSIsContainer) {$_.Name}}
Get-ChildItem $SLIVE | ForEach-Object {New-Item -ItemType SymbolicLink -Path $_.Name -Target $_.PSPath}

exit 0