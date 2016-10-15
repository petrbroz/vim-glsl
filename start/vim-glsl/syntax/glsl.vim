if exists("b:current_syntax")
    finish
endif

" Keywords {{{

syntax keyword glslconditional if else
syntax keyword glslrepeat break continue do for while
syntax keyword glsllabel goto switch default
syntax keyword glslstructure struct

syntax keyword glsltype float int void bool true false
syntax keyword glsltype mat2 mat3 mat4
syntax keyword glsltype vec2 vec3 vec4 ivec2 ivec3 ivec4 bvec2 bvec3 bvec4
syntax keyword glsltype sampler2D samplerCube

syntax keyword glslstorage attribute const uniform varying
syntax keyword glslstorage in out inout

syntax keyword glslkeyword discard return
syntax keyword glslkeyword lowp mediump highp precision invariant

" Reserved for future use
"syntax keyword glslkeyword asm
"syntax keyword glslkeyword class union enum typedef template this packed
"syntax keyword glslkeyword inline noinline volatile public static extern external interface flat
"syntax keyword glslkeyword long short double half fixed unsigned superp
"syntax keyword glslkeyword input output
"syntax keyword glslkeyword hvec2 hvec3 hvec4 dvec2 dvec3 dvec4 fvec2 fvec3 fvec4
"syntax keyword glslkeyword sampler1D sampler3D
"syntax keyword glslkeyword sampler1DShadow sampler2DShadow
"syntax keyword glslkeyword sampler2DRect sampler3DRect sampler2DRectShadow
"syntax keyword glslkeyword sizeof cast
"syntax keyword glslkeyword namespace using

highlight link glslconditional Conditional
highlight link glslrepeat Repeat
highlight link glsllabel Label
highlight link glslstructure Structure
highlight link glsltype Type
highlight link glslstorage StorageClass
highlight link glslkeyword Keyword

" }}}

" Operators {{{

" Unary
syntax match glsloperator "!"
"syntax match glsloperator "~"

" Additive/unary
syntax match glsloperator "+"
syntax match glsloperator "-"

" Multiplicative
syntax match glsloperator "*"
syntax match glsloperator "/"
syntax match glsloperator "%"

" Bitwise
syntax match glsloperator "&"
syntax match glsloperator "^"
syntax match glsloperator "|"
syntax match glsloperator ">>"
syntax match glsloperator "<<"
syntax match glsloperator "&&"
syntax match glsloperator "||"

highlight link glsloperator Operator

" }}}

" Functions {{{

syntax keyword glslfunction radians degrees sin cos tan asin acos atan
syntax keyword glslfunction pow exp log exp2 log2 sqrt inversesqrt
syntax keyword glslfunction abs sign floor ceil fract mod min max clamp mix step smoothstep
syntax keyword glslfunction length distance dot cross normalize faceforward reflect refract
syntax keyword glslfunction matrixCompMult
syntax keyword glslfunction lessThan lessThanEqual greaterThan greaterThanEqual equal any all not
syntax keyword glslfunction texture2D texture2DProj texture2DLod texture2DProjLod textureCube textureCubeLod

highlight link glslfunction Function

" }}}

" Symbols {{{

syntax match glslsymbol "\vgl_\w+"

highlight link glslsymbol Symbol

" }}}

" Comments {{{

syntax match glslcomment "\v\/\/.*$"
syntax region glslcomment start="\v\/\*" end="\v\*\/" contains=glslcomment

highlight link glslcomment Comment

" }}}

" Directives {{{

syntax match glsldefine "\v\#define.*$"
syntax match glsldefine "\v\#ifn?def.*$"
syntax match glsldefine "\v\#endif.*$"
syntax match glslinclude "\v\#include.*$"

highlight link glsldefine Define
highlight link glslinclude Include

" }}}

" TODO: literals

let b:current_syntax = "glsl"
