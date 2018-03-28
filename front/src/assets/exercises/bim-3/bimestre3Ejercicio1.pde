//variables globales
PImage imgBack;
int total;

//variable para recibir info de level y estatus desde JS
int[] dataLevelPS = new int[3];

//variables para iniciar a dibujar los productos
int startDrawX = 60;
int startDrawY = 190;
int widthObject = 140;
int lengthSize = 190;
int centerImg = 50;

//Cargando productos
Product [] productosNames = new Product[12];
productosNames[0] = new Product(startDrawX, startDrawY, widthObject, lengthSize, "assets/exercises/bim-3/img/pnazon.png", 8);
productosNames[1] = new Product(startDrawX, startDrawY, widthObject, lengthSize, "assets/exercises/bim-3/img/coca.png", 11);
productosNames[2] = new Product(startDrawX, startDrawY, widthObject, lengthSize, "assets/exercises/bim-3/img/nito.png", 15);
productosNames[3] = new Product(startDrawX, startDrawY, widthObject, lengthSize, "assets/exercises/bim-3/img/te.png", 17);
productosNames[4] = new Product(startDrawX, startDrawY, widthObject, lengthSize, "assets/exercises/bim-3/img/sabritas.png", 20);
productosNames[5] = new Product(startDrawX, startDrawY, widthObject, lengthSize, "assets/exercises/bim-3/img/nieve.png", 27);
productosNames[6] = new Product(startDrawX, startDrawY, widthObject, lengthSize, "assets/exercises/bim-3/img/paketaxo.png", 35);
productosNames[7] = new Product(startDrawX, startDrawY, widthObject, lengthSize, "assets/exercises/bim-3/img/roles.png", 38);
productosNames[8] = new Product(startDrawX, startDrawY, widthObject, lengthSize, "assets/exercises/bim-3/img/cereal.png", 72);
productosNames[9] = new Product(startDrawX, startDrawY, widthObject, lengthSize, "assets/exercises/bim-3/img/jenga.png", 85);
productosNames[10] = new Product(startDrawX, startDrawY, widthObject, lengthSize, "assets/exercises/bim-3/img/libro.png", 67);
productosNames[11] = new Product(startDrawX, startDrawY, widthObject, lengthSize, "assets/exercises/bim-3/img/oso.png", 53);

int valorProducto;
int posProducto;

//Variables para iniciar a dibujar los billetes
int startDrawX = 240;
int startDrawY = 380;
int widthObject = 120;
int lengthSize = 50;
int centerImg = 50;

long timeMillis;
float timeReturn;

Dinero monedaUno;
Dinero monedaDos;
Dinero monedaCinco;
Dinero monedaDiez;
Dinero billeteVeinte;
Dinero billeteCincuenta;

Contenedor contUno;
Contenedor contDos;
Contenedor contCinco;
Contenedor contDiez;
Contenedor contVeinte;
Contenedor contCincuenta;

String[] arregloDatos = new String[3];



