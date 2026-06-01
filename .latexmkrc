$pdf_mode = 5;
$xelatex = 'xelatex -halt-on-error -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
$show_time = 1;

$ENV{'TZ'} = 'Asia/Shanghai';

$clean_ext = join(' ', qw(
    acn acr alg aux bbl blg fls glg glo gls hd idx ist
    loa lof log lot nav out snm toc run.xml thm xdv
    fdb_latexmk synctex.gz
));
