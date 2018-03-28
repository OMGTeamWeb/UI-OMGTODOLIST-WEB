//variables globales
PImage imgBack;
int total;


//variable para recibir info de level y estatus desde JS
int[] dataLevelPS = new int[3];

//variables para iniciar a dibujar los productos
int startDrawX = 35;
int startDrawY = 290;
int widthObject = 70;
int lengthSize = 100;
int centerImg = 60;

ArrayList products;

//Arreglo de productos a repartir
String [] productName = new String[5];
productName[0] = "coca";
productName[1] = "nieve";
productName[2] = "paketaxo";
productName[3] = "sabritas";
productName[4] = "te";

int posImg = 0;
String imageToDraw;
int countTouch = 0;

String[] arregloDatos = new String[3];


//Cargando personas

Personas personaUno;
Personas personaDos;
Personas personaTres;
Personas personaCuatro;
Personas personaCinco;

long timeMillis;
float timeReturn;


void setup() {
    size(945, 600); 
    
    //cargar elementos graficos
    imgBack = requestImage("assets/exercises/bim-4/img/fondoPared.png");

    arregloDatos = split(getDataFromHtml(), ",");
    dataLevelPS[0]=arregloDatos[0];
    dataLevelPS[1]=arregloDatos[1];
    dataLevelPS[2]=arregloDatos[2];
    
    //identificar cantidad de objetos a dibujar
    products = new ArrayList();
    float productsToDraw = 0;
    posImg = int(random(0,4));
    imageToDraw = productName[posImg];

    //nivel facil
    if(dataLevelPS[1] == 7 || dataLevelPS[1] == 8 || dataLevelPS[1] == 9 || dataLevelPS[1] == 10){
        productsToDraw = 4;
        
        //Cargar productos
        for(int i = 0; i < productsToDraw; i++){
            products.add(new Producto(startDrawX + 40, startDrawY, widthObject, lengthSize, imageToDraw,60));
            startDrawX = startDrawX + 240;
        }
        
        personaUno = new Personas(82, 405, 132, 200, "assets/exercises/bim-4/img/niña.png", 25);
        
        personaDos = new Personas(310, 405, 140, 200, "assets/exercises/bim-4/img/niño.png", 25);
        
        personaTres = new Personas(525, 415, 131, 180, "assets/exercises/bim-4/img/mujer2.png", 25);
        
        personaCuatro = new Personas(720, 405, 132, 200, "assets/exercises/bim-4/img/mujer.png", 25);
        
    }
    
    //nivel medio
    if(dataLevelPS[1] == 1 || dataLevelPS[1] == 2){
        productsToDraw = 2;
        
        //Cargar productos
        for(int i = 0; i < productsToDraw; i++){
            products.add(new Producto(startDrawX + 320, startDrawY, widthObject, lengthSize, imageToDraw,60));
            startDrawX = startDrawX + 150;
        }
        
                
        personaUno = new Personas(200, 430, 140, 160, "assets/exercises/bim-4/img/niña.png", 25);
        
        personaDos = new Personas(600, 430, 120, 170, "assets/exercises/bim-4/img/niño.png", 25);
        
    }
    
    //nivel dificil
    if(dataLevelPS[1] == 3 || dataLevelPS[1] == 4 || dataLevelPS[1] == 5 || dataLevelPS[1] == 6){
        productsToDraw = 3;
        
        //Cargar productos
        for(int i = 0; i < productsToDraw; i++){
            products.add(new Producto(startDrawX + 200, startDrawY, widthObject, lengthSize, imageToDraw,60));
            startDrawX = startDrawX + 200;
        }
        
        personaUno = new Personas(100, 430, 140, 160, "assets/exercises/bim-4/img/niña.png", 25);
        
        personaDos = new Personas(420, 430, 120, 170, "assets/exercises/bim-4/img/niño.png", 25);
        
        personaTres = new Personas(720, 420, 130, 180, "assets/exercises/bim-4/img/mujer.png", 25);
        
        
    }   
}
          