void setup() {
    size(945, 600); 
    
    //cargar elementos graficos
    imgBack = requestImage("assets/exercises/bim-3/img/fondoPared.png");
    
    //identificar el id del objeto a dibujar
    arregloDatos = split(getDataFromHtml(), ",");
    dataLevelPS[0]=arregloDatos[0];
    dataLevelPS[1]=arregloDatos[1];
    dataLevelPS[2]=arregloDatos[2];
   
    posProducto=0;
    valorProducto=0;

    //nivel facil
    if(dataLevelPS[1] == 1 || dataLevelPS[1] == 2 || dataLevelPS[1] == 3 || dataLevelPS[1] == 4){
        posProducto = int(random(0,3));
        valorProducto=productosNames[posProducto].valor;
        
        monedaUno = new Dinero(99, 370, 80, 80, "assets/exercises/bim-3/img/1peso.png", 40, 1);
        monedaDos = new Dinero(315, 370, 80, 80, "assets/exercises/bim-3/img/2pesos.png", 40, 2);
        monedaCinco = new Dinero(532, 365, 80, 80, "assets/exercises/bim-3/img/5pesos.png", 40, 5);
        monedaDiez = new Dinero(748, 360, 80, 80, "assets/exercises/bim-3/img/10pesos.png", 40, 10);
        
        contUno = new Contenedor(82, 480, "$1", 50, 204, 0, 0);
        contDos = new Contenedor(298, 480, "$2", 50, 255, 255, 0);
        contCinco = new Contenedor(515, 480, "$5", 50, 0, 204, 204);
        contDiez = new Contenedor(731, 480, "$10", 50, 153, 0, 153);
    }
     
    //nivel medio
    if(dataLevelPS[1] == 5 || dataLevelPS[1] == 6 || dataLevelPS[1] == 7 || dataLevelPS[1] == 8){
        posProducto = int(random(4,7));
        valorProducto=productosNames[posProducto].valor;
        
        monedaUno = new Dinero(55, 370, 80, 80, "assets/exercises/bim-3/img/1peso.png", 40, 1);
        monedaDos = new Dinero(219, 370, 80, 80, "assets/exercises/bim-3/img/2pesos.png", 40, 2);
        monedaCinco = new Dinero(393, 365, 80, 80, "assets/exercises/bim-3/img/5pesos.png", 40, 5);
        monedaDiez = new Dinero(567, 365, 80, 80, "assets/exercises/bim-3/img/10pesos.png", 40, 10);
        billeteVeinte = new Dinero(731, 365, 150, 75, "assets/exercises/bim-3/img/20pesos.png", 70, 20);

        contUno = new Contenedor(50, 480, "$1", 50, 204, 0, 0);
        contDos = new Contenedor(230, 480, "$2", 50, 255, 255, 0);
        contCinco = new Contenedor(400, 480, "$5", 50, 0, 204, 204);
        contDiez = new Contenedor(575, 480, "$10", 50, 153, 0, 153);
        contVeinte = new Contenedor(755, 480, "$20", 50, 255, 128, 0);

    }
     
    //nivel dificil
    if(dataLevelPS[1] == 9 || dataLevelPS[1] == 10 || dataLevelPS[1] == 11 || dataLevelPS[1] == 12){
        posProducto = int(random(8,11));
        valorProducto=productosNames[posProducto].valor;

        monedaUno = new Dinero(70, 370, 80, 80, "assets/exercises/bim-3/img/1peso.png", 40, 1);
        monedaDos = new Dinero(200, 370, 80, 80, "assets/exercises/bim-3/img/2pesos.png", 40, 2);
        monedaCinco = new Dinero(320, 365, 80, 80, "assets/exercises/bim-3/img/5pesos.png", 40, 5);
        monedaDiez = new Dinero(460, 365, 80, 80, "assets/exercises/bim-3/img/10pesos.png", 40, 10);
        billeteVeinte = new Dinero(590, 365, 150, 75, "assets/exercises/bim-3/img/20pesos.png", 70, 20);
        billeteCincuenta = new Dinero(770, 365, 150, 75, "assets/exercises/bim-3/img/50pesos.png", 70, 50);
        
        contUno = new Contenedor(20, 480, "$1", 50, 204, 0, 0);
        contDos = new Contenedor(170, 480, "$2", 50, 255, 255, 0);
        contCinco = new Contenedor(330, 480, "$5", 50, 0, 204, 204);
        contDiez = new Contenedor(480, 480, "$10", 50, 153, 0, 153);
        contVeinte = new Contenedor(630, 480, "$20", 50, 255, 128, 0);
        contCincuenta = new Contenedor(790, 480, "$50", 50, 153, 51, 255);
        
    }
  
}
          
