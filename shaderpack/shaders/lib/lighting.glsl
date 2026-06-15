// Lighting calculations for optimized performance

// Simple directional light
vec3 directionalLight(vec3 normal, vec3 lightDir, vec3 lightColor) {
    float diffuse = max(dot(normal, lightDir), 0.0);
    return lightColor * diffuse;
}

// Ambient lighting with color
vec3 ambientLight(vec3 normal, vec3 skyColor, vec3 groundColor) {
    float up = normal.y * 0.5 + 0.5;
    return mix(groundColor, skyColor, up);
}

// Simple Fresnel effect for water
float fresnel(vec3 normal, vec3 viewDir, float power) {
    float cosAngle = dot(-viewDir, normal);
    return pow(1.0 - cosAngle, power);
}
