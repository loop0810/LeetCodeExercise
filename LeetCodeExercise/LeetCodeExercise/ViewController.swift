//
//  ViewController.swift
//  LeetCodeExercise
//
//  Created by loop安 on 2019/1/10.
//  Copyright © 2019年 loop安. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        print(self .longestCommonPrefix(["aa","a"]))
        print(self.isValid(""))
    }
    //MARK:合并两个有序链表
//    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        var mergeList:ListNode
//        while l1?.next &&  {
//            <#code#>
//        }
//    }
    
    //MARK:有效的括号
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
    
    //MARK:两数之和
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0 ..< nums.count {
            let min = target - nums[i]
            for j in i+1 ..< nums.count {
                if (nums[j] == min){
                    return [i,j]
                }
            }
        }
        return []
    }
    
    //MARK:回文数
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        let intStr = NSString.init(format: "%d", x)
        let mid = intStr.length / 2
        var preHalfStr = ""
        var nextHalfStr = ""
        if (intStr.length % 2 == 0) {
            //偶数
            preHalfStr = intStr.substring(to: mid)
            nextHalfStr = intStr.substring(with: NSRange.init(location: mid, length: mid))
        }else{
            //奇数
            preHalfStr = intStr.substring(to: mid + 1)
            nextHalfStr = intStr.substring(with: NSRange.init(location: mid, length: mid + 1))
        }
        var str = ""
        for char in nextHalfStr.reversed(){
            str.append(char)
        }
        if preHalfStr == str {
            return true
        }else{
            return false
        }
    }
    
    //MARK:整数反转
    func reverse(_ x: Int) -> Int {
        let isNav:Bool = x < 0 ? true : false
        let intStr:String = String.init(format: "%d", abs(x))
        var str = isNav ? "-" : ""
        for char in intStr.reversed() {
            str.append(char)
        }
        let s:NSString = str as NSString
        let res = Int(s.integerValue)
        if (2 << 30 >= abs(res)){
            return res
        }else{
            return 0
        }
    }
    
    //MARK:罗马数字转整数
    func romanToInt(_ s: String) -> Int {
        var arr:[Character] = []
        for char in s {
            arr.append(char)
        }
        var sum = 0
        var flag = 0
        
        for i in 0 ..< arr.count{
            if(i < arr.count - 1){//临界条件
                if(flag == 1){
                    flag = 0
                    continue
                }
                if(arr[i] == "I" && (arr[i + 1] == "V" || arr[i + 1] == "X")){
                    flag = 1
                    switch arr[i + 1]{
                    case "V":
                        sum += 4
                        break
                    case "X":
                        sum += 9
                        break
                    default:
                        break
                    }
                }
                if(arr[i] == "X" && (arr[i + 1] == "L" || arr[i + 1] == "C")){
                    flag = 1
                    switch arr[i + 1]{
                    case "L":
                        sum += 40
                        break
                    case "C":
                        sum += 90
                        break
                    default:
                        break
                    }
                }
                if(arr[i] == "C" && (arr[i + 1] == "D" || arr[i + 1] == "M")){
                    flag = 1
                    switch arr[i + 1]{
                    case "D":
                        sum += 400
                        break
                    case "M":
                        sum += 900
                        break
                    default:
                        break
                    }
                }
            }
            if(flag == 0){
                if(arr[i] == "I"){
                    sum += 1
                }else if(arr[i] == "V"){
                    sum += 5
                }else if(arr[i] == "X"){
                    sum += 10
                }else if(arr[i] == "L"){
                    sum += 50
                }else if(arr[i] == "C"){
                    sum += 100
                }else if(arr[i] == "D"){
                    sum += 500
                }else if(arr[i] == "M"){
                    sum += 1000
                }
            }
        }
        return sum
    }
    //MARK:最长公共前缀
    //待优化
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty {
            return ""
        }else if strs.count == 1{
            return strs.first ?? ""
        }else{
            var preStr = ""
            var tempStr = ""
            var flag = 0
            for char in strs.first ?? "" {
                tempStr.append(char)
                for str in strs{
                    let subStr = String(str[..<str.index(str.startIndex, offsetBy: (tempStr.count > str.count ? str.count : tempStr.count))])
                    if (subStr != tempStr){
                        flag = 1
                    }
                }
                if (flag == 1){
                    return preStr
                }
                preStr.append(char)
            }
            return preStr
        }
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

