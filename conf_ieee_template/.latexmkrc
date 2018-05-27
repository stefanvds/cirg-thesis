$pdflatex = 'lualatex -interaction=nonstopmode -halt-on-error %O --shell-escape %S';
$pdf_mode = 1;
$out_dir = '../build';
$aux_dir = $out_dir;
$recorder = 1;

@default_files = ('conference_041818.tex');

add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
   my ($base_name, $path) = fileparse( $_[0] );
   pushd $path;
   my $return = system "makeglossaries $base_name";
   popd;
   return $return;
}

push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';

$clean_ext .= ' %R.ist %R.xdy';
