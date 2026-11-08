// duplicate this template for each new practice session so you can start right away with a clean slate and avoid hassle with leftover code from previous sessions

// HOW TO USE:
// when we want to practice doing cpp problems, we run a script/command that does roughly the following for us:
// 1. duplicates this file and hopefully append on whatever number makes sense based on how many other dups I have already in offlinecpp/ dir
// 2. opens the duplicated file in vscode
// 3. DONE! now we can instantly work our way through the tasks and run it all here to verify correctness/buiild etc
// 4. CAVEAT: the only potentially annoyance would be having to comment out all the other calls in main(), just to test 1 or 2 functions I filled out
//      (so may be better off having the template ALREADY have main() calls commented out, then we'd only have to uncomment what we want) 


#include <algorithm>
#include <array>
#include <cstddef>
#include <iostream>
#include <string>
#include <vector>

/*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file contains a list of practice tasks for C++.
% Each task is meant to help reinforce concepts learned along the way/chapters.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*/


// ==========================================================================
// PRACTICE TASKS
// Try each task yourself before looking at the solutions at the bottom.
// ==========================================================================



// --- Functions, types, and constants -----------------------------------------
// Task 1:  
// Write `int square(int value)` that returns value * value, and
// `double average(int a, int b)` that returns the average of two ints.
// (Watch out for integer division: average(3, 4) should be 3.5.)
int square(int value) 
{

}

double average(int a, int b)
{

}

// Task 2:  
// Define a constant `max_score` equal to 100 using constexpr. Then write
// `int clamp_score(int score)` that returns 0 if score is negative,
// max_score if score is above max_score, and score otherwise.
int clamp_score(int score) 
{
    
}

// --- Scope -------------------------------------------------------------------
// Task 3:  
// Write `int next_id()` that returns 1 the first time it is called, 2
// the second time, 3 the third time, and so on. The count must persist
// between calls without using a global variable.
int next_id()
{

}

// --- Strings-----------------------------------------------------------------
// Task 4:  
// Write `int count_vowels(const std::string& text)` that returns how
// many vowels (a, e, i, o, u, upper or lower case) the text contains.
int count_vowels(const std::string& text)
{

}

// Task 5:  
// Write `std::string reverse_text(const std::string& text)` that returns
// a reversed copy. Then write `bool is_palindrome(const std::string& text)`
// that returns true if the text reads the same forwards and backwards.
std::string reverse_text(const std::string& text)
{

}

bool is_palindrome(const std::string& text)
{

}

// --- Vectors -----------------------------------------------------------------
// Task 6:  
// Write `int largest_element(const std::vector<int>& values)` that
// returns the largest value in the vector, or 0 if the vector is empty.
int largest_element(const std::vector<int>& values)
{

}

// Task 7:  
// Write `std::vector<int> filter_even(const std::vector<int>& values)`
// that returns a new vector containing only the even values, in their
// original order. (filter_even({1, 2, 3, 4}) should be {2, 4}.)
std::vector<int> filter_even(const std::vector<int>& values)
{

}

// Task 8:  
// Write `std::vector<int> running_totals(const std::vector<int>& values)`
// that returns a vector where each element is the sum of all the input
// elements up to and including that position.
// (running_totals({1, 2, 3, 4}) should be {1, 3, 6, 10}.)
// Bonus: use reserve() so the result never reallocates.
std::vector<int> running_totals(const std::vector<int>& values)
{

}

// Task 9:  
// Write `void remove_value(std::vector<int>& values, int target)` that
// removes every element equal to target, keeping the order of the rest.
// (Hint: calling erase inside a range-for loop is a bug. Look up the
// erase-remove idiom.)
void remove_value(std::vector<int>& values, int target)
{

}

//  --- Pointers ----------------------------------------------------------------
// Task 10:  
// Write `int sum_values(const int* values, std::size_t count)` that
// takes a pointer to the first element of an int array and the number
// of elements, and returns the sum of all the elements.
int sum_values(const int* values, std::size_t count)
{

}

// Task 11:  
// Write `void swap_with_pointers(int* a, int* b)` that swaps the two
// ints the pointers point to. Do nothing if either pointer is null.
void swap_with_pointers(int* a, int* b)
{

}

// Task 12:  
// Write `int* find_value(int* values, std::size_t count, int target)`
// that returns a pointer to the first element equal to target, or
// nullptr if the target is not present or values is null. Use the
// returned pointer in main to change the found element.
int* find_value(int* values, std::size_t count, int target)
{

}

// Task 13:  
// Write `void reverse_in_place(int* values, std::size_t count)` that
// reverses the array in place. Do it with two pointers (one starting at
// the first element, one at the last) that move toward each other.
// Do nothing if values is null.
void reverse_in_place(int* values, std::size_t count)
{

}

// Task 14:  
// Write `std::size_t string_length(const char* text)` that returns the
// number of characters in a C-style string (not counting the '\0'
// terminator) by walking a pointer until it reaches the terminator.
// Return 0 if text is null. Do not use strlen.
std::size_t string_length(const char* text)
{

}

// Task 15:  
// Write `bool min_and_max(const int* values, std::size_t count, int* out_min, int* out_max)`
// that stores the smallest and largest elements through the two output
// pointers and returns true. If values is null, count is 0, or either
// output pointer is null, return false and leave the outputs untouched.
bool min_and_max(const int* values, std::size_t count, int* out_min, int* out_max)
{

}

// Task 16:  
// Write `int* create_filled_array(std::size_t count, int value)` that
// allocates an array of count ints on the heap with new[], sets every
// element to value, and returns it (or nullptr if count is 0). Then, in
// main, use the array and release it with delete[]. Who owns the memory
// after the function returns?    
int* create_filled_array(std::size_t count, int value)
{

}

// --- References --------------------------------------------------------------
// Task 17:  
// Write `void swap_with_references(int& a, int& b)` that swaps two ints.
// Compare how the call site differs from Task 11.
void swap_with_references(int& a, int& b)
{

}

// Task 18:  
// Write `void add_to_all(std::vector<int>& values, int amount)` that
// adds amount to every element, and
// `int count_above(const std::vector<int>& values, int threshold)` that
// counts the elements greater than threshold. Why is one parameter
// const and the other not?
void add_to_all(std::vector<int>& values, int amount)
{

}

int count_above(const std::vector<int>& values, int threshold)
{

}

// --- Structs -----------------------------------------------------------------
// Task 19: 
// Task 19:  
// Define `struct Rectangle { double width; double height; };`.
// Write `double area(const Rectangle& rect)` and
// `void scale(Rectangle& rect, double factor)`, which multiplies both
// dimensions by factor.
struct Rectangle
{
    double width;
    double height;
};

double area(const Rectangle& rect)
{

}

void scale(Rectangle& rect, double factor)
{

}

// --- Enums -------------------------------------------------------------------
// Task 20:  
// Define `enum class Color { Red, Green, Blue };`. Write
// `std::string color_name(Color color)` using a switch, and
// `Color next_color(Color color)` that goes Red -> Green -> Blue -> Red.
enum class Color
{
    Red,
    Green,
    Blue
};

std::string color_name(Color color)
{

}

Color next_color(Color color)
{

}

// --- Classes -----------------------------------------------------------------
// Task 21:  
// Write a `BankAccount` class with a private balance (starting at 0),
// a `deposit(int amount)` method, a `bool withdraw(int amount)` method
// that refuses (returns false) if funds are insufficient, and a const
// `balance()` getter.
class BankAccount
{
public:
    void deposit(int amount)
    {

    }

    bool withdraw(int amount)
    {

    }

    int balance() const
    {

    }
};

// Task 22:  
// Write a `TrafficLight` class that uses an `enum class` for its state
// (Red, Green, Yellow), starts at Red, and has an `advance()` method
// that moves Red -> Green -> Yellow -> Red, plus a const `state_name()`
// method that returns the current state as a string.
class TrafficLight
{
public:
    void advance()
    {

    }

    std::string state_name() const
    {

    }
};

// --- Combining concepts ------------------------------------------------------
// Task 23:  
// Define `struct Player { std::string name; int score; };`. Write
// `const Player* find_top_player(const Player* players, std::size_t count)`
// that returns a pointer to the player with the highest score, or
// nullptr if count is 0.
struct Player
{
    std::string name;
    int score;
};

const Player* find_top_player(const Player* players, std::size_t count)
{

}












































































































/*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SOLUTIONS FOR EACH TASK SHALL BE PROVIDED BELOW THIS POINT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*/

// Each task lives in its own namespace so names (like Player) never collide.

namespace task_01
{
// Pass-by-value: the function gets its own copy of the int, so the caller's variable is untouched.
int square(int value)
{
    return value * value;
}

double average(int a, int b)
{
    // (a + b) is an int; dividing by the double 2.0 promotes it to double first,
    // so average(3, 4) is 3.5. Dividing by the int 2 would truncate to 3.
    return (a + b) / 2.0;
}
} // namespace task_01

namespace task_02
{
// constexpr: the value is known at compile time and can never change.
constexpr int max_score = 100;

// Forces score into the range [0, max_score].
int clamp_score(int score)
{
    if (score < 0)
    {
        return 0; // Too low: snap up to the minimum.
    }
    if (score > max_score)
    {
        return max_score; // Too high: snap down to the maximum.
    }
    return score; // Already in range: return unchanged.
}
} // namespace task_02

namespace task_03
{
int next_id()
{
    // A static local lives for the whole program, not just one call. The "= 0" runs only
    // the first time execution reaches this line; later calls reuse the stored value.
    // Unlike a global, no code outside this function can see or modify it.
    static int id = 0;
    return ++id; // Pre-increment: bump first, then return the new value (1, 2, 3, ...).
}
} // namespace task_03

namespace task_04
{
int count_vowels(const std::string& text)
{
    // Listing both cases avoids having to convert each character to lower case.
    const std::string vowels = "aeiouAEIOU";
    int count = 0;
    for (char c : text)
    {
        // find() returns npos ("not found") when c is not in the vowel list.
        if (vowels.find(c) != std::string::npos)
        {
            ++count;
        }
    }
    return count;
}
} // namespace task_04

namespace task_05
{
std::string reverse_text(const std::string& text)
{
    std::string reversed;
    // Walk the text from the last character to the first, appending each one.
    // size_t is unsigned, so "i >= 0" would always be true (and 0 - 1 wraps to a huge number).
    // Instead count down from size() to 1 and read text[i - 1].
    for (std::size_t i = text.size(); i > 0; --i)
    {
        reversed += text[i - 1];
    }
    return reversed;
}

bool is_palindrome(const std::string& text)
{
    // A palindrome is identical to its own reversal. Comparison is case-sensitive.
    return text == reverse_text(text);
}
} // namespace task_05

namespace task_06
{
int largest_element(const std::vector<int>& values)
{
    if (values.empty())
    {
        return 0; // Guard first: values[0] on an empty vector is undefined behavior.
    }
    // Start from the first element (not 0) so all-negative vectors work correctly.
    int largest = values[0];
    for (int value : values)
    {
        if (value > largest)
        {
            largest = value;
        }
    }
    return largest;
}
} // namespace task_06

namespace task_07
{
std::vector<int> filter_even(const std::vector<int>& values)
{
    std::vector<int> evens; // Built as a new vector; the input is const and never modified.
    for (int value : values)
    {
        if (value % 2 == 0) // Remainder 0 when divided by 2 means even (also true for 0 and negatives).
        {
            evens.push_back(value);
        }
    }
    return evens;
}
} // namespace task_07

namespace task_08
{
std::vector<int> running_totals(const std::vector<int>& values)
{
    std::vector<int> totals;
    totals.reserve(values.size()); // We know the final size up front, so avoid reallocations.
    int sum = 0; // Carries the total so far across loop iterations.
    for (int value : values)
    {
        sum += value;
        totals.push_back(sum); // Store the total up to and including this element.
    }
    return totals;
}
} // namespace task_08

