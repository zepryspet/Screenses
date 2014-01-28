#!/usr/bin/perl -w

use warnings;
use strict;

print "To obtain the \"top policy\" you must create a file named: session.txt\n";
print "\n This file must contain the session table extracted from the Juniper ScreenOs Firewall\n";
print "\n Sucha file can be download using the next commands:\n";
print "set console page 0\n";
print "get session\n";
print "set console page 20\n";
print "It will be created the file topolicies.txt and it's going to contain the policy ranking";
sleep(3);
#open the file config in read mode
open SESSIONS, "<session.txt" or die $!;
open Topolices, ">topolicies.txt" or die $!;
#reading line by line
my @topolicy;
while (<SESSIONS>) {
	if($_ =~ /policy (.*?)\,/){ #extracting the policy number
		push(@topolicy, $1);    #Saving the number in the array topolicy
	}
}
#counting and ranking the policies based on the count
my %counts;
my $total=0;
$counts{$_}++ foreach @topolicy;
print Topolices "policy id \t\n";            
#Countgin and ordening the policies
foreach (sort {$counts{$a} <=> $counts{$b}} keys %counts) {
    print Topolices "$_ \toccurs $counts{$_} time(s)\n";
	$total=$total+$counts{$_}; 				 #Counting the sessions
}
print Topolices "\nsesiones totales $total"; #Printing the sessions counted by the script
close SESSIONS;
