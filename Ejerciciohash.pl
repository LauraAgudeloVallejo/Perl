use warnings;
use strict;
 
# defines country => language hash
my %langs =  ( England => 'English',
        France => 'French', 
        Spain => 'Spanish', 
        China => 'Chinese', 
        Germany => 'German');
 
for(keys %langs){
 print("Official Language of $_ is $langs{$_}\n");
}