
%{
#include <stdio.h> 
#include <stdlib.h>
#include <string.h>
extern FILE *yyin;
%}

%token CONST VOID INT FLOAT DOUBLE CHAR STRING BOOL
%token FOR WHILE DO TILL SWITCH CASE BREAK DEFAULT FUNCTION RETURN IF ELSE ELSEIF PRINT ENUM
%token SCOPE_OPEN SCOPE_CLOSE BRACKET_OPEN BRACKET_CLOSE SQUARE_BRACKET_OPEN SQUARE_BRACKET_CLOSE SEMICOLON COLON COMMA DOUBLE_QUOTES
%token PLUS MINUS MULTIPLY DIVISON MODLUS EQUAL 
%token EQUAL_EQUAL NOTEQUAL GREATER_THAN GREATER_THAN_OR_EQUAL LESS_THAN LESS_THAN_OR_EQUAL AND OR NOT  

%token<variable> IDENTIFIER 
%token <intValue> INTEGER_VALUE
%token <decimalValue> DECIMAL_VALUE
%token <charValue> CHAR_VALUE
%token <stringValue> STRING_VALUE
%token <boolValue> TRUE_ FALSE_

%type <variable> variable_defintion
%type <variable> variable_decleration
%start code

%union{
    struct variable{
        char* name;
        char* type;
        int value;

    }variable;

    int intValue;
    double decimalValue;
    char charValue;
    char* stringValue;
    int boolValue;
};


%%





code : statments         

statments : statments statment     
          |
          statment
          |
          scope


statment  : variable_decleration SEMICOLON                  {printf("Variable Declartion \n");}
          | variable_defintion SEMICOLON                    {printf("Variable Defintion (Assignment) \n");}
          | constant_decleration_and_defention SEMICOLON    {printf("Constant Defintion \n");}
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
                                            }
                     | FLOAT IDENTIFIER     {
                                            //Send the identifier name and type to to the symbol table and wait for the resopone
                                             printf("%s",$2.name);
                                            }     
                     | DOUBLE IDENTIFIER
                                            {
                                            //Send the identifier name and type to to the symbol table and wait for the resopone
                                             printf("%s",$2.name);
                                            }
                     | CHAR IDENTIFIER      {

                                            //Send the identifier name and type to to the symbol table and wait for the resopone
                                             printf("%c",$2.name);
                                            }
                     | STRING IDENTIFIER    {
                                            //Send the identifier name and type to to the symbol table and wait for the resopone
                                             printf("%s",$2.name);; 
                                            }
                     | BOOL IDENTIFIER      {
                                            //Send the identifier name and type to to the symbol table and wait for the resopone
                                             printf("%s",$2.name);
                                            }
                                                            
                  

variable_defintion   : INT IDENTIFIER EQUAL INTEGER_VALUE       {
                                                                
                                                                   //Send the identifier name and type to to the symbol table and wait for the resopone
                                                                    printf("%s value",$2.name);
                                                                    if (1) //y3ny if tmam fl symbol table
                                                                    {
                                                                        $$ = $2;
                                                                    }
                                                                }
                     | FLOAT IDENTIFIER EQUAL DECIMAL_VALUE     {
                                                                
                                                                   //Send the identifier name, type and value to to the symbol table and wait for the resopone
                                                                    printf("%s value",$4);
                                                                }
                     | CHAR IDENTIFIER EQUAL CHAR_VALUE         {
                                                                
                                                                   //Send the identifier name, type and value to to the symbol table and wait for the resopone
                                                                    printf("%d value",$4);
                                                                }     
                     | STRING IDENTIFIER EQUAL STRING_VALUE     {
                                                                
                                                                   //Send the identifier name, type and value to to the symbol table and wait for the resopone
                                                                    printf("%d value",$4);
                                                                }
                     | INT IDENTIFIER EQUAL IDENTIFIER          {
                                                                
                                                                   //Send the identifier name, type and value to to the symbol table and wait for the resopone
                                                                    printf("%d value",$4);
                                                                } 
                     | FLOAT IDENTIFIER EQUAL IDENTIFIER        {
                                                                
                                                                   //Send the identifier name, type and value to to the symbol table and wait for the resopone
                                                                    printf("%d value",$4);
                                                                }
                     | CHAR IDENTIFIER EQUAL IDENTIFIER         {
                                                                
                                                                   //Send the identifier name, type and value to to the symbol table and wait for the resopone
                                                                    printf("%d value",$4);
                                                                }      
                     | STRING IDENTIFIER EQUAL IDENTIFIER       {
                                                                
                                                                   //Send the identifier name, type and value to to the symbol table and wait for the resopone
                                                                    printf("%d value",$4);
                                                                }             
             


constant_decleration_and_defention : CONST variable_decleration EQUAL expression {
                                                                                   printf($2);
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

assignment :   IDENTIFIER EQUAL expression  {printf("Assignment Statment \n");}  
           |   IDENTIFIER EQUAL IDENTIFIER   {printf("Assignment Statment \n");}  
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
           | CHAR_VALUE
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

