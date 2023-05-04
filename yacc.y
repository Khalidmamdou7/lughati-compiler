
%{

%}

%token CONST INT FLOAT DOUBLE CHAR STRING
%token FOR WHILE DO SWITCH CASE BREAK FUNCTION RETURN IF ELSE ELSEIF PRINT 
%token SCOPE_OPEN SCOPE_CLOSE BRACKET_OPEN BRACKET_CLOSE SQUARE_BRACKET_OPEN SQUARE_BRACKET_CLOSE SEMICOLON 
%token PLUS MINUS MULTIPLY DIVISON MODLUS EQUAL 
%token EQUAL_EQUAL NOTEQUAL GREATER_THAN GREATER_THAN_OR_EQUAL LESS_THAN LESS_THAN_OR_EQUAL AND OR NOT TRUE FALSE 
%token IDENTIFIER INTEGER_VALUE DECIMAL_VALUE CHAR_VALUE STRING_VALUE 

%start code

%%
code : statments                      

statments : statments statment     
          |
          statment

statment  : variable_decleration SEMICOLON
          | variable_defintion SEMICOLON
          | constant_decleration_and_defention SEMICOLON
          | if_statement


        
variable_decleration : INT IDENTIFIER                                               {printf("this is int decleration ");}
                     | FLOAT IDENTIFIER                                             {printf("this is float decleration ");}
                     | DOUBLE IDENTIFIER                                            {printf("this is double decleration ");}
                     | CHAR IDENTIFIER                                              {printf("this is char decleration ");}
                     | STRING IDENTIFIER                                            {printf("this is string decleration ");}


variable_defintion   : variable_decleration EQUAL expression                        {printf("variable defintion ");}
                     | IDENTIFIER EQUAL expression 


constant_decleration_and_defention : CONST variable_decleration EQUAL expression    {printf("constant defintion ");}
    

if_clause       : if_statement elseif_statment else_statment  
                | if_statement else_statment  
                | if_statement      

if_statement    : IF BRACKET_OPEN logical_expression BRACKET_CLOSE SCOPE_OPEN statments SCOPE_CLOSE   {printf("if");}  
                | IF BRACKET_CLOSE logical_expression BRACKET_CLOSE statment   

else_statment   : ELSE BRACKET_OPEN logical_expression BRACKET_CLOSE SCOPE_OPEN statments SCOPE_CLOSE
                | ELSE BRACKET_CLOSE logical_expression BRACKET_CLOSE statment

elseif_statment : elseif_statment ELSEIF BRACKET_OPEN logical_expression BRACKET_CLOSE SCOPE_OPEN statments SCOPE_CLOSE
                | ELSEIF BRACKET_OPEN logical_expression BRACKET_CLOSE SCOPE_OPEN statments SCOPE_CLOSE
                | ELSEIF BRACKET_CLOSE logical_expression BRACKET_CLOSE statment
             


logical_expression : expression OR expression   EQUAL_EQUAL expression 
                   | expression AND expression  EQUAL_EQUAL expression 
                   | expression OR expression   NOTEQUAL expression 
                   | expression AND expression  NOTEQUAL expression 
                   | expression                 EQUAL_EQUAL expression 
                   | expression                 NOTEQUAL expression 



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