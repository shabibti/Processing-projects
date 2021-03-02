float t = 0; //time in...some units
int t_count = 0; //discrete counter; row_shift conditions based on t alone don't work due to precision complications
//int loop_count = 0;
//int frame_count = 0;
int t_speed = 60; //inverse of increment of PI by which t increases
float size = 64; //side length of a single tile
boolean row_shift = true; //true when tiles move along x-axis, false when along y-axis
float[] x = new float[32]; //tile x-coords
float[] y = new float[32]; //tile y-coords

void setup()
{
  size(512,512);
  stroke(255);
  fill(255);
  
  //initialize coordinate arrays for tiles
  for (int i=0; i<8; i++)
  {
    for (int j=0; j<4; j++)
    {
      y[4*i + j] = i*64;
      if (i%2==0)
      {x[4*i + j] = j*128;}
      else
      {x[4*i + j] = j*128 + 64;}
    }
  }
}

void draw()
{
  background(0);
  for (int i = 0; i < 32; i++)
  {
    float dx=0;
    float dy=0;
    if (row_shift)
    {
      if (x[i]%128==0)
      {dx = abs(64*sin(t));}
      else
      {dx = -abs(64*sin(t));}
    }
    else
    {
      if (y[i]%128==0)
      {dy = abs(64*sin(t));}
      else
      {dy = -abs(64*sin(t));}
    }
    
    pushMatrix();
    translate((x[i]+dx),(y[i]+dy));
    square(0,0,size);
    popMatrix();
  }
  
  t+=PI/t_speed;
  t_count++;
  if (t_count == t_speed/2)
  {
    row_shift = !row_shift;
    t_count=0;
    //loop_count+=1;
  }
  
  //save enough frames for a single loop
  //if (loop_count<=1)
  //{
  //  save("frames/frame"+nf(frame_count,4)+".png");
  //  frame_count++;
  //}
}
