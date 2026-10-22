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

// Task 2:  Define a constant `max_score` equal to 100 using constexpr. Then write
//          `int clamp_score(int score)` that returns 0 if score is negative,
//          max_score if score is above max_score, and score otherwise.

const int max_score = 100;

int clamp_score(int score)
{
    if(score < 0)
    {
        return 0;
    }
    else if(score > max_score)
    {
        return max_score;
    }
    else return score;
}

// ⭐ good one here 'static' use-case
// Task 3:  Write `int next_id()` that returns 1 the first time it is called, 2
//          the second time, 3 the third time, and so on. The count must persist
//          between calls without using a global variable.
int next_id()
{
    static int id = 0;
    id++;
    return id;
}

// Task 5:  
// ⭐Write `std::string reverse_text(const std::string& text)` that returns a reversed copy. 
// Then write `bool is_palindrome(const std::string& text)`that returns true if the text reads the same forwards and backwards.
std::string reverse_text(const std::string& text)
{
    // TRY number 1
    // std::string ans = text;
    
    // for(int i = 0; i < text.length(); i++)
    // {
    //     ans[text.length() - i] = text[i];

    // }

    // // print ans string:
    // std::cout << ans << "\n";
    // return ans;

    // TRY number 2
    std::string ans;
    std::cout << text.length() << "\n";

    for(int i = text.length(); i >= 0; i--)
    {
        ans = ans + text[i];

    }

    std::cout << ans << "\n";
    return ans;

    // TRY number 3 (commented out)
    // std::string ans;
    // for(int i = text.length() - 1; i >= 0; i--)
    // {
    //     ans = ans + text[i];
    // }
    // return ans;





}


// Task 4:  Write `int count_vowels(const std::string& text)` that returns how
//          many vowels (a, e, i, o, u, upper or lower case) the text contains.
// int count_vowels(const std::string& text)
// {
//     // iter over the text var input, char by char, comparing each char to the series of possible vowels
//     // (a,e,i,o,u, UPPER & lowercase)

//     int count = 0;
//     for(int i = 0; i < text.length(); i++)
//     {
//         if(text[i] == 'a' || text[i] == 'e' || text[i] == 'i' || text[i] == 'o' || text[i] == 'u' ||
//            text[i] == 'A' || text[i] == 'E' || text[i] == 'I' || text[i] == 'O' || text[i] == 'U')
//         {
//             count++;
//         }

//     }
//     return count;
// }




int count_vowels(const std::string& text)
{
    int count = 0;
    for(std::size_t i = 0; i < text.length(); i++)
    {
        if(text[i] == 'a' || 
        text[i] == 'e' ||
        text[i] == 'i' ||
        text[i] == 'o' ||
        text[i] == 'u'
        )
        {
            count++;
        }
    }
    return count;
}









// TODO!!! LAST LEFT OFF HERE.. 
// bool isPalindrome(const std::string& text)
// {

// }






int main()
{
    // // task 1
    // std::cout << square(10) << "\n";
    // std::cout << average(100.0, 200.0) << "\n";
    // // task 2
    // std::cout << clamp_score(150) << "\n";
    // std::cout << clamp_score(90) << "\n";
    // std::cout << clamp_score(-15) << "\n";
    // // task 3 ⭐
    std::cout << next_id() << "\n";
    std::cout << next_id() << "\n";
    std::cout << next_id() << "\n";
    std::cout << next_id() << "\n";
    // task 4
    reverse_text("hello");
    std::cout << count_vowels("helloi") << "\n";


    // task 5




    return 0; // 0 == success, any non-zero value indicates an error
};