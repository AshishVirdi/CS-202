%{
#include<stdio.h>
#include<stdlib.h>
#define val yylval
#define txt yytext
#define out yyout
#define string str
#include "cucu.tab.h"
void yyerror(char *s);
%}

%%    
main             {fprintf(out,"MAIN: %s\n",txt);
                  val.string=strdup(txt);
                  return Id;}
while            {fprintf(out,"WHILE: %s\n",txt);
                  val.string=strdup(txt);
                  return While;}
for 		 {fprintf(out,"FOR: %s\n",txt);
                  val.string=strdup(txt);
                  return For;}
if               {fprintf(out,"IF: %s\n",txt);
                  val.string=strdup(txt);
                  return If;}
else             {fprintf(out,"ELSE: %s\n",txt);
                  val.string=strdup(txt);
                  return Else;}
int              {fprintf(out,"TYPE: %s\n",txt);
                  val.string=strdup(txt);
                  return Type;}
char             {fprintf(out,"TYPE: %s\n",txt);
                  val.string=strdup(txt);
                  return Type;}
"char**"         {fprintf(out,"TYPE: %s\n",txt);
                  val.string=strdup(txt);
                  return Type;}
"char*"          {fprintf(out,"TYPE: %s\n",txt);
                  val.string=strdup(txt);
                  return Type;}
"char *"          {fprintf(out,"TYPE: %s\n",txt);
                  val.string=strdup(txt);
                  return Type;}
[,]              {fprintf(out,"COMMA: %s\n",txt);
                  val.string=strdup(txt);return Com;
                  }
"return"         {fprintf(out,"RETURN: %s\n",txt);
                  val.string=strdup(txt);
                  return Return;}   
[&]              {fprintf(out,"AND: %s\n",txt);
                  val.string=strdup(txt);
                  return And;}
[|]              {fprintf(out,"OR: %s\n",txt);
                  val.string=strdup(txt);
                  return Or;}
[-]              {fprintf(out,"MINUS: %s\n",txt);
                  val.string=strdup(txt);
                  return Minus;}
[+]              {fprintf(out,"PLUS: %s\n",txt);
                  val.string=strdup(txt);
                  return Plus;}
[=]              {fprintf(out,"ASSIGN: %s\n",txt);
                  val.string=strdup(txt);
                  return Assign;}
[(]              {fprintf(out,"LEFT_PAREN: %s\n",txt);
                  val.string=strdup(txt);return lpr;
                  }
[)]              {fprintf(out,"RIGHT_PAREN: %s\n",txt);
                  val.string=strdup(txt);return rpr;
                  }
[<]              {fprintf(out,"LESS_THAN: %s\n",txt);
                  val.string=strdup(txt);
                  return Less_than;}
[>]              {fprintf(out,"GREATER_THAN: %s\n",txt);
                  val.string=strdup(txt);
                  return Greater_than;}
[\d*\d]          {fprintf(out,"MULT: %s\n",txt);
                  val.string=strdup(txt);
                  return Multiply;}
[*]{2}           {fprintf(out,"ASTS: %s\n",txt);
                  val.string=strdup(txt);
                  return Double_ast;}
[/]              {fprintf(out,"DIVIDE: %s\n",txt);
                  val.string=strdup(txt);
                  return Divide;}
[;]              {fprintf(out,"SEMICOL: %s\n",txt);
                  val.string=strdup(txt);return sem;
                  }
[{]              {fprintf(out,"LEFT_BRACE: %s\n",txt);
                  val.string=strdup(txt);
                  }
[}]              {fprintf(out,"RIGHT_BRACE: %s\n",txt);
                  val.string=strdup(txt);
                  }
[\[]             {fprintf(out,"LEFT_SQ: %s\n",txt);
                  val.string=strdup(txt);return L_SB;
                  }
[]]             {fprintf(out,"RIGHT_SQ: %s\n",txt);
                  val.string=strdup(txt);return R_SB;
                  }
[>][=]           {fprintf(out,"GT_EQUAL: %s\n",txt);
                  val.string=strdup(txt);
                  return GE;}
[<][=]           {fprintf(out,"LT_EQUAL: %s\n",txt);
                  val.string=strdup(txt);
                  return LE;}
[=]{2}           {fprintf(out,"EQUALS: %s\n",txt);
                  val.string=strdup(txt);
                  return Equalto;}
[!][=]           {fprintf(out,"NOT_EQUAL: %s\n",txt);
                  val.string=strdup(txt);
                  return Not_Equalto;}
["]              {fprintf(out,"D_QUOTES: %s\n",txt);
                  val.string=strdup(txt);
                  return Double_quotes;}
\/\/.*           {;};
[a-zA-Z_][a-zA-Z0-9_]*   {val.string=strdup(txt); 
                          fprintf(out,"ID : %s\n",txt); 
                          return Id;};
[0-9][0-9]*      {val.number=atoi(txt); 
                  fprintf(out,"NUM : %d\n",atoi(txt)); 
                  return Number;};          
[ \t\n]+         {;}; 
.                {yyerror("");};

%%
