#include <LiquidCrystal.h>


int lcdRSP = 12;

int lcdEP = 11;

int lcd4P = 5;

int lcd5P = 4;

int lcd6P = 3;

int lcd7P = 2;


JSONObject = json;


LiquidCrystal lcd(lcdRSP, lcdEP, lcd4P, lcd5P, lcd6P, lcd7P);



void setup() {

  json = loadJSONObject("https://script.googleusercontent.com/macros/echo?user_content_key=UfuoIm9oOlTxrr0XWZc0tOhANYBP1IAOorQVn1HDAyxMGMtO-c37Ttdt8PqtINbqI6f1-5gp0Hs1OiuOQArbwmdcfI9PPjmgm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnJ9GRkcRevgjTvo8Dc32iw_BLJPcPfRdVKhJT5HNzQuXEeN3QFwl2n0M6ZmO-h7C6bwVq0tbM60-GgDe_IDXkwWa4wZe3ejg8w&lib=MwxUjRcLr2qLlnVOLh12wSNkqcO1Ikdrk");

  if (client.connect(server, 80)) {

    client.println("https://script.googleusercontent.com/macros/echo?user_content_key=UfuoIm9oOlTxrr0XWZc0tOhANYBP1IAOorQVn1HDAyxMGMtO-c37Ttdt8PqtINbqI6f1-5gp0Hs1OiuOQArbwmdcfI9PPjmgm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnJ9GRkcRevgjTvo8Dc32iw_BLJPcPfRdVKhJT5HNzQuXEeN3QFwl2n0M6ZmO0-h7C6bwVq0tbM60-GgDe_IDXkwWa4wZe3ejg8w&lib=MwxUjRcLr2qLlnVOLh12wSNkqcO1Ikdrk");

    client.println();

}
  
char json[] = {};
  
char c ;
  
while (client.available()) {

  c = client.read();
     
  json[] = c;

  int hours = json.getInt("hours");

  int mins = json.getInt("minutes");

  int sec = json.getInt("seconds");

  println(id + ", " + species + ", " + name);

  lcd.begin(16, 2);

  lcd.print (hours + ":" + mins + ":" + sec);
  

}


void loop() {

  lcd.setCursor(0, 1);

  lcd.print(millis() / 1000);

}
