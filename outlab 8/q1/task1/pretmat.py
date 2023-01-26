import re
import gdb
import re

class Mat2DPrinter:
    def __init__(self, val):
        self.val = val

    def to_string(self):
        # """
        # Use the self.val to decode the 2D Matrix into
        # the demanded format (check sample output in PS)
        # """

        # t = self.val.type
        # print(self.val.type)
        # elem1 = gdb.parse_and_eval('mat2d[0][0]')
        # print(int(elem1))

        t = str(self.val.type)
        t = t.replace(']', '[')
        splits = t.split('[')
        str_list = list()
        rows, cols = (2, 3) # get the rows and columns from val somehow
        rows = int(splits[1])
        cols = int(splits[3])

        str_list.append("ROWS: {row}".format(row=rows))
        str_list.append("COLUMNS: {col}".format(col=cols))

        for i in range(rows):
            temprow = "" # get the rows into a temporary string
            for j in range(cols):
                elem = gdb.parse_and_eval('mat2d[{a}][{b}]'.format(a=i,b=j))
                temprow += str(int(elem)) + " " 
            str_list.append(temprow)
        
        return '\n' + '\n'.join(str_list) 
        

def array2d_printer(val):
    if re.match("int \[[0-9]+\]\[[0-9]+\]", str(val.type)):  # maybe use regex?
        return Mat2DPrinter(val)


gdb.pretty_printers.append(array2d_printer)

############################################################################################