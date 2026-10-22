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




// ⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐
//----------------------------------------------------------
// SET THESE 5 NEW HOTKEYS UP ON WINDOWS SIDE: (delete this section after obvi):
//----------------------------------------------------------
    // Github Copilot: toggle Inline Suggestions (enable/disable) (CTRL-ALT-C)

    // Github Copilot: Open Completions Panel (beta?): CTRL-ALT-P

    // “Trigger”inline suggestion: CTRL-ALT-X

    // Snooze inline suggestions: CTRL-ALT-S

    // CANCEL the ‘snooze’ (the shift-version of whatever the snooze hotkey is obvi): CTRL-ALT-SHIFT-S
// ⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐






// --- Strings -----------------------------------------------------------------
// Task 4:  Write `int count_vowels(const std::string& text)` that returns how
//          many vowels (a, e, i, o, u, upper or lower case) the text contains.

// Task 5:  Write `std::string reverse_text(const std::string& text)` that returns
//          a reversed copy. Then write `bool is_palindrome(const std::string& text)`
//          that returns true if the text reads the same forwards and backwards.