
%{

%}

%token CONST INT FLOAT DOUBLE CHAR STRING
%token FOR WHILE DO SWITCH CASE BREAK FUNCTION RETURN IF ELSE ELSEIF PRINT 
%token SCOPE_OPEN SCOPE_CLOSE BRACKET_OPEN BRACKET_CLOSE SQUARE_BRACKET_OPEN SQUARE_BRACKET_CLOSE
%token PLUS MINUS MULTIPLY DIVISON MODLUS EQUAL 
%token EQUAL_EQUAL NOTEQUAL GREATER_THAN GREATER_THAN_OR_EQUAL LESS_THAN LESS_THAN_OR_EQUAL AND OR NOT TRUE FALSE 
%token IDENTIFIER INTEGER_VALUE DECIMAL_VALUE CHAR_VALUE STRING_VALUE 

%start var_declaration

%%
var_declaration : INT IDENTIFIER                           {
                                                      
                                                      printf("sdssdsd");
                                                        
                                                    }
%%  

int main (void) {
    
    yyparse();
}