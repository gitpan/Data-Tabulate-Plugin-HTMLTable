
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'HTML::Table plugin for Data::Tabulate',
  'AUTHOR' => 'Renee Baecker <module@renee-baecker.de>',
  'BUILD_REQUIRES' => {},
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Data-Tabulate-Plugin-HTMLTable',
  'EXE_FILES' => [],
  'LICENSE' => 'artistic_2',
  'NAME' => 'Data::Tabulate::Plugin::HTMLTable',
  'PREREQ_PM' => {
    'Data::Tabulate' => '0.06',
    'HTML::Table' => '2.08',
    'Test::CheckManifest' => '1.22',
    'Test::More' => '0'
  },
  'VERSION' => '0.03',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



