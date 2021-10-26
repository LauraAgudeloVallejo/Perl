#!/usr/local/bin/perl -w


use strict;
use Bio::DB::Query::GenBank;
use Bio::DB::GenBank;
use Bio::Seq;
use Bio::SeqIO;
#
# Como abrir un arhivo desde perl?
# Como acceder a cada elemento del archivo con while 
#
#open my @sp = archivo
#open (my $List = 'List.txt');
#while (my $List = <>) 
#{
#do

my @sps = ("Leishmania braziliensis", "Leishmania panamensis");
my @prots = ("Cystein protease", "Aspartic protease", "Metalloprotease");
foreach my $sp(@sps){
     foreach my $prot(@prots){

     my $query = "$sp [ORGN] AND $prot [KEYWORDS]";
     my $query_obj = Bio::DB::Query::GenBank->new(-db => 'protein',
                                            -query => $query);
     my $gb_obj = Bio::DB::GenBank->new;

     my $stream_obj = $gb_obj->get_Stream_by_query($query_obj);

     #my $seqOut = Bio::SeqIO->new(-file => '>/home/laura/Escritorio/Leishmania/Results/DBproteases/LD/sequence.fasta', 
     #                            -format => 'fasta' );

     #my $seq_obj = $stream_obj -> next_seq;

     #my $Out, '>', "/home/laura/Desktop/Leishmania/Scripts/Perl/Out.txt"; 
     while(my $seq_obj = $stream_obj -> next_seq){
     print ">",$seq_obj->display_id,"|", $seq_obj->desc, "\n", $seq_obj->seq, "\n"; 
     #$seqOut -> write_seq($seq_obj);
          }        
     }
  }
  
