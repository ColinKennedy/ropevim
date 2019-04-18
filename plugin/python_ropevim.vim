if !has("python")
    finish
endif

function! LoadRope()
pythonx << EOF
import ropevim
from rope_omni import RopeOmniCompleter
EOF
endfunction

call LoadRope()

" The code below is an omni-completer for python using rope and ropevim.
" Created by Ryan Wooden (rygwdn@gmail.com)

function! RopeCompleteFunc(findstart, base)
    " A completefunc for python code using rope
    if (a:findstart)
        pythonx ropecompleter = RopeOmniCompleter(vim.eval("a:base"))
        pythonx vim.command("return %s" % ropecompleter.start)
    else
        pythonx vim.command("return %s" % ropecompleter.complete(vim.eval("a:base")))
    endif
endfunction
