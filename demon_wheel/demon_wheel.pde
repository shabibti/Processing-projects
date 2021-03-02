float num_point = 220;
float amplitude = 1.3;
float frequency = .05;
float phase = 0;
float phase_increment = 2*PI/100;
float rotation_rate = .10;
float num_waves = 20;

//int frame_count = 0;

void setup()
{
  size(500, 500);
  background(0);
  colorMode(RGB,100);
  stroke(100,100,100);
  strokeWeight(1.25);
  noFill();
}

void draw()
{
  background(0,0,0);
  translate(250, 250);
  stroke(100,100,100);
  for (int j = 0; j < num_waves; j++)
  {
    drawSineWave(((float) j) * (2*PI/(num_waves*rotation_rate)), -1);
    drawCosWave(((float) j) * (2*PI/(num_waves*rotation_rate)), 1);
  }
  stroke(100,100,100);
  circle(0,0,2*num_point);
  phase += phase_increment;
  
  //if (frame_count<100)
  //{
  //  save("frames/frame"+nf(frame_count,6)+".png");
  //  frame_count++; 
  //}
}

//@offset: angle of entire curve about canvas horizontal
void drawSineWave(float offset, float sign)
{
  pushMatrix();
  rotate((phase + offset)*rotation_rate*sign);

  beginShape();
  for (int i = 0; i < num_point; i++)
  {
    curveVertex(i, (sqrt((float) i))*amplitude*sin(frequency*i + phase));
  }
  endShape();

  popMatrix();
}

//@offset: angle of entire curve about canvas horizontal
void drawCosWave(float offset, float sign)
{
  pushMatrix();
  rotate((phase + offset)*rotation_rate*sign);

  beginShape();
  for (int i = 0; i < num_point; i++)
  {
    curveVertex(i, (sqrt((float) i))*amplitude*sin(frequency*i + phase + PI));
  }
  endShape();

  popMatrix();
}
