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
















// --- Strings -----------------------------------------------------------------
// Task 4:  Write `int count_vowels(const std::string& text)` that returns how
//          many vowels (a, e, i, o, u, upper or lower case) the text contains.

// Task 5:  Write `std::string reverse_text(const std::string& text)` that returns
//          a reversed copy. Then write `bool is_palindrome(const std::string& text)`
//          that returns true if the text reads the same forwards and backwards.



bool is_palindrome(const std::string& text)
{
    // setup two ptrs at opp ends of string, then keep comparing them
    // left = 0 
    // right = len(text)-1

    // while left <= right:
    // if text[left] != text[right]:
        // return false
    // return true

    int left = 0;
    int right = text.length()-1;

    while(left <= right)
    {
        if (text[left] != text[right])
        {
            return false;
        }
        left++;
        right--;
    }
    return true;



}





std::string reverse_text(const std::string& text)
{
    std::string ans = text;
    // // // iter over text string, in reverse
    // std::cout << "text length: " << text.length() << "\n";
    // for(std::size_t i = text.length()-1; i >= 0; i-- )
    // {
    //     // ans[text.length() - i] = text[i];
    //     std::cout << i << "\n";
    // }
    // return ans;


    // std::string ans = text;
    // for(int i = text.length()-1; i >=0; i--)
    // {
    //     // std::cout << i << "\n";
    //     std::cout << text.length()-1 - i << "\n";

    //     ans[text.length()-1 - i] = text[i];
    // }
    // return ans;




    std::string str = "hello";
    for (char ch : text) 
    {
        std::cout << ch << "\n";
    }

    return ans;
}










int count_vowels(const std::string& text)
{
    int count = 0;
    for(std::size_t i = 0; i < text.length(); i++)
    {
        if(text[i] == 'a' || text[i] == 'e' || text[i]== 'i' || text[i] == 'o' || text[i] == 'u')
        {
            count++;
        }

    }

    return count;
}






















int main()
{
    // std::cout << next_id() << "\n";
    // std::cout << next_id() << "\n";
    // std::cout << next_id() << "\n";
    // std::cout << next_id() << "\n";

    // // std::string myString = "king";
    // // std::cout << myString.length() << "\n";


    // std::cout << reverse_text("alex") << "\n";

    std::cout << is_palindrome("racecar") << "\n";
    std::cout << is_palindrome("alex") << "\n";



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

    // AND THESE last two for CTRL-ALT-T and CTRL-ALT-E:
    // 't': { action: 'Focus Terminal (vscodes terminal)', color: 'yellow' },          // ctrl-alt-t
    // 'e': { action: 'run cpp (code runner)', color: 'yellow' },          // ctrl-alt-e (think 'e' for execute)
// ⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐





