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

/*
==========================================================================
PRACTICE TASKS
Try each task yourself before looking at the solutions at the bottom.
==========================================================================

--- Functions, types, and constants -----------------------------------------
[✅DONE]Task 1:  Write `int square(int value)` that returns value * value, and
         `double average(int a, int b)` that returns the average of two ints.
         (Watch out for integer division: average(3, 4) should be 3.5.)

[✅DONE]Task 2:  Define a constant `max_score` equal to 100 using constexpr. Then write
         `int clamp_score(int score)` that returns 0 if score is negative,
         max_score if score is above max_score, and score otherwise.

--- Scope -------------------------------------------------------------------
[✅DONE]Task 3:  Write `int next_id()` that returns 1 the first time it is called, 2
         the second time, 3 the third time, and so on. The count must persist
         between calls without using a global variable.

--- Strings-----------------------------------------------------------------
[✅DONE]Task 4:  Write `int count_vowels(const std::string& text)` that returns how
         many vowels (a, e, i, o, u, upper or lower case) the text contains.

[✅DONE]Task 5:  Write `std::string reverse_text(const std::string& text)` that returns
         a reversed copy. Then write `bool is_palindrome(const std::string& text)`
         that returns true if the text reads the same forwards and backwards.

--- Vectors -----------------------------------------------------------------
[✅DONE]Task 6:  Write `int largest_element(const std::vector<int>& values)` that
         returns the largest value in the vector, or 0 if the vector is empty.

[✅DONE]Task 7:  Write `std::vector<int> filter_even(const std::vector<int>& values)`
         that returns a new vector containing only the even values, in their
         original order. (filter_even({1, 2, 3, 4}) should be {2, 4}.)

[✅DONE]Task 8:  Write `std::vector<int> running_totals(const std::vector<int>& values)`
         that returns a vector where each element is the sum of all the input
         elements up to and including that position.
         (running_totals({1, 2, 3, 4}) should be {1, 3, 6, 10}.)
         Bonus: use reserve() so the result never reallocates.

[✅DONE]Task 9:  Write `void remove_value(std::vector<int>& values, int target)` that
         removes every element equal to target, keeping the order of the rest.
         (Hint: calling erase inside a range-for loop is a bug. Look up the
         erase-remove idiom.)

--- Pointers ----------------------------------------------------------------
Task 10: Write `int sum_values(const int* values, std::size_t count)` that
         takes a pointer to the first element of an int array and the number
         of elements, and returns the sum of all the elements.

Task 11: Write `void swap_with_pointers(int* a, int* b)` that swaps the two
         ints the pointers point to. Do nothing if either pointer is null.

Task 12: Write `int* find_value(int* values, std::size_t count, int target)`
         that returns a pointer to the first element equal to target, or
         nullptr if the target is not present or values is null. Use the
         returned pointer in main to change the found element.

Task 13: Write `void reverse_in_place(int* values, std::size_t count)` that
         reverses the array in place. Do it with two pointers (one starting at
         the first element, one at the last) that move toward each other.
         Do nothing if values is null.

Task 14: Write `std::size_t string_length(const char* text)` that returns the
         number of characters in a C-style string (not counting the '\0'
         terminator) by walking a pointer until it reaches the terminator.
         Return 0 if text is null. Do not use strlen.

Task 15: Write
         `bool min_and_max(const int* values, std::size_t count, int* out_min, int* out_max)`
         that stores the smallest and largest elements through the two output
         pointers and returns true. If values is null, count is 0, or either
         output pointer is null, return false and leave the outputs untouched.

Task 16: Write `int* create_filled_array(std::size_t count, int value)` that
         allocates an array of count ints on the heap with new[], sets every
         element to value, and returns it (or nullptr if count is 0). Then, in
         main, use the array and release it with delete[]. Who owns the memory
         after the function returns?

--- References --------------------------------------------------------------
Task 17: Write `void swap_with_references(int& a, int& b)` that swaps two ints.
         Compare how the call site differs from Task 11.

Task 18: Write `void add_to_all(std::vector<int>& values, int amount)` that
         adds amount to every element, and
         `int count_above(const std::vector<int>& values, int threshold)` that
         counts the elements greater than threshold. Why is one parameter
         const and the other not?

--- Structs -----------------------------------------------------------------
Task 19: Define `struct Rectangle { double width; double height; };`.
         Write `double area(const Rectangle& rect)` and
         `void scale(Rectangle& rect, double factor)`, which multiplies both
         dimensions by factor.

--- Enums -------------------------------------------------------------------
Task 20: Define `enum class Color { Red, Green, Blue };`. Write
         `std::string color_name(Color color)` using a switch, and
         `Color next_color(Color color)` that goes Red -> Green -> Blue -> Red.

--- Classes -----------------------------------------------------------------
Task 21: Write a `BankAccount` class with a private balance (starting at 0),
         a `deposit(int amount)` method, a `bool withdraw(int amount)` method
         that refuses (returns false) if funds are insufficient, and a const
         `balance()` getter.

Task 22: Write a `TrafficLight` class that uses an `enum class` for its state
         (Red, Green, Yellow), starts at Red, and has an `advance()` method
         that moves Red -> Green -> Yellow -> Red, plus a const `state_name()`
         method that returns the current state as a string.

--- Combining concepts ------------------------------------------------------
Task 23: Define `struct Player { std::string name; int score; };`. Write
         `const Player* find_top_player(const Player* players, std::size_t count)`
         that returns a pointer to the player with the highest score, or
         nullptr if count is 0.
*/











































































































