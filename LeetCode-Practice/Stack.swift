//
//  Stack.swift
//  LeetCode-Practice
//
//  Created by loop安 on 2021/10/31.
//

import Foundation



class Stack_Code: NSObject {
    // MARK: --------简单--------
//    |20|有效的括号||阿里||
    func isValid(_ s: String) -> Bool {
        var push:[String] = []
                var lastSym:String = ""
                for char in s {
                    switch char{
                    case "(",
                         "{",
                         "[":
                        push.append(String(char))
                        break
                    case ")":
                        lastSym = push.last ?? ""
                        if lastSym != "("{
                            return false
                        }
                        push.removeLast()
                        break
                    case "}":
                        lastSym = push.last ?? ""
                        if lastSym != "{"{
                            return false
                        }
                        push.removeLast()
                        break
                    case "]":
                        lastSym = push.last ?? ""
                        if lastSym != "["{
                            return false
                        }
                        push.removeLast()
                        break
                    default:
                        break
                    }
                }
                if push.count != 0 {
                    return false
                }else{
                    return true
                }
        
    }
//    |155|最小栈||阿里||
    
//    |94|二叉树的中序遍历||阿里||
    
//    |144|二叉树的前序遍历||阿里||
    
//    |232|用栈实现队列||阿里||
    
//    |234|回文链表||阿里||
    
//    |225|用队列实现栈||阿里||
    
//    |145|二叉树的后序遍历||阿里||
    
//    |offer 09|用两个栈实现队列||阿里||
    
}

//    |155|最小栈||阿里||
class MinStack {
    private var stack:[Int]?
    private var minList:[Int]?
    
    init() {
        stack = []
        minList = [Int.max]
    }
    
    func push(_ val: Int) {
        stack?.append(val)
        minList?.append(min(minList?.last ?? 0, val))
    }
    
    func pop() {
        stack?.popLast()
    }
    
    func top() -> Int {
        return stack?.last ?? 0
    }
    
    func getMin() -> Int {
        return minList?.last ?? 0
    }
    

}
