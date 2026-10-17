#include <iostream>


void my_funct1(int val)
{
    int ans = val + 5;
    std::cout << ans << " here " << '\n';
    std::cout << ans << '\n';

}

int main() 
{
    std::cout << "hello world cpp tour 1\n";
    my_funct1(10);
}