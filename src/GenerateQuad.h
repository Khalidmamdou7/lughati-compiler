// C++ program to implement Symbol Table
#include <iostream>
using namespace std;
//write a class and method to genrate quadrables
class SymbolTable
{
public:
    void GenerateQuad(string op, string arg1, string arg2, string result);
    string convertCommand(string command);
};
//write a class and method to genrate quadrables
void SymbolTable::GenerateQuad(string op, string arg1, string arg2, string result)
{
    cout << "op: " << op << " arg1: " << arg1 << " arg2: " << arg2 << " result: " << result << endl;
}
// Driver Code
int main()
{
    SymbolTable st;
    st.GenerateQuad("op", "arg1", "arg2", "result");
    return 0;
}
// Output
// op: op arg1: arg1 arg2: arg2 result: result
// Path: src/GenerateQuad.h
// Compare this snippet from src/GenerateQuad.cpp:
// #include "SymbolTable.h"
