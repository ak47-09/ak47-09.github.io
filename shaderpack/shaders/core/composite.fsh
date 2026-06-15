#version 150

uniform sampler2D colortex0;
uniform sampler2D colortex1;
uniform float viewWidth;
uniform float viewHeight;

varying vec2 texCoord;

void main() {
    vec2 uv = texCoord;
    vec3 color = texture(colortex0, uv).rgb;
    
    // Subtle bloom effect - low performance impact
    vec3 bloom = vec3(0.0);
    float bloomStrength = 0.15;
    
    // Sample nearby pixels for bloom
    float pixelSize = 1.0 / viewWidth;
    for(int i = -2; i <= 2; i++) {
        for(int j = -2; j <= 2; j++) {
            if(i == 0 && j == 0) continue;
            vec2 offset = vec2(float(i), float(j)) * pixelSize * 1.5;
            bloom += texture(colortex0, uv + offset).rgb * 0.1;
        }
    }
    
    color += bloom * bloomStrength;
    
    // Subtle color grading for warm aesthetic
    color *= vec3(1.05, 1.02, 0.98);
    
    gl_FragColor = vec4(color, 1.0);
}
