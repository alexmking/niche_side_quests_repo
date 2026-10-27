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



3a. The diff between passing ptr as arg, vs passing address&:
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

3b. the & means 2 different things depending on context: (this is part of the confusion on why the 'std::string& text' arg def does NOT take the 'address-of' a string, like you may think at first glance (since we know &message == address of message variable))

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































// Task 10: Write `int sum_values(const int* values, std::size_t count)` that
//          takes a pointer to the first element of an int array and the number
//          of elements, and returns the sum of all the elements.

// Task 11: Write `void swap_with_pointers(int* a, int* b)` that swaps the two
//          ints the pointers point to. Do nothing if either pointer is null.

// Task 12: Write `int* find_value(int* values, std::size_t count, int target)`
//          that returns a pointer to the first element equal to target, or
//          nullptr if the target is not present or values is null. Use the
//          returned pointer in main to change the found element.



int sum_values_ptrs(const int* nums, std::size_t size )
{
    int tot = 0;

    for(std::size_t i = 0; i <= size-1; i++)
    {
        std::cout << i << "\n";
        tot = tot + nums[i];
    }
    std::cout << tot << "\n";
    return tot;
}

void swap_with_pointers_ptrs(int* a, int* b)
{


    if(!a || !b)
    {
        return;
    }

    std::cout << "INITIAL PTRS ARE..." << "\n";
    std::cout << *a << " == elem for As ptr" << "\n"; 
    std::cout << *b << " == elem for Bs ptr" << "\n"; 
    // if val of a == 7, then...
    // print(a) is ADDRESS
    // print(*a) is 7

    // so we want ptr a to pt to the val that ptr b is currently pointing to, then vice versa for ptr b...
    // CORRECTION: the above is exactly little more complex than what we want here...(maybe good to try for another sep ptr prob)
    // CORRECTION: but here we just want to swap the elements themselves...
    int tmp_elem = *a; // save elem that ptr a is pointing at...

    // we want to access the ELEM ptr a is pting to and redefine it, so first need to deref 'a' via *a....then also de-ref 'b' to get b's element...(Which is what we want to reassign a's elem to...)
    *a = *b;


    *b = tmp_elem;

    std::cout << "NOW PTRS ARE..." << "\n";
    std::cout << *a << " == elem for As ptr" << "\n"; 
    std::cout << *b << " == elem for Bs ptr" << "\n"; 
    return;
}


int* find_value_ptrs(int* values, std::size_t count, int target)
{
    int* ptr = &values[0]; // ptr to first elem of values array...

    // iter over values, then check if values[i] == target, then ret ptr
    for(std::size_t i = 0; i <= count-1; i++)
    {
        if(values[i] == target)
        {
            std::cout << "found target at index " << i << "\n";
            ptr = &values[i];
            return ptr;
        }
    }
    return ptr;
}

// Task 13: Write `void reverse_in_place(int* values, std::size_t count)` that
//          reverses the array in place. Do it with two pointers (one starting at
//          the first element, one at the last) that move toward each other.
//          Do nothing if values is null.

// Task 14: Write `std::size_t string_length(const char* text)` that returns the
//          number of characters in a C-style string (not counting the '\0'
//          terminator) by walking a pointer until it reaches the terminator.
//          Return 0 if text is null. Do not use strlen.

// Task 15: Write
//          `bool min_and_max(const int* values, std::size_t count, int* out_min, int* out_max)`
//          that stores the smallest and largest elements through the two output
//          pointers and returns true. If values is null, count is 0, or either
//          output pointer is null, return false and leave the outputs untouched.

// Task 16: Write `int* create_filled_array(std::size_t count, int value)` that
//          allocates an array of count ints on the heap with new[], sets every
//          element to value, and returns it (or nullptr if count is 0). Then, in
//          main, use the array and release it with delete[]. Who owns the memory
//          after the function returns?





void reverse_in_place_ptrs(int* values, std::size_t count)
{
    // set 2 ptrs at opp ends of list...
    // then iter until left <= right...
    // swap the elems the ptrs are pting to at each iter (making sure to check for null)

    if(values == nullptr || count == 0)
    {
        return;
    }

    int* left = &values[0];
    int* right = &values[count-1];

    while(left < right)
    {
        int tmp_elem = *left;
        *left = *right;
        *right = tmp_elem;

        // increment/dec ptrs...
        left++;
        right--;

    }
    return; 

}


