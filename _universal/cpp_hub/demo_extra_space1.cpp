#include <iostream>



/*
// ⭐ good one here 'static' use-case
// Task 3:  Write `int next_id()` that returns 1 the first time it is called, 2
//          the second time, 3 the third time, and so on. The count must persist
//          between calls without using a global variable.
*/



// int next_id()
// {
//     static int myInt = 0;
//     myInt++;

//     // myInt = myInt+1;
//     // int ans = myInt + 1;
//     return myInt;

    
// }

int next_id()
{
    static int id = 0;
    id++;
    return id;
}








int main()
{
    std::cout << next_id() << "\n";
    std::cout << next_id() << "\n";
    std::cout << next_id() << "\n";
    std::cout << next_id() << "\n";

    return 0;
}