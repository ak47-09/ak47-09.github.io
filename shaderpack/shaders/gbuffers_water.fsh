#version 150
#define PROGRAM_NAME GBUFFERS_WATER

uniform sampler2D tex;
uniform sampler2D lightmap;
uniform float frameTimeCounter;

varying vec2 lmCoord;
varying vec4 vertexColor;

void main() {
    vec2 flowCoord = gl_TexCoord[0].st + frameTimeCounter * 0.05;
    vec4 diffuse = texture(tex, flowCoord);
    diffuse.rgb *= vertexColor.rgb;
    diffuse.a = 0.8;
    
    vec3 lightmap = texture(lightmap, lmCoord).rgb;
    diffuse.rgb *= lightmap;
    
    gl_FragData[0] = diffuse;
    gl_FragData[1] = vec4(normalize(gl_NormalMatrix * gl_Normal) * 0.5 + 0.5, 1.0);
}
