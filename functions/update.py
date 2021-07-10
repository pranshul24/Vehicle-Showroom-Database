import subprocess as sp
import pymysql
import pymysql.cursors
import traceback
import re
from datetime import datetime
import time

clear = lambda : sp.call('clear', shell=True)
wait = lambda: input("Press ENTER key to continue")

def update_contact(con, cur):
    print("|| Update Contact Info ||")
    print("1. Cleaning Agency")
    print("2. Customer")
    print("3. Factory")

    try:
        ch = int(input("Enter choice: "))
        clear()
        if ch == 1:
            reg_no = int(input("Enter Agency's Registration Number: "))
            old_no = int(input("Enter Old phone number: "))
            new_no = int(input("Enter New phone numnber: "))

            query = "UPDATE CLEANING_AGENCY_CONTACT SET Contact_number='{}' WHERE Registration_number='{}' AND Contact_number='{}'".format(new_no, reg_no, old_no)
            cur.execute(query)
            con.commit()
            print("Updated Succesfully")
            wait()

        elif ch == 2:
            a_no = int(input("Enter Aadhar Number of Customer: "))
            old_no = int(input("Enter Old phone number: "))
            new_no = int(input("Enter New phone numnber: "))

            query = "UPDATE CUSTOMER_CONTACT SET Contact_number='{}' WHERE Aadhar_number='{}' AND Contact_number='{}'".format(new_no, a_no, old_no)
            cur.execute(query)
            con.commit()
            print("Updated Succesfully")
            wait()
        elif ch == 3:
            reg_no = int(input("Enter Factory's Registration Number: "))
            old_no = int(input("Enter Old phone number: "))
            new_no = int(input("Enter New phone numnber: "))

            query = "UPDATE FACTORY_CONTACT SET Contact_number='{}' WHERE Registration_number='{}' AND Contact_number='{}'".format(new_no, reg_no, old_no)
            cur.execute(query)
            con.commit()
            print("Updated Succesfully")
            wait()
        else:
            print("Invalid Choice")
            wait()

    except Exception as e:
        print("Error during updation")
        con.commit()
        print(">>", e)
        wait()

def Update_Address(con, cur):
    try:
        print('1. For updating address of Service Center\n2. For Updating address of Customer')
        n=int(input('Enter your choice: '))
        if(n==1):
            db='SERVICE_CENTER'
            db_id='Center_id'
            did=int(input('Please enter center id: '))
            ad=input('Enter new address\n')    
        elif(n==2):
            db='CUSTOMER'
            db_id='Aadhar_number'
            did=int(input('Please enter Aadhar number: '))
            ad=input('Enter new address\n')    
        else:
            return -1
        query='''UPDATE {db}
        SET 
            Address='{address}'
        WHERE
            {db_id}={did};
        '''.format(db=db, address=ad, db_id=db_id, did=did)
        cur.execute(query)
        con.commit()
        print("Inserted Into Database")
        wait()

    except ValueError as ve:
        print("Please enter a valid Integer")    
        wait()    

    except Exception as e:
        con.rollback()
        print("Failed to update the database")
        print(">>>>>>>>>>>>>", e)
        wait()


def update_hours(con, cur):
    try:
        eid = int(input("Enter employee id: "))
        hours = int(input("Enter new number of hours: "))

        query = "UPDATE EMPLOYEE SET Hours={} WHERE Employee_id={}".format(hours, eid)
        cur.execute(query)
        con.commit()
        print("Updated successfully")
        wait()

    except Exception as e:
        con.rollback()
        clear()
        print("Error during updation")
        print(">>", e)
