#!/bin/bash -e

echo "--------------------------------------------------------------"
echo ""
echo "Installing parentNode in mac"
echo "DO NOT CLOSE UNTIL INSTALL ARE COMPLETE" 
echo "You will see 'Install complete' message once it's done"
echo ""
echo ""


source /srv/tools/scripts/functions.sh

install_user=$(getCurrentUser)

guiText "Installing system for $install_user" "Comment"
xcode_array=("Xcode 4" "Xcode 5" "Xcode 6" "Xcode 7" "Xcode 8" "Xcode 9" "Xcode 10")
guiText "Checking for xcode" "Comment"
for item in "${xcode_array[@]}"
do
    test_xcode=$(isInstalled "xcodebuild -version" "Xcode" "$item")
    export test_xcode
done
if [ -z "$test_xcode" ];
then 
    echo "Not Installed"
fi
xcode_array_cl=("version: 6" "version: 7" "version: 8" "version: 9" "version: 10")
guiText "Checking Xcode command line tools version" "Comment"
for item in "${xcode_array_cl[@]}"
do
    test_xcode_cl=$(isInstalled "pkgutil --pkg-info=com.apple.pkg.CLTools_Executables" "version:" "$item")
    export test_xcode_cl
done
if [ -z "$test_xcode_cl" ];
then 
    echo "Not Installed"
fi
guiText "Checking for Macports" "Comment"
isInstalled "port version" "Version:" "Version: 2"
guiText "Test of read" "Comment"
read -p "Do something: " something
echo $something













echo "Install complete"
echo "--------------------------------------------------------------"
echo ""