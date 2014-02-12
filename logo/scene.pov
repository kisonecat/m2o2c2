
#version 3.7;

global_settings {
   assumed_gamma 1
   radiosity{
     pretrace_start 0.08
     pretrace_end   0.001
     count 150
     error_bound 0.2
     nearest_count 20
     recursion_limit 2
     brightness 1
   }
}

camera {
        right x*600/340
	location 1.4*<-3.2, 2.2, -3.4>
	look_at  <3.3, 0, 0>
	angle 60
}

plane {
   y, 0

   pigment {
		color rgb <1,1,1>
   }
    finish { ambient 0 diffuse 0.8 }
}

#declare sphere_radius = 1.38;

sphere {
   <0,sphere_radius,0>, sphere_radius

   pigment {
		color rgb <0.5,0.5,0.5>
   }
    finish { ambient 0 diffuse 0.8 }
}

#declare plane_width = 0.55;

#declare tangent_plane = intersection {
   box { <-plane_width,2*sphere_radius - plane_width,-plane_width>,
         <plane_width,2*sphere_radius + plane_width,plane_width> }
   plane {
     y, 2*sphere_radius
   }
   plane {
     -y, -2*sphere_radius + 0.01
   }
}

#macro make_tangent(r,c)

object{ tangent_plane

   translate <0,-sphere_radius,0>
   rotate r
   translate <0,sphere_radius,0>   

   pigment {
		color rgb c
   }
    finish { ambient 0 diffuse 0.8 }
}

#end

make_tangent(<-70,30,15>,<0,0,1>)
make_tangent(<-20,10,-20>,<1,0,0>)
make_tangent(<0,-30,45>,<0,1,0>)

sky_sphere {
	pigment {
		gradient x
		color_map {
			[0.4 color rgb < 0.700, 0.715, 1.000>*0.5]
			[0.85 color rgb < 1.500, 1.400, 1.250>*1.7]
			
		}
		scale 2
		translate -x
		rotate 20*y
	}
}


