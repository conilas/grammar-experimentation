use lib '.';
use grammar;

my $fh = open "file_test.boll", :r;
my $test = $fh.slurp;
$fh.close;

my $parse_tree = Lang.parse($test, actions => LangActions.new);

for $parse_tree<statement> -> $match {
  say $match
}
