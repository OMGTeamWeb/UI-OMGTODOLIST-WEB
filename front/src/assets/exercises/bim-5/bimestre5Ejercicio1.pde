//Variables globales
PImage imgBack;

//Variable para recibir info de level y estatus desde JS 
int[] dataLevelPS = new int[3];

//Variables para iniciar a dibujar los monitos
int startDrawIXMonito = 100;
int startDrawIYMonito = 258;
int startDrawDXMonito = 525;
int startDrawDYMonito = 258;
int widthMonito = 38;
int lengthMonito = 60;
ArrayList monitosI;
ArrayList monitosD;
ArrayList monitos;
String[] monitosSexo = new String[2];
monitosSexo[0] = "monito";
monitosSexo[1] = "monita";
int posImg = 0;
String monitoToDraw;
int monitosICant;
int monitosDCant;
int cantDibujar;
int posResp = 0;
String auxiliar;

String[] arregloDatos = new String[3];

//Variables para dibujar los botones
RectButton [] botones = new RectButton[3];
int btnX = 300;
int btnY = 420;
int btnSize = 70;
color buttonColor = color(247, 114, 37);
color highlight = color(224, 224, 224);

//Cargando barcos
Barco barcoUno;
Barco barcoDos;

long timeMillis;
float timeReturn;


int[] valores = new int[3];
int[] posValores = new int[3];
String texto1;
String texto2;
String texto3;
String texto4;
int valorCorrectoResta;
int valorCorrectoSuma;

