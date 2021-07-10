import subprocess as sp
import pymysql
import pymysql.cursors
import traceback
import re
from datetime import datetime

clear = lambda : sp.call('clear', shell=True)
wait = lambda: input("Press ENTER key to continue")

def removeEmployee(con, cur):

    try:
        eid = int((input("Enter Employee Id : ")))
        if eid:
            query = "DELETE FROM EMPLOYEE WHERE Employee_id=%d" % (
                eid)
            fl = int((input("To confirm press `1` else press `2` : ")))
            if fl == 2:
                query = ""
        else:
            query = ""
        cur.execute(query)
        print("Employee entry removed")
        con.commit()
        wait()
    except Exception as e:
        con.rollback()
        print(">>>>>>>>>>>>>", e)
        wait()
    return


def Return_Vehicle(con, cur):
    try:
        v_id=input('Please enter Vehicle id of the vehicle you want to return: ')
        query="DELETE FROM SUPPLIES WHERE Vehicle_id='{}'".format(v_id)
        
        #Checking for redundencies
        tQuery="SELECT * FROM SUPPLIES WHERE Vehicle_id='{}'".format(v_id)
        cur.execute(tQuery)
        if cur.rowcount==0:
            print('The vehicle with this id has not yet been supplied')
            wait()
            return -1
        tQuery="SELECT * FROM SALE WHERE Vehicle_id='{}'".format(v_id)
        cur.execute(tQuery)
        if cur.rowcount==1:
            print('The vehicle with this id has already been sold')
            wait()
            return -1
        # print(query)  
        cur.execute(query)
        query="DELETE FROM VEHICLE WHERE Vehicle_id='{}'".format(v_id)
        # print(query)  
        cur.execute(query)
        con.commit()
        print("Vehicle Returned Successfully")
        wait()
    except Exception as e:
        con.rollback()
        print("Failed to Retrieve from database")
        print(">>>>>>>>>>>>>", e)
        wait()

