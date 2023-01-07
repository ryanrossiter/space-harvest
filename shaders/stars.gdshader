shader_type canvas_item;

uniform vec2 offset;

float rand(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

void fragment() {
	vec2 fragPos = FRAGCOORD.xy + offset;
	vec2 screenPos = SCREEN_UV.xy + offset;
	float size = 1.0;
	float prob = 0.9;
	vec2 pos = floor(1.0 / size * fragPos);
	float color = 0.0;
	float starValue = rand(pos);

	if (rand(pos.xy / 20.0) > 0.996) {
		float r = rand(pos.xy);
		color = r * (0.85 * sin(TIME * (r * 5.0) + 720.0 * r) + 0.95);
	}
	COLOR = vec4(vec3(color),1.0);
}