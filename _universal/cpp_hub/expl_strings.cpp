#include <iostream>



/*   
%%%%%%%%%%%%%%%%%%%%%% NOTEWORTHY WRINKLES %%%%%%%%%%%%%%%%%%%%%%
1. Single vs double quotes for chars vs strings
EX:
    if(text[i] == 'e') {}
        text[i] is a char, but "e" (and the other double-quoted chars) is a string literal, which behaves like a const char*. C++ can’t compare those types, so it reports incompatible operands.

        Use single quotes for character literals: 'e', 'i', 'o', and 'u'. For example:

    
2. 


3.


4.


5.


6.


7.

8.









*/


// ----------------------------------------------------------------------------------------
// std::string style (best)(1 of 3)
// ----------------------------------------------------------------------------------------
// ###### NOTE WORTHY STUFF: #########
// <> Recommended default for working with strings in modern C++.
// <> Part of the C++ Standard Library (#include <string>).
// <> Automatically manages memory and resizes as needed.
// <> Mutable: Characters can be modified after initialization.
// <> Supports convenient operations: +, +=, ==, .size(), .find(), etc.
// <> Can be converted to a C-style string using .c_str().
// <> Unlike Python's str, C++ std::string is mutable.
// -----------------
// ###### COMMON PITFALLS #########
// <> .size() returns the number of bytes, not necessarily the number of Unicode characters.
// <> s[index] does not perform bounds checking; use .at(index) when checking is needed.
// <> std::string objects can be expensive to copy when large. Consider const std::string& or std::string_view for read-only function parameters.
// <> .c_str() returns a pointer into the string's internal storage. Modifying or destroying the string can invalidate that pointer.
// -----------------
#include <string>
#include <string_view>

std::string s = "Hello";       // Create
std::string empty;             // Empty string

void myFunction() 
{

s += " World";                 // Append
s.size();                      // Length
s.empty();                     // Check empty
s[0];                          // Access character
s.at(0);                       // Bounds-checked access
s.substr(0, 5);                // Copy substring
s.find("World");               // Find position
s == "Hello World";            // Compare contents
s.c_str();                     // C-style access

std::string_view v = s;        // Non-owning view
  

}


















// ----------------------------------------------------------------------------------------
// char[]  style        (2 of 3)
// ----------------------------------------------------------------------------------------
// ###### NOTE WORTHY STUFF: #########
// <> C-style approach: Stores characters in a fixed-size array.
// <> Owns its character storage, usually on the stack when declared as a local variable.
// <> Fixed capacity: Cannot automatically grow or shrink.
// <> Mutable: Individual characters can be modified.
// <> C-style strings require a null terminator ('\0') to mark the end.
// <> char name[] = "Hello" allocates 6 bytes (5 characters + '\0').
// <> sizeof(name) returns the array's total size in bytes; strlen(name) returns the length before '\0'.
// <> Arrays usually decay into pointers (char*) when passed to functions.
// -----------------
// ###### COMMON PITFALLS ############
// <> Buffer overflow: Writing beyond the allocated capacity causes undefined behavior.
// <> Forgetting the null terminator causes C string functions like strlen() to read beyond the intended string.
// <> strcpy() and strcat() do not check the destination's capacity.
// <> When passed to a function taking char*, the array's size information is lost.
// <> Cannot reassign an array after initialization:
// char name[20] = "Alice";
// name = "Bob"; // ERROR
// -----------------
#include <cstring>
#include <cstdio>

// Declaration / initialization
char a[] = "Hello";           // 6 bytes including '\0'
char b[32] = "Hello";         // 32-byte buffer
char empty[32] = "";         // Empty C-style string

// Common operations (using b)
std::strlen(b);              // Length: 5
b[0];                        // Access character: 'H'
b[0] = 'J';                  // Modify: "Jello"
std::strcmp(b, "Jello");     // Compare: 0 if equal
std::strchr(b, 'e');         // Find character
std::strstr(b, "ell");       // Find substring

// Modifying the contents
std::strcpy(b, "Hello");      // Replace contents
std::strcat(b, " World");     // Append: "Hello World"

// Buffer information
sizeof(b);                  // Capacity: 32 bytes
std::strlen(b);              // Text length: 11

// Capacity-aware replacement
std::snprintf(b, sizeof(b), "%s", "New text");































// ----------------------------------------------------------------------------------------
// char* style          (3 of 3)
// ----------------------------------------------------------------------------------------
// ###### NOTE WORTHY STUFF: #########
// <> Pointer to a character, often used to reference C-style strings.
// <> Does not own memory: Points to existing character storage.
// <> Can point to a char[], dynamically allocated memory, or another writable character buffer.
// <> Can be reassigned to point somewhere else, unlike char[].
// <> Allows pointer arithmetic (p++, p + 1) to traverse characters.
// <> sizeof(p) returns the pointer's size (typically 8 bytes on a 64-bit system), not the string length.
// <> char* allows modification only when the underlying memory is writable.
// <> const char* is commonly used for read-only C-style strings and string literals:
// const char* name = "Alice";
// -----------------
// ###### COMMON PITFALLS ############
// <> Uninitialized pointers: Dereferencing a pointer that doesn't point to valid memory causes undefined behavior.
// <> Dangling pointers: The pointer may outlive the memory it references.
// <> String literals: Never attempt to modify a string literal.
// <> Pointer comparison: == compares addresses, not string contents. Use strcmp() for C-style text comparison.
// <> Buffer overflow: A char* carries no information about the capacity of its buffer.
// <> Memory leaks: If a pointer owns dynamically allocated memory through new[], it must eventually be released using delete[]. Prefer std::string or RAII containers instead.
// -----------------
#include <cstring>

// Declaration / initialization
char buffer[32] = "Hello";
char* p = buffer;             // Mutable pointer
const char* q = "Hello";      // Read-only string literal
char* empty = nullptr;       // No string (not "")

// Common operations (using p)
std::strlen(p);              // Length: 5
p[0];                        // Access character: 'H'
p[0] = 'J';                  // Modify: "Jello"
std::strcmp(p, "Jello");     // Compare: 0 if equal
std::strchr(p, 'e');         // Find character
std::strstr(p, "ell");       // Find substring

// Pointer-specific operations
p++;                        // Point to next character
p = buffer;                 // Reset pointer
p = buffer + 2;             // Point to third character

// Buffer operations (after resetting p)
std::strcpy(p, "Hello");      // Replace contents
std::strcat(p, " World");     // Append (if capacity allows)

// Pointer information
sizeof(p);                  // Size of pointer, NOT buffer
std::strlen(p);              // Length of pointed-to text
