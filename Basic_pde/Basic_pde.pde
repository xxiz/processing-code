void setup(){
size(400,400);
i = 0;
}

int i;
void draw(){
ellipse(i, height/2, 50, 50+i); // X Cord, Y Cord, Hieght, Width
i++;

}

void ellipse(){
ellipse(i,height/2, 50, 50+i);
i++;
background(63, 209, 200);
}