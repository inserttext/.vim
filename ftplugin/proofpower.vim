let proofpower#name       = expand('%:t')
let proofpower#full_name  = expand('%:p')
let proofpower#proxy      = '/tmp/' + proofpower#name

function proofpower#DecodeFile()
	exec pputf8 < proofpower#full_name > proofpower#proxy
	:open proofpower#proxy
endfunction

function proofpower#EncodeFile()
	exec utf8pp < proofpower#proxy > proofpower#full_name
endfunction

autocmd BufWrite *
