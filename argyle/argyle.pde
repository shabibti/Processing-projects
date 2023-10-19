import garciadelcastillo.dashedlines.*;

DashedLines dash;
float displacement_per_frame = 0;
float phase = 0;
int num_rows;
int num_columns;
float side_a = 76; //original value 76
float side_b = 86; //original value 86
float hypotenuse = sqrt(side_a*side_a + side_b*side_b);


public void setup()
{
  size(500, 500);
  num_rows = (int) (height/side_b + 2);
  num_columns = (int) (width/2/side_a + 2);
  print(num_rows, num_columns);
  background(0);
  noStroke();

  dash = new DashedLines(this);
  dash.pattern(10, 8);
}

public void draw()
{
  background(0);
  
  // Draw dotted lines
  strokeWeight(4);
  stroke(191, 44, 142);
  pushMatrix();
  translate(1.2*phase, phase);
  for (int i = -num_columns; i <= 2*num_columns; i++)
  {
    pushMatrix();
    translate(i*2*side_a, 0);
    dash.line(-num_rows*side_a, -num_rows*hypotenuse, num_rows*side_a, num_rows*hypotenuse);
    dash.line(num_rows*side_a, -num_rows*hypotenuse, -num_rows*side_a, num_rows*hypotenuse);
    popMatrix();
  } 
  popMatrix();
  
  //Draw quads
  
  
  phase += displacement_per_frame;
}
