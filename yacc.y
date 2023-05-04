
%{
#include <stdio.h> 
#include <stdlib.h>
#include <string.h>
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



variable_decleration : data_type IDENTIFIER                                               {printf("this is int decleration ");}
                  

variable_defintion   : variable_decleration EQUAL expression                        {printf("variable defintion ");}


constant_decleration_and_defention : CONST variable_decleration EQUAL expression    {printf("constant defintion ");}
    

if_clause       : if_statement elseif_statment else_statment  
                | if_statement else_statment  {printf("ifa");}  
                | if_statement      

if_statement    : IF logical_expression scope   {printf("if");}  
                | IF logical_expression statment     {printf("if");}  


elseif_statment : elseif_statment ELSEIF logical_expression scope
                | ELSEIF logical_expression scope
                | ELSEIF logical_expression statment

else_statment   : ELSE scope
                | ELSE statment


switch_statment : SWITCH BRACKET_OPEN IDENTIFIER BRACKET_CLOSE SCOPE_OPEN case_statment SCOPE_CLOSE

case_statment: CASE data_value COLON scope                                    {printf("switch");}  
             | CASE data_value COLON scope BREAK SEMICOLON                    {printf("brekk");}  
             | case_statment CASE data_value COLON scope                      {printf("many switchs");}  
             | case_statment CASE data_value COLON scope BREAK SEMICOLON      {printf("many swichts break");}  
             | case_statment DEFAULT COLON scope


while_loop : WHILE logical_expression scope 
           | WHILE logical_expression statment


for_loop : FOR BRACKET_OPEN variable_defintion BRACKET_CLOSE scope
         | FOR BRACKET_OPEN variable_defintion BRACKET_CLOSE statment

do_till_loop : DO scope TILL logical_expression         


function_decleration: data_type IDENTIFIER BRACKET_OPEN parameters BRACKET_CLOSE 
                  
function_defintion : function_decleration scope                    

function_call: IDENTIFIER '('  ')'

parameters: parameters COMMA data_type IDENTIFIER
          | data_type IDENTIFIER


enum_statment:  ENUM IDENTIFIER SCOPE_OPEN assignment SCOPE_CLOSE 


data_type : INT
          | FLOAT
          | DOUBLE
          | CHAR
          | STRING
          ;


data_value : INTEGER_VALUE
           | DECIMAL_VALUE
           | CHAR_VALUE
           | STRING_VALUE          
           ;

scope :  SCOPE_OPEN statments SCOPE_CLOSE   {printf("scope");}  
      |  SCOPE_OPEN scope SCOPE_CLOSE       {printf("nested scope");}  
      ;

assignment :   IDENTIFIER EQUAL expression 
           |   IDENTIFIER EQUAL IDENTIFIER
           |   assignment COMMA IDENTIFIER EQUAL expression 



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
int main (void) {
    yyparse();
}