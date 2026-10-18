#include <iostream>

/*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this demo file is where we do concrete demonstrations of C++ concepts.
% ⭐LEARN BY DOING!
% Once we learn a new concept or finish a chapter, we come right here and demonstrate it with concrete examples.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*/


/*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Here we can write additional notes or explanations for the demo.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
LIST OF STUFF TO DEMONSTRATE SO FAR:
- Basic I/O
- Variables and Data Types, ENUMS, CONSTS
- Control Structures (if, for, while)
- Functions
- Classes and Objects
- Inheritance and Polymorphism
- Templates
- Standard Library Usage
*/


// Task 1:  Write `int square(int value)` that returns value * value, and
//          `double average(int a, int b)` that returns the average of two ints.
//          (Watch out for integer division: average(3, 4) should be 3.5.)


int square(int value)
{
    // std::cout << value * value << "\n";
    return value * value;
}

double average(int a, int b)
{
    double tot = a + b;
    // std::cout << tot / 2 << "\n";
    return tot / 2;
}












int main()
{
    square(5);
    average(3.0, 4.0);

    std::cout << square(10) << "\n";

    std::cout << average(100.0, 200.0) << "\n";


    return 0; // 0 == success, any non-zero value indicates an error
};