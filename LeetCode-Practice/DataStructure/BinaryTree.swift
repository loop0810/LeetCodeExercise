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
    
    // MARK: - 简单
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
//    |543|二叉树的直径||阿里||
//    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
//
//    }
//    |110|平衡二叉树||阿里||
    func isBalanced(_ root: TreeNode?) -> Bool {
        return height(root) >= 0
    }
    
    func height(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let leftH = height(root?.left)
        let rightH = height(root?.right)
        
        if leftH == -1 || rightH == -1 || abs(leftH - rightH) > 1 {
            return -1
        } else {
            return max(leftH, rightH) + 1
        }
    }
//    |104|二叉树的最大深度||阿里||
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let leftDepth = maxDepth(root.left)
        let rightDepth = maxDepth(root.right)
        
        return leftDepth > rightDepth ? leftDepth + 1 : rightDepth + 1
    }
//    |111|二叉树的最小深度||阿里||
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let leftDepth = minDepth(root.left)
        let rightDepth = minDepth(root.right)
        
        if root.left == nil && root.right != nil{
            return rightDepth + 1
        }
        if root.right == nil && root.left != nil {
            return leftDepth + 1
        }
        
        return leftDepth < rightDepth ? leftDepth + 1 : rightDepth + 1
    }
//    |101|对称二叉树||阿里||
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isS(p: root?.left, q: root?.right)
    }
    func isS(p: TreeNode?, q:TreeNode?) -> Bool{
        if (p == nil) && (q == nil) {
            return true
        }
        if (p == nil) || (q == nil) {
            return false
        }
        
        return p?.val == q?.val && isS(p: p?.left, q: q?.right) && isS(p: p?.right, q: q?.left)
    }
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
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        return subDfs(r: root, s: subRoot)
    }
    
    func subDfs(r:TreeNode?,s:TreeNode?) -> Bool {
        if r == nil {return false}
        if r?.val == s?.val && subCheck(r: r, s: s) {return true}
        
        return subDfs(r: r?.left, s: s) || subDfs(r: r?.right, s: s)
    }
    
    func subCheck(r:TreeNode?,s:TreeNode?) -> Bool{
        if r == nil && s == nil {
            return true
        }
        if (r == nil && s != nil) || (r != nil && s == nil) || r?.val != s?.val {
            return false
        }
        return subCheck(r: r?.left, s: s?.left) && subCheck(r: r?.right, s: s?.right)
    }
    
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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        // 如果当前节点的值大于 pp 和 qq 的值，说明 pp 和 qq 应该在当前节点的左子树，因此将当前节点移动到它的左子节点；
        if root!.val > p!.val && root!.val > q!.val {
            return lowestCommonAncestor(root?.left, p, q)
        }
        // 如果当前节点的值小于 pp 和 qq 的值，说明 pp 和 qq 应该在当前节点的右子树，因此将当前节点移动到它的右子节点；
        if root!.val < p!.val && root!.val < q!.val {
            return lowestCommonAncestor(root?.right, p, q)
        }
        // 如果当前节点的值不满足上述两条要求，那么说明当前节点就是「分岔点」。此时，pp 和 qq 要么在当前节点的不同的子树中，要么其中一个就是当前节点。
        return root
    }

//    |108|将有序数组转换为二叉搜索树||阿里||
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return sortHelper(nums, left: 0, right: nums.count - 1)
    }
    func sortHelper(_ nums: [Int],left: Int,right: Int) -> TreeNode?{
        if left > right  {
            return nil
        }
        // 选取中点当做节点，可保证树的平衡性
        let mid = left + (right - left) / 2
        let node = TreeNode(nums[mid])
        node.left = sortHelper(nums, left: left, right: mid - 1)
        node.right = sortHelper(nums, left: mid + 1, right: right)
        return node
    }
//    |257|二叉树的所有路径||阿里||
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var paths:[String] = []
        let path = ""
        pathHelper(root: root, path: path, paths: &paths)
        
        return paths
    }
    
    func pathHelper(root: TreeNode?,path: String,paths:inout [String]){
        if root == nil {return}
        var tmpPath = path
        tmpPath += "\(root!.val)"
        if root?.left == nil && root?.right == nil {
            paths.append(tmpPath)
        } else {
            tmpPath += "->"
            pathHelper(root: root?.left,path: tmpPath,paths: &paths)
            pathHelper(root: root?.right,path: tmpPath,paths: &paths)
        }
    }
//    |145|二叉树的后序遍历||阿里||
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var list:[Int] = []
        guard let root = root else { return [] }
        list += postorderTraversal(root.left)
        list += postorderTraversal(root.right)
        list.append(root.val)
        return list
    }
    
    // MARK: - 中等
//    |104|二叉树展开为链表||阿里||
    func flatten(_ root: TreeNode?) {
        guard let root = root else { return }
        
        flatten(root.left)
        flatten(root.right)
        
        let left:TreeNode? = root.left
        let right:TreeNode? = root.right
        
        root.left = nil
        root.right = left
        
        var p:TreeNode? = root
        while p?.right != nil {
            p = p?.right
        }
        
        p?.right = right
    }
    
}
