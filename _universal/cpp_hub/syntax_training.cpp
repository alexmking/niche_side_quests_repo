#include <iostream>
#include <vector>
// this file will be similar to the list_of_practice_tasks.cpp, except it's more focsed on singular lines of syntax such as initilize a C style string, create a ptr to an array etc...

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// THE BEST PRACTICE WAYS TO INITIALIZE EMPTIES: such as an (int, char, string, vector, ptrs etc)
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
int myInt = 0;  // best practice to initialize an int to 0
char myChar = '\0';  // best practice to initialize a char to null character
std::string myStdString = "";  // best practice to initialize a std::string to empty
std::vector<int> myVector;  // best practice to initialize a std::vector to empty
// ptrs:
int* myIntPtr = nullptr; 
char* myCharPtr = nullptr; 
std::string* myStringPtr = nullptr; 
std::vector<int>* myVectorPtr = nullptr;





// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// THE BEST PRACTICE WAYS TO NULL CHECK VARIOUS DIFF variables/pointers etc: (int,char,string,vector,ptrs)
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(myInt != 0)
if(myChar != '\0')
if(myStdString != "")
if(!myVector.empty())
// ptrs:
if(myIntPtr != nullptr)
if(myCharPtr != nullptr)
if(myStringPtr != nullptr)
if(myVectorPtr != nullptr)


