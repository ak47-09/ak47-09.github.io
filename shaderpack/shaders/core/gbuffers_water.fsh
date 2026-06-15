#version 150

uniform sampler2D tex;
uniform sampler2D lightmap;
uniform float frameTimeCounter;

varying vec2 texCoord;
varying vec2 lmCoord;
varying vec3 normal;
varying vec3 viewPos;
varying vec4 glColor;

void main() {
    // Animated water texture coordinates
    vec2 flowCoord = texCoord + vec2(frameTimeCounter * 0.05, frameTimeCounter * 0.03);
    vec4 texColor = texture(tex, flowCoord);
    
    // Apply vertex color
    texColor *= glColor;
    
    // Apply lightmap
    vec3 lightCol = texture(lightmap, lmCoord).rgb;
    texColor.rgb *= lightCol;
    
    // Water is semi-transparent with subtle animation
    texColor.a = mix(0.7, 0.9, sin(frameTimeCounter) * 0.5 + 0.5);
    
    // Ensure water renders
    if(texColor.a < 0.1) texColor.a = 0.5;
    
    gl_FragData[0] = texColor;
    gl_FragData[1] = vec4(normal * 0.5 + 0.5, 1.0);
}
