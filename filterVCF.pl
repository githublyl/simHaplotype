use strict;
use warnings;
use File::Basename;
use informativeSNP;

die "perl $0 vcf\n" unless(@ARGV==1);
my $vcf=shift;

open I, $vcf or die $!;
while(<I>){
        chomp;
        if($_=~/^#/){
                print "$_\n";
                next;
        }
        my $flag=&informativeSNP::ifInformative($_);
        if($flag==1){
                print "$_\n";
        }
}


