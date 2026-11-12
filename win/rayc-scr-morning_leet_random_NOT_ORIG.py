#!/usr/bin/env python3
"""
Author: Alex M King
Description: opens a random leet in the morning
"""

################ FLAG IDEAS / EXTENSIONS ################
# - allow user to specify difficulty levels (so I'd have easy, medium, hard lists and/or tags)
# - allow user to specify topics (so I'd have arrays for arrays, strings, linked lists, trees, etc)
# - allow user to specify openining ALL links of a certain type and or topic (so like open-all-array-probs) or open-all-EASY-graph-probs
# - allow user to combine the three like so: open-all-medium-tree-probs (so we get 'all' and 'medium' and 'tree-category') 
# EXAMPLES:
# open-all-medium-tree-probs
# open-one-medium-tree-probs
# open-all-easy-array-probs
# open-one-hard-graph-probs
#
#
#
################ END FLAG IDEAS / EXTENSIONS ################

import argparse
import random
import webbrowser


ALL_LINKS = [
	##########################################################################################################
	# ARRAYS (category 1)	9 tot
	##########################################################################################################
	{"url": "https://leetcode.com/problems/contains-duplicate/description/?envType=list&envId=rwtad4ld", "difficulty": "easy", "category": 1},
	{"url": "https://leetcode.com/problems/valid-anagram/description/?envType=list&envId=rwtad4ld", "difficulty": "easy", "category": 1},
    {"url": "https://leetcode.com/problems/two-sum/description/?envType=list&envId=rwtad4ld", "difficulty": "easy", "category": 1},
	{"url": "https://leetcode.com/problems/group-anagrams/description/?envType=list&envId=rwtad4ld", "difficulty": "medium", "category": 1},
	{"url": "https://leetcode.com/problems/top-k-frequent-elements/description/?envType=list&envId=rwtad4ld", "difficulty": "medium", "category": 1},
	{"url": "https://leetcode.com/problems/product-of-array-except-self/description/?envType=list&envId=rwtad4ld", "difficulty": "medium", "category": 1},
	{"url": "https://leetcode.com/problems/valid-sudoku/description/?envType=list&envId=rwtad4ld", "difficulty": "medium", "category": 1},
	{"url": "https://leetcode.com/problems/encode-and-decode-strings/description/?envType=list&envId=rwtad4ld", "difficulty": "medium", "category": 1},
	{"url": "https://leetcode.com/problems/longest-consecutive-sequence/description/?envType=list&envId=rwtad4ld", "difficulty": "medium", "category": 1},
	##########################################################################################################
	# STACKS (category 2)	5 tot
	##########################################################################################################
	{"url": "https://leetcode.com/problems/valid-parentheses/description/?envType=list&envId=rwtn0o06", "difficulty": "easy", "category": 2},
	{"url": "https://leetcode.com/problems/min-stack/description/?envType=list&envId=rwtn0o06", "difficulty": "medium", "category": 2},
	{"url": "https://leetcode.com/problems/generate-parentheses/description/?envType=list&envId=rwtn0o06", "difficulty": "medium", "category": 2},
	{"url": "https://leetcode.com/problems/daily-temperatures/description/?envType=list&envId=rwtn0o06", "difficulty": "medium", "category": 2},
	{"url": "https://leetcode.com/problems/largest-rectangle-in-histogram/description/?envType=list&envId=rwtn0o06", "difficulty": "hard", "category": 2},
	##########################################################################################################
	# TWO PTS (category 3)	5 tot
	##########################################################################################################
	{"url": "https://leetcode.com/problems/valid-palindrome/description/?envType=list&envId=rwtajj31", "difficulty": "easy", "category": 3},
	{"url": "https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/?envType=list&envId=rwtajj31", "difficulty": "medium", "category": 3},
	{"url": "https://leetcode.com/problems/3sum/description/?envType=list&envId=rwtajj31", "difficulty": "medium", "category": 3},
	{"url": "https://leetcode.com/problems/container-with-most-water/description/?envType=list&envId=rwtajj31", "difficulty": "medium", "category": 3},
	{"url": "https://leetcode.com/problems/trapping-rain-water/description/?envType=list&envId=rwtajj31", "difficulty": "hard", "category": 3},
	##########################################################################################################
	# SLIDING WINDOW (category 4)	6 tot
	##########################################################################################################
	{"url": "https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/?envType=list&envId=rwtn7fvc", "difficulty": "easy", "category": 4},
	{"url": "https://leetcode.com/problems/longest-substring-without-repeating-characters/description/?envType=list&envId=rwtn7fvc", "difficulty": "medium", "category": 4},
	{"url": "https://leetcode.com/problems/longest-repeating-character-replacement/description/?envType=list&envId=rwtn7fvc", "difficulty": "medium", "category": 4},
	{"url": "https://leetcode.com/problems/permutation-in-string/description/?envType=list&envId=rwtn7fvc", "difficulty": "medium", "category": 4},
	{"url": "https://leetcode.com/problems/minimum-window-substring/description/?envType=list&envId=rwtn7fvc", "difficulty": "hard", "category": 4},
	{"url": "https://leetcode.com/problems/sliding-window-maximum/description/?envType=list&envId=rwtn7fvc", "difficulty": "hard", "category": 4},
	##########################################################################################################
	# BIN_SEARCH (category 5)	7 tot
	##########################################################################################################
	{"url": "https://leetcode.com/problems/binary-search/description/?envType=list&envId=rwtnlcni", "difficulty": "easy", "category": 5},
	{"url": "https://leetcode.com/problems/search-a-2d-matrix/description/?envType=list&envId=rwtnlcni", "difficulty": "medium", "category": 5},
	{"url": "https://leetcode.com/problems/koko-eating-bananas/description/?envType=list&envId=rwtnlcni", "difficulty": "medium", "category": 5},
	{"url": "https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/description/?envType=list&envId=rwtnlcni", "difficulty": "medium", "category": 5},
	{"url": "https://leetcode.com/problems/search-in-rotated-sorted-array/description/?envType=list&envId=rwtnlcni", "difficulty": "medium", "category": 5},
	{"url": "https://leetcode.com/problems/time-based-key-value-store/description/?envType=list&envId=rwtnlcni", "difficulty": "medium", "category": 5},
	{"url": "https://leetcode.com/problems/median-of-two-sorted-arrays/description/?envType=list&envId=rwtnlcni", "difficulty": "hard", "category": 5},
	##########################################################################################################
    # LINKED_LIST (category 6)	11 tot
	##########################################################################################################
	{"url": "https://leetcode.com/problems/reverse-linked-list/description/?envType=list&envId=rwtni42e", "difficulty": "easy", "category": 6},
	{"url": "https://leetcode.com/problems/merge-two-sorted-lists/description/?envType=list&envId=rwtni42e", "difficulty": "easy", "category": 6},
	{"url": "https://leetcode.com/problems/reorder-list/description/?envType=list&envId=rwtni42e", "difficulty": "medium", "category": 6},
	{"url": "https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/?envType=list&envId=rwtni42e", "difficulty": "medium", "category": 6},
	{"url": "https://leetcode.com/problems/copy-list-with-random-pointer/description/?envType=list&envId=rwtni42e", "difficulty": "medium", "category": 6},
	{"url": "https://leetcode.com/problems/add-two-numbers/description/?envType=list&envId=rwtni42e", "difficulty": "medium", "category": 6},
	{"url": "https://leetcode.com/problems/linked-list-cycle/description/?envType=list&envId=rwtni42e", "difficulty": "medium", "category": 6},
	{"url": "https://leetcode.com/problems/find-the-duplicate-number/description/?envType=list&envId=rwtni42e", "difficulty": "medium", "category": 6},
	{"url": "https://leetcode.com/problems/lru-cache/description/?envType=list&envId=rwtni42e", "difficulty": "medium", "category": 6},
	{"url": "https://leetcode.com/problems/merge-k-sorted-lists/description/?envType=list&envId=rwtni42e", "difficulty": "hard", "category": 6},
	{"url": "https://leetcode.com/problems/reverse-nodes-in-k-group/description/?envType=list&envId=rwtni42e", "difficulty": "hard", "category": 6},
	##########################################################################################################
	# TREES (category 7) 	16 tot 
	##########################################################################################################
	{"url": "https://leetcode.com/problems/invert-binary-tree/description/?envType=list&envId=rwtnb7qc", "difficulty": "easy", "category": 7},
	{"url": "https://leetcode.com/problems/maximum-depth-of-binary-tree/description/?envType=list&envId=rwtnb7qc", "difficulty": "easy", "category": 7},
	{"url": "https://leetcode.com/problems/diameter-of-binary-tree/description/?envType=list&envId=rwtnb7qc", "difficulty": "easy", "category": 7},
	{"url": "https://leetcode.com/problems/balanced-binary-tree/description/?envType=list&envId=rwtnb7qc", "difficulty": "easy", "category": 7},
	{"url": "https://leetcode.com/problems/same-tree/description/?envType=list&envId=rwtnb7qc", "difficulty": "easy", "category": 7},
	{"url": "https://leetcode.com/problems/subtree-of-another-tree/description/?envType=list&envId=rwtnb7qc", "difficulty": "easy", "category": 7},
	{"url": "https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/description/?envType=list&envId=rwtnb7qc", "difficulty": "medium", "category": 7},
	{"url": "https://leetcode.com/problems/binary-tree-postorder-traversal/description/?envType=list&envId=rwtnb7qc", "difficulty": "medium", "category": 7},
	{"url": "https://leetcode.com/problems/binary-tree-level-order-traversal/description/?envType=list&envId=rwtnb7qc", "difficulty": "medium", "category": 7},
	{"url": "https://leetcode.com/problems/binary-tree-right-side-view/description/?envType=list&envId=rwtnb7qc", "difficulty": "medium", "category": 7},
	{"url": "https://leetcode.com/problems/count-good-nodes-in-binary-tree/description/?envType=list&envId=rwtnb7qc", "difficulty": "medium", "category": 7},
	{"url": "https://leetcode.com/problems/validate-binary-search-tree/description/?envType=list&envId=rwtnb7qc", "difficulty": "medium", "category": 7},
	{"url": "https://leetcode.com/problems/kth-smallest-element-in-a-bst/description/?envType=list&envId=rwtnb7qc", "difficulty": "medium", "category": 7},
	{"url": "https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/?envType=list&envId=rwtnb7qc", "difficulty": "hard", "category": 7},
	{"url": "https://leetcode.com/problems/binary-tree-maximum-path-sum/description/?envType=list&envId=rwtnb7qc", "difficulty": "hard", "category": 7},
	{"url": "https://leetcode.com/problems/serialize-and-deserialize-binary-tree/description/?envType=list&envId=rwtnb7qc", "difficulty": "hard", "category": 7},
	##########################################################################################################
	# TRIES (category 8)	3 tot			[NO-EASY's]
	##########################################################################################################
	{"url": "https://leetcode.com/problems/implement-trie-prefix-tree/description/?envType=list&envId=rwtvnp95", "difficulty": "medium", "category": 8},
	{"url": "https://leetcode.com/problems/design-add-and-search-words-data-structure/description/?envType=list&envId=rwtvnp95", "difficulty": "medium", "category": 8},
	{"url": "https://leetcode.com/problems/word-search-ii/description/?envType=list&envId=rwtvnp95", "difficulty": "hard", "category": 8},
	##########################################################################################################
    # HEAPS (category 9)	7 tot			
	##########################################################################################################
	{"url": "https://leetcode.com/problems/kth-largest-element-in-a-stream/description/?envType=list&envId=rwtnf28e", "difficulty": "easy", "category": 9},
	{"url": "https://leetcode.com/problems/last-stone-weight/description/?envType=list&envId=rwtnf28e", "difficulty": "easy", "category": 9},
	{"url": "https://leetcode.com/problems/k-closest-points-to-origin/description/?envType=list&envId=rwtnf28e", "difficulty": "medium", "category": 9},
	{"url": "https://leetcode.com/problems/kth-largest-element-in-an-array/description/?envType=list&envId=rwtnf28e", "difficulty": "medium", "category": 9},
	{"url": "https://leetcode.com/problems/task-scheduler/description/?envType=list&envId=rwtnf28e", "difficulty": "medium", "category": 9},
	{"url": "https://leetcode.com/problems/design-twitter/description/?envType=list&envId=rwtnf28e", "difficulty": "medium", "category": 9},
	{"url": "https://leetcode.com/problems/find-median-from-data-stream/description/?envType=list&envId=rwtnf28e", "difficulty": "hard", "category": 9},
	##########################################################################################################
	# INTERVALS (category 10)	6 tot		[NO-EASY's]
	##########################################################################################################
	{"url": "https://leetcode.com/problems/insert-interval/description/?envType=list&envId=rtwdas4j", "difficulty": "medium", "category": 10},
	{"url": "https://leetcode.com/problems/merge-intervals/?envType=list&envId=rtwdas4j", "difficulty": "medium", "category": 10},
	{"url": "https://leetcode.com/problems/non-overlapping-intervals/description/?envType=list&envId=rtwdas4j", "difficulty": "medium", "category": 10},
	{"url": "https://leetcode.com/problems/meeting-rooms/description/?envType=list&envId=rtwdas4j", "difficulty": "easy", "category": 10},
	{"url": "https://leetcode.com/problems/meeting-rooms-ii/description/?envType=list&envId=rtwdas4j", "difficulty": "medium", "category": 10},
	{"url": "https://leetcode.com/problems/minimum-interval-to-include-each-query/description/?envType=list&envId=rtwdas4j", "difficulty": "hard", "category": 10},
	##########################################################################################################
	# GREEDY (category 11)		8 tot		[NO-EASY's]
	##########################################################################################################
	{"url": "https://leetcode.com/problems/maximum-subarray/description/?envType=list&envId=rtwlwiei", "difficulty": "medium", "category": 11},
	{"url": "https://leetcode.com/problems/jump-game/description/?envType=list&envId=rtwlwiei", "difficulty": "medium", "category": 11},
	{"url": "https://leetcode.com/problems/jump-game-ii/description/?envType=list&envId=rtwlwiei", "difficulty": "medium", "category": 11},
	{"url": "https://leetcode.com/problems/gas-station/description/?envType=list&envId=rtwlwiei", "difficulty": "hard", "category": 11}, # says med, actually HARD
	{"url": "https://leetcode.com/problems/hand-of-straights/description/?envType=list&envId=rtwlwiei", "difficulty": "medium", "category": 11},
	{"url": "https://leetcode.com/problems/merge-triplets-to-form-target-triplet/description/?envType=list&envId=rtwlwiei", "difficulty": "medium", "category": 11},
	{"url": "https://leetcode.com/problems/partition-labels/description/?envType=list&envId=rtwlwiei", "difficulty": "medium", "category": 11},
	{"url": "https://leetcode.com/problems/valid-parenthesis-string/description/?envType=list&envId=rtwlwiei", "difficulty": "medium", "category": 11},
	##########################################################################################################
    # BACKTRACKING (category 12)	9 tot		[NO-EASY's]
	##########################################################################################################
	{"url": "https://leetcode.com/problems/subsets/description/?envType=list&envId=rwtvvex6", "difficulty": "medium", "category": 12},
	{"url": "https://leetcode.com/problems/combination-sum/description/?envType=list&envId=rwtvvex6", "difficulty": "medium", "category": 12},
	{"url": "https://leetcode.com/problems/permutations/description/?envType=list&envId=rwtvvex6", "difficulty": "medium", "category": 12},
	{"url": "https://leetcode.com/problems/subsets-ii/description/?envType=list&envId=rwtvvex6", "difficulty": "medium", "category": 12},
	{"url": "https://leetcode.com/problems/combination-sum-ii/description/?envType=list&envId=rwtvvex6", "difficulty": "medium", "category": 12},
	{"url": "https://leetcode.com/problems/word-search/description/?envType=list&envId=rwtvvex6", "difficulty": "medium", "category": 12},
	{"url": "https://leetcode.com/problems/palindrome-partitioning/description/?envType=list&envId=rwtvvex6", "difficulty": "medium", "category": 12},
	{"url": "https://leetcode.com/problems/letter-combinations-of-a-phone-number/?envType=list&envId=rwtvvex6", "difficulty": "medium", "category": 12},
	{"url": "https://leetcode.com/problems/n-queens/description/?envType=list&envId=rwtvvex6", "difficulty": "hard", "category": 12},
	##########################################################################################################
	# DYN_PROG_1D (category 13)		12 tot
	##########################################################################################################
	{"url": "https://leetcode.com/problems/climbing-stairs/description/?envType=list&envId=rtwt49bh", "difficulty": "easy", "category": 13},
	{"url": "https://leetcode.com/problems/min-cost-climbing-stairs/description/?envType=list&envId=rtwt49bh", "difficulty": "easy", "category": 13},
	{"url": "https://leetcode.com/problems/house-robber/description/?envType=list&envId=rtwt49bh", "difficulty": "medium", "category": 13},
	{"url": "https://leetcode.com/problems/house-robber-ii/description/?envType=list&envId=rtwt49bh", "difficulty": "medium", "category": 13},
	{"url": "https://leetcode.com/problems/longest-palindromic-substring/description/?envType=list&envId=rtwt49bh", "difficulty": "medium", "category": 13},
	{"url": "https://leetcode.com/problems/palindromic-substrings/description/?envType=list&envId=rtwt49bh", "difficulty": "medium", "category": 13},
	{"url": "https://leetcode.com/problems/decode-ways/description/?envType=list&envId=rtwt49bh", "difficulty": "medium", "category": 13},
	{"url": "https://leetcode.com/problems/coin-change/description/?envType=list&envId=rtwt49bh", "difficulty": "medium", "category": 13},
	{"url": "https://leetcode.com/problems/maximum-product-subarray/description/?envType=list&envId=rtwt49bh", "difficulty": "medium", "category": 13},
	{"url": "https://leetcode.com/problems/word-break/description/?envType=list&envId=rtwt49bh", "difficulty": "medium", "category": 13},
	{"url": "https://leetcode.com/problems/longest-increasing-subsequence/description/?envType=list&envId=rtwt49bh", "difficulty": "medium", "category": 13},
	{"url": "https://leetcode.com/problems/partition-equal-subset-sum/description/?envType=list&envId=rtwt49bh", "difficulty": "medium", "category": 13},
	##########################################################################################################
	# GRAPH (category 14)		14 tot 		[NO-EASY's]
	##########################################################################################################
	{"url": "https://leetcode.com/problems/number-of-islands/description/?envType=list&envId=rtw8e97v", "difficulty": "medium", "category": 14},
	{"url": "https://leetcode.com/problems/clone-graph/description/?envType=list&envId=rtw8e97v", "difficulty": "medium", "category": 14},
	{"url": "https://leetcode.com/problems/max-area-of-island/description/", "difficulty": "medium", "category": 14},
	{"url": "https://leetcode.com/problems/pacific-atlantic-water-flow/description/?envType=list&envId=rtw8e97v", "difficulty": "medium", "category": 14},
	{"url": "https://leetcode.com/problems/surrounded-regions/description/?envType=list&envId=rtw8e97v", "difficulty": "medium", "category": 14},
	{"url": "https://leetcode.com/problems/rotting-oranges/description/?envType=list&envId=rtw8e97v", "difficulty": "medium", "category": 14},
	{"url": "https://leetcode.com/problems/walls-and-gates/description/?envType=list&envId=rtw8e97v", "difficulty": "medium", "category": 14},
	{"url": "https://leetcode.com/problems/course-schedule/description/?envType=list&envId=rtw8e97v", "difficulty": "medium", "category": 14},
	{"url": "https://leetcode.com/problems/course-schedule-ii/description/?envType=list&envId=rtw8e97v", "difficulty": "medium", "category": 14},
	{"url": "https://leetcode.com/problems/redundant-connection/description/?envType=list&envId=rtw8e97v", "difficulty": "medium", "category": 14},
	{"url": "https://leetcode.com/problems/shortest-path-in-binary-matrix/description/", "difficulty": "medium", "category": 14},
	{"url": "https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/description/?envType=list&envId=rtw8e97v", "difficulty": "medium", "category": 14},
	{"url": "https://leetcode.com/problems/graph-valid-tree/description/?envType=list&envId=rtw8e97v", "difficulty": "medium", "category": 14},
	{"url": "https://leetcode.com/problems/word-ladder/description/?envType=list&envId=rtw8e97v", "difficulty": "medium", "category": 14},
	##########################################################################################################
	# DYN_PROG_2D (category 15) 	14 tot 		[NO-EASY's] 	(geeksforgeeks link for that knapsack prob)
	##########################################################################################################
	{"url": "https://leetcode.com/problems/unique-paths/description/?envType=list&envId=rtw8vv91", "difficulty": "medium", "category": 15},
	{"url": "https://leetcode.com/problems/unique-paths-ii/description/", "difficulty": "medium", "category": 15},
	{"url": "https://leetcode.com/problems/longest-common-subsequence/description/?envType=list&envId=rtw8vv91", "difficulty": "medium", "category": 15},
	{"url": "https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/description/?envType=list&envId=rtw8vv91", "difficulty": "medium", "category": 15},
	{"url": "https://leetcode.com/problems/coin-change-ii/description/?envType=list&envId=rtw8vv91", "difficulty": "medium", "category": 15},
	{"url": "https://leetcode.com/problems/target-sum/description/?envType=list&envId=rtw8vv91", "difficulty": "medium", "category": 15},
	{"url": "https://leetcode.com/problems/interleaving-string/description/?envType=list&envId=rtw8vv91", "difficulty": "medium", "category": 15},
	{"url": "https://leetcode.com/problems/edit-distance/description/?envType=list&envId=rtw8vv91", "difficulty": "medium", "category": 15},
	{"url": "https://leetcode.com/problems/ones-and-zeroes/description/", "difficulty": "medium", "category": 15},
	{"url": "https://www.geeksforgeeks.org/dsa/0-1-knapsack-problem-dp-10/", "difficulty": "medium", "category": 15},
	{"url": "https://leetcode.com/problems/distinct-subsequences/description/?envType=list&envId=rtw8vv91", "difficulty": "medium", "category": 15},
	{"url": "https://leetcode.com/problems/burst-balloons/description/?envType=list&envId=rtw8vv91", "difficulty": "medium", "category": 15},
	{"url": "https://leetcode.com/problems/regular-expression-matching/description/?envType=list&envId=rtw8vv91", "difficulty": "medium", "category": 15},
	{"url": "https://leetcode.com/problems/longest-increasing-path-in-a-matrix/description/?envType=list&envId=rtw8vv91", "difficulty": "medium", "category": 15}
]

