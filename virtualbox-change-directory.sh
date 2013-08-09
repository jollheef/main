echo "Please edit this file and check variables, exit..."
exit

# Warn! Path must not contain double slash.
HOME=/home/michael/
Config=${HOME}.VirtualBox
ConfigBackup=/tmp/vboxconfig$(date +%s).old.tar.gz
MoveFrom=${HOME}VirtualBox\ VMs/
MoveTo=${HOME}vbox-vms/

exitIfFail() {
    if [[ "${?}" != "0" ]]; then
	echo "Something went wrong..."
	exit
    fi
}

echo "--- Backup ${Config} to ${ConfigBackup}"
tar cfz ${ConfigBackup} ${Config}
exitIfFail
echo "--- Change directory in config files (and logs, lol, 1984 :D)"
MoveFrom_ForSed=$(echo ${MoveFrom} | sed 's/\//\\\//g')
MoveTo_ForSed=$(echo ${MoveTo} | sed 's/\//\\\//g')
MoveFrom_ForSed=$(echo ${MoveFrom_ForSed} | sed 's/ /\\ /g')
MoveTo_ForSed=$(echo ${MoveTo_ForSed} | sed 's/ /\\ /g')
echo "s/${MoveFrom_ForSed}/${MoveTo_ForSed}/g"
sed -i "s/${MoveFrom_ForSed}/${MoveTo_ForSed}/g" ${Config}/*
exitIfFail
echo "--- Create ${MoveTo} directory"
mkdir -p ${MoveTo}
exitIfFail
echo "--- Move files from ${MoveFrom} to ${MoveTo}"
mv "${MoveFrom}"/* "${MoveTo}"
exitIfFail
echo "--- Remove old VBox directory"
rm "${MoveFrom}" -rf
exitIfFail
