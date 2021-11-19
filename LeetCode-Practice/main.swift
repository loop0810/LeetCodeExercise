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

var re = Recursion_Code()
//print(re.fib(20))

var dy = Dynamic_Code()
//print(dy.fib(n: 20))
//print(dy.lengthOfLIS([1,4,3,4,2,3]))
//print(dy.minFallingPathSum([[2,1,3],[6,5,4],[7,8,9]]))
//print(dy.longestCommonSubsequence("abcde", "ace"))
//print(dy.longestPalindromeSubseq("bbbab"))
//print(dy.minDistance("a", "c"))
//print(dy.canPartition([1,2,3,5]))
//print(dy.eraseOverlapIntervals([[1,2],[2,3],[3,4],[1,3]]))
//print(dy.minMeetingRooms([[0,30],[5,10],[15,20]]))
//print(dy.minMeetingRooms([[2,15],[36,45],[9,29],[16,23],[4,9]]))
//print(dy.videoStitching([[0,2],[4,6],[8,10],[1,9],[1,5],[5,9]], 10))
//print(dy.jump1([2,0,2,4,6,0,0,3]))
//print(dy.removeCoveredIntervals([[1,4],[3,6],[1,3],[2,8]]))
//print(dy.merge([[1,3],[2,6],[8,10],[15,18]]))

var bt = BackTrace_Code()
//print(bt.canPartitionKSubsets([1739,5391,8247,236,5581,11,938,58,1884,823,686,1760,6498,6513,6316,2867],6))

var dp = DoublePoint_Code()
//print(dp.checkInclusion("abcdxabcde","abcdeabcdx"))
//print(dp.findAnagrams("acdcaeccde","c"))
var l2 = ListNode(2)
var l7 = ListNode(7)
l7.next = l2
var l6 = ListNode(6)
l6.next = l7
var l5 = ListNode(5)
l5.next = l6
var l4 = ListNode(4)
l4.next = l5
var l3 = ListNode(3)
l3.next = l4

l2.next = l3
var l1 = ListNode(1)
l1.next = nil





print(dp.removeNthFromEnd(l1, 1))
