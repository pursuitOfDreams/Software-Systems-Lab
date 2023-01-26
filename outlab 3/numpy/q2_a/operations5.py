import numpy as np
import os
import argparse

parser=argparse.ArgumentParser()
parser.add_argument("--path", type=str)
parser.add_argument("--num", type=int)
args=parser.parse_args()
file = open(args.path, "r")
data = []
while True:
    row = file.readline()
    if row == "":
        break
    if row[-1] == "\n":
        row = row[:-1]
    split_row = row.split(",")
    split_row = list(map(int, split_row))
    data.append(split_row)

dataset = np.array(data)
dataset2 = np.zeros([len(dataset)+2*args.num, len(dataset[0])+2*args.num], dtype=int)
dataset2[args.num:args.num+len(dataset),args.num:args.num+len(dataset)] = dataset
print(dataset2)