namespace task_09
{
void remove_value(std::vector<int>& values, int target)
{
    // Erase-remove idiom: remove_if shifts the kept elements forward and
    // returns the new logical end; erase then actually shrinks the vector.
    // e.g. {4,1,4,2} removing 4: remove -> {1,2,?,?} with the end pointing at the first "?",
    // then erase deletes from there to the old end, leaving {1,2}.
    // If target is absent, remove returns end() and erase of an empty range does nothing.
    values.erase(std::remove(values.begin(), values.end(), target), values.end());
}
} // namespace task_09

namespace task_10
{
// An array decays to a pointer to its first element and loses its size,
// so the element count must be passed separately. const: we only read the elements.
int sum_values(const int* values, std::size_t count)
{
    int sum = 0;
    for (std::size_t i = 0; i < count; ++i)
    {
        sum += values[i]; // values[i] is shorthand for *(values + i).
    }
    return sum;
}
} // namespace task_10

namespace task_11
{
void swap_with_pointers(int* a, int* b)
{
    if (a == nullptr || b == nullptr)
    {
        return; // Dereferencing a null pointer is undefined behavior, so bail out early.
    }
    // *a reads/writes the int the pointer points to. temp holds a's value so it isn't lost.
    int temp = *a;
    *a = *b;
    *b = temp;
}
} // namespace task_11

namespace task_12
{
// Non-const int* in and out so the caller can modify the element it gets back.
int* find_value(int* values, std::size_t count, int target)
{
    if (values == nullptr)
    {
        return nullptr;
    }
    for (std::size_t i = 0; i < count; ++i)
    {
        if (values[i] == target)
        {
            return &values[i]; // Address of the element inside the caller's array (not a copy).
        }
    }
    return nullptr; // Callers must check for nullptr before dereferencing the result.
}
} // namespace task_12

namespace task_13
{
void reverse_in_place(int* values, std::size_t count)
{
    if (values == nullptr || count == 0)
    {
        return;
    }
    int* left = values;
    int* right = values + count - 1; // Pointer arithmetic: points at the last element.
    // Swap the outer pair, then move inward. Stops when the pointers meet (odd count,
    // middle element stays put) or cross (even count).
    while (left < right)
    {
        int temp = *left;
        *left = *right;
        *right = temp;
        ++left;  // Advance to the next element.
        --right; // Step back to the previous element.
    }
}
} // namespace task_13

namespace task_14
{
std::size_t string_length(const char* text)
{
    if (text == nullptr)
    {
        return 0;
    }
    const char* end = text; // Walker pointer; `text` stays at the start for the subtraction below.
    while (*end != '\0')    // C strings end with a '\0' terminator, which is not counted.
    {
        ++end;
    }
    return static_cast<std::size_t>(end - text); // Pointer subtraction gives the element count.
}
} // namespace task_14

namespace task_15
{
// Output parameters: the pointers let this function hand back two values at once.
// The bool return value reports whether the outputs were written.
bool min_and_max(const int* values, std::size_t count, int* out_min, int* out_max)
{
    if (values == nullptr || count == 0 || out_min == nullptr || out_max == nullptr)
    {
        return false; // Invalid input: outputs are deliberately left untouched.
    }
    // Seed both with the first element; the loop then only needs to look at the rest.
    int smallest = values[0];
    int largest = values[0];
    for (std::size_t i = 1; i < count; ++i)
    {
        if (values[i] < smallest)
        {
            smallest = values[i];
        }
        if (values[i] > largest)
        {
            largest = values[i];
        }
    }
    *out_min = smallest; // Write through the pointers only once we know we succeeded.
    *out_max = largest;
    return true;
}
} // namespace task_15

