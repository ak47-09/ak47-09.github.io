#version 150
#define PROGRAM_NAME COMPOSITE

uniform sampler2D colortex0;
uniform sampler2D colortex1;

varying vec2 texCoord;

void main() {
    vec3 color = texture(colortex0, texCoord).rgb;
    
    // Subtle bloom
    vec3 bloom = vec3(0.0);
    float pixelSize = 1.0 / 1920.0;
    for(int i = -1; i <= 1; i++) {
        for(int j = -1; j <= 1; j++) {
            if(i == 0 && j == 0) continue;
            bloom += texture(colortex0, texCoord + vec2(i, j) * pixelSize).rgb * 0.05;
        }
    }
    
    color += bloom * 0.1;
    color *= vec3(1.05, 1.02, 0.98);
    
    gl_FragColor = vec4(color, 1.0);
}
