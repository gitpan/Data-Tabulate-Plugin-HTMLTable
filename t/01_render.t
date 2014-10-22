#!perl -T

use Data::Tabulate::Plugin::HTMLTable;
use Test::More;

eval "use Data::Tabulate";
plan skip_all => "Data::Tabulate is not installed" if $@;

plan tests => 1;
my @array     = (1..10);
my $tabulator = Data::Tabulate->new();
my $html      = $tabulator->render('HTMLTable',{data => [@array]});

my $check     = q~
<table>
<tr><td>1</td><td>2</td><td>3</td></tr>
<tr><td>4</td><td>5</td><td>6</td></tr>
<tr><td>7</td><td>8</td><td>9</td></tr>
<tr><td>10</td><td>&nbsp;</td><td>&nbsp;</td></tr>
</table>
~;

is($html,$check);
