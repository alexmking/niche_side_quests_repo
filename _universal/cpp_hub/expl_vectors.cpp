// This file contains examples and explanations for working with std::vector in C++.

#include <vector>
#include <iostream>
#include <algorithm>
//====================================================================
// IMP DIFFERENCES VS PYTHON LISTS:
//====================================================================
// Unlike Python, C++ exposes the vector's memory capacity.
// - size() — Number of elements currently stored.
// - capacity() — Number of elements that can fit before more storage is needed.
// - reserve(n) — Preallocate capacity for at least n elements.
// - resize(n) — Change the actual number of elements.









using namespace std;



//====================================================================
// COMMON OPERATIONS & THEIR PYTHON-EQUIVALENTS
//====================================================================
void exampleVectorOperations() {
    // [CPP CODE]                   [PYTHON EQUIV]      [DESCRIPTION]
    //-------------------------- || ----------------- || ------------------
    // Create
    vector<int> v{1, 2, 3};         // v = [1, 2, 3]     || Create with values
    vector<int> empty;              // v = []            || Create empty vector

    // Add elements
    v.push_back(4);                 // v.append(4)       || Append element
    v.insert(v.begin() + 1, 5);     // v.insert(1, 5)    || Insert at index 1

    // Access elements
    v[0];                           // v[0]              || First element
    v.front();                      // v[0]              || First element
    v.back();                       // v[-1]             || Last element
    v.at(0);                        // v[0]              || Bounds-checked access

    // Remove elements
    v.pop_back();                   // v.pop()           || Remove last element
    v.erase(v.begin() + 1);         // v.pop(1)          || Remove at index 1
    v.clear();                      // v.clear()         || Remove all elements

    // Size and checks
    v.size();                       // len(v)            || Number of elements
    v.empty();                      // not v             || Check if empty

    // Capacity (C++ specific)
    v.capacity();                   // N/A               || Allocated element capacity
    v.reserve(100);                 // N/A               || Reserve capacity for 100
    v.resize(10);                   // N/A               || Resize to 10 elements

}















// 1. Creating and initializing vectors
void createVectors() {
    std::vector<int> a;              // Empty vector
    std::vector<int> b{10, 20, 30};  // Initialized with values
    std::vector<int> c(5);           // 5 elements, all initialized to 0
    std::vector<int> d(5, 100);      // 5 elements, all initialized to 100
}

// 2. Adding elements
void addElements(std::vector<int>& v) {
    v.push_back(10);                 // Append 10
    v.push_back(20);                 // Append 20
    v.insert(v.begin() + 1, 15);     // Insert 15 at index 1
    v.emplace_back(30);              // Construct element at end
}

// 3. Accessing and modifying elements
void accessElements(std::vector<int>& v) {
    if (v.empty()) return;

    int first = v.front();           // First element
    int last = v.back();             // Last element
    int value = v.at(0);             // Bounds-checked access

    v[0] = 100;                      // Modify first element
}

// 4. Removing elements
void removeElements(std::vector<int>& v) {
    if (v.empty()) return;

    v.pop_back();                    // Remove last element

    if (!v.empty()) {
        v.erase(v.begin());          // Remove first element
    }

    // v.clear();                    // Remove ALL elements
}

// 5. Iterating through a vector
void printVector(const std::vector<int>& v) {
    // Range-based for loop (recommended)
    for (int num : v) {
        std::cout << num << " ";
    }
    std::cout << "\n";

    // Index-based loop (when you need the index)
    for (std::size_t i = 0; i < v.size(); ++i) {
        std::cout << v[i] << " ";
    }
    std::cout << "\n";
}

// 6. Searching and sorting
void searchAndSort(std::vector<int>& v) {
    std::sort(v.begin(), v.end());   // Sort ascending

    auto it = std::find(v.begin(), v.end(), 20);

    if (it != v.end()) {
        std::cout << "Found 20!\n";
    }
}

// 7. Size and capacity
void manageCapacity(std::vector<int>& v) {
    std::cout << "Size: " << v.size() << "\n";
    std::cout << "Capacity: " << v.capacity() << "\n";

    v.reserve(100);                  // Reserve room for 100 elements
    v.resize(10);                    // Change actual size to 10
}






















//====================================================================
// MAIN 
//====================================================================
int main() {
    std::vector<int> nums{1, 2, 3};

    addElements(nums);
    printVector(nums);
    printVector(nums);


    accessElements(nums);
    removeElements(nums);
    searchAndSort(nums);
    manageCapacity(nums);

    return 0;
}





















//====================================================================
// MAIN FUNCTION (the 'other' main, not being used atm...)
//====================================================================
// int main()
// {
//     // Example: Creating and initializing a vector
//     std::vector<int> numbers = {1, 2, 3, 4, 5};

//     // Example: Iterating over a vector using a range-based for loop
//     std::cout << "Numbers: ";
//     for (int num : numbers)
//     {
//         std::cout << num << " ";
//     }
//     std::cout << std::endl;

//     // Example: Adding elements to a vector
//     numbers.push_back(6);
//     numbers.push_back(7);

//     // Example: Accessing elements by index
//     std::cout << "First element: " << numbers[0] << std::endl;
//     std::cout << "Last element: " << numbers[numbers.size() - 1] << std::endl;

//     // Example: Removing the last element
//     numbers.pop_back();

//     // Example: Checking the size of the vector
//     std::cout << "Size: " << numbers.size() << std::endl;

//     return 0;
// }