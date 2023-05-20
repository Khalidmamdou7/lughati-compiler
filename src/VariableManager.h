#ifndef VARIABLEMANAGER_H
#define VARIABLEMANAGER_H

#include <string>
#include <variant>

class TempVariable {
private:
    std::string name;
    std::string type;
    std::variant<int, float, double, bool, std::string, char> value;

public:
    TempVariable(const std::string& name, const std::string& type);
    ~TempVariable();
    std::string getName() const;
    std::string getType() const;
    void setValue(int value);
    void setValue(float value);
    void setValue(double value);
    void setValue(bool value);
    void setValue(const std::string& value);
    void setValue(char value);
    int getIntValue() const;
    float getFloatValue() const;
    double getDoubleValue() const;
    bool getBoolValue() const;
    std::string getStringValue() const;
    char getCharValue() const;
    std::variant<int, float, double, bool, std::string, char> getValue() const;
    void print() const;
};

class VariableManager {
private:
    TempVariable* tempVariable;

public:
    VariableManager();
    ~VariableManager();
    void setTempVariable(const std::string& name, const std::string& type);
    bool setTempVariableValue(int value);
    bool setTempVariableValue(float value);
    bool setTempVariableValue(double value);
    bool setTempVariableValue(bool value);
    bool setTempVariableValue(const std::string& value);
    bool setTempVariableValue(char value);
    TempVariable* getTempVariable();
    void clearTempVariable();
    void printTempVariable() const;
};

#endif // VARIABLEMANAGER_H