#### KIM we still have 3 extra categories to add (less imp ones...but still)
	# 1. the ADVANCED ALGS category with 6 probs
	# 2. the BIT MANIPULATION category with 6-8 problems
	# 3. the MATH AND GEO category with 8 probs

# TODO ??? 
# TODO ??? 
# TODO ??? 
# TODO ??? 
#### IDEA TO THINK ABOUT IMPL ....
# we add 1 more category to represent the 'special' categories/lists of problems (like my CATCH-UP list or my top-problems list (the probs with the ** on them in leetecxcel))
# then, we copy paste those links into that category as well (so they will be duplicated in the ALL_LINKS list, but that's ok)
# this way, we'll be able to aggressively filter for those top problems without need to add an entire new tag to each problem (like "is_top_problem": True or something like that)
# TODO ??? 
# TODO ??? 
# TODO ??? 
# TODO ??? 


# TODO ??? 
#### bc many of the categories have ZERO easy probs, we may want to add a functionality to default to pick a 'MEDIUM' prob from that category if the user picks 'EASY' for a category with NO easy probs so that we don't end up with a situation where the user picks 'EASY' and 'STACKS' and then gets an error bc there are no easy probs in that category, which would be a bummer to start the day with an error like that (and also just not ideal in general)
#### just make sure to print some message in term about how it opened a medium bc no easy probs were avail in that category...
# TODO ??? 




