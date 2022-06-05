PFont font;
int moveX=27;

void setup() {
size(480, 120);
font = createFont("alfdrake.ttf", 60, true);
textFont(font);
}
void draw() {
background(76, 181, 245);
textSize(36);
text("Ashwin Charath", 0, 30);
textSize(36);
fill(52, 103, 92);
text("IT 10", moveX, 90); // Moving text
moveX++; // +1
if (moveX >= width) {
 moveX=-90;

}
}