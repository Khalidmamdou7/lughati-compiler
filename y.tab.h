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
    TILL = 267,
    SWITCH = 268,
    CASE = 269,
    BREAK = 270,
    DEFAULT = 271,
    FUNCTION = 272,
    RETURN = 273,
    IF = 274,
    ELSE = 275,
    ELSEIF = 276,
    PRINT = 277,
    ENUM = 278,
    SCOPE_OPEN = 279,
    SCOPE_CLOSE = 280,
    BRACKET_OPEN = 281,
    BRACKET_CLOSE = 282,
    SQUARE_BRACKET_OPEN = 283,
    SQUARE_BRACKET_CLOSE = 284,
    SEMICOLON = 285,
    COLON = 286,
    COMMA = 287,
    PLUS = 288,
    MINUS = 289,
    MULTIPLY = 290,
    DIVISON = 291,
    MODLUS = 292,
    EQUAL = 293,
    EQUAL_EQUAL = 294,
    NOTEQUAL = 295,
    GREATER_THAN = 296,
    GREATER_THAN_OR_EQUAL = 297,
    LESS_THAN = 298,
    LESS_THAN_OR_EQUAL = 299,
    AND = 300,
    OR = 301,
    NOT = 302,
    TRUE = 303,
    FALSE = 304,
    IDENTIFIER = 305,
    INTEGER_VALUE = 306,
    DECIMAL_VALUE = 307,
    CHAR_VALUE = 308,
    STRING_VALUE = 309
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
#define TILL 267
#define SWITCH 268
#define CASE 269
#define BREAK 270
#define DEFAULT 271
#define FUNCTION 272
#define RETURN 273
#define IF 274
#define ELSE 275
#define ELSEIF 276
#define PRINT 277
#define ENUM 278
#define SCOPE_OPEN 279
#define SCOPE_CLOSE 280
#define BRACKET_OPEN 281
#define BRACKET_CLOSE 282
#define SQUARE_BRACKET_OPEN 283
#define SQUARE_BRACKET_CLOSE 284
#define SEMICOLON 285
#define COLON 286
#define COMMA 287
#define PLUS 288
#define MINUS 289
#define MULTIPLY 290
#define DIVISON 291
#define MODLUS 292
#define EQUAL 293
#define EQUAL_EQUAL 294
#define NOTEQUAL 295
#define GREATER_THAN 296
#define GREATER_THAN_OR_EQUAL 297
#define LESS_THAN 298
#define LESS_THAN_OR_EQUAL 299
#define AND 300
#define OR 301
#define NOT 302
#define TRUE 303
#define FALSE 304
#define IDENTIFIER 305
#define INTEGER_VALUE 306
#define DECIMAL_VALUE 307
#define CHAR_VALUE 308
#define STRING_VALUE 309

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
