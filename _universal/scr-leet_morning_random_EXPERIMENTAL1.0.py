#!/usr/bin/env python3

# reminder may have to make executable after copying/creating new script from my template here: 
# chmod +x /usr/local/bin/alexScripts/scr-script-name.py

# Cross-platform solution: This shebang works on both Mac and Windows
# Just ensure python3 is in your PATH on both systems

import random
import webbrowser
import sys

##############################################
### ARGS QUICK EXPLANATION: (3 args total, but 3rd is optional)
##############################################
# (difficulty, category, is_top)
# difficulty = 		can be 'easy' or 'medium' or 'hard' or 'any' to select from any difficulty
# category = 		can be 'any' or a specific category number (1-15) or group1 or group2 or group3
# is_top = 			can be 'any' or 'top' to only select from top problems in the category/group

# difficulty = 		easy, medium, hard, any, easymed, ezmed,ezm, emed
# category = 		any, 1-15, group1, group2, group3
# is_top = 			any, top	(optional arg)

# GROUPS EXPL: 		the 3 GROUPS are just a way to mirror the 3 GROUPS I outlined in my goal to catch up on my leetcode progress...this way whatever group im currently working on, I can select that group and it will pull from all the categories in that group which makes it way easier to practice the progression style that I'm trying to do (start w mastering group1 before moving on to group2 and then group3 etc) but ALSO, it prevents you from already knowing exactly which group the prob is targeting when you run the script since right now if we run morningwarmup any 3, we immeditately know the sol is TWO PTR which is not good for actually learning the concepts behind the problems which is the whole pt to being w))
# IS_TOP: 			the 3rd arg (is_top) is a high-level way to ensure I only pull up one of the TOP-problems from whatever list-of-matching-problems that result from the FIRST TWO ARGS...

# arg1 = category (can be 'any' or a specific category number or group1 or group2 or group3)
# arg2 = is_top (can be 'any' or 'top' to only select from top problems in the category/group)





# @raycast.title Edit C leet
# @raycast.title Edit C leet
# @raycast.description opens the tmp version of leet script that shows all the top probs for each category, useful for C++ leet conversion practice/ref




# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# USE THE BELOW ARG-COMBOS!!! 
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
##############################################
### COMMON/USEFUL ARG COMBOS:
##############################################
# easymed group1 toponly 	===		pulls only the top 'easy' and 'medium' problems from group1 (which is a good way to get a good variety of probs but still ensure theyre all probs I should know well by now since theyre all in group1 and theyre all top probs in that group)
# easymed group2 toponly 	===		pulls only the top 'easy' and 'medium' problems from group2 (which is a good way to get a good variety of probs but still ensure theyre all probs I should know well by now since theyre all in group2 and theyre all top probs in that group)
# easymed group3 toponly 	===		pulls only the top 'easy' and 'medium' problems from group3 (which is a good way to get a good variety of probs but still ensure theyre all probs I should know well by now since theyre all in group3 and theyre all top probs in that group)
# EXPL: use the above 3 based on whatever GROUP you're currently on, as it will give you the most legit/beneficial problems of that group :)
#
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# USE THE ABOVE ARG-COMBOS!!! 
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


### CATEGORIES ### 
# 1 = arrays
# 2 = stacks
# 3 = two pointers	
# 4 = sliding window
# 5 = binary search	
# 6 = linked list		
# 7 = trees	
# 8 = tries	
# 9 = heaps
# 10 = intervals
# 11 = greedy
# 12 = backtracking
# 13 = 1D dyn prog
# 14 = graph
# 15 = 2D dyn prog		





### CATEGORIES ### 
# 1 = arrays			1
# 2 = stacks					3?
# 3 = two pointers		1
# 4 = sliding window	1
# 5 = binary search		1
# 6 = linked list		1
# 7 = trees					2
# 8 = tries					2
# 9 = heaps				1	2*
# 10 = intervals		1
# 11 = greedy					3
# 12 = backtracking			2
# 13 = 1D dyn prog			2	3*
# 14 = graph				2
# 15 = 2D dyn prog				3
# *indicates* 'or' 

### GROUPS ### ----- (IF NEEDED: we can split into four groups for more incremental progression...)
# group1 = categories 1,3,4,5,6,9,10 		(arrays, two-ptr, sliding-win, bin-search, linked-list, heaps, intervals)	iffy == 
# group2 = categories 7,8,12,13,14			(trees, tries, backtracking, 1D-dyn-prog, graph)							iffy == heaps/intervals could be group1
# group3 = categories 11,15,2				(greedy, 2D-dyn-prog, stacks?)												iffy == greedy and DP1 could be group2 




