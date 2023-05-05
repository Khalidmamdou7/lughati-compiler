%option yylineno
%{
#include "y.tab.h"
%}

%%
[ \n\t\r]+                 ;/* Ignore Whitespaces */
"/*"([^*]|\*+[^*/])*\*+"/" ; /* Ignore Comments */

"const"      return CONST;
"int"        return INT;
"float"      return FLOAT;
"double"     return DOUBLE;
"char"       return CHAR;
"string"     return STRING;


"for"        return FOR;
"while"      return WHILE;
"do"         return DO;
"till"       return TILL;
"case"       return CASE;
"switch"     return SWITCH;
"break"      return BREAK;
"default"    return DEFAULT;
"enum"       return ENUM;


"function"   return FUNCTION;
"return"     return RETURN;


"if"         return IF;
"else"       return ELSE;
"else if"    return ELSEIF;

"print"      return PRINT;



"{"          return SCOPE_OPEN;
"}"          return SCOPE_CLOSE;
"("          return BRACKET_OPEN;
")"          return BRACKET_CLOSE;
"["          return SQUARE_BRACKET_OPEN;
"]"          return SQUARE_BRACKET_CLOSE;
";"          return SEMICOLON;
":"          return COLON;
","          return COMMA;


"+"          return PLUS;
"-"          return MINUS;
"*"          return MULTIPLY;
"/"          return DIVISON;
"%"          return MODLUS;
"="          return EQUAL;


"=="         return EQUAL_EQUAL;
"!="         return NOTEQUAL;
">"          return GREATER_THAN;
">="         return GREATER_THAN_OR_EQUAL;
"<"          return LESS_THAN;
"<="         return LESS_THAN_OR_EQUAL;
"&&"         return AND;
"||"         return OR;
"!"          return NOT;


"true"       return TRUE;
"TRUE"       return TRUE;
"false"      return FALSE;
"FALSE"      return FALSE;


[a-zA-Z_][a-zA-Z_0-9]*           return IDENTIFIER;
0|[-]?[1-9][0-9]*                return INTEGER_VALUE;
[-]?[0-9]+['.'][0-9]*            return DECIMAL_VALUE;          
\'.?\'                           return CHAR_VALUE;
\".?+\"                          return STRING_VALUE;

.                               {yyerror("Lexical Error");}
%%

 void yyerror (char const *s) {
            extern int yylineno;

   fprintf (stderr,"encounterd a %s at line number: %d \n", s, yylineno);
 }

 int yywrap(void){
    return 1;
}