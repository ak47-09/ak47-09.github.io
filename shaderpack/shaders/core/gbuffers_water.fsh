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
    vec4 texColor = texture(tex, flowCoord) * glColor;
    
    // Apply lightmap
    vec3 lightCol = texture(lightmap, lmCoord).rgb;
    texColor.rgb *= lightCol;
    
    // Water foam and transparency
    texColor.a = mix(0.7, 0.9, sin(frameTimeCounter) * 0.5 + 0.5);
    
    // Subtle normal perturbation for water ripple effect
    vec3 perturbedNormal = normal;
    perturbedNormal.xy += sin(vec2(texCoord.y + frameTimeCounter, texCoord.x - frameTimeCounter)) * 0.05;
    perturbedNormal = normalize(perturbedNormal);
    
    gl_FragData[0] = texColor;
    gl_FragData[1] = vec4(perturbedNormal * 0.5 + 0.5, 1.0);
}
