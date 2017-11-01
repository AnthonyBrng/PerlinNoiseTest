public class Particle
{
    private PVector acc = new PVector(0, 0) ;
    private PVector vel = new PVector(0, 0) ;
    private PVector pos  ;
    private float maxSpeed =2;
    private int alpha = 5 ; // 5
    private int colr = 100 ; // 100
    private int size = 2 ;

    private float prevx ;
    private float prevy ;

    public Particle(float x, float y)
    {
        this.pos = new PVector(x, y);
    }


    public void applyForce(PVector force)
    {
        this.acc.add(force) ;
        this.acc.setMag(0.3);
    }

    public void update()
    {
        this.prevx = this.pos.x ;
        this.prevy = this.pos.y;

        this.vel.add(this.acc);
        this.vel.limit(maxSpeed);
        this.pos.add(this.vel) ;
        this.acc.mult(0);

        if (this.pos.x > width)
        {
            this.pos.x = 0 ;
            this.prevx = 0 ;
        }   
        if (this.pos.x < 0)
        {
            this.pos.x = width;
            this.prevx = width ;
        }
        if (this.pos.y < 0 )
        {
            this.pos.y = height ;
            this.prevy = height ;
        }
        if (this.pos.y > height)
        {
            this.pos.y = 0 ;
            this.prevy = 0 ;
        }
    }

    public void show()
    {
        
        pushStyle();
        fill(colr, alpha);
        stroke(colr, alpha) ;        
        point(this.pos.x, this.pos.y);//, size, size);
        strokeWeight(1);
        line(this.prevx,this.prevy, this.pos.x, this.pos.y); //<>//
        popStyle();
    }
    
    public void showRaw()
    {
        pushStyle();
        fill(0);
        stroke(0);
        strokeWeight(1);
        ellipse(this.pos.x, this.pos.y, 3,3);
        popStyle();
    }
        
}