%{
#include <stdio.h>
#include "singedComp.tab.h"

int yyerror(const char*s);

%}

%option yylineno

%%

[ \t\r\n] { /* ignora */ }

"//".*\n { /* ignora */ }

"EstaDoSeuAgrado" { return TOK_PRINT; }

"EuTeOuco" { return TOK_SCANF; }

"EssaMistura" { return TOK_IF; }

"NaoDeuCerto" { return TOK_ELSE; }

"EstouACaminho" { return TOK_WHILE; }

"Mexer" { return TOK_TRUE; }

"NaoMexer" { return TOK_FALSE; }

"JaEraHora" { return TOK_BREAK; }

"MisturarMisturar" { return TOK_AND; }

"GirarMexer" { return TOK_OR; }

"==" { return TOK_EQUAL; }

"!=" { return TOK_GAP; }

">" { return '>'; }
"<" { return '<'; }
"}" { return '}'; }
"{" { return '{'; }
"+" { return '+'; }
"-" { return '-'; }
"*" { return '*'; }
"/" { return '/'; }
"(" { return '('; }
")" { return ')'; }
";" { return ';'; }
"=" { return '='; }

[a-zA-Z_][a-zA-Z0-9_]* {
    return TOK_IDENT;
}

\"[a-zA-Z_0-9]\" {
    return TOK_CHAR;
}

\"[a-zA-Z_0-9' ']+\" {
    return TOK_STRING;
}

[0-9]+\.[0-9]* {
    return TOK_FLOAT;
}

[0-9]+ {
    return TOK_INT;
}

. {
    printf("Símbolo não reconhecido %c\n", yytext[0]);
}

%%

int yywrap() {
    return 1;
}

int yyerror(const char *s){
    printf("Erro de sintaxe na linha %d: %s\n", yylineno, s);
    return 1;
}

int main(int argc, char *argv[]){

    if(argc <=1){
        printf("Sintaxe: %s nome_do_programa\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (yyin == NULL){
        printf("Não foi possível abrir o arquivo %s.\n", argv[1]);
        return 1;
    }

    yyparse();

    if (yyin)
        fclose(yyin);

    return 0;
}