#!/usr/bin/env perl

use 5.020;
use warnings;

use Data::Dumper;

use Giftcard;

my $giftcard = Giftcard->new(
    
    giftcard_id => '44444444444444444444',
    
);

say $giftcard->balance;                             ## private object methods
say $giftcard->status;
say $giftcard->transaction_date;
say $giftcard->get_balance('33333333333333333333'); ## public class methods
say $giftcard->get_transaction_date('33333333333333333333');
say $giftcard->get_status('33333333333333333333'); 
