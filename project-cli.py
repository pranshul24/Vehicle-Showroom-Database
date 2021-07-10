import subprocess as sp
import pymysql
import pymysql.cursors

import menu

DATABASE_NAME = "VEHICLE_DATABASE"
PORT = 5005


clear = lambda : sp.call('clear', shell=True)
wait = lambda: input("Press ENTER key to continue")


flag = True
while flag:
    clear()

    username = "root"
    password = "blahblah"

    try: 
        con = pymysql.connect(
            host="localhost",
            user=username,
            password=password,
            port=PORT,
            db=DATABASE_NAME,
            cursorclass=pymysql.cursors.DictCursor
        )

        clear()
        if con.open:
            print("Connected")
        else:
            print("Failed to connect")
        
        with con.cursor() as cur:
            while True:
                clear()

                menu.print_menu()

                ch = int(input("Enter Choice: "))
                clear()
                if ch == -1:
                    flag = False
                    break
                else:
                    menu.dispatch(con, cur, ch)
    except ValueError as ve:
        clear()
        print("Invalid Value")
        print(">>", ve)
        wait() 

    except Exception as e:
        clear()
        print("Couldn't Connect")
        print(">>", e)
        wait()


print("Program Closed")
