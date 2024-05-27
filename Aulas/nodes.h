#include <iostream>
#include <vector>
#include <map>
#include <set>

using namespace std;

class Node {
protected:
    vector<Node*> children; //um nó cria filhos do tipo nó também e armazena em um vetor
public:
    virtual string toStr(){
        return "node";
    }

};

class Integer : public Node {
protected:
    int value; //valor que o int tem
public:
    Integer(const int v){ //construtor do valor
        value = v;
    }

    virtual string toStr() override { //override está substituindo o método anterior
        return to_string(value);
    }
};

class Float : public Node {
protected:
    float value; //valor que o float tem
public:
    Float(const float v){ //construtor do valor
        value = v;
    }

    virtual string toStr() override { //override está substituindo o método anterior
        return to_string(value);
    }
};

class Ident : public Node {
protected:
    string name; //variável com o nome da variável a ser criada
public:
    Ident(const string n){ //construtor do valor
        name = n;
    }

    virtual string toStr() override { //override está substituindo o método anterior
        return name;
    }
};

class Unary : public Node {
protected:
    Node *value; //nó de onde será tirado o valor dele
    char operation; //char que armazenará o valor do nó

public:
    Unary(Node *v, char op) { //construtor
        value = v;
        operation = op;
    }

    virtual string toStr() override { //override está substituindo o método anterior
        string aux;
        aux.push_back(operation);
        return aux; //imprime somente o operador, pois os filhos podem se imprimir
    }
};

class Binary : public Node {
protected:
    Node *value1; //nó de onde será tirado o operando 1
    Node *value2; //nó de onde será tirado o operando 2
    char operation; //char que armazenará o valor do nó
public:
    Binary(Node *v1, Node *v2, char op) { //construtor
        value1 = v1;
        value2 = v2;
        operation = op;
    }

    virtual string toStr() override { //override está substituindo o método anterior
        string aux;
        aux.push_back(operation);
        return aux; //imprime somente o operador, pois os filhos podem se imprimir
    }
};

class Print {
protected:
    Node *value;

public:
    Print(Node *v){
        value = v;
    }

    virtual string toStr(){
        return "print";
    }
};