/// ----------------------------------------------------------------------------
/// @description
/// Constant.VertexType
/// ----------------------------------------------------------------------------
enum VERTEX_DATE_TYPE_ID {
    /// A single floating point value
    vertex_type_float1
    /// Two floating point values
    vertex_type_float2
    /// Three floating point values
    vertex_type_float3
    /// Four floating point values
    vertex_type_float4
    /// Four component values (r, g, b, a)
    COLOUR = vertex_type_colour
    /// Four component unsigned byte values (from 0 to 255)
    vertex_type_ubyte4
}

/// ----------------------------------------------------------------------------
/// @description
/// Constant.VertexUsage
/// ----------------------------------------------------------------------------
enum VERTEX_USAGE_TYPE_ID {
    /// position values (x, y, z)
    POSITION = vertex_usage_position
    /// colour values (r, g, b, a)
    COLOUR = vertex_usage_colour
    /// normal values (nx, ny, nz)
    NORMAL = vertex_usage_normal
    /// UV coordinates (u, v)
    TEXTURE_ vertex_usage_textcoord
    /// the blendweight of the input matrix (for skeletal animation, for example)
    vertex_usage_blendweight
    /// the indices of the matrices to use (for skeletal animation, for example)
    vertex_usage_blendindices
    /// vertex depth buffer value
    DEPTH = vertex_usage_depth
    /// tangent values
    vertex_usage_tangent
    /// binormal values
    vertex_usage_binormal
    /// fog values
    vertex_usage_fog
    /// sampler index
    SAMPLER_INDEX = vertex_usage_sample
}
