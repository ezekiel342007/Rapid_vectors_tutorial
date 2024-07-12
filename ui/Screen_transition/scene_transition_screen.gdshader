shader_type canvas_item;

uniform sampler2D noise_texture;
uniform sampler2D dissolve_noise_texture;
uniform vec4 colour_1: source_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform float tiling_factor: hint_range(1.0, 10.0) = 1.0;
uniform float move_speed: hint_range(0.1, 5.0) = 0.1;

void fragment() {
	vec2 uv = UV * tiling_factor;
	uv.y += TIME * -move_speed;
	uv = fract(uv);
	float noise_value = texture(noise_texture, uv).r;
	float dissolve_value = texture(dissolve_noise_texture, uv).r;
	COLOR = vec4(noise_value - dissolve_value);
}