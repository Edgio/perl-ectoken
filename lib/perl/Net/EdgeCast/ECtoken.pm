package Net::EdgeCast::ECtoken;

use strict;
use warnings;

use Bytes::Random::Secure qw(random_bytes);
use Crypt::GCM;
use Crypt::Random::Seed;
use Crypt::Rijndael;
use Digest::SHA qw(sha256 sha256_hex);
use MIME::Base64::URLSafe;

use Exporter qw(import);
our @EXPORT_OK = qw(ec_encrypt ec_decrypt);

=head1 NAME

ECtoken

=head1 DESCRIPTION

ECToken is a library for encrypting and decrypting AES-GCM tokens.

Both ec_encrypt and ec_decrypt are exported.

=cut

=head1 FUNCTIONS

=over 4

=cut

=item ec_encrypt

ec_encrypt() takes two arguments, a key and a cleartext token. A urlsafe base64
encoded ciphertext token is returned

=item ec_decrypt

ec_decrypt() takes two arguments, a key and a ciphertext token. The cleartext token
is returned.

=back

=cut

sub ec_encrypt {
	my ($key, $token) = @_;

	# Get sha-256 of key
	my $key_sha256 = sha256($key);

	# Seed rand/generate iv
	my $rand_source = Crypt::Random::Seed->new(NonBlocking => 1);
	my $ivbytes = $rand_source->random_bytes(12);

	# AES GCM encrypt
	my $cipher = Crypt::GCM->new(
			-key => $key_sha256,
			-cipher => 'Crypt::Rijndael',
			);
	$cipher->set_iv($ivbytes);
	$cipher->aad('');
	my $ciphertext = $cipher->encrypt($token);
	my $tag = $cipher->tag;

	# URL Safe Base64 encode and return
	return urlsafe_b64encode("$ivbytes$ciphertext$tag");
}

sub ec_decrypt {
	my ($key, $ciphertoken) = @_;

	return;
}

{
	no warnings "void";
	"If you want to keep a secret, you must also hide it from yourself. - George Orwell";
}

