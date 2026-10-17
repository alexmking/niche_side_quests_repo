#include <iostream>

int main() {
    std::cout << "Hello, World!" << std::endl;
    return 0;
}

#include <unordered_map>
#include <vector>

using namespace std;

class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        unordered_map<int, int> myDict; // KEY == elem, VAL == index of elem

        // iter over nums, checking if (target - currElem) exists in dict...
        // for (int i = 0; i < static_cast<int>(nums.size()); ++i) {

        for (int i = 0; i < nums.size(); ++i) {
            auto it = myDict.find(target - nums[i]);
            if (it != myDict.end()) {
                // FOUND answer, return indices
                int solInd = it->second; // get index of other elem
                return {i, solInd};
            } else {
                // add this entry to dict, where KEY == elem, VAL == ind of elem in nums
                myDict[nums[i]] = i;
            }
        }

        return {};
    }
};