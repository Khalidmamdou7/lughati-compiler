#include "Variable.h"

Variable::Variable(const std::string& name, const std::string& type, bool isConstant, bool isFunction)
    : name(name), type(type), isInitialized(false), isUsed(false), isConstant(isConstant), isFunction(isFunction) {}

Variable::Variable(const Variable& other)
    : name(other.name), type(other.type), value(other.value) {}

// Implement other member functions as needed
