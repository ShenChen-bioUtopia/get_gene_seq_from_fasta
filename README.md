# get_gene_seq_from_fasta
You can get a list of gene seq from a fasta file, the list is not needed to match the fasta gene id completely.


# Usage
perl get_seq_from_fasta_file.pl fasta_name gene_name_list output_file

## For example

# The fasta was gene or cds or protein annotations,such as:
\>AA012345.01.T01.AR.XXX  
MEHAVEQGRSLAETPTYSVASVVTVMVFVCFLVERSIYRFGKKT

# Your gene list can be 
AA012345.01.T01.AR.XXX  
or only  
AA012345

It is useful for you ,you don't need to modify too many data fromat.
