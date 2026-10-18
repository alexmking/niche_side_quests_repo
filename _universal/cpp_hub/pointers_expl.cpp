#include <array>
#include <iostream>
#include <string>
#include <vector>

/* 
EXERCISES FROM Stroustrup's 4th Edition:
https://www.stroustrup.com/4thExercises.pdf
    Each chapter has a checklist of solid gen questions + exercises
    ⭐USE THESE!!! They are surprisingly thorough and helpful
*/ 

/*
### how to remember asterisk placement: ###
* goes with the type when declaring a pointer: int* ptr;
* goes with the pointer variable when dereferencing: *ptr = 5;
Think about what the * is "operating" on:
- When declaring, * is part of the type: int* ptr; means ptr is a pointer to int.
- When dereferencing, * operates on the pointer variable: *ptr = 5; changes the value pointed to by ptr.
*/


/*   
%%%%%%%%%%%%%%%%%%%%%% NOTEWORTHY WRINKLES %%%%%%%%%%%%%%%%%%%%%%
1. AMBIGUITY in pointer declaration with a single elem vs an array of elems/
    > Consider the 3 below declarations:
        int* ptr1;               // pointer to a single int 
        int* ptr2;               //  ptr to first element of an array)
        int (*ptr3)[10];         // pointer to an array of 10 ints
            - the int* could be EITHER a ptr to a single int,
            OR a ptr to the first element of an array of ints.
            **They look exactly the same when declared**

            int* means “pointer to an int.”
            ⭐It does NOT MEAN “pointer to exactly one int.”

        - When you see int* ptr;, you cannot tell just from the declaration whether ptr will point to a single int or the first element of an array.
        - You need to rely on context, comments, or naming conventions to understand the intended usage of the pointer.
        - HOWEVER, there IS a real 'ptr to an array' type:
        int (*ptr3)[10]; // pointer to an array of 10 ints

        Differences in iteration syntax:
        *ptr1       // for a pointer to a single int or first element of an array
        ptr2[4]     // dereferencing a pointer to the 4th element of an array
        *ptr3[4]     // for a pointer to an array of 10 ints (requires dereferencing first: (*ptr3)[i])


            EXAMPLE with a pointer to an array of ints when declared like 'int* ptr'
            int values[3] = {10, 20, 30};
            int* ptr = values;
            std::cout << "First value via pointer: " << ptr[0] << '\n';
            std::cout << "Second value via pointer: " << ptr[1] << '\n';
            std::cout << "Third value via pointer: " << ptr[2] << '\n';

            EXAMPLE with a pointer to an array of ints when declared like 'int (*ptr)[3]'
            int values2[3] = {100, 200, 300};
            int (*ptr2)[3] = &values2;
            std::cout << "First value via pointer to array: " << (*ptr2)[0] << '\n';
            std::cout << "Second value via pointer to array: " << (*ptr2)[1] << '\n';
            std::cout << "Third value via pointer to array: " << (*ptr2)[2] << '\n';

2. ARROW vs DOT OPERATOR with STRUCTS:
    The arrow operator (->) is used to access members of a struct through a pointer.
    The dot operator (.) is used to access members of a struct directly.

    Example:
        Player player{"Alice", 100};
        Player* player_ptr = &player;
        std::cout << "Access via dot: " << player.score << '\n';
        std::cout << "Access via arrow: " << player_ptr->score << '\n';

        ⭐ MEMORY TRICK: if we have a PTR to a struct, then we need to use the 'pointing' arrow operator (->) to access its members.



3. The diff between passing ptr as arg, vs passing address&:
    method1 of 2: string&
    void print_ref(const std::string& text)
    {
        std::cout << text << '\n';
    }
    method2 of 2: string*
    void print_ptr(const std::string* text)
    {
        if (text != nullptr)
        {
            std::cout << *text << '\n'; // Dereference pointer with *
        }
    }

    # showing the diff in how you call them:
    int main()
    {
        std::string message = "Hello";

        // Reference style:
        print_ref(message);

        // Pointer style:
        print_ptr(&message);

        Pointer style can also represent "no object"
        print_ptr(nullptr);

        return 0;
    }
        ⭐ KIM these two methods are accomplishing the same thing: passing the actual string to the function without making a copy. The first uses a const reference, the second uses a pointer.
        ⭐ It's just two diff ways of achieving the same goal: avoiding a copy of the string while still allowing the function to access its contents.
        ⭐ the string& doesn't make as much sense to me as the pointer version, but even though I don't understand the string& method as well, the 
            ⭐ the bigger picture is knowing we're passing by reference when we see the & method in a function definition, just like I do when I see the pointer style.



*/

