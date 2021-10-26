#!/usr/local/bin/perl -w

use strict;
use Bio::Seq;
use Bio::SeqIO;
use Bio::DB::GenBank;
use Bio::DB::Query::GenBank;

my @names = ("NC_018305.1", "NC_018306.1", "NC_018307.1", "NC_018308.1", "NC_018309.1", "NC_018310.1", "NC_018311.1", "NC_018312.1", "NC_018313.1", "NC_018314.1", "NC_018315.1", "NC_018316.1", "NC_018317.1", "NC_018318.1", "NC_018319.1", "NC_018320.1", "NC_018321.1", "NC_018322.1", "NC_018323.1", "NC_018324.1", "NC_018325.1", "NC_018326.1", "NC_018327.1", "NC_018328.1", "NC_018329.1", "NC_018330.1", "NC_018331.1", "NC_018332.1", "NC_018333.1", "NC_018334.1", "NC_018335.1", "NC_018336.1", "NC_018337.1", "NC_018338.1");

foreach my $n (@names){
    my  $query = "Leishmania mexicana [ORGANISM] and $n";
    my $query_obj = Bio::DB::Query::GenBank->new(-db => 'nucleotide',
                                        -query => $query);
    my $gb_obj = Bio::DB::GenBank->new;
    my $stream_obj = $gb_obj->get_Stream_by_query($query_obj);

    #my $seqio_obj_gb = Bio::SeqIO->new(-file => ">../Results/$n.gb",
     #                       -format => 'genbank');

    #my $seqio_obj = Bio::SeqIO->new(-file => ">../Results/$n.fasta",
    #                       -format => 'fasta');


    while(my $seq_obj = $stream_obj -> next_seq){
        #print $seq_obj->display_id, "\t", $seq_obj->length, "\n";
        #print $seq_obj->desc;
        my $seqName = $seq_obj->desc;
        #print $seqName."\n";
        $seqName =~ s/(.*)(chromosome)(.*)(\.)/chr$3/;
        $seqName =~ s/\s/\_/;
        $seq_obj->desc($seqName);
        print $seq_obj->desc;
        my $seqio_obj = Bio::SeqIO->new(-file => ">../../Data/Genomes/$seqName.fasta",
                            -format => 'fasta');
        $seqio_obj -> write_seq($seq_obj);
    #   my $seqio_obj_gb = Bio::SeqIO->new(-file => ">../../Results/Genbank/$seqName.gb",
    #                        -format => 'genbank');
    #   $seqio_obj_gb -> write_seq($seq_obj);
    }
}
