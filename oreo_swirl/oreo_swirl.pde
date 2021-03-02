float[] theta = new float[60];
float k = 3.2; //essentially sets the curvature
float loops = 6;
float t = 0;
int curve_cap = 15;
int vertex_cap = 20;

//parameter for gif recording
//int frame_count = 0;

void setup()
{
  size(300,300);
  background(0);
  strokeWeight(4);
  noFill();
  //frameRate(60);
  
  for (int i = 0; i < theta.length; i++)
  {
    theta[i] = (float(i)/theta.length) * 2*PI*loops;
  }
}

void draw()
{
  background(0); //include this line for moving spiral
  for (int j = 0; j<min(3*int(t),curve_cap); j++)
  {
    pushMatrix();
    translate(150,150);
    rotate(1.2*float(j)/(2*PI));
    scale(2.5);
    stroke(255-15*j);
    drawSpiral();
    popMatrix();
  }
  t+=.45;
  
  //if (t<=theta.length)
  //{
  //  save("frames/frame"+nf(frame_count,6)+".png");
  //  frame_count++;
  //}
}

void drawSpiral()
{
  beginShape();
  for (int i = max((int(t)%theta.length)-vertex_cap,0); i < (int(t)%theta.length); i++)
  {
    curveVertex(x(k*theta[i], theta[i]), y(k*theta[i], theta[i]));
  }
  endShape();
}

float x(float r, float t)
{
  return r*cos(t);
}

float y(float r, float t)
{
  return r*sin(t);
}