// Task 14: Write `std::size_t string_length(const char* text)` that returns the
//          number of characters in a C-style string (not counting the '\0'
//          terminator) by walking a pointer until it reaches the terminator.
//          Return 0 if text is null. Do not use strlen.
std::size_t string_length(const char* text)
{

    const char* ptr = text;
    int count = 0; 
    while(*ptr != '\0')
    {
        count++;
        ptr++;
    }

    return count;
}



// Task 15: Write
//          `bool min_and_max(const int* values, std::size_t count, int* out_min, int* out_max)`
//          that stores the smallest and largest elements through the two output
//          pointers and returns true. If values is null, count is 0, or either
//          output pointer is null, return false and leave the outputs untouched.
bool min_and_max(const int* values, std::size_t count, int* out_min, int* out_max)
{
    // iter over values, and check curr val compares to largest/smallest vals 
    // keep the max and min ptrs pointing at the smallest/largest vals so far
    // then can check answers after by referencing the two ptrs we passed in

    int smallest = values[0];
    int largest = values[0];

    for(std::size_t i = 0; i <= count-1; i++)
    {
        if(values[i] < smallest)
        {
            smallest = values[i];
        }
        if(values[i] > largest)
        {
            largest = values[i];
        }

    }
    // now assign largest/smallest to the two given ptrs...
    *out_min = smallest;
    *out_max = largest;

    return true;

}


































int main()
{
    // std::vector<int> myVect = {1,2,3,4};
    // int* ptr = &myVect[0];
    // sum_values_ptrs(ptr, 4);





    // int val1 = 1;
    // int val2 = 2;
    // int* ptr1 = &val1;
    // int* ptr2 = &val2;
    // swap_with_pointers_ptrs(ptr1, ptr2);






    // std::vector<int> vect2 = {1,2,3,4,5,6,7,8};
    // int* ptr3 = &vect2[0];
    // find_value_ptrs(ptr3, 8, 4);




    // std::vector<int> vec3 = {1,2,3,4};
    // int* ptr4 = &vec3[0];
    // reverse_in_place_ptrs(ptr4, 4);
    // for(auto elem : vec3)
    // {
    //     std::cout << elem << "-";
    // }
    // std::cout << "\n";





    // // call string_length
    // const char* myString = "alex";
    // std::size_t len = string_length(myString);
    // std::cout << "Length of \"" << myString << "\": " << len << "\n";







    // int minVal;
    // int maxVal;
    // std::vector<int> vec4 = {1,2,3,4,2,3};
    // int* vecPtr = &vec4[0];
    // min_and_max(vecPtr, 6, &minVal, &maxVal);

    // std::cout << minVal << "\n";
    // std::cout << maxVal << "\n";






    
    int minVal = 10000;
    int maxVal = -10000;

    int* minPtr = &minVal;
    int* maxPtr = &maxVal;
    std::vector<int> vec4 = {1,2,3,4,2,3};
    int* vecPtr = &vec4[0];
    min_and_max(vecPtr, 6, minPtr, maxPtr);

    std::cout << *minPtr << "\n";
    std::cout << *maxPtr << "\n";





    return 0;
}





//====================================================================
// MAIN FUNCTION
//====================================================================
// int main()
// {
//     // A pointer stores an address. Its type says what kind of object it points to.
//     int score = 10;
//     int* score_pointer = &score; // &score gets score's address; int* points to an int.

//     // ⭐REMEMBER: that no matter what kind of ptr you have (int* or char* or vector* or map*),
//     // the pointer itself stores an ADDRESS, which is the same size regardless of the type it points to,
    

//     std::cout << "score: " << score << '\n'; // Prints the variable directly.
//     std::cout << "score's address: "
//               << static_cast<const void*>(score_pointer) << '\n'; // Prints the stored address.
//     std::cout << "value through pointer: " << *score_pointer << '\n'; // * reads the int at that address.

