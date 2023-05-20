
%{
    #include <stdio.h> 
    #include <stdlib.h>
    #include <string.h>
    #include <iostream>
    #include <string>
    #include <algorithm>
    extern FILE *yyin;
    extern int yylineno;
    void yyerror(char *s);
    extern int yylex(void);
    #include "../src/test.cpp"
    #include "../src/SymbolTable.h"
    #include "../src/VariableManager.h"
    #include "../src/Variable.h"
    #include <stdexcept>

    SymbolTable* symbolTable;
    VariableManager* variableManager;
%}

%token CONST VOID INT FLOAT DOUBLE CHAR STRING BOOL
%token FOR WHILE DO TILL SWITCH CASE BREAK DEFAULT FUNCTION RETURN IF ELSE ELSEIF PRINT ENUM
%token SCOPE_OPEN SCOPE_CLOSE BRACKET_OPEN BRACKET_CLOSE SQUARE_BRACKET_OPEN SQUARE_BRACKET_CLOSE SEMICOLON COLON COMMA DOUBLE_QUOTES
%token PLUS MINUS MULTIPLY DIVISON MODLUS EQUAL 
%token EQUAL_EQUAL NOTEQUAL GREATER_THAN GREATER_THAN_OR_EQUAL LESS_THAN LESS_THAN_OR_EQUAL AND OR NOT  

%union{
    struct variable{
        char* name;
        char* type;

        int intValue;
        double decimalValue;
        char* charValue;
        char* stringValue;
        int boolValue;

    }variable;

    int intValue;
    double decimalValue;
    char* charValue;
    char* stringValue;
    int boolValue;
};

%token <variable> IDENTIFIER 
%token <intValue> INTEGER_VALUE
%token <decimalValue> DECIMAL_VALUE
%token <charValue> CHAR_VALUE
%token <stringValue> STRING_VALUE
%token <boolValue> TRUE_ FALSE_

%type <variable> variable_defintion
%type <variable> variable_decleration
%type <decimalValue> expression
%type <decimalValue> term
%type <decimalValue> factor
%start code



%%





code : statments         

statments : statments statment     
          |
          statment
          |
          scope


statment  : variable_decleration SEMICOLON                  {
                                                                printf("Variable Declartion \n");
                                                                // variableManager->printTempVariable();
                                                                TempVariable* tempVariable = variableManager->getTempVariable();
                                                                if (symbolTable->exists(tempVariable->getName())) {
                                                                    yyerror("Variable already exists");
                                                                }
                                                                else {
                                                                    symbolTable->insert(tempVariable->getName(), tempVariable->getType());
                                                                }
                                                            }
          | variable_defintion SEMICOLON                    {
                                                                printf("Variable Defintion (Assignment) \n");
                                                                // variableManager->printTempVariable();
                                                                TempVariable* tempVariable = variableManager->getTempVariable();
                                                                if (symbolTable->exists(tempVariable->getName())) {
                                                                    yyerror("Variable already exists");
                                                                }
                                                                else {
                                                                    symbolTable->insert(tempVariable->getName(), tempVariable->getType());
                                                                    symbolTable->setVariableValue(tempVariable->getName(), tempVariable->getValue());
                                                                }

                                                            }
          | constant_decleration_and_defention SEMICOLON    {
                                                                printf("Constant Defintion \n");
                                                                variableManager->printTempVariable();
                                                                TempVariable* tempVariable = variableManager->getTempVariable();
                                                                if (symbolTable->exists(tempVariable->getName())) {
                                                                    yyerror("Variable already exists");
                                                                }
                                                                else {
                                                                    symbolTable->insert(tempVariable->getName(), tempVariable->getType(), true);
                                                                    symbolTable->setVariableValue(tempVariable->getName(), tempVariable->getValue());
                                                                }
                                                            }
          | assignment SEMICOLON   
          | comparison_expression SEMICOLON
          | if_clause
          | while_loop
          | for_loop
          | do_till_loop
          | switch_statment
          | case_statment
          | enum_statment SEMICOLON       {printf("Enumuration \n");}  
          | function_decleration SEMICOLON  {printf("Function Declartion \n");} 
          | function_defintion
          | function_call SEMICOLON        {printf("Function Call \n");} 
          | print_statment SEMICOLON     {printf("Print Statment \n");}  
          


