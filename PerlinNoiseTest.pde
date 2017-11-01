float inc = 0.1 ; //0.1
float scl = 20 ;
int cols ; 
int rows;

PVector[][] vectors ;
Particle[] particles ;
int population = 200 ; // 50
float zoff = 0 ;
float zinc = 0.01 ; // 0.001 // 0.01 erinnert an rauch

public void setup() 
{
    size(640, 640,P2D);
    background(255);
    this.rows = floor(height/scl);
    this.cols = floor(width/scl);
    vectors = new PVector[rows][cols] ;
    particles = new Particle[population] ;

    for (int i = 0; i < population; i++)
        particles[i] = new Particle(random(width-1), random(height-1));
}

public void draw() 
{
    //background(255) ;
    float yoff = 0 ;
    for (int y=0; y < rows; y++)
    {
        float xoff = 0 ;
        for (int x=0; x < cols; x++)
        {            
            float r = noise(xoff, yoff, zoff) * TWO_PI ;
            PVector v = PVector.fromAngle(r).normalize();

            //showGrid(x, y);
            //showVectors(x, y, v);

            vectors[y][x] = v ;
            xoff += inc ;
        }
        yoff += inc ;
    }
    zoff += zinc ;


    for (int i=0; i < population; i++)
    {       
        Particle p = particles[i] ;
        
        int index_x = floor(map(p.pos.x/scl,0,width/scl,0,width/scl -1));
        int index_y = floor(map(p.pos.y/scl,0,height/scl,0,height/scl -1));
        
        
        p.applyForce(vectors[index_x][index_y]);
        p.update();
        p.show();
        //p.showRaw();
        
    }

    
    //noLoop();
}



private void showGrid(float x, float y)
{
    pushStyle();
    stroke(0, 50);
    strokeWeight(1);
    rect(x*scl, y*scl, scl, scl);
    popStyle();
}


private void showVectors(float x, float y, PVector v)
{
    pushStyle();
    noFill();
    stroke(0);  
    strokeWeight(1);
    line(x*scl, y*scl, x*scl + v.x*scl, y*scl + v.y*scl);
    popStyle();
}