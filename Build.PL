use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Data::Tabulate::Plugin::HTMLTable',
    license             => 'perl',
    dist_author         => 'Renee Baecker <module@renee-baecker.de>',
    dist_version_from   => 'lib/Data/Tabulate/Plugin/HTMLTable.pm',
    requires            => {
        'Data::Tabulate'      => 0.04,
        'HTML::Table'         => 2.0,
    },
    build_requires      => {
        'Test::More'          => 0,
        'Test::CheckManifest' => 1.0,
        'Data::Tabulate'      => 0.04,
        'HTML::Table'         => 2.0,
    },
    add_to_cleanup      => [ 'Data::Tabulate::Plugin::HTMLTable-*' ],
);

$builder->create_build_script();
