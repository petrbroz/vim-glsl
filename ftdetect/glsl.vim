au BufNewFile,BufRead *.glsl,*.vs,*.fs set filetype=glsl
au CompleteDone *.glsl,*.vs,*.fs pclose