'''
-------------------------------------
FIRST DO THIS
-------------------------------------
TOP PRIORITY NEXT EXTENSION:
allow 3 new values for 2nd argument (aka the category) called group1, group2 and group3
	group1 is the first 5 categories (arrays, stacks, two-ptr, sliding-win, bin-search)
	group2 is the next 5 categories (linked-list, trees, tries, heaps, intervals)
	group3 is the last 2 categories (greedy and backtracking)
this way you can give it a group and it will select from all probs in that group (which makes it way easier to practice the progression style that I'm trying to do (start w mastering group1 before moving on to group2 and then group3 etc) but ALSO, it prevents you from already knowing exactly which group the prob is targeting when you run the script 
	since right now if we run morningwarmup any 3, we immeditately know the sol is TWO PTR which is not good for actually learning the concepts behind the problems which is the whole pt to being w))
'''


'''
-------------------------------------
SECOND DO THIS
-------------------------------------
progress through group1 then move onto group2 and then last group3 until you have a good-enough foundation
(this will prob take a month or two, since each group will take 1-4 weeks to re-master, and much less since we decided were not dumping a ton of time into the 2D DP and the 'low-return, high-effort' probs/categories))
'''



'''
-------------------------------------
THIRD DO THIS
-------------------------------------
AFTER WE GET THROUGH all THREE GROUPS...THEN we can start using the super useful 'is top' arg for all of our practice pretty much since we no logner have to worry about pulling up 'over our head' probs
AFTER WE GET THROUGH all THREE GROUPS...THEN we can start using the super useful 'is top' arg for all of our practice pretty much since we no logner have to worry about pulling up 'over our head' probs
AFTER WE GET THROUGH all THREE GROUPS...THEN we can start using the super useful 'is top' arg for all of our practice pretty much since we no logner have to worry about pulling up 'over our head' probs
AFTER WE GET THROUGH all THREE GROUPS...THEN we can start using the super useful 'is top' arg for all of our practice pretty much since we no logner have to worry about pulling up 'over our head' probs
AFTER WE GET THROUGH all THREE GROUPS...THEN we can start using the super useful 'is top' arg for all of our practice pretty much since we no logner have to worry about pulling up 'over our head' probs
AFTER WE GET THROUGH all THREE GROUPS...THEN we can start using the super useful 'is top' arg for all of our practice pretty much since we no logner have to worry about pulling up 'over our head' probs
AFTER WE GET THROUGH all THREE GROUPS...THEN we can start using the super useful 'is top' arg for all of our practice pretty much since we no logner have to worry about pulling up 'over our head' probs
'''


