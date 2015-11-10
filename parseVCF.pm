package parseVCF;

use strict;
use warnings;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION=1.00;
@ISA=qw(Exporter);
@EXPORT      = ();
@EXPORT_OK   = qw(func1 func2);
%EXPORT_TAGS = ( DEFAULT => [qw(&returnParents)]);

sub returnParents{
        my $line=$_;
        my ($ref,$alt,$p1,$p2)=(split /\s+/,$line)(3,4,9,10);
        my ($p1a1,$p1a2)=&parseGT($p1,$ref,$alt);
        my ($p2a1,$p2a2)=&parseGT($p2,$ref,$alt);
        return($p1a1,$p1a2,$p2a1,$p2a2);
}

sub parseGT{
        my $gtall=shift;
        my $ref=shift;
        my $alt=shift;
        my @snpcalled=($ref,$alt);

        my $gtsec=(split /:/,$gtall)[0];
        my ($gt1,$gt2)=split /\//,$gtsec;
        my $gta=$snpcalled[$gt1];
        my $gtb=$snpcalled[$gt2];
        return ($gta,$gtb);
}

