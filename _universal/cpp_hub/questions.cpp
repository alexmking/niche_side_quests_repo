// this file is where to jot down misc quesitons I want to look into when have time



// 1. What is up with this 'iterator' input to the erase() function:
// values.erase(values.begin());
// IOW: try to get some idea of how erase() works with iterators AND why we need to pass an iterator to it vs just being able to pass the integer index val



// 2. what is the diff between the first arg of these two functions:
    // void myFunc1(int* values, int size)
    // void myFunc2(std::vector<int>& values)

    // ANSWER: they're both ptrs to arrays/vectors but myFunc1(int* values) accepts c-style arrays, not just std::vectors