# Hardcoded list of links
ALL_LINKS = [
	##########################################################################################################
	# ARRAYS (category 1)	9 tot
	##########################################################################################################
	{"url": "https://leetcode.com/problems/group-anagrams/description/?envType=list&envId=rwtad4ld", "difficulty": "medium", "category": 1, "is_top_problem": True}, 	# TOP-PROBLEM


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
	{"url": "https://leetcode.com/problems/trapping-rain-water/description/?envType=list&envId=rwtajj31", "difficulty": "hard", "category": 3, "is_top_problem": True}, 	# TOP-PROBLEM


	##########################################################################################################
	# SLIDING WINDOW (category 4)	6 tot
	##########################################################################################################
	{"url": "https://leetcode.com/problems/longest-substring-without-repeating-characters/description/?envType=list&envId=rwtn7fvc", "difficulty": "medium", "category": 4, "is_top_problem": True}, # TOP-PROBLEM
	{"url": "https://leetcode.com/problems/longest-repeating-character-replacement/description/?envType=list&envId=rwtn7fvc", "difficulty": "medium", "category": 4, "is_top_problem": True},	# TOP-PROBLEM
	{"url": "https://leetcode.com/problems/permutation-in-string/description/?envType=list&envId=rwtn7fvc", "difficulty": "medium", "category": 4, "is_top_problem": True},				# TOP-PROBLEM


	##########################################################################################################
	# BIN_SEARCH (category 5)	7 tot
	##########################################################################################################
	{"url": "https://leetcode.com/problems/search-in-rotated-sorted-array/description/?envType=list&envId=rwtnlcni", "difficulty": "medium", "category": 5, "is_top_problem": True},	# TOP-PROBLEM


	##########################################################################################################
    # LINKED_LIST (category 6)	11 tot
	##########################################################################################################
	{"url": "https://leetcode.com/problems/reorder-list/description/?envType=list&envId=rwtni42e", "difficulty": "medium", "category": 6, "is_top_problem": True},  # TOP-PROBLEM
	{"url": "https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/?envType=list&envId=rwtni42e", "difficulty": "medium", "category": 6, "is_top_problem": True},# TOP-PROBLEM
	{"url": "https://leetcode.com/problems/lru-cache/description/?envType=list&envId=rwtni42e", "difficulty": "medium", "category": 6, "is_top_problem": True},		# TOP-PROBLEM
	{"url": "https://leetcode.com/problems/reverse-nodes-in-k-group/description/?envType=list&envId=rwtni42e", "difficulty": "hard", "category": 6, "is_top_problem": True},		# TOP-PROBLEM


	##########################################################################################################
	# TREES (category 7) 	16 tot 
	##########################################################################################################
	{"url": "https://leetcode.com/problems/balanced-binary-tree/description/?envType=list&envId=rwtnb7qc", "difficulty": "easy", "category": 7, "is_top_problem": True}, # TOP-PROBLEM
	{"url": "https://leetcode.com/problems/count-good-nodes-in-binary-tree/description/?envType=list&envId=rwtnb7qc", "difficulty": "medium", "category": 7, "is_top_problem": True},# TOP-PROBLEM
	{"url": "https://leetcode.com/problems/validate-binary-search-tree/description/?envType=list&envId=rwtnb7qc", "difficulty": "medium", "category": 7, "is_top_problem": True},# TOP-PROBLEM
	{"url": "https://leetcode.com/problems/kth-smallest-element-in-a-bst/description/?envType=list&envId=rwtnb7qc", "difficulty": "medium", "category": 7, "is_top_problem": True},# TOP-PROBLEM


	##########################################################################################################
	# TRIES (category 8)	3 tot			[NO-EASY's]
	##########################################################################################################
	{"url": "https://leetcode.com/problems/design-add-and-search-words-data-structure/description/?envType=list&envId=rwtvnp95", "difficulty": "medium", "category": 8, "is_top_problem": True},# TOP-PROBLEM


	##########################################################################################################
    # HEAPS (category 9)	7 tot			
	##########################################################################################################
	{"url": "https://leetcode.com/problems/kth-largest-element-in-a-stream/description/?envType=list&envId=rwtnf28e", "difficulty": "easy", "category": 9, "is_top_problem": True}, # TOP-PROBLEM
	{"url": "https://leetcode.com/problems/last-stone-weight/description/?envType=list&envId=rwtnf28e", "difficulty": "easy", "category": 9},
	{"url": "https://leetcode.com/problems/k-closest-points-to-origin/description/?envType=list&envId=rwtnf28e", "difficulty": "medium", "category": 9},
	{"url": "https://leetcode.com/problems/kth-largest-element-in-an-array/description/?envType=list&envId=rwtnf28e", "difficulty": "medium", "category": 9, "is_top_problem": True},# TOP-PROBLEM
	{"url": "https://leetcode.com/problems/task-scheduler/description/?envType=list&envId=rwtnf28e", "difficulty": "medium", "category": 9, "is_top_problem": True}, # TOP-PROBLEM
	{"url": "https://leetcode.com/problems/design-twitter/description/?envType=list&envId=rwtnf28e", "difficulty": "medium", "category": 9, "is_top_problem": True}, # TOP-PROBLEM
	{"url": "https://leetcode.com/problems/find-median-from-data-stream/description/?envType=list&envId=rwtnf28e", "difficulty": "hard", "category": 9, "is_top_problem": True}, # TOP-PROBLEM


	##########################################################################################################
	# INTERVALS (category 10)	6 tot		[NO-EASY's]
	##########################################################################################################
	{"url": "https://leetcode.com/problems/insert-interval/description/?envType=list&envId=rtwdas4j", "difficulty": "medium", "category": 10, "is_top_problem": True}, # TOP-PROBLEM


	##########################################################################################################
	# GREEDY (category 11)		8 tot		[NO-EASY's]
	##########################################################################################################
	{"url": "https://leetcode.com/problems/hand-of-straights/description/?envType=list&envId=rtwlwiei", "difficulty": "medium", "category": 11, "is_top_problem": True},				# TOP-PROBLEM
	{"url": "https://leetcode.com/problems/merge-triplets-to-form-target-triplet/description/?envType=list&envId=rtwlwiei", "difficulty": "medium", "category": 11, "is_top_problem": True},# TOP-PROBLEM
	{"url": "https://leetcode.com/problems/partition-labels/description/?envType=list&envId=rtwlwiei", "difficulty": "medium", "category": 11, "is_top_problem": True}, 				# TOP-PROBLEM


	##########################################################################################################
    # BACKTRACKING (category 12)	9 tot		[NO-EASY's]
	##########################################################################################################
	{"url": "https://leetcode.com/problems/word-search/description/?envType=list&envId=rwtvvex6", "difficulty": "medium", "category": 12, "is_top_problem": True},		# TOP-PROBLEM
	{"url": "https://leetcode.com/problems/palindrome-partitioning/description/?envType=list&envId=rwtvvex6", "difficulty": "medium", "category": 12, "is_top_problem": True},	# TOP-PROBLEM


	##########################################################################################################
	# DYN_PROG_1D (category 13)		12 tot
	##########################################################################################################
	{"url": "https://leetcode.com/problems/house-robber/description/?envType=list&envId=rtwt49bh", "difficulty": "medium", "category": 13, "is_top_problem": True}, 	# TOP-PROBLEM
	{"url": "https://leetcode.com/problems/decode-ways/description/?envType=list&envId=rtwt49bh", "difficulty": "medium", "category": 13, "is_top_problem": True},# TOP-PROBLEM
	{"url": "https://leetcode.com/problems/coin-change/description/?envType=list&envId=rtwt49bh", "difficulty": "medium", "category": 13, "is_top_problem": True},# TOP-PROBLEM
	{"url": "https://leetcode.com/problems/maximum-product-subarray/description/?envType=list&envId=rtwt49bh", "difficulty": "medium", "category": 13, "is_top_problem": True},# TOP-PROBLEM
	{"url": "https://leetcode.com/problems/word-break/description/?envType=list&envId=rtwt49bh", "difficulty": "medium", "category": 13, "is_top_problem": True},# TOP-PROBLEM
	{"url": "https://leetcode.com/problems/longest-increasing-subsequence/description/?envType=list&envId=rtwt49bh", "difficulty": "medium", "category": 13, "is_top_problem": True},# TOP-PROBLEM


	##########################################################################################################
	# GRAPH (category 14)		14 tot 		[NO-EASY's]
	##########################################################################################################
	{"url": "https://leetcode.com/problems/rotting-oranges/description/?envType=list&envId=rtw8e97v", "difficulty": "medium", "category": 14, "is_top_problem": True},  # TOP-PROBLEM
	{"url": "https://leetcode.com/problems/course-schedule/description/?envType=list&envId=rtw8e97v", "difficulty": "medium", "category": 14, "is_top_problem": True},   # TOP-PROBLEM
	{"url": "https://leetcode.com/problems/course-schedule-ii/description/?envType=list&envId=rtw8e97v", "difficulty": "medium", "category": 14, "is_top_problem": True},  # TOP-PROBLEM


	##########################################################################################################
	# DYN_PROG_2D (category 15) 	14 tot 		[NO-EASY's] 	(geeksforgeeks link for that knapsack prob)
	##########################################################################################################
	{"url": "https://leetcode.com/problems/longest-common-subsequence/description/?envType=list&envId=rtw8vv91", "difficulty": "medium", "category": 15, "is_top_problem": True}, # TOP-PROBLEM
	{"url": "https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/description/?envType=list&envId=rtw8vv91", "difficulty": "medium", "category": 15, "is_top_problem": True},# TOP-PROBLEM
	{"url": "https://leetcode.com/problems/coin-change-ii/description/?envType=list&envId=rtw8vv91", "difficulty": "medium", "category": 15, "is_top_problem": True}, # TOP-PROBLEM
	{"url": "https://leetcode.com/problems/interleaving-string/description/?envType=list&envId=rtw8vv91", "difficulty": "medium", "category": 15, "is_top_problem": True},# TOP-PROBLEM
	{"url": "https://www.geeksforgeeks.org/dsa/0-1-knapsack-problem-dp-10/", "difficulty": "medium", "category": 15, "is_top_problem": True}, # TOP-PROBLEM


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

# Parse command-line arguments
CATEGORY_GROUPS = {
	"group1": [1, 3, 4, 5, 6, 9, 10],
	"group2": [7, 8, 12, 13, 14],
	"group3": [11, 15, 2]
}


def main():
	difficulty_filter = None
	category_filter = None
	category_filters = None
	top_filter = False
	difficulty_display = None  # For display purposes
	category_display = None    # For display purposes
	top_display = None         # For display purposes

	args = sys.argv[1:]

	if len(args) > 3:
		print("Error: Too many arguments.")
		print("Usage: script.py [easy|medium|hard|any] [1-15|group1|group2|group3|any] [top|any]")
		sys.exit(1)

	if len(args) >= 1:
		difficulty_arg = args[0].lower()
		if difficulty_arg == "med":
			difficulty_arg = "medium"
		if difficulty_arg in ["em", "ezmed", "ezm", "easym", "emed"]:
			difficulty_arg = "easymed"
		if difficulty_arg not in ["easy", "medium", "hard", "any", "easymed"]:
			print(f"Error: Invalid difficulty '{args[0]}'. Must be 'easy', 'medium', 'med', 'hard', 'easymed', or 'any'.")
			sys.exit(1)
		difficulty_display = difficulty_arg
		if difficulty_arg == "any":
			difficulty_filter = None
		elif difficulty_arg == "easymed":
			difficulty_filter = {"easy", "medium"}
		else:
			difficulty_filter = {difficulty_arg}

	if len(args) >= 2:
		category_arg = args[1].lower()
		if category_arg in ["g1", "g2", "g3"]:
			category_arg = "group" + category_arg[1]
		if category_arg == "any":
			category_display = "any"
			category_filters = None
		elif category_arg in CATEGORY_GROUPS:
			category_display = category_arg
			category_filters = set(CATEGORY_GROUPS[category_arg])
		else:
			try:
				category_filter = int(args[1])
				category_display = str(category_filter)
				if category_filter < 1 or category_filter > 15:
					print(f"Error: Invalid category '{args[1]}'. Must be between 1 and 15, 'group1', 'group2', 'group3', or 'any'.")
					sys.exit(1)
				category_filters = {category_filter}
			except ValueError:
				print(f"Error: Category must be an integer between 1 and 15, 'group1', 'group2', 'group3', or 'any'. Got '{args[1]}'.")
				sys.exit(1)

	if len(args) >= 3:
		top_arg = args[2].lower()
		if top_arg in ["y", "onlytop", "onlytopprobs", "topprobs", "topprobsonly", "onlypullfromtopproblems", "onlytopproblems", "topproblemsonly"]:
			top_arg = "top"
		if top_arg not in ["top", "any"]:
			print(f"Error: Invalid top filter '{args[2]}'. Must be 'top' or 'any'.")
			sys.exit(1)
		top_filter = top_arg == "top"
		top_display = top_arg

	filtered_links = ALL_LINKS

	if difficulty_filter:
		filtered_links = [link for link in filtered_links if link["difficulty"] in difficulty_filter]

	if category_filters is not None:
		filtered_links = [link for link in filtered_links if link["category"] in category_filters]

	if top_filter:
		filtered_links = [link for link in filtered_links if link.get("is_top_problem", False)]

	if not filtered_links:
		filter_desc = []
		if difficulty_filter:
			filter_desc.append(f"difficulty='{difficulty_filter}'")
		if category_display and category_display != "any":
			filter_desc.append(f"category='{category_display}'")
		if top_filter:
			filter_desc.append("is_top_problem=True")
		print(f"Error: No links found matching {' and '.join(filter_desc)}.")
		sys.exit(1)

	selected = random.choice(filtered_links)
	selected_link = selected["url"]
	webbrowser.open(selected_link)

	filter_info = []
	if difficulty_display:
		filter_info.append(f"difficulty: {difficulty_display}")
	if category_display:
		filter_info.append(f"category: {category_display}")
	if top_display:
		filter_info.append(f"top: {top_display}")

	if filter_info:
		print(f"Filter: {', '.join(filter_info)}")
		print(f"Matched {len(filtered_links)} link(s)")

	# print(f"Opening: {selected_link}")

if __name__ == "__main__":
    main()




