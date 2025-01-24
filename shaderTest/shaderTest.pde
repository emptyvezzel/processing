PShader psychedelicShader;

// Adjustable shader parameters
float waveSpeed = 2.0;
float distFactor = 10.0;
float colorFactor1 = 3.0;
float colorFactor2 = 4.0;
float colorFactor3 = 1.5;
float distColorFactor1 = 5.0;
float distColorFactor2 = 6.0;
float distColorFactor3 = 7.0;

void setup() {
  size(800, 800, P2D);

  // Assemble shader code using dynamic variables
  String shaderCode = buildShader();
  
  // Save shader code to a file dynamically
  String shaderPath = sketchPath("psychedelic.glsl");
  saveStrings(shaderPath, new String[]{shaderCode});
  
  // Load shader from the dynamically created file
  psychedelicShader = loadShader("psychedelic.glsl");
  psychedelicShader.set("resolution", float(width), float(height));
}

void draw() {
  waveSpeed = 2.0;
  psychedelicShader.set("time", millis() / 1000.0);
  shader(psychedelicShader);
  rect(0, 0, width, height);
}

// Function to dynamically build the shader with modifiable variables
String buildShader() {
  String version = "#ifdef GL_ES\nprecision mediump float;\n#endif\n";
  String uniforms = 
    "uniform vec2 resolution;\n" +
    "uniform float time;\n";
  
  String mainFunctionStart = 
    "void main() {\n" +
    "    vec2 uv = (gl_FragCoord.xy / resolution.xy) * 2.0 - 1.0;\n" +
    "    uv.x *= resolution.x / resolution.y;\n";
  
  String calculations = 
    "    float dist = length(uv);\n" +
    "    float angle = atan(uv.y, uv.x);\n" +
    "    float wave = sin(time * " + waveSpeed + " + dist * " + distFactor + ") * 0.5 + 0.5;\n" +
    "    float color1 = sin(time + angle * " + colorFactor1 + " + dist * " + distColorFactor1 + ");\n" +
    "    float color2 = cos(time + angle * " + colorFactor2 + " + dist * " + distColorFactor2 + ");\n" +
    "    float color3 = sin(time * " + colorFactor3 + " + dist * " + distColorFactor3 + ");\n";
  
  String finalColor = 
    "    vec3 color = vec3(color1, color2, color3) * wave;\n" +
    "    gl_FragColor = vec4(color, 1.0);\n}";
  
  return version + uniforms + mainFunctionStart + calculations + finalColor + "}";
}

void keyPressed() {
  if (key == 'w') waveSpeed += 0.5;
  if (key == 's') waveSpeed -= 0.5;
  if (key == 'd') distFactor += 1.0;
  if (key == 'a') distFactor -= 1.0;
  if (key == 'q') colorFactor1 += 0.5;
  if (key == 'e') colorFactor1 -= 0.5;

  // Regenerate shader after changes
  String shaderCode = buildShader();
  saveStrings(sketchPath("psychedelic.glsl"), new String[]{shaderCode});
  psychedelicShader = loadShader("psychedelic.glsl");
  psychedelicShader.set("resolution", float(width), float(height));
}
