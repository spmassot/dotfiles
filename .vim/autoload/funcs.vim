function! funcs#ToggleBool()
    let wordUnderCursor = eval('expand("<cword>")')
    if len(wordUnderCursor)
	let toggleValue = ToggleBoolValue(wordUnderCursor)
	echom toggleValue
	let startPos = getpos(".")
	execute('normal! ciw')
	append(toggleValue)
	call setpos(".", startPos)
    endif
endfunction

function! ToggleBoolValue(word)
    if a:word ==# 'true'
	echom 'true'
        return 'false'
    elseif a:word ==# 'True'
	echom 'True'
	return 'False'
    elseif a:word ==# 'false'
	echom 'false'
	return 'true'
    elseif a:word ==# 'False'
	echom 'False'
	return 'True'
    else
	return a:word
    endif
endfunction
