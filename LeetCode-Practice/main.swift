//
//  main.swift
//  LeetCode-Practice
//
//  Created by loop安 on 2021/10/28.
//

import Foundation


//var sort = Sort_Code()
//
//print(sort.insertSort([4,5,6,1,3,2]))
//
//
//var binary = BinarySearch_Code()
//
//print(binary.searchCount([1], 1))


var tree = BinaryTree_Code()

var tree5 = TreeNode(5)
var tree3 = TreeNode(3)
var tree2 = TreeNode(2)
tree2.left = nil
tree2.right = tree5
var tree1 = TreeNode(1)
tree1.left = tree2
tree1.right = tree3

//tree.inorderTraversal(tree1)
print(tree.binaryTreePaths(tree1))
