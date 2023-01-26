import gdb
import numpy as np

rsps=[]
rbps=[]
def printer(event):
    rsp = int(gdb.parse_and_eval("$rsp"))
    rbp = int(gdb.parse_and_eval("$rbp"))

    curr = gdb.selected_inferior()
    # print(rsp)
    # print(curr.read_memory(rsp,8)[7])
    # print(rbp)

    if rsp<=rbp:
        rbps.append(rbp)
    # else:
    #     rbps.append(rsp)
    rsps.append(rsp)

    rsps.reverse()
    rbps.reverse()

    # print(rbps, rsps)
    # i = len(rbps)-1
    # print("+-------------------------+")
    # while True:
    #     if i<0:
    #         print("+-------------------------+")
    #         break
    #     print("|", hex(rsps[i]),"|")
    #     print("+-------------------------+")
    #     print("|", hex(rbps[i]),"|")
    #     print("+-------------------------+")
    #     i = i-1

    # print("+-------------------------+")

    # print(hex(int.from_bytes(curr.read_memory(rsps[0],1)[0],'big'))[2:])
    if len(rbps)!=0:
        print("+"+25*"-"+"+")


    for ind, rsp in enumerate(rsps):
        counter=0
        
        if ind!=0:
            break

        if len(rbps)==0:
            break
        

        while True:
            quit=True

            c=curr.read_memory(rsp,81)

            if c[counter]==curr.read_memory(rbps[ind],8)[0]:
                d=curr.read_memory(rbps[ind],8)

                for i in range(8):
                    out=hex(int.from_bytes(d[i],'big'))[2:].zfill(2)
                    if out!="00":
                        quit=False
                    
                    if i==0:
                        print("| "+out+" ", end="")
                        continue

                    if i==7:
                        if ind==0:
                            if counter==0:
                                print(out+" | "+"<- rsp rbp",end="\n")
                            else:
                                print(out+" | "+"<- rbp",end="\n")

                        else:
                            print(out+" | ",end="\n")

                        print("+"+25*"-"+"+")
                        break
                    print(out+" ",end="")


            else:
                
                for i in range(8):
                    out= hex(int.from_bytes(c[counter+i],'big'))[2:].zfill(2)
                    if out!="00":
                        quit=False

                    if i==0:
                        print("| "+out+" ", end="")
                        continue

                    if i==7:
                        if counter==0 and ind==0:
                            print(out+" | "+"<- rsp",end="\n")
                        else:
                            print(out+" |",end="\n")
                        print("+"+25*"-"+"+")
                        break

                    print(out+" ",end="")

            if c[counter]==curr.read_memory(rbps[len(rbps)-1],8)[0] and c[counter+4]==curr.read_memory(rbps[len(rbps)-1],8)[4]:
                quit=True

            if quit:
                break

            counter+=8
    
    rsps.reverse()
    rbps.reverse()
    

gdb.events.stop.connect(printer)