void draw(){
    if (imgBack.width == 0) {
    // Image is not yet loaded
    } else if (imgBack.width == -1) {
        // This means an error occurred during image loading
    } else {
        // Image is ready to go, draw it
        background(imgBack);
    }
    
    if(dataLevelPS[1] == 7 || dataLevelPS[1] == 8 || dataLevelPS[1] == 9 || dataLevelPS[1] == 10){
    
        //Dibujar personas
        personaUno.display();
        personaDos.display();
        personaTres.display();
        personaCuatro.display();
    
        for(int i = 0; i < products.size(); i++){
            products.get(i).display();

            //hacer que todos los objetos no se junten
            for(int j = 0; j < products.size(); j++){
                if(products.get(i).x != products.get(j).x && products.get(i).y != products.get(j).y){
                    products.get(i).repeler(products.get(j));
                }
            }
        
            if(dist(products.get(i).x+20, products.get(i).y+30, personaUno.x+60, personaUno.y+70)<100){
                products.get(i).touch = true;
             }
            
            if(dist(products.get(i).x+20, products.get(i).y+30, personaDos.x+60, personaDos.y+70)<100){
                products.get(i).touch = true;
             }
            
            if(dist(products.get(i).x+20, products.get(i).y+30, personaTres.x+60, personaTres.y+70)<100){
                products.get(i).touch = true;
             }
            
            if(dist(products.get(i).x+20, products.get(i).y+30, personaCuatro.x+60, personaCuatro.y+70)<100){
                products.get(i).touch = true;
             }
        }
    }
    
    if(dataLevelPS[1] == 1 || dataLevelPS[1] == 2){
    
            
        //Dibujar personas
        personaUno.display();
        personaDos.display();
    
        for(int i = 0; i < products.size(); i++){
            products.get(i).display();

            //hacer que todos los objetos no se junten
            for(int j = 0; j < products.size(); j++){
                if(products.get(i).x != products.get(j).x && products.get(i).y != products.get(j).y){
                    products.get(i).repeler(products.get(j));
                }
            }
        
              if(dist(products.get(i).x+40, products.get(i).y+55, personaUno.x+60, personaUno.y+70)<100){
                products.get(i).touch = true;
             }
            
             if(dist(products.get(i).x+40, products.get(i).y+55, personaDos.x+60, personaDos.y+70)<100){
                products.get(i).touch = true;
             }
        }
    }
    
    if(dataLevelPS[1] == 3 || dataLevelPS[1] == 4 || dataLevelPS[1] == 5 || dataLevelPS[1] == 6){
    
        //Dibujar personas
        personaUno.display();
        personaDos.display();
        personaTres.display();
    
        for(int i = 0; i < products.size(); i++){
            products.get(i).display();

            //Hacer que todos los objetos no se junten
            for(int j = 0; j < products.size(); j++){
                if(products.get(i).x != products.get(j).x && products.get(i).y != products.get(j).y){
                    products.get(i).repeler(products.get(j));
                }
            }
        
              if(dist(products.get(i).x+40, products.get(i).y+55, personaUno.x+60, personaUno.y+70)<100){
                products.get(i).touch = true;
             }
            
            if(dist(products.get(i).x+40, products.get(i).y+55, personaDos.x+60, personaDos.y+70)<100){
                products.get(i).touch = true;
             }
            
             if(dist(products.get(i).x+40, products.get(i).y+55, personaTres.x+60, personaTres.y+70)<100){
                products.get(i).touch = true;
             }
        }
    }
    
    
    //Rectangulo
    noStroke();
    fill(207,207,207,150);
    rect(25, 190, 910, 90, 7);

    //inicializar elementos
    //textSize(80);
    fill(0);            
    //text("Ejercicio de reparto", 100, 40);
    textSize(35);
    text("Se tiene que repartir el siguiente producto de manera que ",30,230);
    text("queden distribuidos entre los niños en partes iguales", 55, 265);

    //tiempo transcurrido
    timeMillis = millis();
    timeReturn = timeMillis/1000;
    

}

