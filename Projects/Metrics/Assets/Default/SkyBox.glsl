#shader vertex
#version 410 core

uniform mat4 view;
uniform mat4 projection;

layout (location = 0) in vec3 position;

out vec3 texCoordsOut;

void main()
{
    texCoordsOut = position;
    gl_Position = (projection * view * vec4(position, 1.0)).xyww;
}

#shader fragment
#version 410 core

in vec3 texCoordsOut;

out vec4 frag;

uniform samplerCube cubeMap;

void main()
{    
    frag = texture(cubeMap, texCoordsOut);
}
