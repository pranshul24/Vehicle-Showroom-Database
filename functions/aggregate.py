import subprocess as sp
import pymysql
import pymysql.cursors
import traceback
import re
from datetime import datetime

clear = lambda : sp.call('clear', shell=True)
wait = lambda: input("Press ENTER key to continue")

def GetDatefromstr(date):
    if len(date)<8 or len(date)>8:
        return 0
    d, m, y=date[0:2], date[2:4], date[4:]
    dstr='{}-{}-{} 00:00:00'.format(y, m, d)
    return dstr

def get_total_salary(con, cur):
    query = "SELECT SUM(Salary) FROM EMPLOYEE"
    try:
        cur.execute(query)
        data = cur.fetchall()
        data = data[0]["SUM(Salary)"]

        clear()
        if data == None:
            print("No records found!")
            wait()
            return None

        print("Total Salary:", data)
        
        con.commit()
        wait()

    except Exception as e:
        print("Error during aggregate")
        print(">>", e)
        wait()

def Total_Profit(con, cur):
    try:
        print('Enter 0 if choose to give no value')
        from_d=GetDatefromstr(input('From Date ddmmyyyy: '))
        to_d=GetDatefromstr(input('To Date ddmmyyyy: '))
        clear()
        query="SELECT SUM(Profit) as prof FROM SALE"
        if(from_d!=0):
            query=query+" WHERE Date>'{}'".format(from_d)
        if(to_d!=0):
            query=query+" WHERE Date<'{}'".format(to_d)
        query=query+";"
        cur.execute(query)
        if(cur.rowcount==1):
            for row in cur:
                print ('Total Profit made By Company in given timeframe = {}'.format(row['prof']))
        else:
            print('No sale done yet')
        wait()
    except Exception as e:
       print("Failed to Retrieve from database")
       print(">>>>>>>>>>>>>", e)
       wait()
