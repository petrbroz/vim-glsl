" Trims heading and trailing whitespace from string
function! s:Trim(str)
    return substitute(a:str, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

" Parses the content of the glsl specification text file into a list of
" potential matches for glsl#CompleteFunc. Each item in the output list is
" an object with the following properties:
"   * word - actual name of the symbol used for autocompletion
"   * kind - 'v' for variables, 'c' for constants, or 'f' for functions
"   * menu - full signature of the variable/const/function that will be
"            shown in the autocompletion menu
"   * info - description of the variable/const/function that will be shown
"            in the preview window
function! s:Parse(lines)
    let docs = []
    let word = ""
    let kind = ""
    let menu = ""
    let info = ""
    for line in a:lines
        if stridx(line, "*GlslSpecVars*") >= 0
            " Start of a section; everything after this line are built-in vars
            let kind = "v"
        elseif stridx(line, "*GlslSpecConsts*") >= 0
            " Start of a section; everything after this line are built-in consts
            let kind = "c"
        elseif stridx(line, "*GlslSpecFuncs") >= 0
            " Start of a section; everything after this line are built-in functions
            let kind = "f"
        elseif line =~ '^[\-=]\+$'
            " End of a section
            let kind = ""
        elseif len(line) > 0 && len(kind) > 0
            " Non-empty line in one of the built-in sections can potentially be a documentation block
            if line =~ '\*\w\+\(()\)\?\*$'
                let tokens = split(line, "*")
                let menu = s:Trim(tokens[0])
                let word = s:Trim(tokens[1])
            else
                let info .= s:Trim(line) . "\n"
            endif
        elseif len(kind) > 0
            " Empty line can potentially close a documentation block
            if len(word) > 0 && len(info) > 0
                call add(docs, { "word": word, "kind": kind, "menu": menu, "info": info })
                let word = ""
                let menu = ""
                let info = ""
            endif
        endif
    endfor
    return docs
endfunction

" Parse potential matches from glsl-spec.txt
let s:docs = []
let s:specFile = simplify(expand("<sfile>:p:h") . "/../doc/glsl-spec.txt")
if filereadable(s:specFile)
    let s:docs = s:Parse(readfile(s:specFile))
    echom "vim-glsl: successfully parsed " . len(s:docs) . " completion options"
else
    echom "vim-glsl: could not find the spec file... no completion :("
endif

function! glsl#CompleteFunc(findstart, base)
    if a:findstart
        let line = getline(".")
        let start = col(".") - 1
        while start > 0 && line[start - 1] =~ '\w'
            let start -= 1
        endwhile
        return start
    else
        let matches = []
        for doc in s:docs
            if doc["word"] =~ "^" . a:base
                call add(matches, doc)
            endif
        endfor
        return matches
    endif
endfunction
