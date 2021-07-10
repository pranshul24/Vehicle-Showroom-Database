import subprocess as sp
import pymysql
import pymysql.cursors
import traceback
import re
from datetime import datetime

clear = lambda : sp.call('clear', shell=True)
wait = lambda: input("Press ENTER key to continue")

def getCustomerperModel(con, cur):

    try:
        name = (input("Enter name of the model : "))
        if name:
            query = "SELECT First_name,Last_name FROM CUSTOMER,SALE,VEHICLE WHERE Model_name='%s' AND VEHICLE.Vehicle_id=SALE.Vehicle_id AND Customer_Aadhar_no=Aadhar_number" % (
                name)
        else:
            query = ""
        cur.execute(query)
        myresult = cur.fetchall()
        if len(myresult) == 0:
            print("No records found!")
            wait()
            return None
        
        for x in myresult:
            print(x["First_name"], " ", x["Last_name"])
        wait()
    except Exception as e:
        con.rollback()
        print(">>>>>>>>>>>>>", e)
        wait()
    return
