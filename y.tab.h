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
    DEFAULT = 270,
    FUNCTION = 271,
    RETURN = 272,
    IF = 273,
    ELSE = 274,
    ELSEIF = 275,
    PRINT = 276,
    SCOPE_OPEN = 277,
    SCOPE_CLOSE = 278,
    BRACKET_OPEN = 279,
    BRACKET_CLOSE = 280,
    SQUARE_BRACKET_OPEN = 281,
    SQUARE_BRACKET_CLOSE = 282,
    SEMICOLON = 283,
    COLON = 284,
    PLUS = 285,
    MINUS = 286,
    MULTIPLY = 287,
    DIVISON = 288,
    MODLUS = 289,
    EQUAL = 290,
    EQUAL_EQUAL = 291,
    NOTEQUAL = 292,
    GREATER_THAN = 293,
    GREATER_THAN_OR_EQUAL = 294,
    LESS_THAN = 295,
    LESS_THAN_OR_EQUAL = 296,
    AND = 297,
    OR = 298,
    NOT = 299,
    TRUE = 300,
    FALSE = 301,
    IDENTIFIER = 302,
    INTEGER_VALUE = 303,
    DECIMAL_VALUE = 304,
    CHAR_VALUE = 305,
    STRING_VALUE = 306
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
#define DEFAULT 270
#define FUNCTION 271
#define RETURN 272
#define IF 273
#define ELSE 274
#define ELSEIF 275
#define PRINT 276
#define SCOPE_OPEN 277
#define SCOPE_CLOSE 278
#define BRACKET_OPEN 279
#define BRACKET_CLOSE 280
#define SQUARE_BRACKET_OPEN 281
#define SQUARE_BRACKET_CLOSE 282
#define SEMICOLON 283
#define COLON 284
#define PLUS 285
#define MINUS 286
#define MULTIPLY 287
#define DIVISON 288
#define MODLUS 289
#define EQUAL 290
#define EQUAL_EQUAL 291
#define NOTEQUAL 292
#define GREATER_THAN 293
#define GREATER_THAN_OR_EQUAL 294
#define LESS_THAN 295
#define LESS_THAN_OR_EQUAL 296
#define AND 297
#define OR 298
#define NOT 299
#define TRUE 300
#define FALSE 301
#define IDENTIFIER 302
#define INTEGER_VALUE 303
#define DECIMAL_VALUE 304
#define CHAR_VALUE 305
#define STRING_VALUE 306

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
