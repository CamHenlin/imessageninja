#!/bin/bash

MAXID=$(dscl . -list /Users UniqueID | awk '{print $2}' | sort -ug | tail -1)
USERID=$((MAXID+1))

dscl . -create /Users/$1

dscl . -create /Users/$1 UserShell /bin/bash

dscl . -create /Users/$1 RealName "$1"

dscl . -create /Users/$1 UniqueID "$USERID"

dscl . -create /Users/$1 PrimaryGroupID 20

dscl . -create /Users/$1 NFSHomeDirectory /Users/$1

dscl . -passwd /Users/$1 password
