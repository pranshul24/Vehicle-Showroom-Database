import subprocess as sp
import pymysql
import pymysql.cursors
import traceback
import re
from datetime import datetime
import time

clear = lambda : sp.call('clear', shell=True)
wait = lambda: input("Press ENTER key to continue")

def add_employee(con, cur):
    print("|| Enter details of employee ||")
    try:
        eid = int(input("Enter employee id: "))
        fname = input("Enter First Name: ")
        lname = input("Enter Last Name: ")
        salary = input("Enter Salary: ")
        pan = input("Enter PAN Number: ")
        hours = input("Enter no. of hours employee will work: ")

        query = "INSERT INTO EMPLOYEE(Employee_id, First_name, Last_name, Salary, Pan_number, Hours) VALUES('{}', '{}', '{}', '{}', '{}', '{}')".format(eid, fname, lname, salary, pan, hours)
        cur.execute(query)
        con.commit()
        print("Inserted Employee")
        wait()

    except Exception as e:
        print("Error during insertion")
        print(">>", e)
        wait()

def Add_Sale(con, cur):
    try:
        vehicle_id=input('Please enter Vehicle id: ')
        tQuery="SELECT * FROM SUPPLIES WHERE Vehicle_id='{}';".format(vehicle_id)
        # print(tQuery)
        cur.execute(tQuery)
        if(cur.rowcount==0 or cur.rowcount>1):
            print('Vehicle Not Yet supplied\n')
            wait()
            return -1
        actprice=0
        for row in cur:
            actprice=row['Price']
        customer_aadhar=int(input('Enter Aadhar number of Customer(Make sure the customer is registered): '))
        tQuery="SELECT * FROM CUSTOMER WHERE Aadhar_number={};".format(customer_aadhar)
        cur.execute(tQuery)
        if(cur.rowcount==0):
            print('Customer Doesn\'t exist Please register customer or check aadhar number')
            wait()
            return -1
        salep_id=int(input('Please enter SalePerson\'s id: '))
        servicec_id=int(input('Please enter id of service center associated with vehicle: '))
        sale_price=int(input('Please enter Sale Price: '))
        profit=sale_price-actprice
        cur_time=time.strftime('%Y-%m-%d %H:%M:%S')
        payment_type=input('Please enter payment type(CASH/CARD/OTHER): ')
        query="INSERT INTO SALE(Vehicle_id, Customer_Aadhar_no, Service_Center_id, SalesPerson_id, Sale_price, Profit, Date, Payment_type) VALUES('{}', {}, {}, {}, {}, {}, '{}', '{}');".format(
            vehicle_id, customer_aadhar, servicec_id, salep_id, sale_price, profit, cur_time, payment_type)
        cur.execute(query)
        con.commit()
        print("Inserted Into Database")
        wait()

    except ValueError:
        print("Please enter a valid Integer")    
        wait()    

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)
        wait()


def insertVehicle(con ,cur):
    try:
        row = {}
        print("Enter vehicle's details: ")
        row["vehicle_id"] = input("Enter Vehicle id: ")
        row["model_name"] = input("Enter Model name: ")
        row["passenger_capacity"] = int(input("Enter passenger capacity: "))

        query = "INSERT INTO VEHICLE(Vehicle_id,Model_name,Passenger_capacity) VALUES('%s', '%s', %d)" % (
            row["vehicle_id"], row["model_name"], row["passenger_capacity"])
        cur.execute(query)
        vtype = int(input("For car press-`1` and for bike press-`2` : "))
        if vtype == 1:
            fuel = input("Enter Fuel type : ")
            cartype = input("Enter Car type : ")
            query1 = "INSERT INTO CAR(Vehicle_id,Fuel,Car_Type) VALUES('%s', '%s', '%s')" % (
                row["vehicle_id"], fuel, cartype)
        elif vtype == 2:
            query1 = "INSERT INTO BIKE(Vehicle_id) VALUES('%s')" % (
                row["vehicle_id"])
        cur.execute(query1)
        row2 = {}
        row2["factory_id"] = int(input("Enter Factory id: "))
        row2["manager_id"] = int(input("Enter Manager id: "))
        row2["price"] = int(input("Enter purchasing price: "))
        now = datetime.now()
        formatted_date = now.strftime('%Y-%m-%d %H:%M:%S')
        query1 = "INSERT INTO SUPPLIES(Vehicle_id,Factory_id,Date,Price) VALUES('%s', %d,'%s', %d)" % (
            row["vehicle_id"], row2["factory_id"], formatted_date, row2["price"])
        cur.execute(query1)
        query1 = "SELECT * FROM PURCHASES_VEHICLE_FROM WHERE Factory_id=%d" % (
            row2["factory_id"])
        cur.execute(query1)
        myresult = cur.fetchall()
        k1 = len(myresult)
        if k1 == 0:
            query1 = "INSERT INTO PURCHASES_VEHICLE_FROM(Manager_id,Factory_id) VALUES(%d, %d)" % (
                row2["manager_id"], row2["factory_id"])
            cur.execute(query1)
        con.commit()
        print("Vehicle successfully inserted Into Database")
        wait()

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)
        wait()

    return


def insertCustomer(con, cur):
    try:
        row = {}
        print("Enter Customer's details: ")
        row["Aadhar_number"] = int(input("Enter Aadhar number : "))
        row["First_name"] = input("Enter first name: ")
        row["Last_name"] = input("Enter last name: ")
        row["Email"] = input("Enter Email id: ")
        row["Address"] = input("Enter Address: ")
        query = "INSERT INTO CUSTOMER(Aadhar_number,First_name,Last_name,Email,Address) VALUES(%d,'%s', '%s', '%s','%s')" % (
            row["Aadhar_number"], row["First_name"], row["Last_name"], row["Email"], row["Address"])
        cur.execute(query)
        contacts = input(
            "Enter space separated contact numbers : ")
        if contacts:
            arr = contacts.split(' ')
            for x in arr:
                query = "INSERT INTO CUSTOMER_CONTACT(Aadhar_number,Contact_number) VALUES(%d,%d)" % (
                    row["Aadhar_number"], int(x))
                cur.execute(query)
        con.commit()
        print("Customer successfully inserted Into Database")
        wait()

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)
        wait()

    return
