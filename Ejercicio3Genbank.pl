#!/usr/bin/perl
#
use strict; 
use Bio::Seq;
use Bio::SeqIO;
use Bio::DB::GenBank;
 
# 
my $seq_obj= Bio::Seq -> new(-seq => 'AAATTTATATATA', 
	                                -display_id => "myfirstseq", 
	                                -desc => "ejemplo_1", 
	                                -alphabet => 'dna');
	
my $seqio_obj = Bio::SeqIO -> new(-file =>'>../../Results/DBproteases/seq.fa',
	                                        -format => 'fasta');

$seqio_obj->write_seq($seq_secuencia1); 

my $seqio_obj_gb = Bio::SeqIO -> new (-file=> '>../../Results/seq.gb',
						-format => 'genbank');
$seqio_obj_gb->write_seq($seq_secuencia1);

while ´´´´´´´´´´´´´´´´´´´´´´´´´l,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

