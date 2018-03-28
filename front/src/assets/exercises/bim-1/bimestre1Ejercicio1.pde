//variables globales
PImage imgBack;

//variable para recibir info de level y estatus desde JS
int[] dataLevelPS = new int[3];

//variables para iniciar a dibujar los objetos
int startDrawX = 70;
int startDrawY = 180;
int widthObject = 50;
int lengthSize = 60;
int centerImg = 40;
ArrayList objects;
String [] objectNames = new String[4];
objectNames[0] = "fruit1";
objectNames[1] = "fruit2";
objectNames[2] = "fruit3";
objectNames[3] = "fruit4";
int posImg=0;
String imageToDraw;
Basket basket;
String nameBasket;
int countTouch = 0;
long timeMillis;
float timeReturn;

String[] arregloDatos = new String[3];


void setup() {
    size(945, 600); 
    
    //cargar elementos graficos
    imgBack = requestImage("assets/exercises/bim-1/img/fondoJardin.png");
    nameBasket = "basket";
    basket = new Basket(360,300,300,300,nameBasket,30);

    arregloDatos = split(getDataFromHtml(), ",");
    dataLevelPS[0]=arregloDatos[0];
    dataLevelPS[1]=arregloDatos[1];
    dataLevelPS[2]=arregloDatos[2];
 
    //identificar cantidad de objetos a dibujar
    objects = new ArrayList();
    float objectsToDraw = 0;
    posImg = int(random(0,4));
    imageToDraw = objectNames[posImg];

    //nivel facil
    if(dataLevelPS[1] == 1 || dataLevelPS[1] == 2 || dataLevelPS[1] == 3){
        objectsToDraw = random(dataLevelPS[1]-1,3);
    }
    //nivel medio
    if(dataLevelPS[1] == 4 || dataLevelPS[1] == 5 || dataLevelPS[1] == 6){
        objectsToDraw = random(dataLevelPS[1]-1,6);
    }
    //nivel dificil
    if(dataLevelPS[1] == 7 || dataLevelPS[1] == 8 || dataLevelPS[1] == 9 || dataLevelPS[1] == 10){
        objectsToDraw = random(dataLevelPS[1]-1,10);
    }

    //Cargar objetos
    for(int i=0;i<objectsToDraw; i++){
        if(startDrawX>=400){
            startDrawX = 70;
            startDrawY = startDrawY + 90;
        }
        objects.add(new Thing(startDrawX, startDrawY, widthObject, lengthSize, imageToDraw,30));
        startDrawX = startDrawX + 90;
        
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
    basket.display();

    for(int i=0;i<objects.size(); i++){
        objects.get(i).display();

        //identificar si el objeto esta dentro de la canasta
        if(dist(basket.x+150,basket.y+150,objects.get(i).x+25,objects.get(i).y+35)<190){
            objects.get(i).touch = true;
        }else{
            objects.get(i).touch = false;
        }

        //hacer que todos los objetos no se junten
        for(int j = 0; j<objects.size(); j++){
            if(objects.get(i).x != objects.get(j).x && objects.get(i).y != objects.get(j).y){
                objects.get(i).repeler(objects.get(j));
            }
        }

    }

    //inicializar elementos
    textSize(50);
    fill(0);            
    text("Ejercicio unidades", 240, 100); 
    textSize(35);
    text("Mete "+dataLevelPS[1]+" objetos", 620, 220);
    text("a la canasta", 640, 270);
    textSize(20);

    //tiempo transcurrido
    timeMillis = millis();
    timeReturn = timeMillis/1000;

}

//Regresa a JS un arreglo [a,b], 
// a = ejercicio correcto o incorrecto
// b = nivel que se jugo
//identifica cuantos objetos hay en el basket
//regresa la cantidad de objetos actuales dentro de la canasta

int[] returnToJS(){
    int count = 0;
    int values = new int[3];
    values[0] = 0;
    values[1] = dataLevelPS[1];
    values[2] = timeReturn;

    //identificar cuantos objetos hay
    for(int i = 0; i<objects.size();i++){
        if(objects.get(i).touch == true){
            count++;
        }
    }

    //evaluar si el ejercicio es correcto
    //1 correcto, 0 incorrecto
    if(count == dataLevelPS[1]){
        values[0] = 1;
    }else{
        values[0] = 0;
    }

    //regresar valores a JS
    returnDataPros(values[0]+","+values[1]+","+values[2]);   

    return values;
}

//clase para crear objetos manipulables dentro del canvas
class Thing{
    
    //variables globales
    float x;
    float y;
    float width;
    float length;
    String img;
    int centerImg;
    boolean touch; 

    //constructor por default
    Thing(){
        x = 10;
        y = 400;
        width = 40;
        length = 40;
        img = loadImage("assets/exercises/bim-1/img/pet1.png");
        centerImage = 30;
        touch = false;
    }

    //constructor que recibe posicion, tamaño, nombre de imagen y centro de la imagen
    Thing(float posX, float posY, float widthSize, lengthSize, String picImg, int centerImage){
        x = posX;
        y = posY;
        width = widthSize;
        length = lengthSize;
        img = loadImage("assets/exercises/bim-1/img/"+picImg+".png");
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

    //metodo que hace que el objeto seleccionado 
    //no se junte con el que está chocando
    void repeler(Thing t){        
        if(dist(x+25, y+35, t.x+25, t.y+35) < 50){
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
class Basket{
    
    //variables globales
    float x;
    float y;
    float width;
    float length;
    String img;
    int centerImg;

    //constructor por default
    Basket(){
        x = 255;
        y = 255;
        width = 40;
        length = 40;
        img = loadImage("assets/exercises/bim-1/img/pet1.png");
    }

    //constructor que recibe posicion, tamaño, nombre de imagen y centro de la imagen
    Basket(float posX, float posY, float widthSize, lengthSize, String picImg, int centerImage){
        x = posX;
        y = posY;
        width = widthSize;
        length = lengthSize;
        img = loadImage("assets/exercises/bim-1/img/"+picImg+".png");
        centerImg = centerImage;
    }


    //metodo para hacer drag al objeto
    void display(){
        image(img, x, y, width, length);
    }

}

