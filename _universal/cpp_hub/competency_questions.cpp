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






















