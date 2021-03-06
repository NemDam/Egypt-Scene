# version 150 core
uniform mat4 modelMatrix ;
uniform mat4 textureMatrix ;
uniform mat4 viewMatrix ;
uniform mat4 projMatrix ;
uniform vec4 nodeColour ;

in vec3 position ;
in vec4 colour ;
in vec3 normal ;
in vec2 texCoord ;

 out Vertex {
 vec2 texCoord;
 vec4 colour;
 vec3 normal ;
 vec3 worldPos;
 } OUT ;

 void main ( void ) {
	OUT.colour = colour ;
	OUT . texCoord = (textureMatrix * vec4(texCoord.x, texCoord.y, 0, 1)).xy ;
	mat3 normalMatrix = transpose ( inverse ( mat3 ( modelMatrix )));
	
	OUT.normal = normal;
	
	OUT.worldPos = ( modelMatrix * vec4 ( position ,1)).xyz ;
	gl_Position = ( projMatrix * viewMatrix * modelMatrix ) *vec4 ( position , 1.0);
}