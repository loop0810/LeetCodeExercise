//
//  Sort.swift
//  LeetCode-Practice
//
//  Created by 魏安 on 2021/11/1.
//

import Foundation

class Sort_Code: NSObject {
    // MARK: - 冒泡排序
    func bubbleSort(_ list:[Int]) -> [Int]{
        if list.count <= 1 {
            return list
        }
        var arr = list
        for x in 0 ..< arr.count {
            var flag = false
            for y in 0 ..< arr.count - x - 1 {
                if arr[y] > arr[y + 1] {
                    let temp = arr[y + 1]
                    arr[y + 1] = arr[y]
                    arr[y] = temp
                    flag = true
                }
            }
            if !flag {break}
        }
        return arr
    }
    
    // MARK: - 插入排序
    func insertSort(_ list:[Int]) -> [Int]{
        if list.count <= 1 { return list }
        var arr = list
    
        for x in 1 ..< arr.count {
            let value = arr[x]
            var y = x - 1
            while y >= 0 {
                if arr[y] > value {
                    arr[y + 1] = arr[y]
                    y -= 1
                } else {
                    break
                }
            }
            arr[y + 1] = value
        }
        return arr
    }
    // MARK: - 选择排序
    func selectSort(_ list:[Int]) -> [Int]{
        if list.count <= 1 {return list}
        var arr = list
        for x in 0 ..< arr.count{
            var index = 0
            var min = Int.max
            var flag = false
            for y in x ..< arr.count{
                if arr[y] < min {
                    min = arr[y]
                    index = y
                    flag = true
                }
            }
            if !flag {break}
            
            let temp = arr[x]
            arr[x] = arr[index]
            arr[index] = temp
        }
        return arr
    }
    // MARK: - 
    
}