variable_decleration : INT IDENTIFIER       {
                                                //Send the identifier name and type to to the symbol table and wait for the resopone
                                                printf("%s",$2.name);
                                                // set variable type and name
                                                yylval.variable.name = $2.name;
                                                yylval.variable.type = "int";
                                                variableManager->setTempVariable(yylval.variable.name, yylval.variable.type);
                                                

                                            }
                     | FLOAT IDENTIFIER     {
                                                //Send the identifier name and type to to the symbol table and wait for the resopone
                                                printf("%s",$2.name);
                                                yylval.variable.name = $2.name;
                                                yylval.variable.type = "float";
                                                variableManager->setTempVariable(yylval.variable.name, yylval.variable.type);
                                            }     
                     | DOUBLE IDENTIFIER
                                            {
                                                //Send the identifier name and type to to the symbol table and wait for the resopone
                                                printf("%s",$2.name);
                                                yylval.variable.name = $2.name;
                                                yylval.variable.type = "double";
                                                variableManager->setTempVariable(yylval.variable.name, yylval.variable.type);
                                            }
                     | CHAR IDENTIFIER      {
                                                //Send the identifier name and type to to the symbol table and wait for the resopone
                                                printf("%c",$2.name);
                                                yylval.variable.name = $2.name;
                                                yylval.variable.type = "char";
                                                variableManager->setTempVariable(yylval.variable.name, yylval.variable.type);

                                            }
                     | STRING IDENTIFIER    {
                                                //Send the identifier name and type to to the symbol table and wait for the resopone
                                                printf("%s",$2.name); 
                                                yylval.variable.name = $2.name;
                                                yylval.variable.type = "string";
                                                variableManager->setTempVariable(yylval.variable.name, yylval.variable.type);
                                            }
                     | BOOL IDENTIFIER      {
                                                //Send the identifier name and type to to the symbol table and wait for the resopone
                                                printf("%s",$2.name);
                                                yylval.variable.name = $2.name;
                                                yylval.variable.type = "bool";
                                                variableManager->setTempVariable(yylval.variable.name, yylval.variable.type);
                                            }
                                                            
                  

