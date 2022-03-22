%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *s);
int yylex(void);
int val[26];
int flag=0;
%}
%token TRUE FALSE AND OR NOT WORD NUMBER 
%left  AND
%left  OR
%right NOT
%right '='
%left  '+' '-'
%left  '*' '/'
%left  '(' ')'
%right UMINUS
%%
line :line expr '\n'  { printf("Result: %s\n",$2?"true":"false");}
     |line stmnt '\n'
     | '\n'
     |
     ;
stmnt: phrase          {if(flag==0)printf("Answer:%d\n",$1);
                          else {flag=0;}}
     | WORD '=' phrase {val[$1]=$3;}
     ;
phrase: NUMBER 
      | '-'phrase    {$$=-$2;}
      | '+'phrase    {$$= $2;}
      | WORD         {$$=val[$1];
                        if($$==0){flag=1;printf("error\n");}      
                     } 
      | phrase '+' phrase   {$$ = $1 + $3;flag=0; }  
      | phrase '-' phrase   {$$ = $1 - $3;flag=0; } 
      | phrase '*' phrase   {$$ = $1 * $3;flag=0; }
      | phrase '/' phrase   {if($3==0){
                             printf("not possible to divide by zero\n");
                                flag=1;}
                              else{$$=$1/$3;flag=0;}
                            }
      |'('phrase')'     {$$=$2;flag=0;}
      ;
               
expr : TRUE          {$$=$1;}
     | FALSE         {$$=$1;}
     | expr AND expr {$$=($1 & $3);}
     | expr OR expr  {$$=($1 | $3);}
     | NOT expr      {$$= !($2);} 
     | '('expr')'     {$$=$2;}
     ;
     
%%
void yyerror(char *s){
  fprintf(stderr,"%s\n",s); }
int main(){
  yyparse();
  return 0;
  }
  
