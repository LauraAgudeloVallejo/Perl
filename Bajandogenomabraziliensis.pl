#!/usr/local/bin/perl -w

use strict;
use Bio::Seq;
use Bio::SeqIO;
use Bio::DB::GenBank;
use Bio::DB::Query::GenBank;

my @names = ("NC_009386.2", "NC_009387.2", "NC_009388.2", "NC_009389.2", "NC_009390.2", "NC_009277.2", "NC_009391.2", "NC_009392.2", "NC_009393.2", "NC_009394.2", "NC_009395.2", "NC_009396.2", "NC_009397.2", "NC_009398.2", "NC_009399.2", "NC_009400.2", "NC_009401.2","NC_009402.2","NC_009403.2", "NC_009404.2", "NC_009405.2", "NC_009406.2", "NC_009407.2", "NC_009408.2", "NC_009409.2", "NC_009410.2", "NC_009411.2", "NC_009412.2", "NC_009414.2", "NC_009415.2", "NC_009416.2", "NC_009417.2", "NC_009418.2", "NC_009419.2", "NC_009420.2");

foreach my $n (@names){
    my  $query = "Leishmania infantum [ORGANISM] and $n";
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
        }
}
