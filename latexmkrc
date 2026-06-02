$pdf_mode = 5;
$xelatex = 'xelatex -halt-on-error -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
$show_time = 1;

# Beijing time (UTC+8).
$ENV{'TZ'} = 'Etc/GMT-8';

# Overleaf runs latexmk, not Makefile, so generate this included PDF on demand.
add_cus_dep('tex', 'pdf', 0, 'make_watermark_pdf');

sub make_watermark_pdf {
    my ($base) = @_;

    return 1 unless $base eq 'watermark/watermark_logo';
    return system('latexmk', '-cd', 'watermark/watermark_logo.tex');
}

$clean_ext = join(' ', qw(
    acn acr alg aux bbl blg fls glg glo gls hd idx ist
    loa lof log lot nav out snm toc run.xml thm xdv
    fdb_latexmk synctex.gz
));
