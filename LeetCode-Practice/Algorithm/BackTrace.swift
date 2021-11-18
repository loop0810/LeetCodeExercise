//
//  BackTrace.swift
//  LeetCode-Practice
//
//  Created by 魏安 on 2021/11/18.
//

import Foundation

/**
 result = []
 def backtrack(路径, 选择列表):
     if 满足结束条件:
         result.add(路径)
         return
     
     for 选择 in 选择列表:
         做选择
         backtrack(路径, 选择列表)
         撤销选择
 */

class BackTrace_Code: NSObject {
    
}

extension BackTrace_Code{
    // 46. 全排列
    func permute(_ nums: [Int]) -> [[Int]] {
        var list = [[Int]]()
        let track = [Int]()
        permuteHelper(nums, &list,track)
        return list
    }
    func permuteHelper(_ nums:[Int],_ res:inout [[Int]],_ track:[Int]){
        if track.count == nums.count {
            res.append(track)
            return
        }
        
        var l = track
        
        for i in nums {
            if track.contains(i) { continue }
            l.append(i)
            permuteHelper(nums, &res, l)
            l.removeLast()
        }
    }
    
    // 51. N 皇后
    func solveNQueens(_ n: Int) -> [[String]] {
        return [[".",".","."]]
    }
    // 698. 划分为k个相等的子集
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        if k > nums.count { return false }
        var sum = 0
        for i in nums { sum += i }
        if sum % k != 0 { return false}
        let target = sum / k
        
        let bucket = [Int](repeating: 0, count: k)
        
        let l = nums.sorted {num1,num2 in return num1 > num2}
        
        return kSubsetsHelper(target, 0, bucket, l)
    }
    func kSubsetsHelper(_ target:Int,_ index:Int,_ bucket:[Int],_ nums:[Int]) -> Bool{
        if index == nums.count {
            for i in 0 ..< bucket.count {
                if bucket[i] != target {
                    return false
                }
            }
            return true
        }
        
        var list = bucket
        
        for i in 0 ..< list.count {
            if list[i] + nums[index] > target {
                continue
            }
            list[i] += nums[index]
            if (kSubsetsHelper(target, index + 1, list, nums)){ return true}
            list[i] -= nums[index]
        }
        
        return false
    }
    
    // 78. 子集
    func subsets(_ nums: [Int]) -> [[Int]] {
//        var res = [[Int]]()
        return subsetsHelper(0, nums, [[]])
    }
    func subsetsHelper(_ index:Int,_ nums:[Int],_ res:[[Int]]) -> [[Int]]{
        if index == nums.count {
            return res
        }
        var temp = [[Int]]()
        for list in res {
            temp.append(list)
            var l = list
            l.append(nums[index])
            temp.append(l)
        }
        return subsetsHelper(index, nums, temp)
        
    }
}
