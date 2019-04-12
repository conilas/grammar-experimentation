use lib '.';
use grammar;

my $fh = open "../../examples/type_inference/local_type_inference.js", :r;
my $test = $fh.slurp;
$fh.close;

my $parse_tree = Lang.parse($test);

for $parse_tree<statement> -> $match {
  say $match
}

# Walking down the parse tree
# for $parse_tree<statement> -> $match {
#   when $match<variable-declaration><declaration><fn-declaration> {
#       say "\n";
#       say "[NAME OF FUNCTION]: " ~ $match<variable-declaration><word>;
#       say "[ARGUMENTS]: " ~ $match<variable-declaration><declaration><fn-declaration><fn-args>;
#       say "[BODY]: " ~ $match<variable-declaration><declaration><fn-declaration><fn-body-formats>;
#       say "\n";
#   }
# }