namespace task_16
{
// The caller owns the returned array and must release it with delete[].
// (Forgetting is a memory leak; using delete instead of delete[] is undefined behavior.)
int* create_filled_array(std::size_t count, int value)
{
    if (count == 0)
    {
        return nullptr; // Nothing to allocate; delete[] on nullptr is safe for the caller.
    }
    // new[] allocates on the heap, so the array outlives this function (a local array would not).
    int* array = new int[count];
    for (std::size_t i = 0; i < count; ++i)
    {
        array[i] = value;
    }
    return array;
}
} // namespace task_16

namespace task_17
{
void swap_with_references(int& a, int& b)
{
    // A reference is an alias for the caller's variable, so no null check or * is needed.
    // Call site is also simpler: swap_with_references(x, y) instead of swap_with_pointers(&x, &y).
    int temp = a;
    a = b;
    b = temp;
}
} // namespace task_17

namespace task_18
{
// Non-const &: this function's job is to modify the caller's vector (and avoid copying it).
void add_to_all(std::vector<int>& values, int amount)
{
    for (int& value : values) // int& so we modify the elements, not copies.
    {
        value += amount;
    }
}

// const& avoids copying the vector and promises not to modify it.
int count_above(const std::vector<int>& values, int threshold)
{
    int count = 0;
    for (int value : values)
    {
        if (value > threshold)
        {
            ++count;
        }
    }
    return count;
}
} // namespace task_18

namespace task_19
{
// A struct groups related data; its members are public by default.
struct Rectangle
{
    double width;
    double height;
};

// const&: read-only access without copying the struct.
double area(const Rectangle& rect)
{
    return rect.width * rect.height;
}

// Non-const&: modifies the caller's Rectangle directly (passing by value would scale a copy).
void scale(Rectangle& rect, double factor)
{
    rect.width *= factor;
    rect.height *= factor;
}
} // namespace task_19

namespace task_20
{
// enum class is scoped (use Color::Red, not Red) and does not implicitly convert to int.
enum class Color
{
    Red,
    Green,
    Blue
};

std::string color_name(Color color)
{
    // Every case returns, so no break is needed.
    switch (color)
    {
    case Color::Red:
        return "Red";
    case Color::Green:
        return "Green";
    case Color::Blue:
        return "Blue";
    }
    // Only reachable if color holds an invalid value (e.g. from a cast); also silences
    // the compiler's "control reaches end of non-void function" warning.
    return "Unknown";
}

// Cycles Red -> Green -> Blue -> Red.
Color next_color(Color color)
{
    switch (color)
    {
    case Color::Red:
        return Color::Green;
    case Color::Green:
        return Color::Blue;
    case Color::Blue:
        return Color::Red; // Wrap around to the start.
    }
    return Color::Red; // Fallback for invalid values, same reason as in color_name.
}
} // namespace task_20

namespace task_21
{
// Encapsulation: the class enforces its own rules (no negative deposits, no overdrafts)
// because the balance can only change through these methods.
class BankAccount
{
public:
    void deposit(int amount)
    {
        if (amount > 0) // Silently ignore zero/negative deposits.
        {
            balance_ += amount;
        }
    }

    // Returns true if the withdrawal happened, false if it was refused (balance unchanged).
    bool withdraw(int amount)
    {
        if (amount <= 0 || amount > balance_)
        {
            return false;
        }
        balance_ -= amount;
        return true;
    }

    int balance() const // const: this method does not modify the object.
    {
        return balance_;
    }

private:
    int balance_ = 0; // Private so outside code can only change it through the methods above.
};
} // namespace task_21

namespace task_22
{
class TrafficLight
{
public:
    // Moves to the next state: Red -> Green -> Yellow -> Red.
    void advance()
    {
        switch (state_)
        {
        case State::Red:
            state_ = State::Green;
            break;
        case State::Green:
            state_ = State::Yellow;
            break;
        case State::Yellow:
            state_ = State::Red;
            break;
        }
    }

    // const: only reads state_, so it can be called on const TrafficLight objects.
    std::string state_name() const
    {
        switch (state_)
        {
        case State::Red:
            return "Red";
        case State::Green:
            return "Green";
        case State::Yellow:
            return "Yellow";
        }
        return "Unknown";
    }

private:
    // The state type is private too: it's an implementation detail callers never see.
    // It is declared after the public methods that use it, which is fine because member
    // function bodies are compiled as if the whole class were already defined.
    enum class State
    {
        Red,
        Green,
        Yellow
    };