# TODO ??? 
#### fix the HEAP category arrangement to better fit the 'actual' difficult/good of the problems 
# TODO ??? 


# TODO ??? 
#### comment out the HARD problems that I labeled for 'AFTER CHECKPOINT in my leet doc 
# ##### ====> (KIM some hard probs ARE fine to include bc I still was doing some 'fair' hard probs)
# TODO ??? 




# TODO ??? 
#### mark the problems that are 'work-friendly' using my labels in leet excel doc and think if it makes sense to do something about them in this script...
#  (i.e. can be done in a short amount of time and don't require a lot of thinking or writing code) with a special tag (like "is_work_friendly": True) and then add a command line arg to filter for those problems (like "python morning_leet_random_BETA1.py --work-friendly")
# TODO ??? 




# TODO ??? 
#### SUPER OPTIMIZED LATE-STAGE IDEA...(mirroring my leet-excels 'x' MTWTHFRI mechanism for tracking problems that have been picked recently AND...ALSO...RE-DOING the probs that were a struggle-recently (via the orange/red/white colored x's)
#  create some way to track the 'last-time-picked' of a problem and then have the selection adapt to this so that no one problem/areas gets over-picked/ or worse, ignored, and we get a good variety of problems over time (i.e. if a problem was picked in the last 10 runs, maybe we give it a lower chance of being picked again until other problems have been picked more)
# my INCREMENTING PER CATEGORY is a very basic form of this (where each prob picked from a certain category marks off that category, which is igored until all other categories have been picked from, but this is very basic and doesn't account for the fact that some categories have more problems than others, so the probs in those categories will get picked more often, which is not ideal)
# TODO ??? 



