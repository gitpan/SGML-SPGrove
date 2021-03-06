#
# Copyright (C) 1997 Ken MacLeod
# See the file COPYING for distribution terms.
#
# $Id: test.pl,v 1.2 1997/10/06 21:28:00 ken Exp $
#

# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..2\n"; }
END {print "not ok 1\n" unless $loaded;}
use SGML::SPGrove;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

{
    my ($grove) = SGML::SPGrove->new(<<EOF);
<LITERAL><TOP><ONE></ONE><TWO></TWO></TOP>
EOF
    my ($bad) = 0;
    $bad |= $grove->root->gi ne 'TOP';
    $bad |= $grove->root->contents->[0]->gi ne 'ONE';
    $bad |= $grove->root->contents->[1]->gi ne 'TWO';
    print (($bad ? "not " : "") . "ok 2\n");
}
