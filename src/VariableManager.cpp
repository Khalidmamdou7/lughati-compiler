#include "VariableManager.h"
#include <iostream>
#include <string>
#include <utility>

TempVariable::TempVariable(const std::string& name, const std::string& type)
    : name(name), type(type) {}

TempVariable::~TempVariable() {
    // Clean up the value based on the type
}

std::string TempVariable::getName() const {
    return name;
}

std::string TempVariable::getType() const {
    return type;
}

void TempVariable::setValue(int value) {
    this->value = value;
}

void TempVariable::setValue(float value) {
    this->value = value;
}

void TempVariable::setValue(double value) {
    this->value = value;
}

void TempVariable::setValue(bool value) {
    this->value = value;
}

void TempVariable::setValue(const std::string& value) {
    this->value = value;
}

void TempVariable::setValue(char value) {
    this->value = value;
}

std::variant<int, float, double, bool, std::string, char> TempVariable::getValue() const {
    return value;
}

int TempVariable::getIntValue() const {
    return std::get<int>(value);
}

float TempVariable::getFloatValue() const {
    return std::get<float>(value);
}

double TempVariable::getDoubleValue() const {
    return std::get<double>(value);
}

bool TempVariable::getBoolValue() const {
    return std::get<bool>(value);
}

std::string TempVariable::getStringValue() const {
    return std::get<std::string>(value);
}

char TempVariable::getCharValue() const {
    return std::get<char>(value);
}

void TempVariable::print() const {
    std::cout << name << " of type " << type << " = ";
    std::visit([](auto&& arg) { std::cout << arg; }, value);
    std::cout << std::endl;
}

VariableManager::VariableManager()
    : tempVariable(nullptr) {}

VariableManager::~VariableManager() {
    delete tempVariable;
}

void VariableManager::setTempVariable(const std::string& name, const std::string& type) {
    delete tempVariable; // Delete the existing tempVariable (if any)
    tempVariable = new TempVariable(name, type);
}

TempVariable* VariableManager::getTempVariable() {
    return tempVariable;
}

void VariableManager::clearTempVariable() {
    delete tempVariable;
    tempVariable = nullptr;
}
bool VariableManager::setTempVariableValue(int value) {
    std::cout << "setTempVariableValue(int value)" << std::endl;
    if (tempVariable)
        if (tempVariable->getType() == "float")
            tempVariable->setValue((float)value);
        else if (tempVariable->getType() == "double")
            tempVariable->setValue((double)value);
        else if (tempVariable->getType() == "int")
            tempVariable->setValue(value);
        else {
            std::cout << "Error: Invalid type assignment for " << tempVariable->getName() << std::endl;
            return false;
        }
        return true;
}

bool VariableManager::setTempVariableValue(float value) {
    if (tempVariable)
        if (tempVariable->getType() == "float")
            tempVariable->setValue(value);
        else if (tempVariable->getType() == "double")
            tempVariable->setValue((double)value);
        else if (tempVariable->getType() == "int")
            tempVariable->setValue((int)value);
        else {
            std::cout << "Error: Invalid type assignment for " << tempVariable->getName() << std::endl;
            return false;
        }
        return true;
}

bool VariableManager::setTempVariableValue(double value) {
    std::cout << "setTempVariableValue(double value)" << std::endl;
    std::cout << value << std::endl;
    if (tempVariable)
        if (tempVariable->getType() == "float")
            tempVariable->setValue((float)value);
        else if (tempVariable->getType() == "double")
            tempVariable->setValue(value);
        else if (tempVariable->getType() == "int")
            tempVariable->setValue((int)value);
        else {
            std::cout << "Error: Invalid type assignment for " << tempVariable->getName() << std::endl;
            return false;
        }
        return true;
}

bool VariableManager::setTempVariableValue(bool value) {
    std::cout << "setTempVariableValue(bool value)" << std::endl;
    if (tempVariable)
        if (tempVariable->getType() == "bool")
            tempVariable->setValue(value);
        else {
            std::cout << "Error: Invalid type assignment for " << tempVariable->getName() << std::endl;
            return false;
        }
        return true;
}

bool VariableManager::setTempVariableValue(const std::string& value) {
    std::cout << "setTempVariableValue(const std::string& value)" << std::endl;
    if (tempVariable)
        if (tempVariable->getType() == "string")
            tempVariable->setValue(value);
        else if (tempVariable->getType() == "char")
            tempVariable->setValue(value[0]);
        else {
            std::cout << "Error: Invalid type assignment for " << tempVariable->getName() << std::endl;
            return false;
        }
        return true;
}

bool VariableManager::setTempVariableValue(char value) {
    std::cout << "setTempVariableValue(char value)" << std::endl;
    if (tempVariable)
        if (tempVariable->getType() == "char")
            tempVariable->setValue(value);
        else if (tempVariable->getType() == "string")
            tempVariable->setValue(std::string(1, value));
        else {
            std::cout << "Error: Invalid type assignment for " << tempVariable->getName() << std::endl;
            return false;
        }
        return true;
}

void VariableManager::printTempVariable() const {
    if (tempVariable)
        tempVariable->print();
    else
        std::cout << "No temp variable" << std::endl;
}