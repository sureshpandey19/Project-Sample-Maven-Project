#!/bin/bash

while [[ "$#" -gt 0 ]]; do
      case $1 in
		-H|--host) host="$2"; shift ;;
	        -u|--username) username="$2"; shift ;;
                -p|--password) password="$2"; shift;;
                -P|--port) Port="$2"; shift;;
                -D|--destinationpath) d_path="$2"; shift;;
				-S|--sourcepath) s_path="$2"; shift;;
                -h|--help) help="Help"; ;;
		-v|--version) version="Version"; ;;
	                  *) echo "Unknown parameter passed: $1"; exit 1 ;;
      esac
shift
done

echo ""
if [[ $version == "Version" ]]
then
    echo "Component_Deploy_Create Ver. 20.20.9.1 Copy Right@2020 - Planetcast media Services limited,NOIDA,IND"
fi

if [[ $help == "Help" ]]
then
	#echo ""
	echo ""
	echo "Usage: Component_Deploy_Create [-Options...]"
	echo ""
	echo "---------------------------------------------------------"
	echo "-H,--host                   Inspector Host IP Address or Name"
	echo "-u,--username               Host Root User Name"
	echo "-p,--password               Host Root User Password"
	echo "-P,--port                   Host SSH Connection Port"
	echo "-D,--destinationpath        Binary Destination Path"
	echo "-S,--sourcepath        Binary Source Path"
	echo "-v,--version                Application Version"
	echo "-h,--help                   Application Help" 
	echo "---------------------------------------------------------"
fi	

if [[ $host !=  "" && $username != ""  &&  $password != "" && $Port != "" && $d_path != "" ]] 
then

    /usr/local/bin/scp_comp.sh $host  $username $password $s_path $d_path
	if [ $? -eq 0 ]
	then
        exit 0
	else
		exit 1
	fi	

else
	echo "Error in Provided Parameter, please check help(-h/--help) option"
	echo ""
	echo ""
	exit 1
fi


