Shader "CookbookShaders/Chapter 03/NormalMapShader"
{
    Properties
    {
        _MainTint("Diffuse Tint", Color) = (0,1,0,1)
        _NormalTex("Normal Map", 2D) = "bump" {}
    }
        SubShader
    {
        Tags { "RenderType" = "Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _NormalTex;
        float4 _MainTint;


        struct Input
        {
            float2 uv_NormalTex;
        };

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // provided base color for material
            o.Albedo = _MainTint;
            // get the normal data out of the normal map texture using the UnpackNormal function
            float3 normalMap = UnpackNormal(tex2D(_NormalTex, IN.uv_NormalTex));
            // Apply the new normal to the lighting model
            o.Normal = normalMap.rgb;

            
            
            // Metallic and smoothness come from slider variables
            
            
        }
        ENDCG
    }
    FallBack "Diffuse"
}
