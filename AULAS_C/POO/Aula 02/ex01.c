
#include <stdio.h>
#define TAMANHO_NOME 256
#define NUM_NOTAS 2
//Estrutura cad notas
typedef struct{
    char nome[TAMANHO_NOME]; //nome
    double notas[NUM_NOTAS]; //array
}CadNotas;

int main(void)
{
    CadNotas aluno; //varíavel tipo CadNotas (struct)
    printf("Cadrastro de Notas\n");
    printf("Insira o nome do aluno:");
    scanf("%255[^\n]s", aluno.nome); // 255 para ler espaços antes do que for escrito
    for(int i=0; i<NUM_NOTAS;i++){
        printf("Nota %d:", i+10);
        scanf("%lf", &aluno.notas[i]);// lf para long float. para arrays não é necessário o &.
    }
    printf("Dados do aluno\n");
    printf("Nome do aluno: %s\n", aluno.nome);
    for(int j=0;j<NUM_NOTAS;j++){
        printf("Nota: %d %lf\n", j+1, aluno.notas[j]);

    }
    return 0;
}
