%{
#include <stdio.h>
#include <stdlib.h>
#include "mystack.h"

int do_op();

%}

%token I LPAREN RPAREN OR AND XOR NOT

%union{
  int number;
}

%type <number> I 

%%

e: t e_  ;
e_: OR t {add_operation(OR);} e_  | %empty ;

t: d t_  ;
t_: AND d { add_operation(AND); } t_  | %empty ;

d: h d_ ;
d_: XOR h {add_operation (XOR);} d_ | %empty ; 

h: NOT f { add_operation(NOT); }  | f ;
f: LPAREN {printf("pre-e\n"); print_numbers(); print_operations(); } e 
 {printf("post-e\n"); print_numbers(); print_operations(); do_op(); print_numbers(); print_operations(); }  RPAREN  
 | I { add_number($1); };



%%

int do_op(){
  if( is_operation_empty() )
    return;
  int op = pop_operation();
  int right, left, result;
  switch (op) {
    case OR: // |
      right = pop_number();
      left = pop_number();
      result = left | right;
      add_number(result);
      return result;
    case XOR: // ^
      right = pop_number();
      left = pop_number();
      result = left ^ right;
      add_number(result);
      return result;
    case AND: // &
      right = pop_number();
      left = pop_number();
      result = left & right ;
      add_number(result);
      return result;
    case NOT: // ~
      right = pop_number();
      result = ~ right;
      add_number(result);
      return result;
    default:
      printf("UNKNOWN OPERATION!!!\n");
      exit(1);
  }
}

int main() {
    if (yyparse() == 0) {
        printf("\n");
    } else {
        printf("Invalid expression.\n");
    }
    print_numbers();
    print_operations();
    do_op();
    print_numbers();
    print_operations();
    int result = pop_number();
    printf("Result: %d\n", result);
    return 0;
}

int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}

