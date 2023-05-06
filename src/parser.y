
%{
#include <stdio.h> 
#include <stdlib.h>
#include <string.h>
    extern FILE *yyin;
%}

%token CONST INT FLOAT DOUBLE CHAR STRING
%token FOR WHILE DO TILL SWITCH CASE BREAK DEFAULT FUNCTION RETURN IF ELSE ELSEIF PRINT ENUM
%token SCOPE_OPEN SCOPE_CLOSE BRACKET_OPEN BRACKET_CLOSE SQUARE_BRACKET_OPEN SQUARE_BRACKET_CLOSE SEMICOLON COLON COMMA
%token PLUS MINUS MULTIPLY DIVISON MODLUS EQUAL 
%token EQUAL_EQUAL NOTEQUAL GREATER_THAN GREATER_THAN_OR_EQUAL LESS_THAN LESS_THAN_OR_EQUAL AND OR NOT TRUE FALSE 
%token IDENTIFIER INTEGER_VALUE DECIMAL_VALUE CHAR_VALUE STRING_VALUE 

%start code

%%
code : statments                      

statments : statments statment     
          |
          statment
          |
          scope


statment  : variable_decleration SEMICOLON
          | variable_defintion SEMICOLON
          | constant_decleration_and_defention SEMICOLON
          | assignment SEMICOLON   
          | logical_expression SEMICOLON
          | if_clause
          | while_loop
          | for_loop
          | do_till_loop
          | switch_statment
          | case_statment
          | enum_statment SEMICOLON
          | function_decleration SEMICOLON
          | function_defintion
          | function_call SEMICOLON
          ;


variable_decleration : data_type IDENTIFIER                                         {printf("Variable Declartion \n");}
                  

variable_defintion   : variable_decleration EQUAL expression                        {printf("Variable Defintion (Assignment) \n");}


constant_decleration_and_defention : CONST variable_decleration EQUAL expression    {printf("Constant Defintion \n");}
    

if_clause       : if_statement elseif_statment else_statment           {printf("Full If statment \n");} 
                | if_statement else_statment                           {printf("If-Else \n");} 
                | if_statement                                         {printf("If statment \n");} 

if_statement    : IF logical_expression scope   {printf("if");}   
                | IF logical_expression statment     {printf("if");}  


elseif_statment : elseif_statment ELSEIF logical_expression scope
                | ELSEIF logical_expression scope
                | ELSEIF logical_expression statment

else_statment   : ELSE scope
                | ELSE statment


switch_statment : SWITCH BRACKET_OPEN IDENTIFIER BRACKET_CLOSE SCOPE_OPEN case_statment SCOPE_CLOSE     {printf("Switch \n");}  

case_statment: CASE data_value COLON scope                                    
             | CASE data_value COLON scope BREAK SEMICOLON                
             | case_statment CASE data_value COLON scope                    
             | case_statment CASE data_value COLON scope BREAK SEMICOLON        
             | case_statment DEFAULT COLON scope


while_loop : WHILE logical_expression scope  {printf("While Loop \n");} 
           | WHILE logical_expression statment {printf("While Loop \n");} 


for_loop : FOR BRACKET_OPEN variable_defintion  BRACKET_CLOSE scope      {printf("For Loop \n");}  
         | FOR BRACKET_OPEN variable_defintion BRACKET_CLOSE statment   {printf("For Loop \n");}  

do_till_loop : DO scope TILL logical_expression                         {printf("Do-till loop \n");} 



function_decleration: data_type IDENTIFIER BRACKET_OPEN parameters BRACKET_CLOSE                              {printf("Function Declartion \n");} 
                  
function_defintion : function_decleration SCOPE_OPEN statments RETURN expression SEMICOLON SCOPE_CLOSE        {printf("Function Defintion \n");} 

function_call: IDENTIFIER '('  ')'                                                                            {printf("Function Call \n");} 
  
parameters: parameters COMMA data_type IDENTIFIER  
          | data_type IDENTIFIER
          


enum_statment:  ENUM IDENTIFIER SCOPE_OPEN assignment SCOPE_CLOSE  {printf("Enumuration \n");}  


data_type : INT      
          | FLOAT   
          | DOUBLE  
          | CHAR    
          | STRING  
          


data_value : INTEGER_VALUE
           | DECIMAL_VALUE
           | CHAR_VALUE
           | STRING_VALUE          
           

scope :  SCOPE_OPEN statments SCOPE_CLOSE   {printf("Scope \n");}  
      |  SCOPE_OPEN scope SCOPE_CLOSE     
      ;

assignment :   IDENTIFIER EQUAL expression  {printf("Assignment Statment \n");}  
           |   IDENTIFIER EQUAL IDENTIFIER   {printf("Assignment Statment \n");}  
           |   assignment COMMA IDENTIFIER EQUAL expression   {printf("Assignment Statment \n");}  



logical_expression : BRACKET_OPEN expression OR expression   EQUAL_EQUAL    expression BRACKET_CLOSE  
                   | BRACKET_OPEN expression AND expression  EQUAL_EQUAL    expression BRACKET_CLOSE
                   | BRACKET_OPEN expression OR expression   NOTEQUAL       expression BRACKET_CLOSE
                   | BRACKET_OPEN expression AND expression  NOTEQUAL       expression BRACKET_CLOSE
                   | BRACKET_OPEN expression                 EQUAL_EQUAL    expression BRACKET_CLOSE
                   | BRACKET_OPEN expression                 NOTEQUAL       expression BRACKET_CLOSE


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



%%



int main(int argc, char *argv[])
{
    char input[1000];
    FILE *fp = NULL;
    if (argc != 2) {
        printf("Enter input(!q to quit): \n");
        while (1) {
            fgets(input, 1000, stdin);
            if (strcmp(input, "!q\n") == 0) {
                break;
            }
            yy_scan_string(input);
            yyparse();
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

        fclose(yyin);
    }
    return 0;
}

