float t = 0;
float dt = TWO_PI/900;
float traj_radius = 100;
float traj_freq = -1;
float perturb_radius = 20;
float perturb_freq = 10;
float beads_per_ring = 35;
float petals = 5;

void setup()
{
  size(300,300,P2D);
  colorMode(HSB, 360, 1, 1);
  background(0,0,0);
  noStroke();
}

void draw()
{
  background(0,0,0);
  translate(150,150);
  
  fill(200,1,1);
  for (float i = 0; i < beads_per_ring; i++)
  {
    float phase = i*TWO_PI/beads_per_ring;
    float perturb = calcPerturb(0 + phase*petals);
    fill(200, (perturb_radius + perturb)/(2*perturb_radius),1);
    circle((traj_radius + perturb)*cos(traj_freq*t + phase), (traj_radius + perturb)*sin(traj_freq*t + phase), 10);
  }
  
  fill(100,1,1);
  for (float i = 0; i < beads_per_ring; i++)
  {
    float phase = i*TWO_PI/beads_per_ring;
    float perturb = calcPerturb(PI + phase*petals);
    fill(100, (perturb_radius + perturb)/(2*perturb_radius),1);
    circle((traj_radius + perturb)*cos(traj_freq*t + phase), (traj_radius + perturb)*sin(traj_freq*t + phase), 10);
  }
 
  t += dt;
}

float calcPerturb(float phase)
{
  return perturb_radius*cos(perturb_freq*t + phase);
}
