%{
#include "nodes.h"

int yyerror(const char *s);
int yylex(void);
%}

%define parse.error verbose

%token TOK_IDENT
%token TOK_PRINT
%token TOK_FLOAT
%token TOK_INT

%start program

%%

program : globals ;

globals : globals global {
}

/* globals é usado para criar coisas globais, como variaveis e funções*/
globals : global {
}

/* global vira criação de variavel "variavel = valor"*/
global : TOK_IDENT '=' expr ';' {
}

/* global vira "print variavel"*/
global : TOK_PRINT TOK_IDENT ';' {
}

/*expressão vira  expressão + ou - termo */
expr : expr '+' term {
}

expr : expr '-' term {
}

/* expressão vira só termo */
expr : term {
}

/* termo vira termo * ou / fator */
term : term '*' factor {
}

term : term '/' factor {
}

/* termo vira só fator */
term : factor {
}

/* fator vira expressão com parenteses */
factor : '(' expr ')' {
}

factor : TOK_IDENT {
}

factor : TOK_INT {
}

factor : TOK_FLOAT {
}

factor : unary {
}

/* para numeros tipo '-20' ou '+30'*/
unary : '-' factor {
}

%%