int returnToJS(){
    
    int values = new int[3];
    values[0] = 0;
    values[1] = dataLevelPS[1];
    values[2] = timeReturn;
    
    if(dataLevelPS[1] == 7 || dataLevelPS[1] == 8 || dataLevelPS[1] == 9 || dataLevelPS[1] == 10){
    
        for(int i = 0; i < products.size(); i++){
  
            if(products.get(i).touch == true){
                total++;
            }  
        }    
        
        if(total == 4){
            values[0] = 1;
        }else{
            values[0] = 0;
        }
        
            
        returnDataPros(values[0]+", "+values[1]+", "+values[2]);
        console.log("valor: "+total +" , correcto: "+values[0]);
        
        return values[0];
    
    }
    
    
    if(dataLevelPS[1] == 1 || dataLevelPS[1] == 2){
    
        for(int i = 0; i < products.size(); i++){
  
            if(products.get(i).touch == true){
                total++;
            }  
        }    
        
        if(total == 2){
            values[0] = 1;
        }else{
            values[0] = 0;
        }
        
            
        returnDataPros(values[0]+", "+values[1]+", "+values[2]);
        console.log("valor: "+total +" , correcto: "+values[0]);
        
        return values[0];
    
    }
    
    
    if(dataLevelPS[1] == 3 || dataLevelPS[1] == 4 || dataLevelPS[1] == 5 || dataLevelPS[1] == 6){
    
        for(int i = 0; i < products.size(); i++){
  
            if(products.get(i).touch == true){
                total++;
            }  
        }    
        
        if(total == 3){
            values[0] = 1;
        }else{
            values[0] = 0;
        }
        
            
        returnDataPros(values[0]+", "+values[1]+", "+values[2]);
        console.log("valor: "+total +" , correcto: "+values[0]);
        
        return values[0];
    
    }
}


//clase para crear objetos manipulables dentro del canvas
class Producto{
    
    //variables globales
    float x;
    float y;
    float width;
    float length;
    String img;
    int centerImg;
    boolean touch; 

    //constructor por default
    Producto(){
        x = 10;
        y = 400;
        width = 40;
        length = 40;
        img = loadImage("assets/exercises/bim-4/img/coca.png");
        centerImage = 30;
        touch = false;
    }

    //constructor que recibe posicion, tamaño, nombre de imagen y centro de la imagen
    Producto(float posX, float posY, float widthSize, lengthSize, String picImg, int centerImage){
        x = posX;
        y = posY;
        width = widthSize;
        length = lengthSize;
        img = loadImage("assets/exercises/bim-4/img/"+picImg+".png");
        centerImg = centerImage;
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

    //metodo que hace que el producto seleccionado 
    //repela a los demas productos
    void repeler(Producto t){        
        if(dist(x+20, y+30, t.x+20, t.y+30) < 70){
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

//clase para crear un recipiente donde objetos pueden estar
class Personas{
    
    //variables globales
    float x;
    float y;
    float width;
    float length;
    String img;
    int centerImg;

    //constructor por default
    Personas(){
        x = 255;
        y = 255;
        width = 40;
        length = 40;
        img = loadImage("assets/exercises/bim-4/img/niña.png");
    }

    //constructor que recibe posicion, tamaño, nombre de imagen y centro de la imagen
    Personas(float posX, float posY, float widthSize, lengthSize, String picImg, int centerImage){
        x = posX;
        y = posY;
        width = widthSize;
        length = lengthSize;
        img = loadImage(picImg);
        centerImg = centerImage;
    }


    //metodo para hacer drag al objeto
    void display(){
        image(img, x, y, width, length);
    }

}

