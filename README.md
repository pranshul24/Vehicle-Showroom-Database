<!-- Is Written in Markdown Format -->
# Vehicle Showroom Database
## TO RUN

__In project_cli.py we've hardcoded__
```
    DATABASE_NAME='VEHICLE_DATABASE' // Line 7
    PORT=5005 // Line 8
    username='root' // Line 19
    password='blahblah' // Line 20
    host='localhost' // Line 24
```
> Please Change these values according to your configuration.

__To Setup Database:__
* Create (If Already Doesn't Exist)
```
CREATE DATABASE VEHICLE_DATABASE; 
USE VEHICLE_DATABASE
```
* Import Database (Use path to the file according to where it is stored in your pc)
```
SOURCE vehicledump.sql
```
>  Now Your database should be setup and ready.

__To Run CLI__
Open a Terminal in the folder with code and run the following command
```
python3 project-cli.py
```
You should now be in the CLI

