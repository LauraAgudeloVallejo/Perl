#!/usr/bin/perl

use strict;
use warnings;

use Bio::SeqIO;

my $in  = Bio::SeqIO->new(-file => $ARGV[0] ,
                          -format => 'Fasta');

while (my $seq = $in->next_seq) {
    print '>' . $seq->id . ' ' . $seq->desc . "\n";
    print $seq->seq . "\n";
}    
