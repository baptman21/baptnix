nnoremap <leader>xb o\begin{}<Esc>i
nnoremap <leader>xe o\end{}<Esc>i
vnoremap <leader>xf :s/\%V\(.*\)\/\(.*\)\%V/\\frac{\1}{\2}/<Esc>:noh<CR>i
nnoremap <leader>x1 i\frac{1}{}<Esc>i
