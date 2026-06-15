#version 150
#define PROGRAM_NAME GBUFFERS_TERRAIN

varying vec2 lmCoord;
varying vec4 vertexColor;

void main() {
    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
    
    lmCoord = (gl_MultiTexCoord1 * vec2(1.0/16.0));
    vertexColor = gl_Color;
    
    gl_TexCoord[0] = gl_MultiTexCoord0;
}
