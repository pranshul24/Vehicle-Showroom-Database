import subprocess as sp
import pymysql
import pymysql.cursors
import traceback
import re
from datetime import datetime

clear = lambda : sp.call('clear', shell=True)
wait = lambda: input("Press ENTER key to continue")

def getinfo_accto_vehicleID_partialsearch(con, cur):
    try:
        pattern = input("Type vehicle id pattern : ")
        strp = pattern+"+"
        query = "SELECT First_name,Last_name,Email,VEHICLE.Vehicle_id,Model_name FROM VEHICLE,SALE,CUSTOMER WHERE VEHICLE.Vehicle_id=SALE.Vehicle_id AND Aadhar_number=Customer_Aadhar_no"
        cur.execute(query)
        myresult = cur.fetchall()

        if len(myresult) == 0:
            print("No such vehicle has been sold yet!!!")
        else:
            print("The number of SOLD vehicles with partial match in Vehicle Id : ")
            count = 0
            for x in myresult:
                if re.search(strp, x["Vehicle_id"]):
                    count += 1
                    print(x["First_name"], " ", x["Last_name"], " ",
                          x["Email"], " ", x["Vehicle_id"], " ", x["Model_name"])
            if count == 0:
                print("None")
        wait()
    except Exception as e:
        con.rollback()
        print(">>>>>>>>>>>>>", e)
        wait()
    return