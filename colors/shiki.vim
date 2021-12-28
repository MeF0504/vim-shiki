" Vim color file
" Name:     shiki
" Author:   MeF0504
" Github:   https://github.com/MeF0504/vim-shiki
"

highlight clear
if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'shiki'
set background=dark

function! s:ret_color_id(cid, gui)
    if type(a:cid) == type('a')
        return a:cid
    endif
    if !a:gui
        return a:cid
    endif
    " https://jonasjacek.github.io/colors/
    let system_color = [
                \ '#000000',
                \ '#800000',
                \ '#008000',
                \ '#808000',
                \ '#000080',
                \ '#800080',
                \ '#008080',
                \ '#c0c0c0',
                \ '#808080',
                \ '#ff0000',
                \ '#00ff00',
                \ '#ffff00',
                \ '#0000ff',
                \ '#ff00ff',
                \ '#00ffff',
                \ '#ffffff',
                \ ]

    if a:cid < 16
        " system colors
        return system_color[a:cid]
    elseif a:cid >= 232
        " gray scales
        let g_level = (a:cid-232)*10+8
        return printf('#%02x%02x%02x', g_level, g_level, g_level)
    else
        " 6x6x6 color blocks
        let cid = a:cid - 16
        let r = cid/36
        let g = (cid-r*36)/6
        let b = cid%6
        if r != 0
            let r = (r*40)+55
        endif
        if g != 0
            let g = (g*40)+55
        endif
        if b != 0
            let b = (b*40)+55
        endif
        return printf('#%02x%02x%02x', r, g, b)
    endif

endfunction

let s:color_def = {}
" :h group-name
let s:color_def["Normal"]           = [254, 232, '']
let s:color_def["Error"]            = [255, 9, 'Bold']

" Spring
let s:color_def["PreProc"]          = [105, -1, '']
" let s:color_def["Include"]        = 
" let s:color_def["Define"]         = 
" let s:color_def["Macro"]          = 
" let s:color_def["Precondit"]      = 

" Summer
let s:color_def["Identifier"]       = [33, -1, 'NONE']
" let s:color_def["Function"]       = 
let s:color_def["Statement"]        = [39, -1, 'Bold']
" let s:color_def["Conditional"]    = 
" let s:color_def["Repeat"]         = 
" let s:color_def["Label"]          = 
" let s:color_def["Operator"]       = 
" let s:color_def["Keyword"]        = 
" let s:color_def["Exception"]      = 
let s:color_def["Constant"]         = [44, -1, '']
" let s:color_def["Number"]         = 
" let s:color_def["Boolean"]        = 
" let s:color_def["Float"]          = 
let s:color_def["String"]           = [34, -1, '']
let s:color_def["Character"]        = [34, -1, '']
let s:color_def["Special"]          = [228, -1, '']
let s:color_def["Type"]             = [83, -1, '']
" let s:color_def["StorageClass"]   = 
" let s:color_def["Structure"]      = 
" let s:color_def["Typedef"]        = 

" Autumn

" Winter
let s:color_def["Comment"]          = [244, -1, '']
" let s:color_def["SpecialChar"]    = 
" let s:color_def["Tag"]            = 
" let s:color_def["Delimiter"]      = 
" let s:color_def["SpecialComment"] = 
" let s:color_def["Debug"]          = 
let s:color_def["Underlined"]       = [45, -1, 'Bold']
let s:color_def["Ignore"]           = [7, -1, '']
let s:color_def["Todo"]             = [0, 253, 'Bold']


" :h highlight-groups
" let s:color_def["Cursor"]         = 
" let s:color_def["StatusLine"]       = 
" let s:color_def["StatusLineNC"]     = 
" let s:color_def["StatusLineTerm"]   = 
" let s:color_def["StatusLineTermNC"] = 
" let s:color_def["WildMenu"]         = 
let s:color_def["ErrorMsg"]         = [255, 1, 'Bold']
let s:color_def["WarningMsg"]       = [235, 11, 'Bold']

" Spring
let s:color_def["CursorColumn"]     = [-1, 46, '']
let s:color_def["CursorLine"]       = [-1, -1, 'UnderLine']
let s:color_def["VertSplit"]        = [44, -1, '']
let s:color_def["Folded"]           = [253, 93, 'Bold']
let s:color_def["SignColumn"]       = [207, -1, 'Bold']
let s:color_def["LineNr"]           = [219, 0, '']
let s:color_def["CursorLineNr"]     = [234, 250, '']
let s:color_def["QuickFixLine"]     = [254, 53, '']
let s:color_def["Title"]            = [207, -1, 'Bold']

" Summer
let s:color_def["Directory"]        = [22, -1, 'Bold']

" Autumn
let s:color_def["DiffAdd"]          = [235, 226, '']
let s:color_def["DiffChange"]       = [253, 94, '']
let s:color_def["DiffDelete"]       = [253, 88, '']
let s:color_def["DiffText"]         = [253, 130, 'Bold']
let s:color_def["IncSearch"]        = [254, 166, 'Bold']
let s:color_def["MatchParen"]       = [196, 'NONE', 'Bold']
let s:color_def["Search"]           = [252, 124, 'Bold']
let s:color_def["Pmenu"]            = [253, 240, '']
let s:color_def["PmenuSel"]         = [235, 221, 'Bold']
let s:color_def["PmenuSbar"]        = [250, 52, '']
let s:color_def["PmenuThumb"]       = [250, 196, '']
let s:color_def["SpecialKey"]       = [126, -1, 'UnderLine']
let s:color_def["SpellBad"]         = [250, 160, '']
let s:color_def["SpellCap"]         = [235, 190, '']
let s:color_def["SpellLocal"]       = [235, 143, '']
let s:color_def["SpellRare"]        = [250, 88, '']

" Winter
let s:color_def["ColorColumn"]      = [-1, 17, '']
let s:color_def["Conceal"]          = [18, -1, '']
let s:color_def["FoldColumn"]       = [7, 234, '']
let s:color_def["ModeMsg"]          = [19, 255, 'Bold']
let s:color_def["MoreMsg"]          = [12, 250, 'Bold']
let s:color_def["NonText"]          = [38, -1, '']
let s:color_def["Question"]         = [7, -1, 'Bold']
let s:color_def["Visual"]           = [253, 18, '']

for s:kn in keys(s:color_def)
    let s:exe_cmd = 'highlight '.s:kn
    if s:color_def[s:kn][0] >= 0
        let s:exe_cmd .= ' ctermfg='.s:ret_color_id(s:color_def[s:kn][0], 0)
        let s:exe_cmd .= ' guifg='.s:ret_color_id(s:color_def[s:kn][0], 1)
    endif
    if s:color_def[s:kn][1] >= 0
        let s:exe_cmd .= ' ctermbg='.s:ret_color_id(s:color_def[s:kn][1], 0)
        let s:exe_cmd .= ' guibg='.s:ret_color_id(s:color_def[s:kn][1], 1)
    endif
    if s:color_def[s:kn][2] != ''
        let s:exe_cmd .= ' cterm='.s:color_def[s:kn][2]
        let s:exe_cmd .= ' gui='.s:color_def[s:kn][2]
    endif
    execute s:exe_cmd
    " echo s:exe_cmd
endfor

