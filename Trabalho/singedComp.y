%{
int yyerror(const char *s);
int yylex(void);
%}

%define parse.error verbose

%token TOK_IDENT
%token TOK_PRINT
%token TOK_SCANF
%token TOK_IF
%token TOK_ELSE
%token TOK_WHILE
%token TOK_BREAK
%token TOK_TRUE
%token TOK_FALSE
%token TOK_AND
%token TOK_OR
%token TOK_EQUAL
%token TOK_GAP
%token TOK_STRING
%token TOK_CHAR
%token TOK_FLOAT
%token TOK_INT
%token TOK_BOOL

%start program

%%

program : globals ;

globals : globals global {
}

globals : global {
}

global : TOK_IDENT '=' expr ';' {
}

expr : expr '+' term {
}

expr : expr '-' term {
}

expr : term {
}

term : term '*' factor {
}

term : term '/' factor {
}

term : factor {
}

factor : '(' expr ')' {
}

factor : TOK_IDENT {
}

factor : TOK_CHAR {
}

factor : TOK_STRING {
}

factor : TOK_INT {
}

factor : TOK_FLOAT{
}

factor : unary {
}

factor : bool {
}

unary : '-' factor {
}

global : TOK_PRINT '(' TOK_IDENT ')' ';'{
}

global : TOK_PRINT '(' TOK_STRING ')' ';' {
}

global : scan {
}

scan : TOK_SCANF '(' TOK_IDENT ')' ';' {
}

global : while {
}

global: decision {
}

global : break {
}

while : TOK_WHILE '(' condition ')''{' globals '}'{
}

decision : TOK_IF '(' condition ')' '{' globals '}' {
}

decision : TOK_IF '(' condition ')' '{' globals '}' TOK_ELSE '{' globals '}' {
}

decision : TOK_IF '(' condition ')' '{' globals '}' TOK_ELSE decision {
}

condition : factor logical_op factor {
}

condition : '(' condition TOK_OR condition ')' {
}

condition : '(' condition TOK_AND condition ')' {
}

condition : expr {
}

bool : TOK_TRUE {
}

bool : TOK_FALSE {
}

logical_op : TOK_EQUAL {
}

logical_op : TOK_GAP {
}

logical_op : '>' {
}

logical_op : '<' {
}

break : TOK_BREAK ';' {
}

%%