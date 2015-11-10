use strict;
use warnings;
use File::Basename;
use parseVCF;
die "perl $0 vcf randPos.txt hotspotPos.txt\n" unless(@ARGV==3);

my $vcf=shift;
my $randposfile=shift;
my $hotspotfile=shift;
use strict;
use warnings;
use File::Basename;
use parseVCF;
die "perl $0 vcf randPos.txt hotspotPos.txt\n" unless(@ARGV==3);

my $vcf=shift;
my $randposfile=shift;
my $hotspotfile=shift;

my %selectedpos;
open I, $randposfile or die $!;
while(<I>){
        chomp;
        $selectedpos{$_}=1;
}
close I;

my %selectedhs;
open II, $hotspotfile or die $!;
while(<II>){
        chomp;
        $selectedhs{$_}=1;
}
close II;

my ($p1,$p2,$ma1,$ma2,$fa1,$fa2);
my $i=0;
open III,$vcf or die $!;
while(<III>){
        chomp;
        if($_=~/^#/){
                next;
        }
        $i++;
        if(existed $selectedpos{$i}){
                ($ma1,$ma2,$fa1,$fa2)=&parseVCF::returnParents($_);
                print "$ma1\t$ma2\t$fa1\t$fa2\n";
        }
}


