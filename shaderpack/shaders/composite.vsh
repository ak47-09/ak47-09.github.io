#version 150
#define PROGRAM_NAME COMPOSITE

varying vec2 texCoord;

void main() {
    gl_Position = gl_ProjectionMatrix * vec4(gl_Vertex.xy, 0.0, 1.0);
    texCoord = gl_Vertex.xy * 0.5 + 0.5;
}