struct Player
{
    std::string name;
    int score;
};

struct testStruct
{
    int* ptr1;
    int* ptr2;
    // declare a pointer to an array of ints
    int (*array_ptr)[];
};

// This function receives an address, so it can change the caller's int.
void add_five(int* value)
{
    if (value != nullptr) // Check before dereferencing: null has no object to access.
    {
        *value += 5; // * dereferences value, giving access to the int stored at that address.
    }
}

// function that accepts a ptr to an array of integers, along with its size, and a ptr to a vector of integers, then prints their contents
// SO YOU CAN SEE THE DIFF B/W POINTERS TO ARRAYS AND POINTERS TO VECTORS
void print_array_and_vector(int* array_ptr, std::size_t array_size, std::vector<int>* vector_ptr)
{
    // array section
    if (array_ptr != nullptr)
    {
        std::cout << "Array contents: ";
        for (std::size_t i = 0; i < array_size; ++i)
        {
            std::cout << array_ptr[i] << ' ';
        }
        std::cout << '\n';
    }

    // vector section
    if (vector_ptr != nullptr)
    {
        std::cout << "Vector contents: ";
        for (const int& value : *vector_ptr)
        {
            std::cout << value << ' ';
        }
        std::cout << '\n';
    }
}

void function_with_many_diff_ptr_type_args(int* int_ptr, double* double_ptr, char* char_ptr, Player* player_ptr)
{
    // Example usage: just print the values if the pointers are not null.
    if (int_ptr != nullptr)
    {
        std::cout << "int value: " << *int_ptr << '\n';
    }
    if (double_ptr != nullptr)
    {
        std::cout << "double value: " << *double_ptr << '\n';
    }
    if (char_ptr != nullptr)
    {
        std::cout << "char value: " << *char_ptr << '\n';
    }
    if (player_ptr != nullptr)
    {
        std::cout << "player name: " << player_ptr->name << ", score: " << player_ptr->score << '\n';
    }
}

// this function accepts a pointer to a Player object and prints its details.
void print_player(const Player* player_ptr)
{
    if (player_ptr == nullptr)
    {
        std::cout << "no player provided\n";
        return;
    }

    std::cout << player_ptr->name << " has score "
              << player_ptr->score << '\n';
}

// this function accepts a pointer to an array of integers and its size, then returns the sum of the values
int sum_values(const int* values, std::size_t count)
{
    // When count is nonzero, values must point to at least count readable ints.
    int sum = 0;
    for (std::size_t i = 0; i < count; ++i)
    {
        sum += values[i]; // A pointer plus a length can describe a read-only array.
    }   
    return sum;
}

// this function accepts a pointer to an array of integers, its size, and a target value, then returns a pointer to the first matching element or nullptr if not found.
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
            return &values[i]; // Return the address when the caller needs to use the matching element.
        }
    }
    return nullptr; // nullptr represents "not found".
}








