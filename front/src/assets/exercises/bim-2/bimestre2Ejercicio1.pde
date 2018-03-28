//variables globales
PImage imgBack;

//variable para recibir info de level y estatus desde JS
int[] dataLevelPS = new int[3];

//variables para iniciar a dibujar los objetos
int startDrawX = 120;
int startDrawY = 100;
int widthObject = 40;
int lengthSize = 50;
int centerImg = 30;
ArrayList objects;
String [] objectNames = new String[5];
objectNames[0] = "fruit1";
objectNames[1] = "fruit2";
objectNames[2] = "fruit3";
objectNames[3] = "fruit4";
objectNames[4] = "fruit5";
int posImg=0;
String imageToDraw;
int countDecenas;
RectButton btnYes;
RectButton btnNo;
int btnYX = 640;
int btnYY =250;
int btnNX = 750;
int btnNY =250;
int btnISize = 70;
int statusGame;
float objectsToDraw;
int decenasValue;
long timeMillis;
float timeReturn;

String[] arregloDatos = new String[3];


color buttoncolor = color(224,224,224);
color highlight = color(255,152,92);


void setup() {
    size(945, 600); 
    
    //cargar elementos graficos
    imgBack = requestImage("assets/exercises/bim-2/img/fondoJardin.png");

    arregloDatos = split(getDataFromHtml(), ",");
    dataLevelPS[0]=arregloDatos[0];
    dataLevelPS[1]=arregloDatos[1];
    dataLevelPS[2]=arregloDatos[2];


    //declarar botones
    btnYes = new RectButton(btnYX, btnYY, btnISize, buttoncolor, highlight);
    btnNo = new RectButton(btnNX, btnNY, btnISize, buttoncolor, highlight);
    statusGame = 0;
    
    //identificar cantidad de objetos a dibujar
    objects = new ArrayList();
    objectsToDraw = 0;
    posImg = int(random(0,4));
    imageToDraw = objectNames[posImg];

    //nivel facil
    if(dataLevelPS[1] == 1 || dataLevelPS[1] == 2 || dataLevelPS[1] == 3){
        objectsToDraw = random(9,25);
        decenasValue = 1;
    }
    //nivel medio
    if(dataLevelPS[1] == 4 || dataLevelPS[1] == 5 || dataLevelPS[1] == 6){
        objectsToDraw = random(15,35);
        decenasValue = 2;
    }
    //nivel dificil
    if(dataLevelPS[1] == 7 || dataLevelPS[1] == 8 || dataLevelPS[1] == 9 || dataLevelPS[1] == 10){
        objectsToDraw = random(25,40);
        decenasValue = int(random(3,5));
    }


    //Cargar objetos
    //int(objectsToDraw)
    for(int i=0;i<int(objectsToDraw); i++){
        if(countDecenas<10){
            if(startDrawX>=370){
                startDrawX = 120;
                startDrawY = startDrawY + 55;
            }
            objects.add(new Thing(startDrawX, startDrawY, widthObject, lengthSize, imageToDraw,centerImg));
            startDrawX = startDrawX + 50;   

            countDecenas = countDecenas + 1;

        }else{
            startDrawY = startDrawY + 20;
            countDecenas = 0;
            
        }
   
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
    
    //dibujar rectangulos
    showRect();

    //dibujar botones
    btnYes.display(" SI");
    btnNo.display("NO");
    
    //dibujar los objetos en el canvas
    //basket.display();

    for(int i=0;i<objects.size(); i++){
        objects.get(i).display();


    }

    //inicializar elementos graficos
    textSize(50);
    fill(255, 255, 255);            
    text("Ejercicio decenas", 290, 60); 
    textSize(30);
    if(decenasValue<=1){
        text("¿Es "+decenasValue+" decena?", 630,200);
    }else{
        text("¿Son "+decenasValue+" decenas?", 630,200);
    }

    //tiempo transcurrido
    timeMillis = millis();
    timeReturn = timeMillis/1000;

    //acciones rectangulos
    //btnYes.overRect();
    //btnNo.overRect();

}

//metodo para crear rectablgulos
void showRect(){
    noStroke();
    fill(255, 255, 255, 90);
    rect(110, 95, 260, 115, 7);
    rect(110, 225, 260, 115,7);
    rect(110, 355, 260, 115,7);
    rect(110, 480, 260, 115,7);
}

//para identificar si le doy clic a un rectangulo
//guardar el estatus del juego en la sesion
void mousePressed(){
    int objectsDraw = objects.size();
    if(btnYes.overRect()){
        btnNo.returnColor();
        btnYes.changeColor();
        if(objectsDraw == (decenasValue*10)){
            statusGame = 1;
        }else{
            statusGame = 0;
        }
    }
    if(btnNo.overRect()){
        btnYes.returnColor();
            btnNo.changeColor();
        if(objectsDraw == (decenasValue*10)){
            statusGame = 1;
        }else{
            statusGame = 0;
        }
    }
}

//Regresa a JS un arreglo [a,b], 
// a = ejercicio correcto o incorrecto
// b = nivel que se jugo
//identifica cuantos objetos hay en el basket
//regresa la cantidad de objetos actuales dentro de la canasta
int[] returnToJS(){
    int aux = new int[3];
    aux[0] = 0;
    aux[1] = dataLevelPS[1];
    aux[2] = timeReturn;
    if(statusGame == 1){
        aux[0] = 0;
    }else{
        aux[0] = 1;
    }

    returnDataPros(aux[0]+","+aux[1]+","+aux[2]);   
    return aux;
}



class RectButton{

    int x;
    int y; 
    int size; 
    color currentcolor;
    color highlight;
    String data;
    color auxCurrentColor;
    color strokeColor = color(255,255,255);

    RectButton(int ix, int iy, int isize, color icolor, color ihighlight){
        x = ix;
        y = iy;
        size = isize;
        basecolor = icolor;
        highlight = ihighlight;
        currentcolor = basecolor;
        auxCurrentColor = currentcolor;
    }

    //identificar si estoy sobre un rectangulo
    boolean overRect(){
        if (mouseX >= x && mouseX <= x+size && 
            mouseY >= y && mouseY <= y+size) {
            fill(highlight);
            rect(x, y, size, size);
            fill(0);
            textSize(30);
            text(data, x+15, y+45);
            return true;
        } else {
            return false;
        }
    }

    void changeColor(){
        currentcolor = highlight;
        strokeColor = color(0);
        display(data);
    }

    void returnColor(){
        currentcolor = auxCurrentColor;
        strokeColor = color(255,255,255);
        display(data);
    }

    void display(String dataAux){
        stroke(strokeColor);
        strokeWeight(3);

        fill(currentcolor);
        rect(x, y, size, size);

        fill(0);
        textSize(30);
        data = dataAux;
        text(data, x+15, y+45);

    }

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
        img = loadImage("assets/exercises/bim-2/img/pet1.png");
        centerImage = 30;
        touch = false;
    }

    //constructor que recibe posicion, tamaño, nombre de imagen y centro de la imagen
    Thing(float posX, float posY, float widthSize, lengthSize, String picImg, int centerImage){

        x = posX;
        y = posY;
        width = widthSize;
        length = lengthSize;
        img = loadImage("assets/exercises/bim-2/img/"+picImg+".png");
        centerImg = centerImage;
        touch = false;
    }

    //metodo para dibujar en canvas el objeto
    void display(){
        image(img, x, y, width, length);
        //this.drag();
    }

}

