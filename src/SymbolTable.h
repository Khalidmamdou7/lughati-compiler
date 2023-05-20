#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H

#include <iostream>
#include <unordered_map>
#include <stack>
#include <string>
#include <utility>
#include <variant>
#include "Variable.h"

class SymbolTable {
private:
    std::unordered_map<std::string, std::stack<Variable>> symbolTable;

public:
    void insert(const std::string& name, const std::string& type, bool isConstant = false, bool isFunction = false);
    void enterScope();
    void exitScope();
    bool exists(const std::string& name);
    std::string getType(const std::string& name);
    bool isInitialized(const std::string& name);
    void setInitialized(const std::string& name);
    bool isUsed(const std::string& name);
    void setUsed(const std::string& name);
    void checkUnusedVariables();
	Variable getVariable(const std::string& name);
	void setVariableValue(const std::string& name, const std::variant<int, float, double, bool, std::string, char>& value);
	void setValue(const std::string& name, int value);
	void setValue(const std::string& name, float value);
	void setValue(const std::string& name, double value);
	void setValue(const std::string& name, bool value);
	void setValue(const std::string& name, const std::string& value);
	void setValue(const std::string& name, char value);
	int getIntValue(const std::string& name);
	float getFloatValue(const std::string& name);
	double getDoubleValue(const std::string& name);
	bool getBoolValue(const std::string& name);
	std::string getStringValue(const std::string& name);
	char getCharValue(const std::string& name);

	void print() const;
	void exportToFile();
};

#endif // SYMBOLTABLE_H