//     *score_pointer = 12; // * on the left side writes to score; it does not change the pointer's address.
//     std::cout << "score after changing it through the pointer: "
//               << score << "\n\n"; // score itself changed because the pointer refers to score.

//     add_five(&score); // Pass score's address so add_five can modify the original variable.
//     std::cout << "score after add_five: " << score << "\n\n";

//     int* empty_pointer = nullptr; // nullptr means this pointer currently points to no object.
//     if (empty_pointer == nullptr)
//     {
//         std::cout << "empty_pointer does not point to an object\n\n"; // Dereferencing it would be invalid.
//     }

//     const int fixed_value = 20;
//     const int* pointer_to_const = &fixed_value; // Can point to a different int, but cannot change its value through this pointer.
//     std::cout << "value through pointer_to_const: "
//               << *pointer_to_const << '\n';

//     int another_value = 30;
//     int* const const_pointer = &another_value; // The pointer cannot point elsewhere, but can change the int it points to.
//     *const_pointer = 31; // Dereferencing still allows changing the pointed-to int.
//     std::cout << "value through const_pointer: "
//               << *const_pointer << "\n\n";

//     std::array<int, 3> numbers{4, 8, 12};
//     int* first_number = numbers.data(); // data() returns a pointer to the first array element.
//     for (std::size_t i = 0; i < numbers.size(); ++i)
//     {
//         std::cout << "numbers[" << i << "] = "
//                   << *(first_number + i) << '\n'; // Pointer arithmetic advances by int elements; * accesses the selected element.
//     }
//     std::cout << "sum of numbers: "
//               << sum_values(numbers.data(), numbers.size()) << '\n';

//     int* matching_number = find_value(numbers.data(), numbers.size(), 8);
//     if (matching_number != nullptr)
//     {
//         *matching_number = 9; // The returned pointer lets the caller update the matched element.
//         std::cout << "updated matching number: " << *matching_number << "\n\n";
//     }
//     else
//     {
//         std::cout << "number not found\n\n";
//     }

//     // Pointers can also point to other built-in types; the pointer type must match.
//     double temperature = 21.5;
//     double* temperature_pointer = &temperature; // double* points to a double, not an int.
//     std::cout << "temperature through pointer: " << *temperature_pointer << '\n';

//     char initial = 'A';
//     char* initial_pointer = &initial; // char* points to a single char object.
//     std::cout << "initial through pointer: " << *initial_pointer << "\n\n";

//     // A struct pointer points to the entire struct object. Use -> to access a
//     // member through a pointer; player_pointer->score means (*player_pointer).score.
//     Player player{"Avery", 25};
//     Player* player_pointer = &player; // Player* points to a Player struct.
//     std::cout << player_pointer->name << " has score "
//               << player_pointer->score << '\n';
//     player_pointer->score = 26; // -> accesses and changes a member of the pointed-to struct.
//     std::cout << "updated score: " << (*player_pointer).score << "\n\n"; // (*p).member is equivalent to p->member.
//     print_player(player_pointer); // const Player* allows reading the player without modifying it.
//     print_player(nullptr); // A nullable pointer can represent an optional argument.
//     std::cout << '\n';

//     // A pointer can point to a vector object. Dereferencing it accesses that
//     // vector; -> is shorthand for (*pointer).member.
//     std::vector<int> scores{15, 20, 25};
//     std::vector<int>* scores_pointer = &scores; // vector<int>* points to the whole vector object.
//     std::cout << "number of scores: " << scores_pointer->size() << '\n'; // Same as (*scores_pointer).size().
//     scores_pointer->push_back(30); // Calls the vector's member function through the pointer.
//     std::cout << "last score: " << (*scores_pointer)[3] << '\n'; // [] accesses a vector element after dereferencing the vector.

//     int* first_score = scores_pointer->data(); // data() points to the first element, not to the vector object.
//     std::cout << "first score through element pointer: " << *first_score << "\n\n"; // Dereference to read the first int.

//     // Dereference only a non-null pointer whose object is still alive.
//     // A pointer does not keep its object alive. Also, changing a vector's size
//     // can invalidate pointers to its elements, so reacquire them after changes.

//     return 0;
// }