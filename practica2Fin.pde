//Guardamos la posición de los puntos
ArrayList<Float[]> vectores = new ArrayList<Float[]>();
boolean volumen = false; //Es True cuando el volumen está finalido
int nElement = 0;
float[][] arrayv; //Array auxiliar
PShape obj;

void setup(){
  size(1000,600, P3D);
  background(255);
  textSize(18); 
  fill(0);
  text("Pulsa S para generar el volumen", 350, 590 );
  obj=createShape();
  
  //Dibujamos una linea central que será el eje de giro
  line(width/2, 30, width/2, height-30);
  strokeWeight(7); 
}

void draw() {
  if(volumen){
    background(255);
    translate(mouseX, mouseY);
    shape(obj);
  }
}
void pintarVolumen(){
  float angulo;
  float medio = width/2;
  obj.beginShape(TRIANGLE_STRIP);
  obj.fill(102);
  obj.strokeWeight(2);
  int nVueltas = 360 / 10;
  for(int i = 0; i< vectores.size()-1;i++){
    Float[] aux = vectores.get(i);
    Float[] aux2 = vectores.get(i+1);
    for(int a = 0;a<nVueltas-1 ;a++){
      angulo = radians(nVueltas*a);
      obj.vertex((aux[0]-medio)*cos(angulo),aux[1],(aux[0]-medio)*sin(angulo));
      obj.vertex((aux2[0]-medio)*cos(angulo),aux2[1],(aux2[0]-medio)*sin(angulo));
    }
  }
  obj.endShape();
  shape(obj);
}

void mouseClicked() {
  vectores.add(nElement,new Float[]{(float)mouseX,(float)mouseY,0.0});
  point(mouseX,mouseY,0);
  nElement++;
}

void keyPressed(){
  int k = key;
  if(k == 115){ //Empieza a generar el solido
    arrayv = new float[vectores.size()][3];
    background(255);
    pintarVolumen();
    volumen = true;
  }
}
