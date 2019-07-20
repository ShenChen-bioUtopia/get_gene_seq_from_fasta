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
	#print $fasta{"MedsaG0000065333.01.T01"};
}
close IN;

my @list;
open(IN,"<$gene_name_list");
while(<IN>){
    chomp;
    push(@list,$_);
}
#print @list;
close IN;

open(OUT,">$out");
foreach my $h (@list){
    #print $h;
    foreach my $g (keys %fasta){
        #print $g;
        if ($g =~ /$h/){
            my $gene_id = $g;
            print OUT "$gene_id\n$fasta{$gene_id}\n";
        }else{
            next;
        }
        
    }

}
close OUT;