void draw() {
    if (imgBack.width == 0) {
    // Image is not yet loaded
    } else if (imgBack.width == -1) {
        // This means an error occurred during image loading
    } else {
        // Image is ready to go, draw it
        background(imgBack);
    }
    
    //dibujar los objetos en el canvas
    productosNames[posProducto].display();
    
    //Nivel facil
    if(dataLevelPS[1] == 1 || dataLevelPS[1] == 2 || dataLevelPS[1] == 3 || dataLevelPS[1] == 4){
    
        //Dibujar contenedores
        contUno.display();
        contDos.display();
        contCinco.display();
        contDiez.display();
    
        //Dibujar monedas y billetes
        monedaUno.display();
        monedaDos.display();
        monedaCinco.display();
        monedaDiez.display();
        
        //Combinaciones para repeler las monedas
        monedaUno.repeler(monedaDos);
        monedaUno.repeler(monedaCinco);
        monedaUno.repeler(monedaDiez);
        
        monedaDos.repeler(monedaUno);
        monedaDos.repeler(monedaCinco);
        monedaDos.repeler(monedaDiez);
        
        monedaCinco.repeler(monedaUno);
        monedaCinco.repeler(monedaDos);
        monedaCinco.repeler(monedaDiez);
        
        monedaDiez.repeler(monedaUno);
        monedaDiez.repeler(monedaDos);
        monedaDiez.repeler(monedaCinco);   
        
        //Identificar si las monedas estan adentro de su contenedor
        if(dist(contUno.x+70, contUno.y+55, monedaUno.x+40, monedaUno.y+40)<50){
            monedaUno.touch = true;
            //text("Si toca", 100, 100);
        }else{
            monedaUno.touch = false;
            //text("No toca", 100, 100);
        }
    
        if(dist(contDos.x+70, contDos.y+55, monedaDos.x+40, monedaDos.y+40)<50){
            monedaDos.touch = true;
            //text("Si toca", 100, 100);
        }else{
            monedaDos.touch = false;
            //text("No toca", 100, 100);
        }
    
        if(dist(contCinco.x+70, contCinco.y+55, monedaCinco.x+40, monedaCinco.y+40)<50){
            monedaCinco.touch = true;
            //text("Si toca", 100, 100);
        }else{
            monedaCinco.touch = false;
            //text("No toca", 100, 100);
        }

        if(dist(contDiez.x+70, contDiez.y+55, monedaDiez.x+40, monedaDiez.y+40)<50){
            monedaDiez.touch = true;
            //text("Si toca", 100, 100);
        }else{
            monedaDiez.touch = false;
            //text("No toca", 100, 100);
        }
        
    }
    
    //nivel medio
    if(dataLevelPS[1] == 5 || dataLevelPS[1] == 6 || dataLevelPS[1] == 7 || dataLevelPS[1] == 8){
        
        //Dibujar Contenedor
        contUno.display();
        contDos.display();
        contCinco.display();
        contDiez.display();
        contVeinte.display();
        
        //Dibujar monedas
        monedaUno.display();
        monedaDos.display();
        monedaCinco.display();
        monedaDiez.display();
        billeteVeinte.display();
        
        //Combinaciones para repeler productos
        monedaUno.repeler(monedaDos);
        monedaUno.repeler(monedaCinco);
        monedaUno.repeler(monedaDiez);
        monedaUno.repeler(billeteVeinte);
        
        monedaDos.repeler(monedaUno);
        monedaDos.repeler(monedaCinco);
        monedaDos.repeler(monedaDiez);
        monedaDos.repeler(billeteVeinte);
        
        monedaCinco.repeler(monedaUno);
        monedaCinco.repeler(monedaDos);
        monedaCinco.repeler(monedaDiez);
        monedaCinco.repeler(billeteVeinte);
        
        monedaDiez.repeler(monedaUno);
        monedaDiez.repeler(monedaDos);
        monedaDiez.repeler(monedaCinco);
        monedaDiez.repeler(billeteVeinte);
                
        billeteVeinte.repeler(monedaUno);
        billeteVeinte.repeler(monedaDos);
        billeteVeinte.repeler(monedaCinco);
        billeteVeinte.repeler(monedaDiez);  
        
        //Identificar si las monedas estan adentro de su contenedor
        if(dist(contUno.x+70, contUno.y+55, monedaUno.x+40, monedaUno.y+40)<50){
            monedaUno.touch = true;
            //text("Si toca", 100, 100);
            }else{
            monedaUno.touch = false;
            //text("No toca", 100, 100);
         }
     
        if(dist(contDos.x+70, contDos.y+55, monedaDos.x+40, monedaDos.y+40)<50){
            monedaDos.touch = true;
            //text("Si toca", 100, 100);
        }else{
            monedaDos.touch = false;
            //text("No toca", 100, 100);
        }
    
        if(dist(contCinco.x+70, contCinco.y+55, monedaCinco.x+40, monedaCinco.y+40)<50){
            monedaCinco.touch = true;
            //text("Si toca", 100, 100);
        }else{
            monedaCinco.touch = false;
            //text("No toca", 100, 100);
        }

        if(dist(contDiez.x+70, contDiez.y+55, monedaDiez.x+40, monedaDiez.y+40)<50){
            monedaDiez.touch = true;
            //text("Si toca", 100, 100);
        }else{
            monedaDiez.touch = false;
            //text("No toca", 100, 100);
        }
    
        if(dist(contVeinte.x+70, contVeinte.y+55, billeteVeinte.x+70, billeteVeinte.y+35)<50){
            billeteVeinte.touch = true;
            //text("Si toca", 100, 100);
        }else{
            billeteVeinte.touch = false;
            //text("No toca", 100, 100);
            }
            
    }
    
    //nivel dificil
    if(dataLevelPS[1] == 9 || dataLevelPS[1] == 10 || dataLevelPS[1] == 11 || dataLevelPS[1] == 12){

        //Dibujar Contenedor
        contUno.display();
        contDos.display();
        contCinco.display();
        contDiez.display();
        contVeinte.display();
        contCincuenta.display();

        //Dibujar monedas
        monedaUno.display();
        monedaDos.display();
        monedaCinco.display();
        monedaDiez.display();
        billeteVeinte.display();
        billeteCincuenta.display();
        
        //Combinaciones para repeler productos
        monedaUno.repeler(monedaDos);
        monedaUno.repeler(monedaCinco);
        monedaUno.repeler(monedaDiez);
        monedaUno.repeler(billeteVeinte);
        monedaUno.repeler(billeteCincuenta);
        
        monedaDos.repeler(monedaUno);
        monedaDos.repeler(monedaCinco);
        monedaDos.repeler(monedaDiez);
        monedaDos.repeler(billeteVeinte);
        monedaDos.repeler(billeteCincuenta);
        
        monedaCinco.repeler(monedaUno);
        monedaCinco.repeler(monedaDos);
        monedaCinco.repeler(monedaDiez);
        monedaCinco.repeler(billeteVeinte);
        monedaCinco.repeler(billeteCincuenta);
        
        monedaDiez.repeler(monedaUno);
        monedaDiez.repeler(monedaDos);
        monedaDiez.repeler(monedaCinco);
        monedaDiez.repeler(billeteVeinte);
        monedaDiez.repeler(billeteCincuenta);
                
        billeteVeinte.repeler(monedaUno);
        billeteVeinte.repeler(monedaDos);
        billeteVeinte.repeler(monedaCinco);
        billeteVeinte.repeler(monedaDiez);
        billeteVeinte.repeler(billeteCincuenta);
        
        billeteCincuenta.repeler(monedaUno);
        billeteCincuenta.repeler(monedaDos);
        billeteCincuenta.repeler(monedaCinco);
        billeteCincuenta.repeler(monedaDiez);
        billeteCincuenta.repeler(billeteVeinte);
        
        
        //Identificar si las monedas estan adentro de su contenedor
        if(dist(contUno.x+70, contUno.y+55, monedaUno.x+40, monedaUno.y+40)<50){
            monedaUno.touch = true;
            //text("Si toca", 100, 100);
            }else{
            monedaUno.touch = false;
            //text("No toca", 100, 100);
            }
    
        if(dist(contDos.x+70, contDos.y+55, monedaDos.x+40, monedaDos.y+40)<50){
            monedaDos.touch = true;
            //text("Si toca", 100, 100);
        }else{
            monedaDos.touch = false;
            //text("No toca", 100, 100);
            }
    
        if(dist(contCinco.x+70, contCinco.y+55, monedaCinco.x+40, monedaCinco.y+40)<50){
            monedaCinco.touch = true;
            //text("Si toca", 100, 100);
        }else{
            monedaCinco.touch = false;
            //text("No toca", 100, 100);
            }

        if(dist(contDiez.x+70, contDiez.y+55, monedaDiez.x+40, monedaDiez.y+40)<50){
            monedaDiez.touch = true;
            //text("Si toca", 100, 100);
        }else{
            monedaDiez.touch = false;
            //text("No toca", 100, 100);
            }
    
        if(dist(contVeinte.x+70, contVeinte.y+55, billeteVeinte.x+70, billeteVeinte.y+35)<50){
            billeteVeinte.touch = true;
            //text("Si toca", 100, 100);
        }else{
            billeteVeinte.touch = false;
            //text("No toca", 100, 100);
            }
            
        if(dist(contCincuenta.x+70, contCincuenta.y+55, billeteCincuenta.x+70, billeteCincuenta.y+35)<50){
            billeteCincuenta.touch = true;
            //text("si toca", 100, 100);
        }else{
            billeteCincuenta.touch = false;
            //text("No toca", 100, 100);
        }

    }
    
   
    //Rectangulo
    noStroke();
    fill(207,207,207,150);
    rect(230,230, 690, 120, 7);

    //inicializar elementos
    //textSize(80);
    fill(0);            
    //text("Sistema monetario", 100, 40);
    textSize(35);
    text("¿Si quieres comprar un dulce que cuesta ",250,275);
    text(+valorProducto+" pesos, con que monedas lo pagarías?", 260,320);
            
    //tiempo transcurrido
    timeMillis = millis();
    timeReturn = timeMillis/1000; 
     
    
}

