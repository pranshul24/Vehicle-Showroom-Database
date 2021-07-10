import subprocess as sp
import pymysql
import pymysql.cursors
import traceback
import re
from datetime import datetime

clear = lambda : sp.call('clear', shell=True)
wait = lambda: input("Press ENTER key to continue")

def getinfoCustomer(con, cur):
    try:
        row = {}
        print("Enter customer's details: ")
        name = (input("Name (Fname Lname): ")).split(' ')
        row["First_name"] = name[0]
        row["Last_name"] = name[1]
        row["Aadhar_number"] = input("Aadhar number: ")
        row["contact_number"] = input("Contact number: ")

        if row["Aadhar_number"]:
            query = "SELECT * FROM CUSTOMER WHERE Aadhar_number=%d" % (
                int(row["Aadhar_number"]))
        elif row["contact_number"]:
            k = int(row["contact_number"])
            query = "SELECT CUSTOMER.Aadhar_number,First_name,Last_name,Email,Address FROM CUSTOMER_CONTACT,CUSTOMER WHERE Contact_number = %d AND CUSTOMER.Aadhar_number=CUSTOMER_CONTACT.Aadhar_number" % (
                k)
        else:
            query = "SELECT * FROM CUSTOMER WHERE First_name='%s' AND Last_name='%s'" % (
                row["First_name"], row["Last_name"])
        cur.execute(query)
        myresult = cur.fetchall()
        clear()
        if len(myresult) == 0:
            print("No matching records!")
            wait()
            return None

        # print("Aadhar_number First_name Last_name Email Address")
        print("{:15} {:15} {:15} {:35} {}".format("Aadhar Number", "First Name", "Last Name", "Email", "Address"))        
        for x in myresult:
            print("{:<15} {:15} {:15} {:35} {}".format(x["Aadhar_number"], x["First_name"], x["Last_name"], x["Email"], x["Address"]))
        wait()
    
    
    except Exception as e:
        con.rollback()
        print(">>", e)
        wait()
    return


def getinfoEmployee(con, cur):
    clear()
    print("|| Retreive Employee Details ||")
    print("1. Using Employee Id")
    print("2. Using Employee Name")

    try:
        ch = int(input("Enter Choice: "))
        clear()

        if ch == 1:
            eid = input("Enter Id to search: ")
            query = "SELECT * FROM EMPLOYEE WHERE Employee_id='{}'".format(eid)
        elif ch == 2:
            name = input("Enter Name to search (using First name OR Last name (not both)): ")
            query = "SELECT * FROM EMPLOYEE WHERE First_name='{}' OR Last_name='{}'".format(name, name)
        else:
            clear()
            print("Invalid Choice!")
            wait()
            return None
        
        cur.execute(query)
        data = cur.fetchall()

        clear()
        if len(data) == 0:
            print("No records found!")
            wait()
            return None
        
        print("{:15} {:15} {:15} {:10} {:15} {:10}".format("Employee Id", "First Name", "Last Name", "Salary", "Pan Number", "Hours"))
        for row in data:
            print("{:<15} {:<15} {:<15} {:<10} {:<15} {:<10}".format(row["Employee_id"], row["First_name"], row["Last_name"], row["Salary"], row["Pan_number"], row["Hours"]))

        con.commit()
        wait()

    except Exception as e:
        print("Error during retreival")
        print(">>", e)
        wait()

def Get_Salary(con, cur):
    try:
        id=input("Enter 0 to retrieve all Salaies\nInput comma separated id's for multiple\nPlease Enter Employee id: ")
        clear()
        query="SELECT * FROM EMPLOYEE"
        if(len(id.split(",")) > 1):
            query=query+" WHERE"
            for i in range(len(id.split(","))-1):
                query=query+" EMPLOYEE.Employee_id={} OR".format(int(id.split(",")[i]))
            query=query+" EMPLOYEE.Employee_id={}".format(int(id.split(",")[len(id.split(","))-1]))
        elif(int(id)==0):
            print("Showing Salary for all employees")
        else:
            query=query+" WHERE EMPLOYEE.Employee_id={}".format(int(id))
        cur.execute(query)
        if(cur.rowcount>0):    
            print ("{:<10} {:<10}".format('ID', 'Salary')) 
            for row in cur:
                print ("{:<10} {:<10}".format(row['Employee_id'], row['Salary'])) 
        else:
            print("Employee with id doesn't exist")
        wait()
    except ValueError:
        print("Please enter a valid Integer") 
        wait()       
    except Exception as e:
       print("Failed to Retrieve from database")
       print(">>", e)
       wait()
