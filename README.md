# Pull_Files_From_S3

##########Instructions to download files from S3#################

This file contains configuration variables to download files from Amazon Simple Storage Service (S3).

Variables :-

1. AWS_ACCESS_KEY_ID: The AWS access key ID that provides access to the S3 bucket.
2. AWS_SECRET_ACCESS_KEY: The AWS secret access key that is associated with the access key ID.
3. Bucket_Name: The name of the S3 bucket that contains the folder in which files are to be downloaded.
4. Folder_Name: The name of the folder within the bucket that contains the files to be downloaded.
5. File_Names: A comma-separated list of the file names to be downloaded.
6. Destination_Folder_Path: The local file system path where the downloaded files will be stored.

Note :- 
	
1. Do not add spaces after the commas in the File_Names variable.
2. Ensure that the destination folder specified in Destination_Folder_Path exists before running the script.
3. Ensure that AWS Cli must be installed
