# Lush Aesthetic Shaderpack

A low-performance-impact shaderpack for Minecraft 1.20.1 designed for Iris and Sodium mods.

## Features

- 🌿 **Lush Aesthetic**: Warm lighting and enhanced vegetation colors
- 💧 **Enhanced Water**: Subtle wave animations and improved reflections
- ✨ **Subtle Bloom**: Lightweight bloom effect on bright surfaces
- 🎨 **Color Grading**: Warm color cast for an inviting atmosphere
- ⚡ **Low Performance Impact**: Optimized for smooth gameplay

## Installation

### Requirements
- Minecraft 1.20.1
- Fabric Loader
- Iris Shaders mod
- Sodium mod

### Installation Steps

1. Download the shaderpack .zip file
2. Open your Minecraft folder (`%appdata%/.minecraft` on Windows)
3. Navigate to `shaderpacks` folder (create if it doesn't exist)
4. Extract the .zip file into the `shaderpacks` folder
5. Launch Minecraft with Fabric
6. Open Iris Shaders menu (default: `O` key)
7. Select "Lush Aesthetic" from the list
8. Adjust quality settings as needed

## Settings

### Recommended Settings for Best Performance

- **Shadow Quality**: Low
- **Volumetric Lighting**: Off
- **Bloom Strength**: 0.15 (default)
- **Water Quality**: High (minimal performance impact due to optimization)
- **Ambient Occlusion**: Low

## Performance

This shaderpack is designed to maintain 60+ FPS on mid-range systems while providing a visually appealing aesthetic. Performance may vary based on your hardware.

### Expected Performance Impact
- **Low-end GPUs**: +5-10% frame time
- **Mid-range GPUs**: +2-5% frame time
- **High-end GPUs**: Negligible impact

## Features Breakdown

### Terrain Shading
- Subtle ambient occlusion approximation
- Enhanced lightmap application
- Warm color grading applied per-texture

### Water Rendering
- Animated wave textures
- Subtle normal perturbation
- Dynamic transparency
- Efficient wave calculations

### Post-Processing
- Lightweight bloom effect
- Color grading with warm tones
- Gentle vignette for depth perception
- Contrast enhancement

## Troubleshooting

**Low FPS?**
- Ensure Sodium is properly installed
- Disable bloom in Iris settings
- Lower render distance
- Check that your GPU drivers are updated

**Shader flickering?**
- Update Iris to the latest version
- Clear shader cache in Iris settings
- Verify Sodium compatibility

**Colors look wrong?**
- Check graphics settings in Iris
- Verify monitor color profile
- Adjust color grading values in shader files

## Customization

To customize the shaderpack:

1. Open shader files in the `shaders/` directory
2. Modify the color values, effect strengths, or add new effects
3. Save changes
4. Reload shaders in-game (Iris menu > Reload Shaders)

## File Structure

```
Lush Aesthetic/
├── pack.mcmeta
├── README.md
└── shaders/
    ├── core/
    │   ├── gbuffers_terrain.fsh/vsh
    │   ├── gbuffers_textured.fsh/vsh
    │   ├── gbuffers_water.fsh/vsh
    │   ├── composite.fsh/vsh
    │   └── final.fsh/vsh
    └── lib/
        ├── common.glsl
        └── lighting.glsl
```

## License

Free to use and modify for personal use.

## Version

- **Version**: 1.0
- **Minecraft**: 1.20.1
- **Iris**: 1.6.0+
- **Sodium**: 0.4.10+

## Support

For issues or suggestions, please refer to the Iris Shaders documentation or contact the development team.
