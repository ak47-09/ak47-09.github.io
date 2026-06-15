#version 150

varying vec2 texCoord;
varying vec2 lmCoord;
varying vec3 normal;
varying vec3 viewPos;
varying vec4 glColor;

void main() {
    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
    
    texCoord = gl_MultiTexCoord0.st;
    lmCoord = gl_MultiTexCoord1.st / 16.0;
    
    normal = normalize(gl_NormalMatrix * gl_Normal);
    viewPos = (gl_ModelViewMatrix * gl_Vertex).xyz;
    glColor = gl_Color;
}
