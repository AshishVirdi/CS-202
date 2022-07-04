%{
#include<stdlib.h>
#include<string.h>
#include<stdio.h>
FILE *output;
int yylex();
void yyerror(char *s) {fprintf(output,"Error\n");}
int yywrap(void) { return 1;}

%}

%union{
int number;
char *str;
}

%token<number> Number
%token<str> GE LE Less_than Greater_than Equalto Not_Equalto And Or Type  Return Main Double_quotes Id If Else While Assign sem Com rpr lpr R_SB L_SB Plus Minus Multiply Divide Double_ast For

%%
begin : program_begins
        | begin program_begins
        ;

program_begins : var_decl 
                | func_decl {fprintf(output,"FUN-DEC\n");}
                | func_defn {fprintf(output,"FUN-DEF\n");}
                | caller   
                | if_st      
                | while_st
                | for_st 
                | statement
                ;

var_decl: Type Id sem {fprintf(output,"\nlocal variable %s\n",$2);}
          | Type Id Assign expr sem {fprintf(output,":=   local variable %s ",$2);}
          | Type Id L_SB expr R_SB Assign expr sem  {fprintf(output,"Local variable- %s  ",$2);}
          | Type Id L_SB expr R_SB sem          {fprintf(output,"\nlocal variable %s\n",$2);}
          ;
          
func_decl : Type Id lpr  args rpr sem       {fprintf(output,"Variable- %s ",$2);}
            | Type Id lpr rpr sem           {fprintf(output,"Variable- %s ",$2);} 
            | Return expr sem               {fprintf(output," RET ");} 
            | Return lpr  expr rpr sem      {fprintf(output," RET ");}     
           ;
            
func_defn : Type Id lpr args rpr func_body   {fprintf(output,"Identifier-%s ",$2);fprintf(output,"\nFuntion Body\n");}
            | Type Id lpr rpr func_body      {fprintf(output,"Identifier-%s ",$2);fprintf(output,"\nFuntion Body\n");}
            ;
caller : Id lpr  call_ags rpr sem            {fprintf(output,"Identifier-%s ",$1);}
         | Id lpr rpr sem                   {fprintf(output,"Identifier-%s ",$1);}   
        ;
call_ags: expr                          {fprintf(output,"FUN-ARG\n");}
        | expr Com call_ags             {fprintf(output,"FUN-ARG\n");}
        ;                       
                    
args : Type Id {fprintf(output,"FUN-ARG\n");}
      | Id            {fprintf(output,"FUN-ARG\n");}          
      | expr
      | Type Id Com args {fprintf(output,"FUN-ARG\n");}
      | Id Com args {fprintf(output,"FUN-ARG\n");}
      | expr Com args {fprintf(output,"FUN-ARG\n");}
      ;
      
if_st : If lpr expr rpr "{" func_body "}"                              {fprintf(output,"Identifier-if ");}
       | If lpr expr rpr "{" func_body "}" Else "{" func_body "}"      {fprintf(output,"Identifier-if "); fprintf(output," Identifier-else ");}             
       ;
while_st : While lpr expr rpr "{" func_body "}"  {fprintf(output,"Identifier-While  ");}    
         ;
         
for_st : For lpr var_decl expr sem statement rpr func_body
	| For lpr var_decl expr sem statement rpr "{" func_body "}"
	| For lpr statement expr sem statement rpr func_body
	| For lpr statement expr sem statement rpr "{" func_body "}"
	;       

func_body : program_begins
           | func_body program_begins
           ; 

statement :     Id Assign expr sem
                | Id Assign expr sem
                | expr sem
                ;
                
expr : prime_expr 
       | expr Plus expr {fprintf(output,"+ ");}
       | expr GE expr   {fprintf(output,">= ");}
       | expr LE expr   {fprintf(output,"<= ");}
       | expr Less_than expr    {fprintf(output,"< ");}
       | expr Greater_than expr {fprintf(output,"> ");}
       | expr Equalto expr      {fprintf(output,"== ");}
       | expr Not_Equalto expr  {fprintf(output,"!= ");}
       | expr And expr          {fprintf(output,"AND ");}
       | expr Or expr           {fprintf(output,"OR ");}
       | expr Minus expr        {fprintf(output,"- ");}
       | expr Divide expr       {fprintf(output,"/ ");}
       | expr Multiply expr     {fprintf(output,"* ");}
       | L_SB expr R_SB         
       | expr Com expr
       | lpr  expr rpr 
       | prime_expr expr
       ;
                   
prime_expr : Number             {fprintf(output," Const - %d  ",$1);}
            | Id                {fprintf(output,"variable- %s  ",$1);}
            ;

%%


int main(int argc[],char *argv[])
{
extern FILE *yyin,*yyout;
yyin = fopen(argv[1],"r");
yyout = fopen("Lexer.txt","w");
output = fopen("Parser.txt","w");
yyparse();
return 0;
}
