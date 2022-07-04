/* A Bison parser, made by GNU Bison 3.7.6.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
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
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_CUCU_TAB_H_INCLUDED
# define YY_YY_CUCU_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    Number = 258,                  /* Number  */
    GE = 259,                      /* GE  */
    LE = 260,                      /* LE  */
    Less_than = 261,               /* Less_than  */
    Greater_than = 262,            /* Greater_than  */
    Equalto = 263,                 /* Equalto  */
    Not_Equalto = 264,             /* Not_Equalto  */
    And = 265,                     /* And  */
    Or = 266,                      /* Or  */
    Type = 267,                    /* Type  */
    Return = 268,                  /* Return  */
    Main = 269,                    /* Main  */
    Double_quotes = 270,           /* Double_quotes  */
    Id = 271,                      /* Id  */
    If = 272,                      /* If  */
    Else = 273,                    /* Else  */
    While = 274,                   /* While  */
    Assign = 275,                  /* Assign  */
    sem = 276,                     /* sem  */
    Com = 277,                     /* Com  */
    rpr = 278,                     /* rpr  */
    lpr = 279,                     /* lpr  */
    R_SB = 280,                    /* R_SB  */
    L_SB = 281,                    /* L_SB  */
    Plus = 282,                    /* Plus  */
    Minus = 283,                   /* Minus  */
    Multiply = 284,                /* Multiply  */
    Divide = 285,                  /* Divide  */
    Double_ast = 286,              /* Double_ast  */
    For = 287                      /* For  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 12 "cucu.y"

int number;
char *str;

#line 101 "cucu.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_CUCU_TAB_H_INCLUDED  */
