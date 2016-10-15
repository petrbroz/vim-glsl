# glsl.vim

Provides basic functionality such as syntax highlighting or code folding
for standard OpenGL ES 1.0 shaders, and for additional directives used in
[three.js](https://github.com/mrdoob/three.js/) (for example, `#include`).

Supported file extensions: `.glsl`, `.vs`, `.fs`

## Requirements

- [Vim 8](https://github.com/vim/vim/blob/master/runtime/doc/version8.txt)

## Installation

Clone this repo in your Vim's package folder:
```bash
   mkdir -p ~/.vim/pack
   cd ~/.vim/pack
   git clone git://github.com/petrbroz/vim-glsl.git
```

## Features

#### Syntax highlighting

![Syntax highlighting](https://github.com/petrbroz/vim-glsl/blob/gh-pages/images/syntax.png)

#### Code folding (indent-based)

![Code folding](https://github.com/petrbroz/vim-glsl/blob/gh-pages/images/folding.gif)

#### Go to shader chunk

With cursor inside the brackets of the `#include<foo>` directive, `gf` will try to find
_foo.glsl_, _foo.vs_, or _foo.fs_ in the subtree of the current working directory.

![Go to chunk](https://github.com/petrbroz/vim-glsl/blob/gh-pages/images/gotochunk.gif)

## License

Distributed under the same terms as Vim. See `:help license`.