/*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SOLUTIONS FOR EACH TASK SHALL BE PROVIDED BELOW THIS POINT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*/

// Each task lives in its own namespace so names (like Player) never collide.

namespace task_01
{
int square(int value)
{
    return value * value;
}

double average(int a, int b)
{
    return (a + b) / 2.0; // 2.0 forces floating-point division.
}
} // namespace task_01

namespace task_02
{
constexpr int max_score = 100;

int clamp_score(int score)
{
    if (score < 0)
    {
        return 0;
    }
    if (score > max_score)
    {
        return max_score;
    }
    return score;
}
} // namespace task_02

namespace task_03
{
int next_id()
{
    static int id = 0; // Initialized once; keeps its value between calls but is only visible here.
    return ++id;
}
} // namespace task_03

namespace task_04
{
int count_vowels(const std::string& text)
{
    const std::string vowels = "aeiouAEIOU";
    int count = 0;
    for (char c : text)
    {
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
    for (std::size_t i = text.size(); i > 0; --i) // size_t is unsigned, so count down to 1 and use i - 1.
    {
        reversed += text[i - 1];
    }
    return reversed;
}

bool is_palindrome(const std::string& text)
{
    return text == reverse_text(text);
}
} // namespace task_05

namespace task_06
{
int largest_element(const std::vector<int>& values)
{
    if (values.empty())
    {
        return 0;
    }
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
    std::vector<int> evens;
    for (int value : values)
    {
        if (value % 2 == 0)
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
    int sum = 0;
    for (int value : values)
    {
        sum += value;
        totals.push_back(sum);
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
    values.erase(std::remove(values.begin(), values.end(), target), values.end());
}
} // namespace task_09

namespace task_10
{
int sum_values(const int* values, std::size_t count)
{
    int sum = 0;
    for (std::size_t i = 0; i < count; ++i)
    {
        sum += values[i];
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
        return;
    }
    int temp = *a;
    *a = *b;
    *b = temp;
}
} // namespace task_11

namespace task_12
{
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
            return &values[i];
        }
    }
    return nullptr;
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
    int* right = values + count - 1; // Points at the last element.
    while (left < right)
    {
        int temp = *left;
        *left = *right;
        *right = temp;
        ++left;
        --right;
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
    const char* end = text;
    while (*end != '\0')
    {
        ++end;
    }
    return static_cast<std::size_t>(end - text); // Pointer subtraction gives the element count.
}
} // namespace task_14

namespace task_15
{
bool min_and_max(const int* values, std::size_t count, int* out_min, int* out_max)
{
    if (values == nullptr || count == 0 || out_min == nullptr || out_max == nullptr)
    {
        return false;
    }
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
int* create_filled_array(std::size_t count, int value)
{
    if (count == 0)
    {
        return nullptr;
    }
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
    int temp = a; // A reference is an alias, so no null check or * is needed.
    a = b;
    b = temp;
}
} // namespace task_17

namespace task_18
{
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
struct Rectangle
{
    double width;
    double height;
};

double area(const Rectangle& rect)
{
    return rect.width * rect.height;
}

void scale(Rectangle& rect, double factor)
{
    rect.width *= factor;
    rect.height *= factor;
}
} // namespace task_19

namespace task_20
{
enum class Color
{
    Red,
    Green,
    Blue
};

std::string color_name(Color color)
{
    switch (color)
    {
    case Color::Red:
        return "Red";
    case Color::Green:
        return "Green";
    case Color::Blue:
        return "Blue";
    }
    return "Unknown";
}

Color next_color(Color color)
{
    switch (color)
    {
    case Color::Red:
        return Color::Green;
    case Color::Green:
        return Color::Blue;
    case Color::Blue:
        return Color::Red;
    }
    return Color::Red;
}
} // namespace task_20

namespace task_21
{
class BankAccount
{
public:
    void deposit(int amount)
    {
        if (amount > 0)
        {
            balance_ += amount;
        }
    }

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
    enum class State
    {
        Red,
        Green,
        Yellow
    };

