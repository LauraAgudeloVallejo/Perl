#!/usr/bin/perl
#
use strict; 
use Bio::Seq; 
# 
my $seq_secuencia1 = Bio::Seq -> new(-seq => 'AAATTTATATATA', 
	                                -display_id => "myfirstseq", 
	                                -desc => "ejemplo_1", 
	                                -alphabet => 'dna');

print ">".$seq_secuencia1->display_id."\n";
print $seq_secuencia1->seq."\n";


  
