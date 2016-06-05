#!/usr/bin/env python

import os

fileNeoSecurity = open("/opt/coldfusion11/cfusion/lib/neo-security.xml", "r+")
fileNeoSecurityBackup = open("/opt/coldfusion11/cfusion/lib/neo-security.xml.original", "w")

textEnableSecurity = "<var name='admin.security.enabled'><boolean value='true'/>"
textDisableSecurity = "<var name='admin.security.enabled'><boolean value='false'/>"

textNeoSecurity = fileNeoSecurity.read()

fileNeoSecurityBackup.write( textNeoSecurity )

fileNeoSecurity.seek(0)
fileNeoSecurity.truncate()
fileNeoSecurity.write( textNeoSecurity.replace( textEnableSecurity, textDisableSecurity) )

fileNeoSecurity.close()
fileNeoSecurityBackup.close()
