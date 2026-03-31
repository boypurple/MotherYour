image_alpha -= .02
if(vspeed < 0) image_alpha = 1
if(y > ystart) vspeed = 0
if(image_alpha <= 0) instance_destroy()