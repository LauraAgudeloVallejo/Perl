#!/usr/bin/perl

#los arreglos se representan por @
my @names = ("Laura", "Carlos", "Andrés");
#acceder a los elementos
print "El nombre es = $names[1]\n";
my @days = qw/Mon Tue Wed Thu Fri Sat Sun/;
print "The day = $days[3]\n";
print "The day = $days[-4]\n";
my @num = (2..5);
print "@num\n";
my @weeksday =@days[2..5];
print "@weeksday\n";


