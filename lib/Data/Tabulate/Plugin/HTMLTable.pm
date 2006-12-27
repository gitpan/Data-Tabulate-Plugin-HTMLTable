package Data::Tabulate::Plugin::HTMLTable;

use warnings;
use strict;
use HTML::Table;

=head1 NAME

Data::Tabulate::Plugin::HTMLTable - HTML::Table plugin for Data::Tabulate

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

This module renders the table for HTML

    use Data::Tabulate;
    
    my @array = (1..10);
    my $foo   = Data::Tabulate->new();
    my $html  = $foo->render('HTMLTable',{data => [@array]});

=head1 METHODS

=head2 new

create a new object of C<Data::Tabulate::Plugin::HTMLTable>.

=cut

sub new{
    return bless {},shift;
}

=head2 output

returns a string that contains the HTML source for the table

=cut

sub output {
    my ($self,@data) = @_;
    
    my %atts = $self->attributes();
    my $obj  = HTML::Table->new(%atts);
    for(@data){
        my @row = map{defined($_) ? $_ : '&nbsp;'}@$_;
        $obj->addRow(@row);
    }
    
    return $obj->getTable();
}

=head2 attributes

set some attributes for L<HTML::Table>.

=cut

sub attributes{
    my ($self,%atts) = @_;
    $self->{attributes} = {%atts} if keys %atts;
    my %return = ();
    if(defined $self->{attributes} and ref($self->{attributes}) eq 'HASH'){
        %return = %{$self->{attributes}}
    }
    return %return;
}


=head1 AUTHOR

Renee Baecker, C<< <module at renee-baecker.de> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-data-tabulate-plugin-htmltable at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Data::Tabulate::Plugin::HTMLTable>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Data::Tabulate::Plugin::HTMLTable

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Data::Tabulate::Plugin::HTMLTable>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Data::Tabulate::Plugin::HTMLTable>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Data::Tabulate::Plugin::HTMLTable>

=item * Search CPAN

L<http://search.cpan.org/dist/Data::Tabulate::Plugin::HTMLTable>

=back

=head1 ACKNOWLEDGEMENTS

=head1 COPYRIGHT & LICENSE

Copyright 2006 Renee Baecker, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Data::Tabulate::Plugin::HTMLTable
