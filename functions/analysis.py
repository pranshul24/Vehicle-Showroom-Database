import subprocess as sp
import pymysql
import pymysql.cursors
import traceback
import re
from datetime import datetime

clear = lambda : sp.call('clear', shell=True)
wait = lambda: input("Press ENTER key to continue")

def sales_generated(con, cur):
    query = "SELECT SALE.SalesPerson_id, EMPLOYEE.First_name, EMPLOYEE.Last_name, SUM(Sale_price), COUNT(Sale_id) FROM EMPLOYEE JOIN SALE WHERE Employee_id=SalesPerson_id GROUP BY SalesPerson_id"
    try:
        cur.execute(query)
        data = cur.fetchall()
        if len(data) == 0:
            print("No records found!")
            wait()
            return None;
        print("{:15} {:20} {:35} {:15}".format("Salesperson Id", "Name", "Total Sales generated (in Rs.)", "Vehicles Sold"))

        for row in data:
            print("{:<15} {:20} {:<35} {:<15}".format(row["SalesPerson_id"], row["First_name"] + " " + row["Last_name"],int(row["SUM(Sale_price)"]), row["COUNT(Sale_id)"]))

        wait()

    
    except Exception as e:
        print("Error during retreival")
        print(">>", e)
        wait()


def Get_Inventory(con, cur):
    try:
        query="SELECT Model_name, COUNT(*) as NumModels from (SELECT * FROM VEHICLE WHERE Vehicle_id NOT IN (SELECT s.Vehicle_id  FROM SALE s)) T GROUP BY Model_name;"
        cur.execute(query)
        if(cur.rowcount>0):    
            print ("{:<40} {:<4}".format('Model_name', 'NumModels')) 
            for row in cur:
                print ("{:<40} {:<10}".format(row['Model_name'], row['NumModels'])) 
        else:
            print("Inventory is empty")
        wait()
    except Exception as e:
       print("Failed to Retrieve from database")
       print(">>>>>>>>>>>>>", e)
       wait()

def getVehiclesSoldperModel(con ,cur):
    try:
        query = "SELECT Model_name,COUNT(*) Number_sold FROM VEHICLE,SALE WHERE VEHICLE.Vehicle_id=SALE.Vehicle_id GROUP BY Model_name"
        cur.execute(query)
        myresult = cur.fetchall()
        if len(myresult) == 0:
            print("No vehicle has been sold yet!!!")
        else:
            print("The number of vehicles sold per model : ")
            # print("Model name         Count")
            print("{:40} {}".format("Model name", "Count"))
            for x in myresult:
                print("{:<40} {}".format(x["Model_name"], x["Number_sold"]))
        wait()
    except Exception as e:
        con.rollback()
        print(">>>>>>>>>>>>>", e)
        wait()
    return
