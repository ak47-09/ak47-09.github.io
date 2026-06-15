// Common shader utilities

#define PI 3.14159265359
#define TAU 6.28318530718

// Gamma correction
vec3 toLinear(vec3 color) {
    return pow(color, vec3(2.2));
}

vec3 toGamma(vec3 color) {
    return pow(color, vec3(1.0 / 2.2));
}

// Color space utilities
float luminance(vec3 color) {
    return dot(color, vec3(0.299, 0.587, 0.114));
}

// Fast approximation of pow
float pow2(float x) {
    return x * x;
}

float pow3(float x) {
    return x * x * x;
}

// Smooth step
float smootherstep(float edge0, float edge1, float x) {
    x = clamp((x - edge0) / (edge1 - edge0), 0.0, 1.0);
    return x * x * x * (x * (x * 6.0 - 15.0) + 10.0);
}
