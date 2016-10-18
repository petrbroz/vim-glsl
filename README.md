# glsl.vim

Provides basic functionality such as syntax highlighting or code folding
for standard OpenGL ES 1.0 shaders, and for additional directives used in
[three.js](https://github.com/mrdoob/three.js/) (for example, `#include`).

Supported file extensions: `.glsl`, `.vs`, `.fs`

![Demo](https://github.com/petrbroz/vim-glsl/blob/gh-pages/images/screencast.gif?raw=true)

## Installation

* Using [pathogen](https://github.com/tpope/vim-pathogen)? Open your terminal and run:
```bash
cd ~/.vim/bundle && git clone git://github.com/petrbroz/vim-glsl.git
```
* Using [Vundle](https://github.com/VundleVim/Vundle.vim)? Open your _.vimrc_ and add:
```vim
Plugin 'petrbroz/vim-glsl'
```
* Using [NeoBundle](https://github.com/Shougo/neobundle.vim)?  Open your _.vimrc_ and add:
```vim
NeoBundle 'petrbroz/vim-glsl'
```

## Features

#### Syntax highlighting

Based on WebGL 1.0 [specs](https://www.khronos.org/registry/webgl/specs/latest/).
Additionally, `#include` directives used in [three.js](https://github.com/mrdoob/three.js/)
are also recognized.

#### Code folding

Simply based on cindent.

#### Reference documentation

The built-in variables, constants, and functions of OpenGL ES GLSL are documented
using vim's docs format, so you can look up the documentation using something like
`:h texture2D()`, or just hit `K` while the cursor is on the function.

> If these don't work, you may need to update your help tags. See `:h helptags`
> for more information.

#### Autocomplete

The same reference documentation mentioned above is used to provide the user-defined
autocompletion. Hit `ctrl-x` `ctrl-u` while in insert mode to invoke it. If you want
to use omnicompletion instead (`ctrl-x` `ctrl-o`), add the following line to your
_.vimrc_ file:

```vim
set omnifunc=glsl#CompleteFunc
```

#### Go to shader chunk

With cursor inside the brackets of the `#include<foo>` directive, `gf` will try to find
_foo.glsl_, _foo.vs_, or _foo.fs_ in the subtree of the current working directory.

## License

Distributed under the same terms as Vim. See `:help license`.
