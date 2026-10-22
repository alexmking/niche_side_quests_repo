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
✅DONE✅Task 1:  Write `int square(int value)` that returns value * value, and
         `double average(int a, int b)` that returns the average of two ints.
         (Watch out for integer division: average(3, 4) should be 3.5.)

✅DONE✅Task 2:  Define a constant `max_score` equal to 100 using constexpr. Then write
         `int clamp_score(int score)` that returns 0 if score is negative,
         max_score if score is above max_score, and score otherwise.

--- Scope -------------------------------------------------------------------
Task 3:  Write `int next_id()` that returns 1 the first time it is called, 2
         the second time, 3 the third time, and so on. The count must persist
         between calls without using a global variable.

--- Strings -----------------------------------------------------------------
Task 4:  Write `int count_vowels(const std::string& text)` that returns how
         many vowels (a, e, i, o, u, upper or lower case) the text contains.

Task 5:  Write `std::string reverse_text(const std::string& text)` that returns
         a reversed copy. Then write `bool is_palindrome(const std::string& text)`
         that returns true if the text reads the same forwards and backwards.

--- Arrays ------------------------------------------------------------------
Task 6:  Write `int largest_element(const std::array<int, 5>& values)` that
         returns the largest value in the array.

--- Pointers ----------------------------------------------------------------
Task 7:  Write `int sum_values(const int* values, std::size_t count)` that
         takes a pointer to the first element of an int array and the number
         of elements, and returns the sum of all the elements.

Task 8:  Write `void swap_with_pointers(int* a, int* b)` that swaps the two
         ints the pointers point to. Do nothing if either pointer is null.

Task 9:  Write `int* find_value(int* values, std::size_t count, int target)`
         that returns a pointer to the first element equal to target, or
         nullptr if the target is not present or values is null. Use the
         returned pointer in main to change the found element.

--- References --------------------------------------------------------------
Task 10: Write `void swap_with_references(int& a, int& b)` that swaps two ints.
         Compare how the call site differs from Task 8.

Task 11: Write `void add_to_all(std::vector<int>& values, int amount)` that
         adds amount to every element, and
         `int count_above(const std::vector<int>& values, int threshold)` that
         counts the elements greater than threshold. Why is one parameter
         const and the other not?

--- Structs -----------------------------------------------------------------
Task 12: Define `struct Rectangle { double width; double height; };`.
         Write `double area(const Rectangle& rect)` and
         `void scale(Rectangle& rect, double factor)`, which multiplies both
         dimensions by factor.

--- Enums -------------------------------------------------------------------
Task 13: Define `enum class Color { Red, Green, Blue };`. Write
         `std::string color_name(Color color)` using a switch, and
         `Color next_color(Color color)` that goes Red -> Green -> Blue -> Red.

--- Classes -----------------------------------------------------------------
Task 14: Write a `BankAccount` class with a private balance (starting at 0),
         a `deposit(int amount)` method, a `bool withdraw(int amount)` method
         that refuses (returns false) if funds are insufficient, and a const
         `balance()` getter.

Task 15: Write a `TrafficLight` class that uses an `enum class` for its state
         (Red, Green, Yellow), starts at Red, and has an `advance()` method
         that moves Red -> Green -> Yellow -> Red, plus a const `state_name()`
         method that returns the current state as a string.

--- Combining concepts ------------------------------------------------------
Task 16: Define `struct Player { std::string name; int score; };`. Write
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
int largest_element(const std::array<int, 5>& values)
{
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
int sum_values(const int* values, std::size_t count)
{
    int sum = 0;
    for (std::size_t i = 0; i < count; ++i)
    {
        sum += values[i];
    }
    return sum;
}
} // namespace task_07

namespace task_08
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
} // namespace task_08

namespace task_09
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
} // namespace task_09

namespace task_10
{
void swap_with_references(int& a, int& b)
{
    int temp = a; // A reference is an alias, so no null check or * is needed.
    a = b;
    b = temp;
}
} // namespace task_10

namespace task_11
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
} // namespace task_11

namespace task_12
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
} // namespace task_12

namespace task_13
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
} // namespace task_13

namespace task_14
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
} // namespace task_14

namespace task_15
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
} // namespace task_15

namespace task_16
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
} // namespace task_16

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

    std::array<int, 4> numbers{4, 8, 12, 16};
    check("task 7: sum_values", task_07::sum_values(numbers.data(), numbers.size()) == 40);

    int x = 1;
    int y = 2;
    task_08::swap_with_pointers(&x, &y);
    check("task 8: swap_with_pointers", x == 2 && y == 1);
    task_08::swap_with_pointers(&x, nullptr); // Must not crash.

    int* found = task_09::find_value(numbers.data(), numbers.size(), 12);
    if (found != nullptr)
    {
        *found = 99;
    }
    check("task 9: find_value", found != nullptr && numbers[2] == 99);
    check("task 9: find_value missing", task_09::find_value(numbers.data(), numbers.size(), 1234) == nullptr);

    task_10::swap_with_references(x, y);
    check("task 10: swap_with_references", x == 1 && y == 2);

    std::vector<int> scores{1, 5, 10};
    task_11::add_to_all(scores, 2);
    check("task 11: add_to_all", scores == std::vector<int>({3, 7, 12}));
    check("task 11: count_above", task_11::count_above(scores, 5) == 2);

    task_12::Rectangle rect{2.0, 3.0};
    task_12::scale(rect, 2.0);
    check("task 12: area and scale", task_12::area(rect) == 24.0);

    check("task 13: color_name", task_13::color_name(task_13::Color::Green) == "Green");
    check("task 13: next_color wraps", task_13::next_color(task_13::Color::Blue) == task_13::Color::Red);

    task_14::BankAccount account;
    account.deposit(100);
    check("task 14: withdraw ok", account.withdraw(30) && account.balance() == 70);
    check("task 14: withdraw refused", !account.withdraw(500) && account.balance() == 70);

    task_15::TrafficLight light;
    check("task 15: starts red", light.state_name() == "Red");
    light.advance();
    light.advance();
    check("task 15: advance", light.state_name() == "Yellow");
    light.advance();
    check("task 15: wraps to red", light.state_name() == "Red");

    task_16::Player players[] = {{"Avery", 25}, {"Blake", 40}, {"Casey", 33}};
    const task_16::Player* top = task_16::find_top_player(players, 3);
    check("task 16: find_top_player", top != nullptr && top->name == "Blake");
    check("task 16: empty", task_16::find_top_player(players, 0) == nullptr);

    return 0;
}