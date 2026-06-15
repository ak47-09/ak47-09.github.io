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
    
    // Apply lightmap
    vec3 lightCol = texture(lightmap, lmCoord).rgb;
    texColor.rgb *= lightCol;
    
    // Enhance warm tones in lighting
    texColor.rgb += vec3(0.02, 0.01, 0.0) * lightCol.y;
    
    gl_FragData[0] = texColor;
    gl_FragData[1] = vec4(normal * 0.5 + 0.5, 1.0);
}