//====================================================================
// MAIN FUNCTION
//====================================================================
int main()
{
    // A pointer stores an address. Its type says what kind of object it points to.
    int score = 10;
    int* score_pointer = &score; // &score gets score's address; int* points to an int.

    // ⭐REMEMBER: that no matter what kind of ptr you have (int* or char* or vector* or map*),
    // the pointer itself stores an ADDRESS, which is the same size regardless of the type it points to,
    

    std::cout << "score: " << score << '\n'; // Prints the variable directly.
    std::cout << "score's address: "
              << static_cast<const void*>(score_pointer) << '\n'; // Prints the stored address.
    std::cout << "value through pointer: " << *score_pointer << '\n'; // * reads the int at that address.

    *score_pointer = 12; // * on the left side writes to score; it does not change the pointer's address.
    std::cout << "score after changing it through the pointer: "
              << score << "\n\n"; // score itself changed because the pointer refers to score.

    add_five(&score); // Pass score's address so add_five can modify the original variable.
    std::cout << "score after add_five: " << score << "\n\n";

    int* empty_pointer = nullptr; // nullptr means this pointer currently points to no object.
    if (empty_pointer == nullptr)
    {
        std::cout << "empty_pointer does not point to an object\n\n"; // Dereferencing it would be invalid.
    }

    const int fixed_value = 20;
    const int* pointer_to_const = &fixed_value; // Can point to a different int, but cannot change its value through this pointer.
    std::cout << "value through pointer_to_const: "
              << *pointer_to_const << '\n';

    int another_value = 30;
    int* const const_pointer = &another_value; // The pointer cannot point elsewhere, but can change the int it points to.
    *const_pointer = 31; // Dereferencing still allows changing the pointed-to int.
    std::cout << "value through const_pointer: "
              << *const_pointer << "\n\n";

    std::array<int, 3> numbers{4, 8, 12};
    int* first_number = numbers.data(); // data() returns a pointer to the first array element.
    for (std::size_t i = 0; i < numbers.size(); ++i)
    {
        std::cout << "numbers[" << i << "] = "
                  << *(first_number + i) << '\n'; // Pointer arithmetic advances by int elements; * accesses the selected element.
    }
    std::cout << "sum of numbers: "
              << sum_values(numbers.data(), numbers.size()) << '\n';

    int* matching_number = find_value(numbers.data(), numbers.size(), 8);
    if (matching_number != nullptr)
    {
        *matching_number = 9; // The returned pointer lets the caller update the matched element.
        std::cout << "updated matching number: " << *matching_number << "\n\n";
    }
    else
    {
        std::cout << "number not found\n\n";
    }

    // Pointers can also point to other built-in types; the pointer type must match.
    double temperature = 21.5;
    double* temperature_pointer = &temperature; // double* points to a double, not an int.
    std::cout << "temperature through pointer: " << *temperature_pointer << '\n';

    char initial = 'A';
    char* initial_pointer = &initial; // char* points to a single char object.
    std::cout << "initial through pointer: " << *initial_pointer << "\n\n";

    // A struct pointer points to the entire struct object. Use -> to access a
    // member through a pointer; player_pointer->score means (*player_pointer).score.
    Player player{"Avery", 25};
    Player* player_pointer = &player; // Player* points to a Player struct.
    std::cout << player_pointer->name << " has score "
              << player_pointer->score << '\n';
    player_pointer->score = 26; // -> accesses and changes a member of the pointed-to struct.
    std::cout << "updated score: " << (*player_pointer).score << "\n\n"; // (*p).member is equivalent to p->member.
    print_player(player_pointer); // const Player* allows reading the player without modifying it.
    print_player(nullptr); // A nullable pointer can represent an optional argument.
    std::cout << '\n';

    // A pointer can point to a vector object. Dereferencing it accesses that
    // vector; -> is shorthand for (*pointer).member.
    std::vector<int> scores{15, 20, 25};
    std::vector<int>* scores_pointer = &scores; // vector<int>* points to the whole vector object.
    std::cout << "number of scores: " << scores_pointer->size() << '\n'; // Same as (*scores_pointer).size().
    scores_pointer->push_back(30); // Calls the vector's member function through the pointer.
    std::cout << "last score: " << (*scores_pointer)[3] << '\n'; // [] accesses a vector element after dereferencing the vector.

    int* first_score = scores_pointer->data(); // data() points to the first element, not to the vector object.
    std::cout << "first score through element pointer: " << *first_score << "\n\n"; // Dereference to read the first int.

    // Dereference only a non-null pointer whose object is still alive.
    // A pointer does not keep its object alive. Also, changing a vector's size
    // can invalidate pointers to its elements, so reacquire them after changes.

    return 0;
}