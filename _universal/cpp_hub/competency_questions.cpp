#include <iostream>
#include <string>
#include <vector>



// this file contains some legit competency questions that test understanding 
// I will try to have these only be the extra-useful/ transcendent ones
// TIP: LEARN-BY-EXPERIENCE:
//      > you can also treat these questions as a faster-way to 'experience' or reinforce the concepts without needing to actually read my whole 
//      page of notes on it in strings_expl or pointers_expl.cpp etc 
//          > this is akin to how neetcode would have a list of conceptual questions for many of the leetcode problems:
                // if you could answer the questions, then you wouldn't have to do the whole problem from scratch to ensure you retained the info or didn't forget how to do the problem
                // this proved to be really valuable once the list of topics/concepts grew large (since you could quickly test your grasp on all the topics via the 'questions', but actually doing the full problems would take 5+ hours everyday (obvi not realistic))



// ==========================================================================
// COMPETENCY QUESTIONS:
// ==========================================================================
// 1. Does the below function take an address of a string as an argument? Why?
std::string my_func(const std::string& text)
{
    // text refers to message
}

// 2. why can we DECLARE variables outside of main and outside of functions (aka at 'file-scope'), but we cannot also do executable statements there? (SEE EX BELOW)
// the DECLARATION below is fine, no errors
std::vector<int> myVect{1, 2, 3};         // v = [1, 2, 3]     || Create with values
std::vector<int> empty;              // v = []            || Create empty vector

// HOWEVER...this executable statement is not allowed at file-scope and will cause a compilation error. Executable statements must be inside functions.
myVect.push_back(4); // this same statement would be fine in a function or in main(), but it is not allowed at file-scope

// This demonstrates the difference between declarations and executable statements at file-scope.
// But WHY is this the case?
int main(){}
                // (quick expl of at-file-scope if still fuzzy on it):
                    // in a C++ file you have your includes, globals, functions/helpers, and main(). So what at-file-scope means is
                    // any code written outside of functions (including main). This specific REAL-ESTATE only allows DECLARATIONS, not actual expressions/executable lines (like myVect.push_back(4))








































































































// ==========================================================================
// ANSWERS TO COMPETENCY QUESTIONS:
// ==========================================================================
// 1. 
// No, it does not take an address of a string as an argument. It takes a 'reference' to a constant string.
// This is because the '&' means different things in 2 different contexts:
// In a declaration/type, & means reference.
// In an expression, &variable means address-of.
std::string myFunc(const std::string& text){}           // reference to a constant string, not an address
std::string* ptr = &message;                            // pointer to a string, address-of operator used here

// 2. RE-READ BELOW ...
// Variables can be declared at file-scope because the compiler needs to know their type and allocate storage for them before any function is executed.
// Executable statements, however, are run-time actions that require a function context (like main() or any other function) to be executed.
// At file-scope, there is no function context, so the compiler cannot execute statements there.




















