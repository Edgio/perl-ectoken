#!/usr/bin/perl
# ------------------------------------------------------------------------------
# Copyright Verizon.
#
# Licensed under the terms of the Apache 2.0 open source license.
# Please refer to the LICENSE file in the project root for the terms
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# use...
# ------------------------------------------------------------------------------
use strict;
use warnings;
use feature "say";
use Getopt::Long qw(:config no_ignore_case);
use Net::EdgeCast::ECtoken qw(ec_encrypt);

GetOptions(
	"h|help"	=> sub { usage(); },
	"V|version"	=> sub { version(); },
);

sub usage {
	say "Usage $0 <key> <token>";
	exit 1;
}

sub version {
	say "EC Token encryption and decryption utility.  Version: 3.0.0";
	exit 0;
}

sub main {
	my $key = $ARGV[0];
	usage() unless $key;
	my $token = $ARGV[1];
	usage() unless $token;
	my $token_enc = ec_encrypt($key, $token);
	say "$token_enc";
}

main();
