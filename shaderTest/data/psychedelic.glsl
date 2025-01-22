#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 resolution;
uniform float time;

void main() {
    vec2 uv = (gl_FragCoord.xy / resolution.xy) * 2.0 - 1.0;
    uv.x *= resolution.x / resolution.y;
    
    float dist = length(uv);
    float angle = atan(uv.y, uv.x);
    
    float wave = sin(time * 2.0 + dist * 10.0) * 0.5 + 0.5;
    float color1 = sin(time + angle * 3.0 + dist * 5.0);
    float color2 = cos(time + angle * 4.0 + dist * 6.0);
    float color3 = sin(time * 1.5 + dist * 7.0);
    
    vec3 color = vec3(color1, color2, color3) * wave;
    gl_FragColor = vec4(color, 1.0);
}