variable_defintion   : INT IDENTIFIER EQUAL INTEGER_VALUE       {
                                                                
                                                                   //Send the identifier name and type to to the symbol table and wait for the resopone
                                                                    printf("%s value",$2.name);
                                                                    // set variable type and name
                                                                    variableManager->setTempVariable($2.name, "int");
                                                                    // set variable value
                                                                    if (!variableManager->setTempVariableValue($4)) {
                                                                        yyerror("Variable value is not compatible with the variable type");
                                                                    }
                                                    
                                                                }
                     | FLOAT IDENTIFIER EQUAL DECIMAL_VALUE     {
                                                                
                                                                   //Send the identifier name, type and value to to the symbol table and wait for the resopone
                                                                    printf("%s value",$2.name);
                                                                    variableManager->setTempVariable($2.name, "float");
                                                                    if (!variableManager->setTempVariableValue($4)) {
                                                                        yyerror("Variable value is not compatible with the variable type");
                                                                    }
                                                                }
                     | CHAR IDENTIFIER EQUAL CHAR_VALUE         {
                                                                
                                                                   //Send the identifier name, type and value to to the symbol table and wait for the resopone
                                                                    printf("%s value",$4);
                                                                    std::string str = $4;
                                                                    // remove quotes from string
                                                                    str.erase(std::remove(str.begin(), str.end(), '\''), str.end());
                                                                    variableManager->setTempVariable($2.name, "char");
                                                                    if (!variableManager->setTempVariableValue(str[0])) {
                                                                        yyerror("Variable value is not compatible with the variable type");
                                                                    }
                                                                }     
                     | STRING IDENTIFIER EQUAL STRING_VALUE     {
                                                                
                                                                   //Send the identifier name, type and value to to the symbol table and wait for the resopone
                                                                    printf("%s value",$4);
                                                                    variableManager->setTempVariable($2.name, "string");
                                                                    std::string str = $4;
                                                                    // remove quotes from string
                                                                    str.erase(std::remove(str.begin(), str.end(), '"'), str.end());
                                                                    if (!variableManager->setTempVariableValue(str)) {
                                                                        yyerror("Variable value is not compatible with the variable type");
                                                                    }
                                                                }
                     | INT IDENTIFIER EQUAL IDENTIFIER          {
                                                                
                                                                   //Send the identifier name, type and value to to the symbol table and wait for the resopone
                                                                    printf("%d value",$4);
                                                                    variableManager->setTempVariable($2.name, "int");
                                                                    // TODO: get value of other identifier
                                                                    if (symbolTable->exists($4.name)) {
                                                                        Variable var = symbolTable->getVariable($4.name);
                                                                        // var.value is of type std::variant<int, float, double, char, string, bool>
                                                                        // setTempVariableValue() expects an int, float, double, char, string, bool
                                                                        // convert variant to int, float, double, char, string, bool
                                                                        std::visit([](const auto& value) { 
                                                                            variableManager->setTempVariableValue(value);
                                                                            printf("value: %d", value);
                                                                         }, var.value);
                                                                        symbolTable->setUsed($4.name);
                                                                    }
                                                                    else {
                                                                        yyerror("Variable does not exist");
                                                                    }
                                                                } 
                     | FLOAT IDENTIFIER EQUAL IDENTIFIER        {
                                                                
                                                                   //Send the identifier name, type and value to to the symbol table and wait for the resopone
                                                                    printf("%d value",$4);
                                                                    variableManager->setTempVariable($2.name, "float");
                                                                    // TODO: get value of other identifier
                                                                    if (symbolTable->exists($4.name)) {
                                                                        Variable var = symbolTable->getVariable($4.name);
                                                                        // var.value is of type std::variant<int, float, double, char, string, bool>
                                                                        // setTempVariableValue() expects an int, float, double, char, string, bool
                                                                        // convert variant to int, float, double, char, string, bool
                                                                        std::visit([](const auto& value) { 
                                                                            variableManager->setTempVariableValue(value);
                                                                            printf("value: %d", value);
                                                                         }, var.value);
                                                                        symbolTable->setUsed($4.name);
                                                                    }
                                                                    else {
                                                                        yyerror("Variable does not exist");
                                                                    }

                                                                }
                     | CHAR IDENTIFIER EQUAL IDENTIFIER         {
                                                                
                                                                   //Send the identifier name, type and value to to the symbol table and wait for the resopone
                                                                    printf("%d value",$4);
                                                                    variableManager->setTempVariable($2.name, "char");
                                                                    // TODO: get value of other identifier
                                                                    if (symbolTable->exists($4.name)) {
                                                                        Variable var = symbolTable->getVariable($4.name);
                                                                        // var.value is of type std::variant<int, float, double, char, string, bool>
                                                                        // setTempVariableValue() expects an int, float, double, char, string, bool
                                                                        // convert variant to int, float, double, char, string, bool
                                                                        std::visit([](const auto& value) { 
                                                                            variableManager->setTempVariableValue(value);
                                                                            printf("value: %d", value);
                                                                         }, var.value);
                                                                        symbolTable->setUsed($4.name);
                                                                    }
                                                                    else {
                                                                        yyerror("Variable does not exist");
                                                                    }

                                                                }      
                     | STRING IDENTIFIER EQUAL IDENTIFIER       {
                                                                
                                                                   //Send the identifier name, type and value to to the symbol table and wait for the resopone
                                                                    printf("%d value",$4);
                                                                    variableManager->setTempVariable($2.name, "string");
                                                                    // TODO: get value of other identifier
                                                                    if (symbolTable->exists($4.name)) {
                                                                        Variable var = symbolTable->getVariable($4.name);
                                                                        // var.value is of type std::variant<int, float, double, char, string, bool>
                                                                        // setTempVariableValue() expects an int, float, double, char, string, bool
                                                                        // convert variant to int, float, double, char, string, bool
                                                                        std::visit([](const auto& value) { 
                                                                            variableManager->setTempVariableValue(value);
                                                                            printf("value: %d", value);
                                                                         }, var.value);
                                                                        symbolTable->setUsed($4.name);
                                                                    }
                                                                    else {
                                                                        yyerror("Variable does not exist");
                                                                    }

                                                                }             
             


