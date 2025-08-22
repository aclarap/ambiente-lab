public class Carro{
    //atributos
    private String marca;
    private int ano;
    private String modelo;
    private boolean ligado;

    //metodo contrutor da classe
    public Carro(String marca, int ano, String modelo){
        this.marca = marca;
        this.modelo = modelo;
        this.ano = ano;
        this.ligado = false;
    }
    //ligar motor
    public void ligar(){
        ligado = true;
        System.out.print("Motor ligado!");
    }
    //desligar motor
    public void desligar(){
        ligado = false;
        System.out.print("Motor desligado!");
    }
    //mostrar informações
    public void mostraInfo(){
        System.out.println("Marca:"+marca);
        System.out.println("Modelo:"+modelo);
        System.out.println("Ano:"+ano);
        System.out.println("Status:"+ligado);
    }

    public static void main(String[] args){
        //criação do objeto carro
        Carro  c1 = new Carro("fiat", 1970, "147");
        Carro  c2 = new Carro("volvo", 1999, "xxx");
        c1.mostraInfo();
        c2.mostraInfo();
        c1.ligar();
    }

}