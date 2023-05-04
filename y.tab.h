/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    CONST = 258,
    INT = 259,
    FLOAT = 260,
    DOUBLE = 261,
    CHAR = 262,
    STRING = 263,
    FOR = 264,
    WHILE = 265,
    DO = 266,
    SWITCH = 267,
    CASE = 268,
    BREAK = 269,
    FUNCTION = 270,
    RETURN = 271,
    IF = 272,
    ELSE = 273,
    ELSEIF = 274,
    PRINT = 275,
    SCOPE_OPEN = 276,
    SCOPE_CLOSE = 277,
    BRACKET_OPEN = 278,
    BRACKET_CLOSE = 279,
    SQUARE_BRACKET_OPEN = 280,
    SQUARE_BRACKET_CLOSE = 281,
    SEMICOLON = 282,
    PLUS = 283,
    MINUS = 284,
    MULTIPLY = 285,
    DIVISON = 286,
    MODLUS = 287,
    EQUAL = 288,
    EQUAL_EQUAL = 289,
    NOTEQUAL = 290,
    GREATER_THAN = 291,
    GREATER_THAN_OR_EQUAL = 292,
    LESS_THAN = 293,
    LESS_THAN_OR_EQUAL = 294,
    AND = 295,
    OR = 296,
    NOT = 297,
    TRUE = 298,
    FALSE = 299,
    IDENTIFIER = 300,
    INTEGER_VALUE = 301,
    DECIMAL_VALUE = 302,
    CHAR_VALUE = 303,
    STRING_VALUE = 304
  };
#endif
/* Tokens.  */
#define CONST 258
#define INT 259
#define FLOAT 260
#define DOUBLE 261
#define CHAR 262
#define STRING 263
#define FOR 264
#define WHILE 265
#define DO 266
#define SWITCH 267
#define CASE 268
#define BREAK 269
#define FUNCTION 270
#define RETURN 271
#define IF 272
#define ELSE 273
#define ELSEIF 274
#define PRINT 275
#define SCOPE_OPEN 276
#define SCOPE_CLOSE 277
#define BRACKET_OPEN 278
#define BRACKET_CLOSE 279
#define SQUARE_BRACKET_OPEN 280
#define SQUARE_BRACKET_CLOSE 281
#define SEMICOLON 282
#define PLUS 283
#define MINUS 284
#define MULTIPLY 285
#define DIVISON 286
#define MODLUS 287
#define EQUAL 288
#define EQUAL_EQUAL 289
#define NOTEQUAL 290
#define GREATER_THAN 291
#define GREATER_THAN_OR_EQUAL 292
#define LESS_THAN 293
#define LESS_THAN_OR_EQUAL 294
#define AND 295
#define OR 296
#define NOT 297
#define TRUE 298
#define FALSE 299
#define IDENTIFIER 300
#define INTEGER_VALUE 301
#define DECIMAL_VALUE 302
#define CHAR_VALUE 303
#define STRING_VALUE 304

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
