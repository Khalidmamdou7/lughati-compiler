#include "GenerateQuad.h"
#include <iostream>
#include <fstream>
// wirte implementation of SymbolTable
using namespace std;
//write a class and method to genrate quadrables
void SymbolTable::GenerateQuad(string op, string arg1, string arg2, string result)
{
    cout << "op: " << op << " arg1: " << arg1 << " arg2: " << arg2 << " result: " << result << endl;
}

//wrute function to convert the normal command to the command that can be executed by the system
string SymbolTable::convertCommand(string command)
{
    string newCommand = "";
    for (int i = 0; i < command.length(); i++)
    {
        if (command[i] == ' ')
        {
            newCommand += "\\ ";
        }
        else
        {
            newCommand += command[i];
        }
    }
    return newCommand;
}
