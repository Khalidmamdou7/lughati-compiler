#include "Variable.h"

Variable::Variable(const std::string& name, const std::string& type)
    : name(name), type(type), isInitialized(false), isUsed(false) {}

Variable::Variable(const Variable& other)
    : name(other.name), type(other.type), value(other.value) {}

// Implement other member functions as needed