    State state_ = State::Red;
};
} // namespace task_22

namespace task_23
{
struct Player
{
    std::string name;
    int score;
};

const Player* find_top_player(const Player* players, std::size_t count)
{
    if (players == nullptr || count == 0)
    {
        return nullptr;
    }
    const Player* top = &players[0];
    for (std::size_t i = 1; i < count; ++i)
    {
        if (players[i].score > top->score)
        {
            top = &players[i];
        }
    }
    return top;
}
} // namespace task_23

// Runs every solution and prints PASS/FAIL for each check.
void check(const char* label, bool passed)
{
    std::cout << (passed ? "PASS: " : "FAIL: ") << label << '\n';
}

int main()
{
    check("task 1: square", task_01::square(7) == 49);
    check("task 1: average", task_01::average(3, 4) == 3.5);

    check("task 2: clamp below", task_02::clamp_score(-5) == 0);
    check("task 2: clamp above", task_02::clamp_score(150) == task_02::max_score);
    check("task 2: clamp inside", task_02::clamp_score(42) == 42);

    task_03::next_id();
    task_03::next_id();
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
    smallest = 111;
    largest = 222;
    check("task 15: min_and_max empty", !task_15::min_and_max(sample, 0, &smallest, &largest) && smallest == 111 && largest == 222);
    check("task 15: min_and_max null output", !task_15::min_and_max(sample, 4, nullptr, &largest));

    int* filled = task_16::create_filled_array(4, 7);
    bool all_seven = filled != nullptr;
    for (int i = 0; filled != nullptr && i < 4; ++i)
    {
        all_seven = all_seven && filled[i] == 7;
    }
    check("task 16: create_filled_array", all_seven);
    delete[] filled; // The caller owns the array, so the caller releases it.
    check("task 16: create_filled_array zero", task_16::create_filled_array(0, 7) == nullptr);

    task_17::swap_with_references(x, y);
    check("task 17: swap_with_references", x == 1 && y == 2);

    std::vector<int> scores{1, 5, 10};
    task_18::add_to_all(scores, 2);
    check("task 18: add_to_all", scores == std::vector<int>({3, 7, 12}));
    check("task 18: count_above", task_18::count_above(scores, 5) == 2);

    task_19::Rectangle rect{2.0, 3.0};
    task_19::scale(rect, 2.0);
    check("task 19: area and scale", task_19::area(rect) == 24.0);

    check("task 20: color_name", task_20::color_name(task_20::Color::Green) == "Green");
    check("task 20: next_color wraps", task_20::next_color(task_20::Color::Blue) == task_20::Color::Red);

    task_21::BankAccount account;
    account.deposit(100);
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