int returnToJS(){

    int values = new int[3];
    values[0] = 0;
    values[1] = dataLevelPS[1];
    values[2] = timeReturn;
    
    if(dataLevelPS[1] == 1 || dataLevelPS[1] == 2 || dataLevelPS[1] == 3 || dataLevelPS[1] == 4){


        //Cuenta dinero dentro de contenedor
        if(monedaUno.touch == true){
            total = total + 1;
        }

        if(monedaDos.touch == true){
            total = total + 2;
        }
    
        if(monedaCinco.touch == true){
            total = total + 5;
        }
    
        if(monedaDiez.touch == true){
            total = total + 10;
        }
        
        if(valorProducto == total){
            values[0] = 1;
        }else{
            values[0] = 0;
    }
    
        //Regresar valores a JS
        returnDataPros(values[0]+","+values[1]+","+values[2]); 

    return values[0];
    
    }
    
    if(dataLevelPS[1] == 5 || dataLevelPS[1] == 6 || dataLevelPS[1] == 7 || dataLevelPS[1] == 8){

        //Cuenta dinero dentro de contenedor
        if(monedaUno.touch == true){
            total = total + 1;
        }

        if(monedaDos.touch == true){
            total = total + 2;
        }
    
        if(monedaCinco.touch == true){
            total = total + 5;
        }
    
        if(monedaDiez.touch == true){
            total = total + 10;
        }
    
        if(billeteVeinte.touch == true){
            total = total + 20;
        }
        
        if(valorProducto == total){
            values[0] = 1;
        }else{
            values[0] = 0;
        }   
    
        //Regresar valores a JS
        returnDataPros(values[0]+","+values[1]+","+values[2]); 

        return values[0];
        
    }
    
    if(dataLevelPS[1] == 9 || dataLevelPS[1] == 10 || dataLevelPS[1] == 11 || dataLevelPS[1] == 12){

        //Cuenta dinero dentro de contenedor
        if(monedaUno.touch == true){
            total = total + 1;
        }

        if(monedaDos.touch == true){
            total = total + 2;
        }
    
        if(monedaCinco.touch == true){
            total = total + 5;
        }
    
        if(monedaDiez.touch == true){
            total = total + 10;
        }
    
        if(billeteVeinte.touch == true){
            total = total + 20;
        }
    
        if(billeteCincuenta.touch == true){
            total = total + 50;
        }
    
    
        if(valorProducto == total){
            values[0] = 1;
        }else{
            values[0] = 0;
        }
    
        //Regresar valores a JS
        returnDataPros(values[0]+","+values[1]+","+values[2]); 

        return values[0];
        
    }
    
}


