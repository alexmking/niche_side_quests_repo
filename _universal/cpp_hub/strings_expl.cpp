#include <iostream>





// -------------------------------------------------
// std::string style (best)
// -------------------------------------------------

#include <string>
#include <string_view>

std::string s = "Hello";       // Create
std::string empty;             // Empty string

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
  





















// -------------------------------------------------
// std::string style (best)
// -------------------------------------------------
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
































// -------------------------------------------------
// std::string style (best)
// -------------------------------------------------
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
