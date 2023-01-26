import os
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--path", type=str)
args = parser.parse_args()

dict = {}
# pathname = os.path.join(os.getcwd(), args.path)
for filename in os.listdir(args.path):
    with open(os.path.join(args.path, filename), 'r') as f:
        while True:
            row = f.readline()
            if row == "":
                break
            if row[-1] == "\n":
                row = row[:-1]
            data = row.split(sep="-")
            if data[0] in dict:
                dict[data[0]]=[int(idx)+dict[data[0]][i] for i,idx in enumerate(data[1:])]
            else:
                dict.update({data[0]:[int(i) for i in data[1:]]})

medals = []
countries = []
for item in dict:
    medals.append(dict[item][0])
    countries.append(item)

countries = [x for _, x in sorted(zip(medals, countries), reverse=True)]
medals.sort(reverse=True)

dict3={}
for _ in range(len(medals)-1):
    for i in range(len(medals)-1):
        if medals[i]==medals[i+1] and countries[i]>countries[i+1]:
            countries[i], countries[i+1] = countries[i+1], countries[i]
for item in countries:
    dict3.update({item:dict[item]})
print(dict3)
