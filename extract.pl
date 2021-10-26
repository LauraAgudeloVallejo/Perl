#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper; 

#open -> comando para abrir archivo
#< --> va a entrar al código
open my $TAB1, "<$ARGV[0]"; #archivo/tabla
open my $TAB2, "<$ARGV[1]"; #genoma fasta
#ARGV --> cargar archivos en la memoria y acceder al archivo 
my %grupo; 
my $tab; 

while($tab = > <$TAB1>){
        chomp $tab; 
        my @split = split /\t/, $tab;
        my $id = join("\t", @split);
        if (!defined $grupo{id}){       
                $grupo{$id} = []; #vacie el contenido delahash
        }
        push @{$grupo{id}}, [$split[0], $split[1], $split[2], $split[3]]; #split hace accder a los valores
}
print Dumper (\%grupo);
# defined verifica si un valor está asignado o no a una variable
#chomp --> limpia caracteres, operadores no funcionales, los elimina.    
} 
#hash->% toma palabras claves de una tabla (keyword), las cuales van a adquirir un valor, es un loop 


