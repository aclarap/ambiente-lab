#include <stdio.h>

void alteraValor(int n1){
    n1 = n1 * 2;
    printf("o valor de n1 é %d \n", n1);
}

void alteraValorRef(int *n2){
    *n2 = *n2 * 2;
}

void dobrarElemento(int n[], int tamanho){
    for(int i=0; i<tamanho; i++){
        n[i] = n[i]*2;
    }
}

typedef struct{
    char nome[20];
    int idade;
}Pessoa;

void alteraRef(Pessoa *p){
    p->idade = 30;
}

int main(){
    int x;
    printf("Entre com um inteiro:");
    scanf("%d", &x);
    printf("O valor da variável x é: %d\n", x);
    printf("O valor do end de x é: %p\n", &x);

    int *ptx = &x;
    printf("O valor guardado no ptx é: %p\n", ptx);
    printf("O valor guardado no end apontado por ptx é %d\n", *ptx);
    printf("O endereço de ptx é %p\n", &ptx);

    x++;
    printf("O valor de x incrementado é de %d\n", x);
    (*ptx)++;
    printf("O valor de x incrementado é de %d\n", x);

    char nome[5] = "Joao"; // precisa ser [5] para comportar o '\0'
    printf("Nome é %s\n", nome);
    printf("O endereço da variável nome %p\n", nome);

    char *ptnome = nome;
    printf("O valor guardado no ptnome é %p\n", ptnome);
    printf("O valor armazenado no ptnome %c\n", *ptnome);
    for(int i=0; i<4;i++){
        printf("%c -", *ptnome);
        ptnome++;
    }

    printf("\n");
    int i = 20;
    alteraValor(i);
    printf("o valor de i é %d \n", i);
    alteraValorRef(&i);
    printf("o valor de i é de %d \n", i);

    int numero[5] = {1,2,3,4,5};
    dobrarElemento(numero, 5);

    for(int j=0; j<5; j++){
        printf("%d -", numero[j]);
    }

    printf("\n");
    Pessoa pessoa = {"joao",20};
    printf("idade pessoa é %d\n", pessoa.idade);
    alteraRef(&pessoa);
    printf("idade pessoa é %d\n", pessoa.idade);

    return 0;
}
