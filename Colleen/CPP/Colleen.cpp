#include <iostream>
#include <string>
#include <algorithm>

std::string s = R"(#include <iostream>
#include <string>
#include <algorithm>

std::string s = R*($)*;

// Global Scope Comment
int main() {
    // Main Scope Comment
    std::string c = s;
    std::replace(s.begin(), s.begin() + s.find('$') + 5, '*', '"');
    std::cout << s.substr(0, s.find('$')) << c << s.substr(s.find('$') + 1);
}
)";

// Global Scope Comment
int main() {
    // Main Scope Comment
    std::string c = s;
    std::replace(s.begin(), s.begin() + s.find('$') + 5, '*', '"');
    std::cout << s.substr(0, s.find('$')) << c << s.substr(s.find('$') + 1);
}
