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

#### Reference documentation

The built-in variables, constants, and functions of OpenGL ES GLSL are documented
using vim's docs format, so you can look up the documentation using something like
`:h texture2D()`, or just hit `K` while the cursor is on the function.

#### Autocomplete

The same reference documentation mentioned above is used to provide the user-defined
autocompletion. Hit `ctrl-x` `ctrl-u` while in insert mode to invoke it. If you want
to use omnicompletion instead (`ctrl-x` `ctrl-o`), add the following line to your
_.vimrc_ file:

```vim
set omnifunc=glsl#CompleteFunc
```

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