constant_decleration_and_defention : CONST variable_decleration EQUAL expression {
                                                                                    printf("%s value",$2.name);
                                                                                    // variableManager->setTempVariable($2.name, $2.type);
                                                                                    // TODO: get value of the expression
                                                                                    // variableManager->setTempVariableValue($4);
                                                                                    //send to symbol table
                                                                                 }       
    

if_clause       : if_statement elseif_statment else_statment           {printf("Full If statment \n");} 
                | if_statement else_statment                           {printf("If-Else \n");} 
                | if_statement                                         {printf("If statment \n");} 

if_statement    : IF BRACKET_OPEN comparison_expression BRACKET_CLOSE scope   
                | IF BRACKET_OPEN comparison_expression BRACKET_CLOSE statment     

elseif_statment : ELSEIF BRACKET_OPEN comparison_expression BRACKET_CLOSE scope
                | ELSEIF BRACKET_OPEN comparison_expression BRACKET_CLOSE statment

else_statment   : ELSE scope
                | ELSE statment


switch_statment : SWITCH BRACKET_OPEN IDENTIFIER BRACKET_CLOSE SCOPE_OPEN case_statment SCOPE_CLOSE     {printf("Switch Statment\n");}  

case_statment: CASE data_value COLON statment                                    
             | CASE data_value COLON statment BREAK SEMICOLON                
             | case_statment CASE data_value COLON statment                    
             | case_statment CASE data_value COLON statment BREAK SEMICOLON        
             | case_statment DEFAULT COLON statment


while_loop : WHILE BRACKET_OPEN comparison_expression BRACKET_CLOSE scope    {printf("While Loop \n");} 
           | WHILE BRACKET_OPEN comparison_expression BRACKET_CLOSE statment {printf("While Loop \n");} 


for_loop : FOR BRACKET_OPEN variable_defintion SEMICOLON comparison_expression SEMICOLON assignment BRACKET_CLOSE scope      {printf("For Loop \n");}  
         | FOR BRACKET_OPEN variable_defintion SEMICOLON comparison_expression SEMICOLON assignment BRACKET_CLOSE  statment   {printf("For Loop \n");}  

do_till_loop : DO scope TILL BRACKET_OPEN comparison_expression BRACKET_CLOSE       {printf("Do-till loop \n");} 
             | DO statment TILL BRACKET_OPEN comparison_expression BRACKET_CLOSE    {printf("Do-till loop \n");} 


function_decleration : INT IDENTIFIER BRACKET_OPEN parameters BRACKET_CLOSE                    
                     | FLOAT IDENTIFIER BRACKET_OPEN parameters BRACKET_CLOSE                
                     | DOUBLE IDENTIFIER BRACKET_OPEN parameters BRACKET_CLOSE                  
                     | CHAR IDENTIFIER BRACKET_OPEN parameters BRACKET_CLOSE                   
                     | STRING IDENTIFIER BRACKET_OPEN parameters BRACKET_CLOSE                  

