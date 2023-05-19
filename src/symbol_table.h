// C++ program to implement Symbol Table
#include <iostream>
using namespace std;

const int MAX = 100;

class Node {
	string identifier, scope, type;
	int lineNo;
	bool is_init;
	bool is_func;
	bool is_const;
	Node* next;

public:
	Node()
	{
		next = NULL;
	}

	Node(string key, string scope, string type, int lineNo, bool initFlag, bool funcFlag, bool constFlag)
	{
		this->identifier = key;
		this->scope = scope;
		this->type = type;
		this->lineNo = lineNo;
		this->is_init = initFlag;
		this->is_func = funcFlag;
		this->is_const = constFlag;
		next = NULL;
	}

	void print()
	{
		cout << "Identifier's Name: " << identifier
			<< "\nType: " << type
			<< "\nScope: " << scope
			<< "\nLine Number: " << lineNo << endl;
		cout << "is_init: " << (is_init ? "true" : "false") << endl;
		cout << "is_func: " << (is_func ? "true" : "false") << endl;
		cout << "is_const: " << (is_const ? "true" : "false") << endl;
	}

	friend class SymbolTable;
};

class SymbolTable {
	Node* head[MAX];

public:
	SymbolTable()
	{
		for (int i = 0; i < MAX; i++)
			head[i] = NULL;
	}

	int hashf(string id); // hash function
	bool insert(string id, string scope, string Type, int lineno, bool initFlag, bool funcFlag, bool constFlag);
	string find(string id);
	bool deleteRecord(string id);
	bool modify(string id, string scope, string Type);
	bool hasMultipleDeclarations(string id, string scope);
	bool hasTypeMismatch(string id, string scope, string type);
	void checkInitializationAndUsage();
};
