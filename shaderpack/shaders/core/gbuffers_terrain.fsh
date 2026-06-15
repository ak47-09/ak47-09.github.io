#version 150

uniform sampler2D tex;
uniform sampler2D lightmap;

varying vec2 texCoord;
varying vec2 lmCoord;
varying vec3 normal;
varying vec4 glColor;

void main() {
    vec4 texColor = texture(tex, texCoord) * glColor;
    
    // Discard transparent pixels
    if(texColor.a < 0.1) discard;
    
    // Apply lightmap with enhanced warm tones
    vec3 lightCol = texture(lightmap, lmCoord).rgb;
    texColor.rgb *= lightCol;
    
    // Warm color cast for aesthetic
    texColor.rgb += vec3(0.015, 0.005, -0.01) * lightCol.y;
    
    // Subtle ambient occlusion approximation
    float ao = mix(0.9, 1.0, dot(normal, vec3(0.577)));
    texColor.rgb *= ao;
    
    gl_FragData[0] = texColor;
    gl_FragData[1] = vec4(normal * 0.5 + 0.5, 1.0);
}
