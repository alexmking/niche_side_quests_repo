##### annoying python syntaxes that i have to deal with when writing code for leetcode problems

myList = [ [] for i in range(5)]     # creates a list of 5 separate **empty** lists

sortedWord = "".join(sorted("myword"))     # sorts the letters in a word and then joins them back together into a string (since sorted() returns a **list** of the sorted characters for some reason)

myList = [0] * 10    # creates a list of 10 zeros. If I did myList = [[0] * 10] * 10, it would create a list of 10 references to the same inner list, which is not what I want. This way, each inner list is a separate object in memory.

# create an list of length 10, filled with no value (None)
myList = [] * 10




nums = [100,200,300,400]
myDict = {"a": 1, "b": 2, "c": 3}

# variations of the multi-variable usage w 'for' loop (lists, vs dicts etc)
for outerInd, outerElem in enumerate(nums):
    print(outerInd)
    print(outerElem)

# for outerInd, outerElem in myDict.items():
#     print(outerInd, outerElem)

# ############# COMMON WRONG SYNTAX ##################
# ### WRONG / COMMON conflating if rusty on python ####
# for outerInd, outerElem in nums: # WRONG!
#     print(outerElem) # WRONG!
# ### WRONG / COMMON conflating if rusty on python ####
# for outerInd, outerElem in myDict:# WRONG!
#     print(outerInd, outerElem)# WRONG!
# ### WRONG / COMMON conflating if rusty on python ####
