void setup(){
    size(945, 600);
    
    //Cargar elementos graficos 
    imgBack = requestImage("assets/exercises/bim-5/img/fondoPlaya.png");
    
    arregloDatos = split(getDataFromHtml(), ",");
    dataLevelPS[0]=arregloDatos[0];
    dataLevelPS[1]=arregloDatos[1];
    dataLevelPS[2]=arregloDatos[2];

    //Identificar cuantos monitos dibujar
    monitosI = new ArrayList();
    monitosD = new ArrayList();
    monitos = new ArrayList();
    monitosICant = 0;
    monitosDCant = 0;
    posImg = int(random(0, 2));
    //posImg = 1;
    monitosToDraw = monitosSexo[posImg];
    
     //Nivel facil
    if(dataLevelPS[1] == 1 || dataLevelPS[1] == 2){
        cantDibujar = int(random(2,6));
        if(cantDibujar==2){
            monitosICant=1;
            monitosDCant=1;
        }else{
            monitosICant = int(random(1, (cantDibujar-1)));
            monitosDCant = cantDibujar - monitosICant;
        }

        valores[0]=cantDibujar;
        valores[1]=int(random(1,cantDibujar));
        valores[2]=int(random(cantDibujar+1,8));

        texto1 = "¿Cuántas personas hay en";
        texto2 = "total por los 2 barcos?";

        for(int i = 0; i < monitosICant; i++){
            monitosI.add(new Monito(startDrawIXMonito + 60, startDrawIYMonito, widthMonito, lengthMonito, monitosToDraw,15));
            startDrawIXMonito = startDrawIXMonito + 40;
        }
        
        for(int j = 0; j < monitosDCant; j++){
            monitosD.add(new Monito(startDrawDXMonito + 65, startDrawDYMonito, widthMonito, lengthMonito, monitosToDraw,15));
            startDrawDXMonito = startDrawDXMonito + 40;
        }

        valorCorrectoSuma = cantDibujar;
        
    }

    if(dataLevelPS[1] == 3 || dataLevelPS[1] == 4 || dataLevelPS[1] == 5){
        cantDibujar = int(random(5,10));
        monitosICant = int(random(1, (cantDibujar-1)));
        monitosDCant = cantDibujar - monitosICant;
        
        valores[0]=cantDibujar;
        valores[1]=int(random(1,cantDibujar));
        valores[2]=int(random(cantDibujar+1,15));

        texto1 = "¿Cuántas personas hay en";
        texto2 = "total por los 2 barcos?";

        for(int i = 0; i < monitosICant; i++){
            monitosI.add(new Monito(startDrawIXMonito + 65, startDrawIYMonito, widthMonito, lengthMonito, monitosToDraw,15));
            startDrawIXMonito = startDrawIXMonito + 40;
        }
        
        for(int j = 0; j < monitosDCant; j++){
            monitosD.add(new Monito(startDrawDXMonito + 60, startDrawDYMonito, widthMonito, lengthMonito, monitosToDraw,15));
            startDrawDXMonito = startDrawDXMonito + 40;
        }

        valorCorrectoSuma = cantDibujar;
        
    }
    
    //Restaaaaaaaaaaaaaaaaaaaa
    if(dataLevelPS[1] == 6 || dataLevelPS[1] == 7){
        cantDibujar = int(random(3 ,7));
        
        valores[0]=cantDibujar-2;
        valores[1]=int(random(1,cantDibujar));
        valores[2]=int(random((cantDibujar)+1,9));

        texto3 = "Si hay "+cantDibujar +" personas en el barco blanco y pasamos";
        texto4 = "a " +2+ " al barco negro ¿Cuántas quedan?";
        
        for(int i = 0; i < cantDibujar; i++){
            monitos.add(new Monito(startDrawIXMonito + 60, startDrawIYMonito, widthMonito, lengthMonito, monitosToDraw,15));
            startDrawIXMonito = startDrawIXMonito + 40;
        }
        
        valorCorrectoResta=cantDibujar-2;

    }
    
    if(dataLevelPS[1] == 8 || dataLevelPS[1] == 9 || dataLevelPS[1] == 10){
        cantDibujar = int(random(5, 9));
        
        valores[0]=cantDibujar-2;
        valores[1]=int(random(1,cantDibujar));
        valores[2]=int(random((cantDibujar)+1,12));

        texto3 = "Si hay "+cantDibujar +" personas en el barco blanco y pasamos";
        texto4 = "a " +2+ " al barco negro ¿Cuántas quedan?";
        
        for(int i = 0; i < cantDibujar; i++){
            monitos.add(new Monito(startDrawIXMonito + 60, startDrawIYMonito, widthMonito, lengthMonito, monitosToDraw,15));
            startDrawIXMonito = startDrawIXMonito + 40;
        }
        
        valorCorrectoResta=cantDibujar-2;

    }

     barcoUno = new Barco(20, 250, 430, 101, "img/barco.png");
     barcoDos = new Barco(460, 250, 410, 101, "img/barco2.png");
     
    //boton en el que se posicionará la respuesta

    int auxpv1=int(random(0,3));
    int auxpv2=int(random(0,3));
    int auxpv3=int(random(0,3));

    posValores[0]=valores[auxpv1];

    while(auxpv2==auxpv1){
        auxpv2=int(random(0,3));
    }

    posValores[1]=valores[auxpv2];

    while(auxpv3==auxpv1 || auxpv3==auxpv2){
        auxpv3=int(random(0,3));
    }

    posValores[2]=valores[auxpv3];

    for(int b = 0; b < botones.length(); b++){
        botones[b] = new RectButton(btnX, btnY, btnSize, buttonColor, highlight, " "+posValores[b]+"");
        btnX = btnX + 150;       
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
    
    barcoUno.display();
    barcoDos.display();

    if(dataLevelPS[1] == 1 ||dataLevelPS[1] == 2 || dataLevelPS[1] == 3 || 
        dataLevelPS[1] == 4 || dataLevelPS[1] == 5){
        
        //Dibujar monitos
        for(int i = 0; i < monitosI.size(); i++){
            monitosI.get(i).display();
        }
        
        for(int j = 0; j < monitosD.size(); j++){
            monitosD.get(j).display();
        }
        
        //Rectangulo
        noStroke();
        fill(207,207,207,150);
        rect(220,70, 480, 110, 7);
    
        
    }else{
       for(int i = 0; i < monitos.size(); i++){
            monitos.get(i).display();
            monitos.get(i).drag();
            
        //Rectangulo
        noStroke();
        fill(207,207,207,50);
        rect(105,65, 780, 110, 7);
        
        } 
    }
    

    
    //dibujar botones
    for(int b = 0; b < botones.length(); b++){
        botones[b].display();
        botones[b].overRect();
    }


    //inicializar elementos
    fill(0);            
    textSize(35);
    text(texto1, 250,110);
    text(texto2, 285, 150);
    text(texto3, 120, 110);
    text(texto4, 210, 150);
            
    //tiempo transcurrido
    timeMillis = millis();
    timeReturn = timeMillis/1000;

}

//Para identificar si le doy clic a un rectangulo
//guardar el estatus del juego en la sesion

void mousePressed(){

    if(botones[0].overRect()){
        botones[1].returnColor();
        botones[2].returnColor();
        botones[0].changeColor();
        
        if(dataLevelPS[1] == 1 ||dataLevelPS[1] == 2 || dataLevelPS[1] == 3 || 
        dataLevelPS[1] == 4 || dataLevelPS[1] == 5){
            
            if(cantDibujar == botones[0].dataAux){
                statusGame = 1;
            }else{
                statusGame = 0;
            }    
        }else{
            if(valorCorrectoResta == botones[0].dataAux){
                statusGame = 1;
            }else{
                statusGame = 0;
            }    
        }
    }
    
    if(botones[1].overRect()){
        botones[0].returnColor();
        botones[2].returnColor();
        botones[1].changeColor();
        
        if(dataLevelPS[1] == 1 ||dataLevelPS[1] == 2 || dataLevelPS[1] == 3 || dataLevelPS[1] == 4 || dataLevelPS[1] == 5){   
        
            if(cantDibujar == botones[1].dataAux){
                botones[2].returnColor();
                botones[0].returnColor();
                botones[1].changeColor();
                statusGame = 1;
            }else{
                statusGame = 0;
            }   
        }else{
            if(valorCorrectoResta == botones[1].dataAux){
                botones[2].returnColor();
                botones[0].returnColor();
                botones[1].changeColor();
                statusGame = 1;
            }else{
                statusGame = 0;
            }  
        }    
    }

    if(botones[2].overRect()){
        botones[0].returnColor();
        botones[1].returnColor();
        botones[2].changeColor();
        
        if(dataLevelPS[1] == 1 ||dataLevelPS[1] == 2 || dataLevelPS[1] == 3 || dataLevelPS[1] == 4 || dataLevelPS[1] == 5){   
        
            if(cantDibujar == botones[2].dataAux){
                botones[1].returnColor();
                botones[0].returnColor();
                botones[2].changeColor();
                statusGame = 1;
            }else{
                statusGame = 0;
            }   
        }else{
            if(valorCorrectoResta == botones[2].dataAux){
                botones[1].returnColor();
                botones[0].returnColor();
                botones[2].changeColor();
                statusGame = 1;
            }else{
                statusGame = 0;
            }  
        }       
    }
}


int[] returnToJS(){
    int aux = new int[3];
    aux[0] = 0;
    aux[1] = dataLevelPS[1];
    aux[2] = timeReturn;
    if(statusGame == 1){
        aux[0] = 1;
    }else{
        aux[0] = 0;
    }

    returnDataPros(aux[0]+","+aux[1]+","+aux[2]);   
    return aux[0];
}


class Barco{

    float x;
    float y;
    float width;
    float length;
    String img;
    
    
    //Constructor por default
    Barco(){
        x = 50;
        y = 200;
        width = 226;
        length = 101;
        img = loadImage("assets/exercises/bim-5/img/barco.png"); 
    }
    
    Barco(float posX, float posY, float widthSize, float lengthSize, String picImg){
        
        x = posX;
        y = posY;
        width = widthSize;
        length = lengthSize;
        img = loadImage(picImg);
    
    }
    
    //Metodo para dibujar el barco
    void display(){
        image(img, x, y, width, length);
    }
}

class Monito{

    float x;
    float y;
    float width;
    float length;
    String img;
        int centerImg;

    
    //Constructor por default
    Monito(){
        x = 70;
        y = 220;
        width = 50;
        length = 53;
        img = loadImage("assets/exercises/bim-5/img/monito.png"); 
    }
    
    Monito(float posX, float posY, float widthSize, float lengthSize, String picImg, int icenterImg){
        
        x = posX;
        y = posY;
        width = widthSize;
        length = lengthSize;
        img = loadImage("assets/exercises/bim-5/img/"+picImg+".png");
        centerImg = icenterImg;
    
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
    
    //Metodo para dibujar en canvas el monito
    void display(){
        image(img, x, y, width, length);
    }
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
    String dataAux;

    RectButton(int ix, int iy, int isize, color icolor, color ihighlight, String dataAuxBtn){
        x = ix;
        y = iy;
        size = isize;
        basecolor = icolor;
        highlight = ihighlight;
        currentcolor = basecolor;
        auxCurrentColor = currentcolor;
        dataAux = dataAuxBtn;
        
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

    void display(){
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