function_defintion : function_decleration SCOPE_OPEN statments RETURN expression SEMICOLON SCOPE_CLOSE        {printf("Function Defintion \n");} 

function_call: IDENTIFIER BRACKET_OPEN arguments BRACKET_CLOSE                                                                      
  
parameters: parameters COMMA INT IDENTIFIER  
          | data_type IDENTIFIER
          |;


arguments: arguments COMMA  IDENTIFIER  
          | IDENTIFIER      
          |; 


enum_statment:  ENUM IDENTIFIER SCOPE_OPEN assignment SCOPE_CLOSE  

print_statment: PRINT BRACKET_OPEN STRING_VALUE BRACKET_CLOSE  
           

scope :  SCOPE_OPEN statments SCOPE_CLOSE   {printf("Scope \n");}  
      |  SCOPE_OPEN scope SCOPE_CLOSE     
      |  SCOPE_OPEN SCOPE_CLOSE
      ;

assignment :   IDENTIFIER EQUAL expression  {
                                                printf("Assignment Statment \n");
                                                if (symbolTable->exists($1.name))
                                                {
                                                    printf("Variable %s exists\n", $1.name);
                                                    Variable var = symbolTable->getVariable($1.name);
                                                    variableManager->setTempVariable($1.name, var.type);
                                                    if (!variableManager->setTempVariableValue($3)) {
                                                        yyerror("Variable value is not compatible with the variable type");
                                                    }
                                                }
                                            }  
           |   IDENTIFIER EQUAL IDENTIFIER   {
                                                printf("Assignment Statment \n");}  
           |   assignment COMMA IDENTIFIER EQUAL expression   {printf("Assignment Statment \n");}  



comparison_expression : IDENTIFIER comparsion_operator expression                      {printf("Comparison Statment \n");}  
                      | comparison_expression locigal_operator comparison_expression   {printf("Ext Comparison Statment \n");}  



expression : expression PLUS term     
           | expression MINUS term
           | term                   

term       : term MULTIPLY factor
           | term DIVISON factor
           | factor 

factor     : expression
           | INTEGER_VALUE            
           | DECIMAL_VALUE
           | IDENTIFIER             

data_type : INT        
          | FLOAT   
          | DOUBLE  
          | CHAR    
          | STRING  
          


data_value : INTEGER_VALUE
           | DECIMAL_VALUE
           | CHAR_VALUE   { }      
           | STRING_VALUE       

locigal_operator : OR
                 | AND  
                 | NOT   

comparsion_operator : EQUAL_EQUAL
                    | NOTEQUAL
                    | GREATER_THAN
                    | GREATER_THAN_OR_EQUAL                 
                    | LESS_THAN
                    | LESS_THAN_OR_EQUAL
%%


// Defines the yyerror function.
void yyerror(char *s)
{
    printf("Syntax Error on line %d: %s\n", yylineno, s);
}

int yywrap()
{
    return 1;
}

int main(int argc, char *argv[])
{

    // Initialize the symbol table.
    symbolTable = new SymbolTable();
    variableManager = new VariableManager();

    char input[1000];
    FILE *fp = NULL;

    if (argc != 2) {
        printf("Enter input(!q to quit): \n");
        while (1) {
            fgets(input, 1000, stdin);
            if (strcmp(input, "!q\n") == 0) {
                break;
            }
            yyin = fmemopen(input, strlen(input), "r");
            yyparse();
            symbolTable->print();
            symbolTable->exportToFile();
        }
    } else {
        char *filename = argv[1];
        fp = fopen(filename, "r");
        yyin = fp;

        if (fp == NULL)
        {
            printf("Error: could not open file %s", filename);
            return 1;
        }

        yyparse();
        symbolTable->exportToFile();


        fclose(yyin);
    }
    return 0;
}

