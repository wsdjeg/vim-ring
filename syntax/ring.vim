" Vim syntax file
" Language:     ring
" Maintainer:   Shidong Wang <wsdjeg@outlook.com>
" URL:          http://github.com/wsdjeg/vim-ring
" Description:  Contains all of the keywords in #lang ring

" Initializing:
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" Highlight unmatched parens
" syn match ringError ,[]})],

if version < 600
  set iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
else
  setlocal iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
endif

" Language Reference
" http://ring-lang.sourceforge.net/doc1.12/reference.html
syn keyword ringKeywords again and but bye call case catch changeringkeyword changeringoperator class def do done else elseif end exit for from func get give if import in load loadsyntax loop new next not off ok on or other package private put return see step switch to try while endfunc endclass endpackage
" all built-in functions

" comments
" We can write one line comments and multi-line comments
" The comment starts with # or //
" Multi-line comments are written between /* and */
syn match ringComment /\(#.*$\)\|\(\/\/.*$\)\|\(\/\*\_.*\*\/\)/ contains=ringTodo,@Spell
" syn region ringMultilineComment start=/#|/ end=/|#/ contains=ringMultilineComment,ringTodo,ringNote,@Spell
syn keyword ringTodo FIXME TODO contained

" Literals
syn region ringString start=/\%(\\\)\@<!"/ skip=/\\[\\"]/ end=/"/
syn keyword ringBoolean  true false
syn match ringSymbol /'\S*/

if version >= 508 || !exists("did_ring_syntax_inits")
  if version < 508
    let did_ring_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink ringKeywords             Statement
  HiLink ringFunc                 Function

  HiLink ringString               String
  HiLink ringChar                 Character
  HiLink ringBoolean              Boolean

  HiLink ringNumber               Number
  HiLink ringNumberError          Error
  HiLink ringContainedNumberError Error

  HiLink ringQuoted               Structure
  HiLink ringQuotedStruc          Structure
  HiLink ringSymbol               Structure

  HiLink ringDelimiter            Delimiter
  HiLink ringConstant             Constant

  HiLink ringComment              Comment
  HiLink ringMultilineComment     Comment
  HiLink ringTodo                 Todo
  HiLink ringNote                 SpecialComment
  HiLink ringError                Error

  HiLink ringExtSyntax            Type
  HiLink ringExtFunc              PreProc
  delcommand HiLink
endif

let b:current_syntax = "ring"

