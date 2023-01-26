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

mean = np.mean(dataset, axis=0)
median = np.median(dataset, axis=0)
std = np.std(dataset, axis=0)
std = np.around(std, decimals=2)
determinant = np.linalg.det(dataset)
inverse = np.linalg.inv(dataset)
inverse = np.around(inverse, decimals=2)
print(mean)
print(median)
print(std)
print(determinant)
print(inverse)