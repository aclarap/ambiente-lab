public class Carro {
    // Atributos
    private String marca;
    private int ano;
    private String modelo;
    private boolean ligado;

    // Construtor
    public Carro(String marca, int ano, String modelo) {
        this.marca = marca;
        this.modelo = modelo;
        this.ano = ano;
        this.ligado = false;
    }

    // Ligar motor
    public void ligar() {
        ligado = true;
        System.out.println("Motor ligado!");
    }

    // Desligar motor
    public void desligar() {
        ligado = false;
        System.out.println("Motor desligado!");
    }

    // Mostrar informações
    public void mostraInfo() {
        System.out.println("Marca: " + marca);
        System.out.println("Modelo: " + modelo);
        System.out.println("Ano: " + ano);
        System.out.println("Status: " + (ligado ? "Ligado" : "Desligado"));
        System.out.println("-----------------------");
    }

    // Método principal
    public static void main(String[] args) {
        // Criação dos objetos
        Carro c1 = new Carro("Fiat", 1970, "147");
        Carro c2 = new Carro("Volvo", 1999, "XXX");

        // Mostrar informações iniciais
        c1.mostraInfo();
        c2.mostraInfo();

        // Ligar carro 1 e mostrar novamente
        c1.ligar();
        c1.mostraInfo();

        // Exemplo de desligar carro 2
        c2.desligar();
