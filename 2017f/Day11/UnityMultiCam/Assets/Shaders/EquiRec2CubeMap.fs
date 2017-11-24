/*{
	"CREDIT": "by mojovideotech",
 	"CATEGORIES" : [
		"Geometry Adjustment",
    	"equirectangular",
    	"sphericalcoordinates",
    	"cubemap"
  ],
  "DESCRIPTION" : "Single pass spherical coordinate transformation. 2:1 Equirectangular > 6:1 Cubemap Back-Left-Front-Right-Bottom-Top",
  "INPUTS" : [
    	{
      		"NAME" : "inputImage",
    		"TYPE" : "image"
    	},
    	{
			"NAME": "rotX",
			"TYPE": "float",
			"DEFAULT": 90.0,
			"MIN": -360,
			"MAX": 360
		},
		{
			"NAME": "rotY",
			"TYPE": "float",
			"DEFAULT": 90.0,
			"MIN":  -360,
			"MAX": 360
		}
  ],
  "ISFVSN" : "2"
}
*/

////////////////////////////////////////////////////////////
// EquiRec2CubeMap  by mojovideotech
//
// Single pass spherical coordinate transformation
// Input 2:1 Equirectangular / LatLong
// Output 6:1 Cubemap Back-Left-Front-Right-Bottom-Top
//
// Creative Commons Attribution-NonCommercial-ShareAlike 3.0
////////////////////////////////////////////////////////////

#define 	pi   	3.141592653589793 	// pi
#define 	twpi	6.283185307179586  	// two pi, 2*pi
#define 	rad		0.01745329251994	// degs>rads

vec3 rXY(vec3 p, vec2 a) {
    vec2 c = cos(a), s = sin(a);
    p = vec3(p.x, c.x*p.y + s.x*p.z, -s.x*p.y + c.x*p.z);
    return vec3(c.y*p.x + s.y*p.z, p.y, -s.y*p.x + c.y*p.z);
}

void main() {
	vec2 uv = gl_FragCoord.xy/RENDERSIZE.xy;
	uv.x *= 6.0;
  	vec3 rd;
	if (uv.x < 1.0) { 
    		uv -= 0.5;
    		rd = vec3(2.0 * uv.x, 1.0, -2.0 * uv.y);
  	} else
  	if (uv.x < 2.0) {
    		uv -= vec2(1.5, 0.5);
    		rd = vec3(1.0, -2.0 * uv.xy);
  	} else 
    if (uv.x < 3.0) {
    		uv -= vec2(2.5, 0.5);
    		rd = vec3(-2.0 * uv.x, -1.0, -2.0 * uv.y);
 	} else
	if (uv.x < 4.0) {
    		uv -= vec2(3.5, 0.5);
    		rd = vec3(-1.0, 2.0 * uv.x, -uv.y * 2.0);
  	} else
  	if (uv.x < 5.0) {
    		uv -= vec2(4.5, 0.5);
    		rd = vec3(-2.0 * uv.xy, 1.0);
  	} else
	if (uv.x < 6.0) {
    		uv -= vec2(5.5, 0.5);
    		rd = vec3(-uv.x * 2.0, uv.y * 2.0, -1.0);
  	} 
	rd = normalize(rd);
    vec3 dd = normalize(rXY(rd, vec2(rotX, rotY) * rad));
    vec2 map = vec2(atan(dd.z, dd.x) + pi, acos(dd.y)) / vec2(twpi, pi);
	gl_FragColor = IMG_NORM_PIXEL(inputImage, map, 1.0);
}
 	