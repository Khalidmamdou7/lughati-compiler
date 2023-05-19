#include "symbol_table.h"



bool SymbolTable::hasMultipleDeclarations(string id, string scope)
{
    int index = hashf(id);
    Node* start = head[index];
    int count = 0;

    while (start != NULL) {
        if (start->identifier == id && start->scope == scope) {
            count++;
            if (count > 1) {
                // Multiple declarations of the same variable within the same scope
                return true;
            }
        }
        start = start->next;
    }

    return false;
}

///////////////////////////////////////////////////////////////////////////

bool SymbolTable::hasTypeMismatch(string id, string scope, string type)
{
    int index = hashf(id);
    Node* start = head[index];

    while (start != NULL) {
        if (start->identifier == id && start->scope == scope) {
            if (start->type != type) {
                // Type mismatch: variable is being used improperly regarding its type
                return true;
            }
        }
        start = start->next;
    }

    return false;
}

////////////////////////////////////////////////////////////////////////////
void SymbolTable::checkInitializationAndUsage()
{
    for (int i = 0; i < MAX; i++) {
        Node* start = head[i];

        while (start != NULL) {
            if (start->type != "function") {
                // Check if variable is used before being initialized
                if (start->lineNo == -1) {
                    cout << "Variable '" << start->identifier << "' in scope '" << start->scope << "' is used before being initialized." << endl;
                }

                // Check if variable is unused
                bool isUsed = false;
                Node* current = head[i];
                while (current != NULL) {
                    if (current->type != "function" && current->identifier == start->identifier && current->scope == start->scope) {
                        isUsed = true;
                        break;
                    }
                    current = current->next;
                }

                if (!isUsed) {
                    cout << "Variable '" << start->identifier << "' in scope '" << start->scope << "' is declared but not used." << endl;
                }
            }

            start = start->next;
        }
    }
}