def parse_args() -> argparse.Namespace:
	parser = argparse.ArgumentParser(
		description="Open a random link filtered by difficulty and category."
	)
	parser.add_argument(
		"difficulty",
		nargs="?",
		help="Difficulty filter: easy, medium, hard, or any",
	)
	parser.add_argument(
		"category",
		nargs="?",
		help="Category filter: integer from 1 to 15, or any",
	)
	return parser.parse_args()


def normalize_difficulty(value: str | None) -> str | None:
	if value is None:
		return None
	value = value.strip().lower()
	if value == "any":
		return None
	if value not in {"easy", "medium", "hard"}:
		raise ValueError("difficulty must be one of: easy, medium, hard")
	return value


def validate_category(value: str | int | None) -> int | None:
	if value is None:
		return None
	if isinstance(value, str):
		if value.strip().lower() == "any":
			return None
		try:
			value = int(value)
		except ValueError as exc:
			raise ValueError("category must be an integer from 1 to 15") from exc
	if not 1 <= value <= 15:
		raise ValueError("category must be an integer from 1 to 15")
	return value


def select_link(difficulty: str | None, category: int | None) -> dict:
	filtered = ALL_LINKS
	if difficulty is not None:
		filtered = [link for link in filtered if link["difficulty"] == difficulty]
	if category is not None:
		filtered = [link for link in filtered if link["category"] == category]
	if not filtered:
		raise LookupError("No links match the provided filters.")
	return random.choice(filtered)


def main() -> None:
	args = parse_args()
	try:
		difficulty = normalize_difficulty(args.difficulty)
		category = validate_category(args.category)
	except ValueError as exc:
		raise SystemExit(f"Error: {exc}")

	try:
		link = select_link(difficulty, category)
	except LookupError as exc:
		raise SystemExit(f"Error: {exc}")

	webbrowser.open(link["url"])
	print(
		f"Opened: {link['url']} (difficulty={link['difficulty']}, category={link['category']})"
	)


if __name__ == "__main__":
	main()


