#include <array>
#include <iostream>
#include <string>
#include <vector>

struct Player
{
    std::string name;
    int score;
};

// This function receives an address, so it can change the caller's int.
void add_five(int* value)
{
    if (value != nullptr) // Check before dereferencing: null has no object to access.
    {
        *value += 5; // * dereferences value, giving access to the int stored at that address.
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

int main()
{
    // A pointer stores an address. Its type says what kind of object it points to.
    int score = 10;
    int* score_pointer = &score; // &score gets score's address; int* points to an int.

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
    std::cout << '\n';

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