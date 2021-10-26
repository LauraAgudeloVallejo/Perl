#!/usr/bin/perl

use strict; 
use warnings;
use Bio::Seq;
use Bio::SeqIO;

#my $seq_obj = Bio::Seq -> new(-seq => 'TATATATATA',
#                               -display_id => "secuencia",
#                               -desc => "ejemplo_1",    
#                               -alphabet => "dna");
#my $seqio_obj =Bio::SeqIO -> new(-file => '>seq.fasta',
#                                -format => 'fasta');
#
#$seqio_obj->write_seq($seq_obj);

#Tarea

#my @seq = ("TATATA", "GAGAGAGA", "ATCGATCG");
#foreach my$file_names(@seq) = ("seq1","seq2" ,"seq3");
#foreach my $seq_obj(@seq){ = Bio::Seq -> new(-seq => '$seq',
#                         -display_id => '$seq',
#                         -desc => '$seq',    
#                         -alphabet => "dna");
#}
#        my $seqio_obj = Bio::SeqIO -> new(-file => > '$seq',
#                         -format => 'fasta');
# 
# $seqio_obj->write_seq($seq);


my @seq = ("TATATA", "GAGAGAGA", "ATCGATCG");
my %seq_name =  ( GAGAGAGA => 'GAGAGAGA',
        TATATA   => 'TATATA', 
        ATCGATCG => 'ATCGATCG', 
foreach my $seq(@seq){
	foreach my $seq_name(@seq_name){

		my $seq = Bio::Seq -> new(-seq => $seq, 
		         -display_id => $seq_name,
                         -desc => $seq_name,    
                         -alphabet => "dna");
}
                my $seq_io = Bio::SeqIO -> new(-file => $seq,
                         -format => 'fasta');

$seq_io->write_seq($seq);
}
