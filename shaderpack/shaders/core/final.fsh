#version 150

uniform sampler2D colortex0;
uniform sampler2D colortex1;
uniform sampler2D depthtex0;
uniform float viewWidth;
uniform float viewHeight;
uniform float far;
uniform float near;

varying vec2 texCoord;

float linearizeDepth(float depth) {
    return (2.0 * near * far) / (far + near - (2.0 * depth - 1.0) * (far - near));
}

void main() {
    vec3 color = texture(colortex0, texCoord).rgb;
    
    // Subtle contrast enhancement
    color = mix(color, pow(color, vec3(0.95)), 0.3);
    
    // Gentle saturation boost
    float gray = dot(color, vec3(0.299, 0.587, 0.114));
    color = mix(gray * vec3(1.0), color, 1.1);
    
    // Light vignette
    vec2 uv = texCoord * 2.0 - 1.0;
    float vignette = 1.0 - dot(uv, uv) * 0.15;
    color *= mix(vec3(0.95), vec3(1.0), vignette);
    
    gl_FragColor = vec4(color, 1.0);
}