//clase para crear objetos manipulables dentro del canvas
class Product{
    
    //variables globales
    float x;
    float y;
    float width;
    float length;
    String img;
    int valor;
    boolean touch;
    

    //constructor por default
    Product(){
        x = 10;
        y = 400;
        width = 40;
        length = 40;
        img = loadImage("assets/exercises/bim-3/img/coca.png");
        valor = 11;
        touch = false;

    }

    //constructor que recibe posicion, tamaño, nombre de imagen y centro de la imagen
    Product(float posX, float posY, float widthSize, lengthSize, String picImg, int valorImg){
        x = posX;
        y = posY;
        width = widthSize;
        length = lengthSize;
        img = loadImage(picImg);
        valor = valorImg;
        touch = false;
    }

    //metodo para dibujar en canvas el objeto
    void display(){
        image(img, x, y, width, length);
    }

}

//clase para crear monedas
class Dinero{
    
    //variables globales
    float x;
    float y;
    float width;
    float length;
    String img;
    int centerImg;
    int valor;
    boolean touch; 

    //constructor por default
    Dinero(){
        x = 10;
        y = 400;
        width = 40;
        length = 40;
        img = loadImage("assets/exercises/bim-3/img/coca.png");
        centerImage = 50;
        valor = 1;
        touch = false;
    }