    State state_ = State::Red; // Default member initializer: every new light starts at Red.
};
} // namespace task_22

namespace task_23
{
struct Player
{
    std::string name;
    int score;
};

// Returns a pointer into the caller's array rather than a copy (no string copy, and no
// "not found" sentinel Player needed). The pointer is const to match the const input.
// It is only valid while the array exists. Ties go to the earliest player.
const Player* find_top_player(const Player* players, std::size_t count)
{
    if (players == nullptr || count == 0)
    {
        return nullptr;
    }
    const Player* top = &players[0]; // Best so far; start with the first player.
    for (std::size_t i = 1; i < count; ++i)
    {
        if (players[i].score > top->score) // -> accesses a member through a pointer: (*top).score.
        {
            top = &players[i]; // Re-point at the new leader; nothing is copied.
        }
    }
    return top;
}
} // namespace task_23

// Tiny test helper: prints PASS/FAIL plus a label for one boolean condition.
void check(const char* label, bool passed)
{
    std::cout << (passed ? "PASS: " : "FAIL: ") << label << '\n';
}

// Runs every solution above and prints PASS/FAIL for each check.
// Variables like x, y, numbers and smallest/largest are reused across several tasks.
int main()
{
    check("task 1: square", task_01::square(7) == 49);
    check("task 1: average", task_01::average(3, 4) == 3.5);

    check("task 2: clamp below", task_02::clamp_score(-5) == 0);
    check("task 2: clamp above", task_02::clamp_score(150) == task_02::max_score);
    check("task 2: clamp inside", task_02::clamp_score(42) == 42);

    task_03::next_id(); // Returns 1; result ignored, we only need the counter to advance.
    task_03::next_id(); // Returns 2.
    check("task 3: next_id", task_03::next_id() == 3);

    check("task 4: count_vowels", task_04::count_vowels("Hello World") == 3);

    check("task 5: reverse_text", task_05::reverse_text("abc") == "cba");
    check("task 5: is_palindrome", task_05::is_palindrome("racecar") && !task_05::is_palindrome("hello"));

    check("task 6: largest_element", task_06::largest_element({3, 9, 2, 7, 5}) == 9);
    check("task 6: largest_element negatives", task_06::largest_element({-8, -3, -5}) == -3);
    check("task 6: largest_element empty", task_06::largest_element({}) == 0);

    check("task 7: filter_even", task_07::filter_even({1, 2, 3, 4, 6, 7}) == std::vector<int>({2, 4, 6}));
    check("task 7: filter_even none", task_07::filter_even({1, 3, 5}).empty());

    check("task 8: running_totals", task_08::running_totals({1, 2, 3, 4}) == std::vector<int>({1, 3, 6, 10}));
    check("task 8: running_totals empty", task_08::running_totals({}).empty());

    std::vector<int> to_trim{4, 1, 4, 4, 2, 4};
    task_09::remove_value(to_trim, 4);
    check("task 9: remove_value", to_trim == std::vector<int>({1, 2}));
    task_09::remove_value(to_trim, 99); // Must leave the vector unchanged.
    check("task 9: remove_value missing", to_trim == std::vector<int>({1, 2}));

    std::array<int, 4> numbers{4, 8, 12, 16};
    check("task 10: sum_values", task_10::sum_values(numbers.data(), numbers.size()) == 40);

    int x = 1;
    int y = 2;
    task_11::swap_with_pointers(&x, &y);
    check("task 11: swap_with_pointers", x == 2 && y == 1);
    task_11::swap_with_pointers(&x, nullptr); // Must not crash.

    // The returned pointer aims at numbers[2], so writing through it edits the array itself.
    int* found = task_12::find_value(numbers.data(), numbers.size(), 12);
    if (found != nullptr)
    {
        *found = 99;
    }
    check("task 12: find_value", found != nullptr && numbers[2] == 99);
    check("task 12: find_value missing", task_12::find_value(numbers.data(), numbers.size(), 1234) == nullptr);

    int values_to_reverse[] = {1, 2, 3, 4, 5};
    task_13::reverse_in_place(values_to_reverse, 5);
    check("task 13: reverse_in_place odd", values_to_reverse[0] == 5 && values_to_reverse[2] == 3 && values_to_reverse[4] == 1);
    int even_values[] = {1, 2, 3, 4};
    task_13::reverse_in_place(even_values, 4);
    check("task 13: reverse_in_place even", even_values[0] == 4 && even_values[1] == 3 && even_values[2] == 2 && even_values[3] == 1);
    task_13::reverse_in_place(nullptr, 3); // Must not crash.
    task_13::reverse_in_place(values_to_reverse, 0); // Must leave the array unchanged.
    check("task 13: reverse_in_place empty", values_to_reverse[0] == 5);

    check("task 14: string_length", task_14::string_length("hello") == 5);
    check("task 14: string_length empty", task_14::string_length("") == 0);
    check("task 14: string_length null", task_14::string_length(nullptr) == 0);

    int smallest = 0;
    int largest = 0;
    const int sample[] = {7, -3, 12, 5};
    check("task 15: min_and_max", task_15::min_and_max(sample, 4, &smallest, &largest) && smallest == -3 && largest == 12);
    smallest = 111; // Sentinel values: if they survive the call, the outputs were left untouched.
    largest = 222;
    check("task 15: min_and_max empty", !task_15::min_and_max(sample, 0, &smallest, &largest) && smallest == 111 && largest == 222);
    check("task 15: min_and_max null output", !task_15::min_and_max(sample, 4, nullptr, &largest));

    int* filled = task_16::create_filled_array(4, 7);
    bool all_seven = filled != nullptr; // Verify every element, not just the first.
    for (int i = 0; filled != nullptr && i < 4; ++i)
    {
        all_seven = all_seven && filled[i] == 7;
    }
    check("task 16: create_filled_array", all_seven);
    delete[] filled; // The caller owns the array, so the caller releases it.
    check("task 16: create_filled_array zero", task_16::create_filled_array(0, 7) == nullptr);

    task_17::swap_with_references(x, y); // x and y were 2 and 1 after task 11; swapping restores 1 and 2.
    check("task 17: swap_with_references", x == 1 && y == 2);

    std::vector<int> scores{1, 5, 10};
    task_18::add_to_all(scores, 2);
    check("task 18: add_to_all", scores == std::vector<int>({3, 7, 12}));
    check("task 18: count_above", task_18::count_above(scores, 5) == 2);

    task_19::Rectangle rect{2.0, 3.0}; // Brace-init fills width, then height. Scaled: 4 x 6 = 24.
    task_19::scale(rect, 2.0);
    check("task 19: area and scale", task_19::area(rect) == 24.0);

    check("task 20: color_name", task_20::color_name(task_20::Color::Green) == "Green");
    check("task 20: next_color wraps", task_20::next_color(task_20::Color::Blue) == task_20::Color::Red);

    task_21::BankAccount account;
    account.deposit(100); // 100 -> withdraw 30 -> 70; the 500 withdrawal must be refused.
    check("task 21: withdraw ok", account.withdraw(30) && account.balance() == 70);
    check("task 21: withdraw refused", !account.withdraw(500) && account.balance() == 70);

    task_22::TrafficLight light;
    check("task 22: starts red", light.state_name() == "Red");
    light.advance();
    light.advance();
    check("task 22: advance", light.state_name() == "Yellow");
    light.advance();
    check("task 22: wraps to red", light.state_name() == "Red");

    task_23::Player players[] = {{"Avery", 25}, {"Blake", 40}, {"Casey", 33}};
    const task_23::Player* top = task_23::find_top_player(players, 3);
    check("task 23: find_top_player", top != nullptr && top->name == "Blake");
    check("task 23: empty", task_23::find_top_player(players, 0) == nullptr);

    return 0;
}