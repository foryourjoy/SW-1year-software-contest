void setup() {
  size(1300, 800);
  rectMode(CENTER);
  ellipseMode(CENTER);
  textSize(50);
  background(#216736);
}

//coordinates(card)    
int x = 650;
int y = 400;
int w = 350;//card width
int h = 500;//card height
int d = 100;//card circle diameter
//turn(1: card1 /2: card2)
int di = 1;
//time
int currentTime;
int eventTime = 3000;//3 second
//points
int point_1 = 0;
int point_2 = 0;
//card
//color
int t1;
int t2;
//card number
int n1;
int n2;
//key press 1 time
int ti = 1;

void draw() {
  currentTime = millis();
  if (currentTime >= eventTime - 10 && currentTime <= eventTime + 10) {
    ti = 0;
    if (di == 1) {
      t1 = int(random(1, 4));
      n1 = int(random(1, 6));
      card(t1, n1, x-300);
      di = 2;
    } else {
      t2 = int(random(1, 4));
      n2 = int(random(1, 6));
      card(t2, n2, x+300);//LOVE YOU love you love you
      di = 1;
    }
    eventTime += 1000;
  }
  if (keyPressed && ti != 1) {
    if ((t1 == t2 && n1 + n2 == 5) || (t1 != t2 && (n1 == 5 || n2 == 5))) {
      if (key == 'a') {
        point_1 ++;
        ti = 1;
      } else if (key == 'l') {
        point_2 ++;
        ti = 1;
      }
    } else {
      if (key == 'a') {
        point_1 --;
        point_2 ++;
        ti = 1;
      } else if (key == 'l') {
        point_2 --;
        point_1 ++;
        ti = 1;
      }
    }    
  }
  if(point_1 >= 10 || point_2 >= 10){
    fill(#FFE600);
    text("1p point:", 10, 100);
    text(point_1, 30, 200);
    fill(#F200FF);
    text("2p point:", 1050, 100);
    text(point_2, 1200, 200);
    fill(0);
    rect(x, y, 1000, 500, 20);
    textSize(100);
    if(point_1>=10){
      fill(#FFE600);
      text("Player 1 win!!!",width/2-320,height/2+10);
    }
    if(point_2>=10){
      fill(#F200FF);
      text("Player 2 win!!!",width/2-320,height/2+10);
    }
    noLoop();
  }
  }
  
//card design
void card(int type, int num, int x) {
  fill(255);
  strokeWeight(5);
  rect(x, y, w, h, 20);//card dimension
  
  //circle color
  if (type==1) {
    fill(255, 0, 0);
  } else if (type==2) {
    fill(0, 255, 0);
  } else {
    fill(0, 0, 255);
  }
  
  //circle dimension
  if (num == 1) {
    ellipse(x, y, d, d);
  } else if (num == 2) {
    ellipse(x-(w/4), y-(h/4), d, d);
    ellipse(x+(w/4), y+(h/4), d, d);
  } else if (num == 3) {
    ellipse(x-(w/4), y-(h/4), d, d);
    ellipse(x, y, 100, 100);
    ellipse(x+(w/4), y+(h/4), d, d);
  } else if (num == 4) {
    ellipse(x-(w/4), y-(h/4), d, d);
    ellipse(x+(w/4), y+(h/4), d, d);
    ellipse(x-(w/4), y+(h/4), d, d);
    ellipse(x+(w/4), y-(h/4), d, d);
  } else {
    ellipse(x-(w/4), y-(h/4), d, d);
    ellipse(x, y, 100, 100);
    ellipse(x+(w/4), y+(h/4), d, d);
    ellipse(x-(w/4), y+(h/4), d, d);
    ellipse(x+(w/4), y-(h/4), d, d);
  }
}
