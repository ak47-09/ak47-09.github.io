#version 150
#define PROGRAM_NAME GBUFFERS_TEXTURED

uniform sampler2D tex;
uniform sampler2D lightmap;

varying vec2 lmCoord;
varying vec4 vertexColor;

void main() {
    vec4 diffuse = texture(tex, gl_TexCoord[0].st);
    diffuse.rgb *= vertexColor.rgb;
    
    if (diffuse.a < 0.5) discard;
    
    vec3 lightmap = texture(lightmap, lmCoord).rgb;
    diffuse.rgb *= lightmap;
    
    gl_FragData[0] = diffuse;
    gl_FragData[1] = vec4(normalize(gl_NormalMatrix * gl_Normal) * 0.5 + 0.5, 1.0);
}
