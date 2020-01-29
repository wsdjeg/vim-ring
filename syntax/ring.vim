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
syn keyword ringFunctions acos                      add                       addattribute              adddays
syn keyword ringFunctions addmethod                 ascii                     asin                      assert
syn keyword ringFunctions atan                      atan2                     attributes                binarysearch
syn keyword ringFunctions bytes2double              bytes2float               bytes2int                 callgc
syn keyword ringFunctions ceil                      cfunctions                char                      chdir
syn keyword ringFunctions classes                   classname                 clearerr                  clock
syn keyword ringFunctions clockspersecond           closelib                  copy                      cos
syn keyword ringFunctions cosh                      currentdir                date                      dec
syn keyword ringFunctions decimals                  del                       diffdays                  dir
syn keyword ringFunctions double2bytes              eval                      exefilename               exefolder
syn keyword ringFunctions exp                       fabs                      fclose                    feof
syn keyword ringFunctions ferror                    fexists                   fflush                    fgetc
syn keyword ringFunctions fgetpos                   fgets                     filename                  find
syn keyword ringFunctions float2bytes               floor                     fopen                     fputc
syn keyword ringFunctions fputs                     fread                     freopen                   fseek
syn keyword ringFunctions fsetpos                   ftell                     functions                 fwrite
syn keyword ringFunctions getattribute              getchar                   globals                   hex
syn keyword ringFunctions hex2str                   input                     insert                    int2bytes
syn keyword ringFunctions intvalue                  isalnum                   isalpha                   isandroid
syn keyword ringFunctions isattribute               iscfunction               isclass                   iscntrl
syn keyword ringFunctions isdigit                   isfreebsd                 isfunction                isglobal
syn keyword ringFunctions isgraph                   islinux                   islist                    islocal
syn keyword ringFunctions islower                   ismacosx                  ismethod                  ismsdos
syn keyword ringFunctions isnull                    isnumber                  isobject                  ispackage
syn keyword ringFunctions ispackageclass            ispointer                 isprint                   isprivateattribute
syn keyword ringFunctions isprivatemethod           ispunct                   isspace                   isstring
syn keyword ringFunctions isunix                    isupper                   iswindows                 iswindows64
syn keyword ringFunctions isxdigit                  left                      len                       lines
syn keyword ringFunctions list                      list2str                  loadlib                   locals
syn keyword ringFunctions log                       log10                     lower                     max
syn keyword ringFunctions mergemethods              methods                   min                       murmur3hash
syn keyword ringFunctions nullpointer               number                    object2pointer            objectid
syn keyword ringFunctions packageclasses            packagename               packages                  perror
syn keyword ringFunctions pointer2object            pow                       prevfilename              ptrcmp
syn keyword ringFunctions raise                     random                    read                      remove
syn keyword ringFunctions rename                    reverse                   rewind                    right
syn keyword ringFunctions ring_give                 ring_see
syn keyword ringFunctions ring_state_delete         ring_state_filetokens
syn keyword ringFunctions ring_state_findvar        ring_state_init           ring_state_main
syn keyword ringFunctions ring_state_mainfile       ring_state_new            ring_state_newvar
syn keyword ringFunctions ring_state_runcode        ring_state_runfile        ring_state_runobjectfile
syn keyword ringFunctions ring_state_setvar         ringvm_callfunc           ringvm_calllist
syn keyword ringFunctions ringvm_cfunctionslist     ringvm_classeslist        ringvm_evalinscope
syn keyword ringFunctions ringvm_fileslist          ringvm_functionslist      ringvm_genarray
syn keyword ringFunctions ringvm_give               ringvm_hideerrormsg       ringvm_info
syn keyword ringFunctions ringvm_memorylist         ringvm_packageslist       ringvm_passerror
syn keyword ringFunctions ringvm_scopescount        ringvm_see                ringvm_settrace
syn keyword ringFunctions ringvm_tracedata          ringvm_traceevent         ringvm_tracefunc
syn keyword ringFunctions setattribute              shutdown                  sin                       sinh
syn keyword ringFunctions sort                      space                     sqrt                      srandom
syn keyword ringFunctions str2hex                   str2hexcstyle             str2list                  strcmp
syn keyword ringFunctions string                    substr                    swap                      sysget
syn keyword ringFunctions system                    tan                       tanh                      tempfile
syn keyword ringFunctions tempname                  time                      timelist                  trim
syn keyword ringFunctions type                      ungetc                    unsigned                  upper
syn keyword ringFunctions varptr                    version                   windowsnl                 write
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
  HiLink ringFunctions            Function

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

