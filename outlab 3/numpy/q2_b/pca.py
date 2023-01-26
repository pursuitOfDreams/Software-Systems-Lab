import numpy as np
from numpy import asarray
from numpy import savetxt
from numpy import linalg as LA
import matplotlib.pyplot as plt
import os
import argparse
import pandas as pd


parser=argparse.ArgumentParser()
parser.add_argument("--path", type=str)
parser.add_argument("--output", type=str)
args=parser.parse_args()

dataset = pd.read_csv(args.path, header=None)

dataset -= dataset.mean(axis=0)
cov_mat = dataset.cov()
dataset = np.array(dataset)
eigenvals, eigenvectors = LA.eig(cov_mat)
eigenvectors = np.transpose(eigenvectors)
eigenvectors = np.array([x for _, x in sorted(zip(eigenvals, eigenvectors), reverse=True)])
eigenvectors = np.transpose(eigenvectors)
np.sort(eigenvals)
print(eigenvals)

eigenvectors = eigenvectors[:,0:2]

result = np.matmul(dataset, eigenvectors)
x = result[:, 0]
y = result[:, 1]
plt.scatter(x,y)
plt.xlim([-15,15])
plt.ylim([-15,15])

pathname = os.path.join(os.getcwd(), args.output)
filename = os.path.join(pathname, 'out.png')
plt.savefig(filename)

filename2=os.path.join(pathname, 'transform.csv')
savetxt(filename2, result, delimiter=',',fmt='%.16f')
