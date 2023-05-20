#ifndef VARIABLE_H
#define VARIABLE_H

#include <string>
#include <variant>

// Define the Value type to represent the variable value
using Value = std::variant<int, float, double, bool, std::string, char>;

class Variable {

public:
    std::string name;
    std::string type;
    Value value;
    bool isInitialized;
    bool isUsed;
    Variable(const std::string& name, const std::string& type);
    Variable(const Variable& other); // Copy constructor
    // Add other member functions as needed
};

#endif // VARIABLE_H