    //constructor que recibe posicion, tamaño, nombre de imagen y centro de la imagen
    Dinero(float posX, float posY, float widthSize, lengthSize, String picImg, int centerImage, int valorDinero){
        x = posX;
        y = posY;
        width = widthSize;
        length = lengthSize;
        img = loadImage(picImg);
        centerImg = centerImage;
        valor = valorDinero;
        touch = false;
    }

    //metodo para dibujar en canvas el objeto
    void display(){
        image(img, x, y, width, length);
        this.drag();
    }

    //metodo para hacer drag al objeto
    void drag(){
        
      if(dist(x+25, y+35, mouseX,mouseY)<centerImg){
       // cursor(HAND);
        if(mousePressed){
            x = mouseX-25;
            y = mouseY-35;
        }
      }else{
        //cursor(ARROW);
       }
    }

    //metodo que hace que el objeto seleccionado 
    //no se junte con el que está chocando
    void repeler(Dinero t){        
        if(dist(x+40, y+40, t.x+40, t.y+40) < 100){
            if(x < t.x && y < t.y){
                t.x = t.x + 5;
                t.y = t.y + 5;
            } else if(x > t.x && y < t.y){
                t.x = t.x - 5;
                t.y = t.y + 5;
            } else if(x < t.x && y > t.y){
                t.x = t.x + 5;
                t.y = t.y - 5;
            } else if(x > t.x && y > t.y){
                t.x = t.x - 5;
                t.y = t.y - 5;
            }
            
        }
    }

}

//Clase contenedor
class Contenedor{
    
    //variables globales
    float x;
    float y;
    String name;
    int centerCont;
    int r;
    int g;
    int b;

    //constructor por default
    Contenedor(){
        x = 255;
        y = 255;
        name = "0";
        centerCont = 50;  
        r = 207;
        g = 207;
        b = 207;

    }

    //constructor que recibe posicion, nombre valor y centro del contenedor
    Contenedor(float posX, float posY, String nameCont, int centerContenedor,int rC, int gC, int bC){
        x = posX;
        y = posY;
        name = nameCont;
        centerCont = centerContenedor;
        r = rC;
        g = gC;
        b = bC;
    }


    //Metodo para mostrar contenedor
    void display(){
        noStroke();
        fill(0);
        textSize(35);
        text(name+" ", x+45, y+65);
        fill(r, g, b, 180);
        rect(x, y, 135, 110, 7);

    }

}
 