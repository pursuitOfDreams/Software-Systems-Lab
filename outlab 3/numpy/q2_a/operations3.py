import numpy as np
import os
import argparse

parser=argparse.ArgumentParser()
parser.add_argument("--path", type=str)
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
print(np.sort(dataset,axis=0))
print(np.sort(dataset,axis=1))
print(np.sort(np.ndarray.flatten(dataset)))