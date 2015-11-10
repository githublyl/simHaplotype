package informativeSNP;

use strict;
use warnings;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION=1.00;
@ISA=qw(Exporter);
@EXPORT      = ();
@EXPORT_OK   = qw(func1 func2);
%EXPORT_TAGS = ( DEFAULT => [qw(&ifInformative)]);


sub ifInformative{
        my $line=shift;
        my ($p1,$p2)=(split /\s+/,$line)[9,10];
        my $p1allele=&parseAllele($p1);
        my $p2allele=&parseAllele($p2);
        my $flag=0;
        if( ($p1allele eq "0/0") && ($p2allele eq "0/1") ){
                $flag=1;
        }elsif( ($p1allele eq "0/1") && ($p2allele eq "0/0") ){
                $flag=1;
        }
        return $flag;
}

sub parseAllele{
        my $line=shift;
        my $allele=(split /:/,$line)[0];
        return $allele;
}
