import os
import argparse

def geturl(x):
    if x in complete_url:
        return x
    elif x in incomplete_url:
        return complete_url[incomplete_url.index(x)]
    elif x in sup_incomplete_url:
        return complete_url[sup_incomplete_url.index(x)]



parser = argparse.ArgumentParser()
parser.add_argument("--path1", type=str)
parser.add_argument("--path2", type=str)
parser.add_argument("--output", type=str)
args = parser.parse_args()

# pathname = os.path.join(os.getcwd(), args.path)
complete_url = []
incomplete_url = []
sup_incomplete_url = []
with open(args.path1, 'r') as f:
        while True:
            row = f.readline()
            if row == "":
                break
            if row[-1] == "\n":
                row = row[:-1]
            complete_url.append(row)
            data = row.split(sep=r"/")
            print(data[2])
            data2=row.split(sep=r"/", maxsplit=2)
            incomplete_url.append(data2[2])
            sup_incomplete_url.append(data2[2][4:])

inputs = []
num = 0
pathname = os.path.join(args.output, "winner.txt")
file = open(pathname, 'w')
with open(args.path2, 'r') as f:
    while True:
        row = f.readline()
        if row == "":
            break
        if row[-1] == "\n":
            row = row[:-1]
        data3 = row.split(sep=r"||")
        inputs.append(data3[3])
        if data3[3] in complete_url or data3[3] in incomplete_url or data3[3] in sup_incomplete_url:
            print("user_name -", data3[0],": Winner - Lucky draw!!! -",geturl(data3[3]))
            file.writelines([data3[0],"||",data3[2],"||", geturl(data3[3])])
            file.write("\n")
            num+=1
print(num)
