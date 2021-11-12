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


var tree3 = TreeNode(3)
var tree2 = TreeNode(2)
tree2.left = tree3
tree2.right = nil
var tree1 = TreeNode(1)
tree1.left = nil
tree1.right = tree2

tree.inorderTraversal(tree1)
