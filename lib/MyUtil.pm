package MyUtil;
use strict;
use warnings;
use autodie;

use base 'Exporter';
use vars qw(@ISA @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter);

%EXPORT_TAGS = (
    all => [
        qw{
            replace_home
        },
    ],
);

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

sub replace_home {
    my $path = shift;

    require File::Spec;
    require File::HomeDir;

    if ( $path =~ /^\~\// ) {
        $path =~ s/^\~\///;
        $path = File::Spec->catdir( File::HomeDir->my_home, $path );
    }

    return $path;
}


1;
