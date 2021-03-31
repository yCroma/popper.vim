let s:sep = fnamemodify('.', ':p')[-1:]

function! s:get_files(path) abort
	let p = expand(a:path)
	let entries = []

	for f in readdir(p)
		if f[0] is# '.'
			continue
		endif

		let file_path = p . s:sep . f
		if isdirectory(file_path)
			""call add(entries, file_path)
			let entries += s:get_files(file_path)
		else
			if file_path[0] is# '.'
				let file_path = file_path[2:]
			endif
			call add(entries, file_path)
		endif
	endfor

	return entries
endfunction

function! popper#files() abort
	call popup_menu(s:get_files('.'), #{
		\ padding: [0,1,0,1],
		\ border: [1,1,1,1],
		\ highlight: "black",
		\ borderhighlight: ["white"]
		\})
endfunction

let s:store = []

function! s:add_item_store(directory) abort

endfunction

function! popper#additem() abort
	let sample_array = []
	let sample_array += [1]
	echo sample_array
	let sample_array += ["text", ["some", "hierarchy"]]
	echo sample_array
endfunction

" 目標：ディレクトリを選択した際に、ディレクトリの内部がポップアップに展開されるようにする

" ディレクトリを解析して、内部にあるファイルやディレクトリを item として管理する
" item から配列をレンダリング
" ポップアップで表示
" ポップアップ側の機能でディレクトリを選択した際は、さらに１段回掘り下げて、ディレクトリの内部がポップアップに順番を崩さず展開するようにする

let s:array_items = []
let s:list_items = {}
let s:array_popup = []

let s:current_dir = "."

function! popper#begin_popper() abort
	" 現在のディレクトリにおいてポップアップを行う

	" 現在のディレクトリのファイル情報を取得
	" 連想配列をデータストアに保存する
	" 配列を作成し、レンダリングを行う

	"let s:array_items = s:get_dir_files(s:current_dir)
	"let s:list_items = s:store_items(s:array_items)
	"let s:array_popup = s:render_items(s:list_items)
endfunction

function! popper#update_popper() abort
	" 操作時に発火する
	" ファイル選択して<CR>したらファイルを開く
	" ディレクトリを選択して<CR>したらもう一階層表示する
endfunction

""function! s:get_dir_files(path) abort
function! popper#get_dir_files(path) abort
	" path のディレクトリのファイルを取得
	let p = expand(a:path)
	let entries = []
	
	" 現在のパスの表示法は ./popper.vim"
	for f in readdir(p)
		let file_path = p . s:sep . f
		call add(entries, file_path)
	endfor
	return entries
endfunction

" { 'array_index' : num , 'file_path' : string , 'parent_index' : num , 'nest' : num , 'selected' : 0 or 1 }
"function! s:store_items(array_items) abort
function! popper#store_items(array_items) abort
	let l:list_items = []
	for item in a:array_items
		let l:list_item = {}
		let l:list_item.array_index = len(l:list_items)
		let l:list_item.file_path = item
		let l:list_item.parent_index = 0
		let l:list_item.nest = 0
		let l:list_item.selected = 0

		call add(l:list_items, l:list_item)
	endfor	
	return l:list_items
endfunction

" { 'array_index' : num , 'file_path' : string , 'file_name': string, 'parent_index' : num , 'nest' : num , 'selected' : 0 or 1 }
""function! s:generate_item(path) abort
function! popper#generate_items(path) abort
	" path のディレクトリの中身について、itemを生成する"
	let p = expand(a:path)
	let l:list_items = []
	
	" 現在のパスの表示法は ./popper.vim"
	for f in readdir(p)
		let l:file_path = p . s:sep . f

		let l:list_item = {}
		let l:list_item.array_index = len(l:list_items)
		let l:list_item.file_path = l:file_path
		let l:list_item.file_name = f
		let l:list_item.parent_index = 0
		let l:list_item.nest = 0
		let l:list_item.selected = 0
		let l:list_item.is_dir = isdirectory(l:file_path)

		call add(l:list_items, l:list_item)
	endfor
	return l:list_items
endfunction

function s:render_items(list_items) abort
	let l:array_popup = []
	for item in a:list_items
		
	endfor
	return l:array_popup
endfunction
