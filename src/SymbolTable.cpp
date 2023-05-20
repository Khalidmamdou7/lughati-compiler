#include "SymbolTable.h"
#include <iostream>
#include <fstream>
#include <string>
#include <utility>

void SymbolTable::insert(const std::string& name, const std::string& type, bool isConstant, bool isFunction) {
    symbolTable[name].push(Variable(name, type, isConstant, isFunction));
}

void SymbolTable::enterScope() {
    symbolTable.emplace();
}

void SymbolTable::exitScope() {
    if (!symbolTable.empty()) {
        symbolTable.erase(symbolTable.begin());
    }
}

bool SymbolTable::exists(const std::string& name) {
    return symbolTable.count(name) > 0;
}

std::string SymbolTable::getType(const std::string& name) {
    if (exists(name) && !symbolTable[name].empty()) {
        return symbolTable[name].top().type;
    }
    return "";
}

bool SymbolTable::isInitialized(const std::string& name) {
    if (exists(name) && !symbolTable[name].empty()) {
        return symbolTable[name].top().isInitialized;
    }
    return false;
}

void SymbolTable::setInitialized(const std::string& name) {
    if (exists(name) && !symbolTable[name].empty()) {
        symbolTable[name].top().isInitialized = true;
    }
}

bool SymbolTable::isUsed(const std::string& name) {
    if (exists(name) && !symbolTable[name].empty()) {
        return symbolTable[name].top().isUsed;
    }
    return false;
}

void SymbolTable::setUsed(const std::string& name) {
    if (exists(name) && !symbolTable[name].empty()) {
        symbolTable[name].top().isUsed = true;
    }
}

void SymbolTable::checkUnusedVariables() {
    for (auto& entry : symbolTable) {
        const std::stack<Variable>& varStack = entry.second;
        if (!varStack.empty() && !varStack.top().isUsed) {
            std::cout << "Warning: Variable '" << varStack.top().name << "' declared but not used.\n";
        }
    }
}

Variable SymbolTable::getVariable(const std::string& name) {
    if (exists(name) && !symbolTable[name].empty()) {
        return symbolTable[name].top();
    }
    return Variable();
}

void SymbolTable::setVariableValue(const std::string& name, const std::variant<int, float, double, bool, std::string, char>& value) {
    if (exists(name) && !symbolTable[name].empty()) {
        symbolTable[name].top().value = value;
        symbolTable[name].top().isInitialized = true;
    }
}

// void SymbolTable::setValue(const std::string& name, int value) {
//     if (exists(name) && !symbolTable[name].empty()) {
//         symbolTable[name].top().value = value;
//     }
// }

// void SymbolTable::setValue(const std::string& name, float value) {
//     if (exists(name) && !symbolTable[name].empty()) {
//         symbolTable[name].top().value = value;
//     }
// }

// void SymbolTable::setValue(const std::string& name, double value) {
//     if (exists(name) && !symbolTable[name].empty()) {
//         symbolTable[name].top().value = value;
//     }
// }

// void SymbolTable::setValue(const std::string& name, bool value) {
//     if (exists(name) && !symbolTable[name].empty()) {
//         symbolTable[name].top().value = value;
//     }
// }

// void SymbolTable::setValue(const std::string& name, const std::string& value) {
//     if (exists(name) && !symbolTable[name].empty()) {
//         symbolTable[name].top().value = value;
//     }
// }

// void SymbolTable::setValue(const std::string& name, char value) {
//     if (exists(name) && !symbolTable[name].empty()) {
//         symbolTable[name].top().value = value;
//     }
// }

// std::variant SymbolTable::getValue(const std::string& name) {
//     if (exists(name) && !symbolTable[name].empty()) {
//         return symbolTable[name].top().value;
//     }
//     return std::variant();
// }

// int SymbolTable::getIntValue(const std::string& name) {
//     if (exists(name) && !symbolTable[name].empty()) {
//         return symbolTable[name].top().value;
//     }
//     return 0;
// }

// float SymbolTable::getFloatValue(const std::string& name) {
//     if (exists(name) && !symbolTable[name].empty()) {
//         return symbolTable[name].top().value;
//     }
//     return 0.0f;
// }

// double SymbolTable::getDoubleValue(const std::string& name) {
//     if (exists(name) && !symbolTable[name].empty()) {
//         return symbolTable[name].top().value;
//     }
//     return 0.0;
// }

// bool SymbolTable::getBoolValue(const std::string& name) {
//     if (exists(name) && !symbolTable[name].empty()) {
//         return symbolTable[name].top().value;
//     }
//     return false;
// }

// std::string SymbolTable::getStringValue(const std::string& name) {
//     if (exists(name) && !symbolTable[name].empty()) {
//         return symbolTable[name].top().value;
//     }
//     return "";
// }

// char SymbolTable::getCharValue(const std::string& name) {
//     if (exists(name) && !symbolTable[name].empty()) {
//         return symbolTable[name].top().value;
//     }
//     return '\0';
// }

void SymbolTable::print() const {
    for (auto& entry : symbolTable) {
        const std::stack<Variable>& varStack = entry.second;
        if (!varStack.empty()) {
            std::cout << "Variable: " << varStack.top().name << " Type: " << varStack.top().type << std::endl;
            std::cout << "Initialized: " << varStack.top().isInitialized << " Used: " << varStack.top().isUsed << std::endl;
            if (varStack.top().isInitialized) {
                std::visit([](const auto& value) { std::cout << value << std::endl; }, varStack.top().value);
            }
            std::cout << std::endl;
        }
    }
}

void SymbolTable::exportToFile() {
    std::ofstream file;
	file.open("./build/symbolTable.txt", std::ios::out | std::ios::trunc);
    for (auto& entry : symbolTable) {
        const std::stack<Variable>& varStack = entry.second;
        if (!varStack.empty()) {
            file << "Variable: " << varStack.top().name << std::endl
                    << "Type: " << varStack.top().type << std::endl;
            file << "Initialized: " << varStack.top().isInitialized << std::endl
                << "Used: " << varStack.top().isUsed << std::endl;
            if (varStack.top().isInitialized) {
                std::visit([&file](const auto& value) { file << "Value: " << value << std::endl; }, varStack.top().value);
            }
            file << "====================\n";
        }
    }
    file.close();
}