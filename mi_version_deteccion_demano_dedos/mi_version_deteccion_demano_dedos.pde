import de.voidplus.leapmotion.*;
import processing.net.*; // libreria .Net para usar TCP
LeapMotion leap;
Server servidor,servidorye,servidorzeta,servidorproximidad;
int Data;
int proximidad=0;
int contador;
int opcion1=0;
int opcion2=0;
int resultado=0;
int fotos=0;
float ekis=0;
float ye=0;
float zeta=0;

float xindice=0;
float yindice=0;
float zindice=0;

float xgordo=0;
float ygordo=0;
float zgordo=0;
/*
public void init() { 
  frame.removeNotify(); 
  frame.setUndecorated(true); 
  frame.addNotify();
  super.init();
}*/

void setup(){
  size(800, 500, OPENGL);
  background(255);
  // ...
  servidor= new Server(this,2058);
  servidorye= new Server(this,2059);
  servidorzeta = new Server(this, 2060);
  servidorproximidad= new Server(this,2061);
  Data=0;
  proximidad=0;
  leap = new LeapMotion(this);
}

void draw(){
  proximidad=0;
  contador=0;
  background(255);
  // ...
  int fps = leap.getFrameRate();


  // ========= HANDS =========
    
  for(Hand hand : leap.getHands()){


    // ----- BASICS -----
        
    int     hand_id          = hand.getId();
    PVector hand_position    = hand.getPosition();
    PVector hand_stabilized  = hand.getStabilizedPosition();
    PVector hand_direction   = hand.getDirection();
    PVector hand_dynamics    = hand.getDynamics();
    float   hand_roll        = hand.getRoll();
    float   hand_pitch       = hand.getPitch();
    float   hand_yaw         = hand.getYaw();
    boolean hand_is_left     = hand.isLeft();
    boolean hand_is_right    = hand.isRight();
    float   hand_grab        = hand.getGrabStrength();
    float   hand_pinch       = hand.getPinchStrength();
    float   hand_time        = hand.getTimeVisible();
    PVector sphere_position  = hand.getSpherePosition();
    float   sphere_radius    = hand.getSphereRadius();
  
  
    ekis= hand_position.x;
    ye= hand_position.y;
    zeta= hand_position.z;

    
    //println("x: "+ekis+" y: "+ye+" z: "+ zeta);
    
  // margen de x : 0 a 800
  // margen de y : 0 a 440 ( 0 arriba, 440 abajo - proximo al Leapmotion)
  // margen de z : -10 a 100 ( -10 es hacia atras, y el 100 es hacia la pantalla)

/* Se programa 10 diferentes posiciones del X para mandar al motor que ocupe la posicion X del movimiento del robot
* */
  if(ekis<80){
 // println("se mando x: 0 al labView");
    servidor.write('0');
  }
  if ( ekis>80 && ekis<160){
  // println("se mando x: 1 al labView");
    servidor.write('1');
  }
  if(ekis>160 && ekis<240){
  //println("se mando x: 2 al labView");
   servidor.write('2');
  }
  if(ekis>240 && ekis<320){
 //  println("se mando x: 3 al labView");
    servidor.write('3');
  }
  if(ekis>320 && ekis<400){
  //println( "se mando x: 4 al labView");
  servidor.write('4');
  }
  if( ekis>400 && ekis<480){
   // println("se mando x: 5 al labView");
    servidor.write('5');
  }
  if( ekis>480 && ekis<560){
   // println("se mando x: 6 al labView");
    servidor.write('6');
  }
  if( ekis>560 && ekis<640){
   //println("se mando x: 7 al labView");
   servidor.write('7'); 
  }
  if(ekis>640 && ekis<720){
   // println("se mando x: 8 al labView");
    servidor.write('8');
  }if (ekis>720){
   //println("se mando x: 9 al labview");
    servidor.write("9");
  }
 //********************** acaba X **************************
 //******************** empieza Y **************************
  if(ye<44){
    //println("se mando x: 0 al labView");
    servidorye.write('0');
  } 
  if(ye>44 && ye<88){
   //println("se mando x: 1 al labView");
    servidorye.write('1');
  }
  if(ye>88 && ye<132){
   //  println("se mando x: 2 al labView");
    servidorye.write('2');
  }
  if(ye>132 && ye<176){
   //  println("se mando x: 3 al labView");
    servidorye.write('3');
  }
  if(ye>176 && ye<220){
    //  println("se mando x: 4 al labView");
    servidorye.write('4');
  }
  if(ye>220 && ye<264){
     //    println("se mando x: 5 al labView");
    servidorye.write('5');
  }
  if(ye>264 && ye<308){
   //  println("se mando x: 6 al labView");
    servidorye.write('6');
  }
  if(ye>308 && ye<352){
   //   println("se mando x: 7 al labView");
    servidorye.write('7');
  }
  if(ye>352 && ye<396){
     //    println("se mando x: 8 al labView");
    servidorye.write('8');
  }
  if(ye>396){
     //    println("se mando x: 9 al labView");
    servidorye.write('9');
  }
  /// ***************** se acaba y **********************
  /// ***************** starts z ************************
  if(zeta<1){
          println("se mando z: 0 al labView");
    servidorzeta.write('0');
  }
  if(zeta>1 && zeta<12){
      println("se mando z: 1 al labView");
    servidorzeta.write('1');
  }
  if(zeta>12 && zeta<23){
       println("se mando z: 2 al labView");
    servidorzeta.write('2');
  }
  if(zeta>23 && zeta<34){
        println("se mando z: 3 al labView");
    servidorzeta.write('3');
  }
  if(zeta>34 && zeta<45){
        println("se mando z: 4 al labView");
    servidorzeta.write('4');
  }
  if(zeta>45 && zeta<56){
         println("se mando z: 5 al labView");
    servidorzeta.write('5');
  }
  if(zeta>56 && zeta<67){
         println("se mando z: 6 al labView");
    servidorzeta.write('6');
  }
  if(zeta>67 && zeta<78){
        println("se mando z: 7 al labView");
    servidorzeta.write('7');
  }
  if(zeta>78 && zeta<89){
      println("se mando z: 8 al labView");
    servidorzeta.write('8');
  }
  if(zeta>89){
       println("se mando z: 9 al labView");
    servidorzeta.write('9');
  }
  


    // ----- SPECIFIC FINGER -----
        
    Finger  finger_thumb     = hand.getThumb();
    // or                      hand.getFinger("thumb");
    // or                      hand.getFinger(0);
    xgordo= hand.getThumb().getStabilizedPosition().x;    //posicion del dedo gordo para hacer calculo de proximidad
    ygordo= hand.getThumb().getStabilizedPosition().y;
    zgordo= hand.getThumb().getStabilizedPosition().z;
 

    Finger  finger_index     = hand.getIndexFinger();
    // or                      hand.getFinger("index");
    // or                      hand.getFinger(1);
    xindice= hand.getIndexFinger().getStabilizedPosition().x; 
    yindice= hand.getIndexFinger().getStabilizedPosition().y; 
    zindice= hand.getIndexFinger().getStabilizedPosition().z; 
    
    //println("dif en x : "+ (xgordo-xindice) + " dif en y: "+ (ygordo-yindice) + " dif en z: "+ (zgordo-zindice));
   // println("dif en x : "+ (xindice-xgordo) + " dif en y: "+ (yindice-ygordo) + " dif en z: "+ (zindice-zgordo));
       if((xindice-xgordo)<10){
     proximidad+=1; 
     
    }
    if((yindice-ygordo)<10){
      proximidad+=1; 
      
    }
    if((zindice-zgordo)<10){
      proximidad+=1;
    }
   

     // dedo de enmedio con el dedo gordo
    // println("["+proximidad+"] ");
     if(proximidad==3){
     //println(" pinza activada");
     servidorproximidad.write('1');
     }else{
       servidorproximidad.write('0');
     }
    
    Finger  finger_middle    = hand.getMiddleFinger();
    // or                      hand.getFinger("middle");
    // or                      hand.getFinger(2);

    Finger  finger_ring      = hand.getRingFinger();
    // or                      hand.getFinger("ring");
    // or                      hand.getFinger(3);

    Finger  finger_pink      = hand.getPinkyFinger();
    // or                      hand.getFinger("pinky");
    // or                      hand.getFinger(4);        


    // ----- DRAWING -----
        
    hand.draw();
    // hand.drawSphere();


    // ========= ARM =========
        
    if(hand.hasArm()){
      Arm     arm               = hand.getArm();
      float   arm_width         = arm.getWidth();
      PVector arm_wrist_pos     = arm.getWristPosition();
      PVector arm_elbow_pos     = arm.getElbowPosition();
    }


    // ========= FINGERS =========
        
    for(Finger finger : hand.getFingers()){
           
      
      // ----- BASICS -----
            
      int     finger_id         = finger.getId();
      PVector finger_position   = finger.getPosition();
      PVector finger_stabilized = finger.getStabilizedPosition();
      PVector finger_velocity   = finger.getVelocity();
      PVector finger_direction  = finger.getDirection();
      float   finger_time       = finger.getTimeVisible();


      // ----- SPECIFIC FINGER -----
            
      switch(finger.getType()){
        case 0:
          //System.out.println("thumb");
          break;
        case 1:
          //System.out.println("index");
          break;
        case 2:
         //  System.out.println("middle");
          break;
        case 3:
          // System.out.println("ring");
          break;
        case 4:
          // System.out.println("pinky");
          break;
      }


      // ----- SPECIFIC BONE -----
            
      Bone    bone_distal       = finger.getDistalBone();
      // or                       finger.get("distal");
      // or                       finger.getBone(0);
            
      Bone    bone_intermediate = finger.getIntermediateBone();
      // or                       finger.get("intermediate");
      // or                       finger.getBone(1);
            
      Bone    bone_proximal     = finger.getProximalBone();
      // or                       finger.get("proximal");
      // or                       finger.getBone(2);

      Bone    bone_metacarpal   = finger.getMetacarpalBone();
      // or                       finger.get("metacarpal");
      // or                       finger.getBone(3);
            
            
      // ----- DRAWING -----
            
       finger.draw(); // = drawLines()+drawJoints()
       finger.drawLines();
       finger.drawJoints();


      // ----- TOUCH EMULATION -----
            
      int     touch_zone        = finger.getTouchZone();
      float   touch_distance    = finger.getTouchDistance();
      
      switch(touch_zone){
        case -1: // None
          break;
        case 0: // Hovering
          // println("Hovering (#"+finger_id+"): "+touch_distance);
          break;
        case 1: // Touching
         // println("Touching (#"+finger_id+")");
          break;
        }
      }
    
    
      // ========= TOOLS =========
        
      for(Tool tool : hand.getTools()){
      
      
        // ----- BASICS -----
            
        int     tool_id           = tool.getId();
        PVector tool_position     = tool.getPosition();
        PVector tool_stabilized   = tool.getStabilizedPosition();
        PVector tool_velocity     = tool.getVelocity();
        PVector tool_direction    = tool.getDirection();
        float   tool_time         = tool.getTimeVisible();
      
      
        // ----- DRAWING -----
            
        // tool.draw();
      
      
        // ----- TOUCH EMULATION -----
            
        int     touch_zone        = tool.getTouchZone();
        float   touch_distance    = tool.getTouchDistance();
      
        switch(touch_zone){
          case -1: // None
            break;
          case 0: // Hovering
            // println("Hovering (#"+tool_id+"): "+touch_distance);
            break;
          case 1: // Touching
            // println("Touching (#"+tool_id+")");
            break;
        }
      }
  }
  
  
  // ========= DEVICES =========
    
  for(Device device : leap.getDevices()){
    float device_horizontal_view_angle = device.getHorizontalViewAngle();
    float device_verical_view_angle = device.getVerticalViewAngle();
    float device_range = device.getRange();
  }
    
   
  
}
    


// ========= CALLBACKS =========

void leapOnInit(){
  // println("Leap Motion Init");
}
void leapOnConnect(){
  // println("Leap Motion Connect");
}
void leapOnFrame(){


    
    
  
  }

void leapOnDisconnect(){
  // println("Leap Motion Disconnect");
}
void leapOnExit(){
  // println("Leap Motion Exit");
}
