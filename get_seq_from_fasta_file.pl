use strict;
use warnings;

my($fasta_file,$gene_name_list,$out) = @ARGV;
my $usage = "USAGE:\nperl $0 fasta_name gene_name_list output\n";
$usage .= "对于gene list中的名字可以为fasta内基因名字的子集，因为提供了匹配模式";
die $usage unless(@ARGV == 3);


my %fasta;
my $fasta_gene_id;
my $fasta_seq;
my $seqhead;

open(IN,"<$fasta_file") or die $!;
while(<IN>){
	chomp;
    if($_=~/>/){
        $fasta_gene_id = $_;
        $fasta_gene_id =~ s/\s+.*//;
        $fasta_gene_id =~ s/>//;
    }else{
        $fasta{$fasta_gene_id} = $_;
    }
}
close IN;

my @list;
open(IN,"<$gene_name_list");
while(<IN>){
    chomp;
    push(@list,$_);
}

close IN;

open(OUT,">$out");
foreach my $h (@list){
    foreach my $g (keys %fasta){
        if ($g =~ /$h/){
            my $gene_id = $g;
            print OUT "$gene_id\n$fasta{$gene_id}\n";
        }else{
            next;
        }
        
    }

}
close OUT;







