import os
import sys
sys.path.append(os.path.abspath(os.path.join(os.path.dirname("__file__"))))

import gdb
from utils import printBTree

############################################################################################
# SKELETON CODE FOR PRINTING
############################################################################################
class TreeNode:

    def __init__(self, data):
        self.left = None
        self.right = None
        self.value = data

    def insert(self, srcnode, leftORright, data):
        """
        Inserts a new node with the `data` to the left
        or right of the `srcnode` depending on the 
        `leftORright` being -1 or 1 respectively.
        """
        if leftORright == -1:
            srcnode.left = TreeNode(data)
        elif leftORright == 1:
            srcnode.right = TreeNode(data)

    def printTree(self):
        return printBTree(self, lambda n: (str(n.value), n.left, n.right), isTop=False)
############################################################################################


############################################################################################
# YOU CAN START EDITING BELOW
############################################################################################

def makeTree(curr, t):
    if(t['left']!=0x0):
        curr.insert(curr, -1, t['left'].dereference()['data'])
        makeTree(curr.left, t['left'])
    if(t['right']!=0x0):
        curr.insert(curr, 1, t['right'].dereference()['data'])
        makeTree(curr.right, t['right'])






class TreePrinter:
    def __init__(self, val):
        self.val = val

    def to_string(self):
        r = self.val['root']
        t = r.dereference()
        root = TreeNode(t['data'])


        makeTree(root, t)
        #root = TreeNode()
        
        #
        # Build and fillup the TreeNode structure 
        # using the contents of `self.val`.
        #

        return '\n' + '\n'.join(root.printTree())

def tree_printer(val):
    if str(val.type) == "tree":
        return TreePrinter(val)
 

gdb.pretty_printers.append(tree_printer)
############################################################################################
