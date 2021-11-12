//
//  BinaryTree.swift
//  LeetCode-Practice
//
//  Created by loop安 on 2021/11/12.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class BinaryTree_Code:NSObject{
//    |226|翻转二叉树||阿里||
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
//        let temp:TreeNode = root.left
//        root.left = root.right
//        root.right = temp
        let left = invertTree(root.left)
        let right = invertTree(root.right)
        
        root.left = left
        root.right = right
        
        return root
        }
//    |104|二叉树展开为链表||阿里||
//    |543|二叉树的直径||阿里||
//    |110|平衡二叉树||阿里||
//    |111|二叉树的最小深度||阿里||
//    |101|对称二叉树||阿里||
//    |144|二叉树的前序遍历||阿里||
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var list:[Int] = []
        guard let root = root else { return [] }
        list.append(root.val)
        list += preorderTraversal(root.left)
        list += preorderTraversal(root.right)
        
        return list
    }
//    |572|另一棵树的子树||阿里||
//    |94|二叉树的中序遍历||阿里||
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var list = [Int]()
        guard let root = root else { return [] }
        list += inorderTraversal(root.left)
        list.append(root.val)
        list += inorderTraversal(root.right)
        return list
    }
//    |112|路径总和||阿里||
//    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
//
//        }
//    |100|相同的树||阿里||
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        } else if p == nil || q == nil || p?.val != q?.val {
            return false
        }
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
//    |235|二叉搜索树的最近公共祖先||阿里||
//    |108|将有序数组转换为二叉搜索树||阿里||
//    |257|二叉树的所有路径||阿里||
//    |145|二叉树的后序遍历||阿里||
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var list:[Int] = []
        guard let root = root else { return [] }
        list += postorderTraversal(root.left)
        list += postorderTraversal(root.right)
        list.append(root.val)
        return list
    }
}
