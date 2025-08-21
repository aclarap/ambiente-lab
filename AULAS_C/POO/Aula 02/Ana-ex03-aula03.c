#include <stdio.h>
#define NUM_NOTAS 2

typedef struct{
    char rua[50];
    int numero;
    char cep[12];
    char estado[3];
}Endereco;

typedef struct{
    char nome[50];
    int matricula[10];
    Endereco end;
}Aluno;

int main(void){
    Aluno alunos[NUM_NOTAS];
    printf("uuuuuuuuuuuuuuuu");
    return 0;
}