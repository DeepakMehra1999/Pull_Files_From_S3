#!/bin/bash


#present working directory
pwd=$(pwd)

#importing variables from an input file
source ./input_file.txt

#Use below variables for color coding
reset=`tput sgr0`
red=`tput setaf 1`


#Use if statement if AWS credentials are empty
if [ -z "$AWS_ACCESS_KEY_ID" ]; then
  echo "${red}Please specify the value to AWS_ACCESS_KEY_ID${reset}"
fi

if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
  echo "${red}Please specify the value to AWS_SECRET_ACCESS_KEY${reset}"
  exit
fi

#if user fills, AWS credentials but he/she missed to fill file names, give below message and exit from script
if [ -z "$File_Names" ]; then
  echo "${red}Please specify the value to File_Names${reset}"
  exit
fi


#declare an array to store all the file names in an array
declare -a File_Array

#Convert the comma-separated string into an array
IFS="," read -r -a File_Array <<< "$File_Names"


#Pull files from S3
for File in "${File_Array[@]}"; do
  AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} /usr/local/bin/aws --region us-east-2 s3 cp s3://$Bucket_Name/$Folder_Name/$File $Destination_Folder_Path
  if [ $? -ne 0 ]; then
    echo "${red}Error: AWS S3 download operation for file $File failed ${reset}"
    exit 1
    fi
done




echo -e "\n********************************"
echo "File pulled Successfully"
echo "Check '$Destination_Folder_Path' path to see the downloaded files"
echo "********************************"

#Remove values of below lines from an input file
sed -i 's/AWS_ACCESS_KEY_ID=.*/AWS_ACCESS_KEY_ID=/g' $pwd/input_file.txt
sed -i 's/AWS_SECRET_ACCESS_KEY=.*/AWS_SECRET_ACCESS_KEY=/g' $pwd/input_file.txt
sed -i 's/File_Names=.*/File_Names=/g' $pwd/input_file.txt