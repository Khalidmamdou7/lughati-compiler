%option yylineno
%{
 #include <stdio.h>

    #include <stdlib.h>
%}

%%
[ \n\t\r]+                 ;/* Ignore Whitespaces */
"/*"([^*]|\*+[^*/])*\*+"/" ; /* Ignore Comments */

"const"     printf("CONST");
"int"       printf("INT");
"float"     printf("FLOAT");
"double"    printf("DOUBLE");
"char"      printf("CHAR");
"string"    printf("STRING");


"for"       printf("FOR");
"while"     printf("WHILE");
"do"        printf("DO");
"switch"    printf("SWICTH");
"case"      printf("CASE");
"break"     printf("BREAK");


"function"  printf("FUNCTION");
"return"    printf("RETURN");


"if"        printf("IF");
"else"      printf("ELSE");
"else if"   printf("ELSEIF");


"{"         printf("SCOPE_OPEN");
"}"         printf("SCOPE_CLOSE");
"("         printf("BRACKET_OPEN");
")"         printf("BRACKET_CLOSE");
"["         printf("SQUARE_BRACKET_OPEN");
"]"         printf("SQUARE_BRACKET_CLOSE");


"+"         printf("PLUS");
"-"         printf("MINUS");
"*"         printf("MULTIPLY");
"/"         printf("DIVISON");
"%"         printf("MODLUS");
"="         printf("EQUAL");


"=="        printf("EQUAL_EQUAL");
"!="        printf("NOTEQUAL");
">"         printf("GREATER_THAN");
">="        printf("GREATER_THAN_OR_EQUAL");
"<"         printf("LESS_THAN");
"<="        printf("LESS_THAN_OR_EQUAL");
"&&"        printf("AND");
"||"        printf("OR");
"!"         printf("NOT");


"true"      printf("TRUE");
"TRUE"      printf("TRUE");
"false"     printf("FALSE");
"FALSE"     printf("FALSE");


[a-zA-Z_][a-zA-Z_0-9]*          printf("IDENTIFIER");
0|[-]?[1-9][0-9]*               printf("INTEGER");
[-]?[0-9]+['.'][0-9]*           printf("DECIMAL");          
\'.?\'                          printf("CHAR");
\".?+\"                         printf("STRING");

.                               {printf(strdup(yytext)) + "Asakbna"}
%%