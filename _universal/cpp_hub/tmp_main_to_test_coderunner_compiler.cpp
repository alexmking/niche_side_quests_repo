#include <iostream>

int main() {
    if (__cplusplus == 201703L) {
        std::cout << "Success! You are using C++17." << std::endl;
    } else if (__cplusplus > 201703L) {
        std::cout << "Even better! You are using a standard newer than C++17: " << __cplusplus << std::endl;
    } else {
        std::cout << "Still using an old standard: " << __cplusplus << std::endl;
    }
    return 0;
}
