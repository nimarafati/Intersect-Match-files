#!/usr/bin/perl
#This script gets two files and intersect them by identifiers available in first column of each file
#Nima Rafati 20140110
my $inFile1=$ARGV[0];
my $inFile2=$ARGV[1];
my $col1=$ARGV[2];
my $col2=$ARGV[3];
my %hashF1=();
my %hashF2=();
my $usage="Usage:./$0 file1 file2 column_file1 column_file2\n";

open(inF1,$inFile1) || die print "No input file\n$usage";
while(<inF1>)
{
        chomp($_);
        @lineArr=split("\t",$_);
	$hashF1{$lineArr[$col1-1]}=$_;
	#print "$lineArr[$col1-1]\n$hashF1{$lineArr[$col1-1]}\n";<STDIN>;
}
close inF1;

open(inF2,$inFile2) || die print "No input file";
while(<inF2>)
{
        chomp($_);
        @lineArr=split("\t",$_);
	if(exists $hashF1{$lineArr[$col2-1]})
	{
		print "$hashF1{$lineArr[$col2-1]}\t$_\n";
	}
}
close inF2;
