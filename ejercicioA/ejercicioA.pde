import processing.opengl.*;

size(512, 512, P2D);
((PGraphicsOpenGL)g).textureSampling(2);
PImage img = loadImage("textura.png");
beginShape();
texture(img);
vertex(0, 0, 0, 0);
vertex(0, 512, 0, 128);
vertex(512, 512, 128, 128);
vertex(512, 0, 128, 0);
endShape();
