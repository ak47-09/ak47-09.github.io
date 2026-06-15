#version 150
#define PROGRAM_NAME FINAL

uniform sampler2D colortex0;

varying vec2 texCoord;

void main() {
    vec3 color = texture(colortex0, texCoord).rgb;
    
    // Color grading and contrast
    color = mix(color, pow(color, vec3(0.95)), 0.2);
    
    // Light vignette
    vec2 uv = texCoord * 2.0 - 1.0;
    float vignette = 1.0 - dot(uv, uv) * 0.1;
    color *= mix(vec3(0.97), vec3(1.0), vignette);
    
    gl_FragColor = vec4(color, 1.0);
}
