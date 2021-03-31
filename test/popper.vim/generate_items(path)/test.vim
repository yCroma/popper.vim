" ディレクトリの要素を取得する関数のテスト

""{'parent_index': 0, 'array_index': 0, 'file_path': './sample_dir/.Afile', 'is_dir': 0, 'nest': 0, 'file_name': '.Afile', 'selected': 0}
""{'parent_index': 0, 'array_index': 1, 'file_path': './sample_dir/Bdir', 'is_dir': 1, 'nest': 0, 'file_name': 'Bdir', 'selected': 0}
""{'parent_index': 0, 'array_index': 2, 'file_path': './sample_dir/Cfile', 'is_dir': 0, 'nest': 0, 'file_name': 'Cfile', 'selected': 0}
""{'parent_index': 0, 'array_index': 3, 'file_path': './sample_dir/Dfile', 'is_dir': 0, 'nest': 0, 'file_name': 'Dfile', 'selected': 0}


""let s:output = popper#generate_items("./sample_dir")
""call setline(3, s:output)

let v:errors = []

let s:expected = [ 
	\ {'parent_index': 0, 'array_index': 0, 'file_path': './sample_dir/.Afile', 'is_dir': 0, 'nest': 0, 'file_name': '.Afile', 'selected': 0},
	\ {'parent_index': 0, 'array_index': 1, 'file_path': './sample_dir/Bdir', 'is_dir': 1, 'nest': 0, 'file_name': 'Bdir', 'selected': 0},
	\ {'parent_index': 0, 'array_index': 2, 'file_path': './sample_dir/Cfile', 'is_dir': 0, 'nest': 0, 'file_name': 'Cfile', 'selected': 0},
	\ {'parent_index': 0, 'array_index': 3, 'file_path': './sample_dir/Dfile', 'is_dir': 0, 'nest': 0, 'file_name': 'Dfile', 'selected': 0},
	\]

let s:actual = popper#generate_items("./sample_dir") 

call assert_equal( s:expected, s:actual , "test fail")
echo v:errors

