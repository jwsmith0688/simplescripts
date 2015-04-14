package Giftcard;

=pod

=head1 NAME

Giftcards.pm

=head1 SYNOPSIS

    my $obj = Giftcard->new(
        giftcard_id  => '20-digit gitcard id',
    );

    $obj->balance;

=head1 DESCRIPTION

This is a Giftcard class that defines attributes and methods for determining
the various characteristics of a Giftcard -- balance, status, etc. 

=cut

use Moose;
use DBI;

## Class Attributes ##
has 'giftcard_id' => (

    is          => 'rw',
    isa         => 'Str',
    required    => 1,

);

has 'properties' => (

    is          => 'ro',
    isa         => 'HashRef',
    lazy        => 1,
    builder     => '_get_properties',

);

has 'balance' => (

    is          => 'ro',
    isa         => 'Num',
    lazy        => 1,
    default     => sub { 

        my $self    = shift;
        
        return $self->properties->{$self->giftcard_id}->{balance};
    
    }

);

has 'status' => (

    is          => 'ro',
    isa         => 'Str',
    lazy        => 1,
    default     => sub {

        my $self = shift;

        return $self->properties->{$self->giftcard_id}->{status};

    }

);

has 'transaction_date' => (

    is          => 'ro',
    isa         => 'Str',
    lazy        => 1,
    default     => sub {

        my $self = shift;

        return $self->properties->{$self->giftcard_id}->{transaction_date};

    }

);

## Class Methods
sub _get_properties {

    my $self        = shift;
    my %properties;

    my $dbh     = DBI->connect("DBI:mysql:database=BooksAMillion;host=localhost",
                                "jsmith", "#12jsmith",
                                { 'RaiseError' => 1 });

    my $sth     = $dbh->prepare("select * from Giftcard");

    $sth->execute();

    while (my $row = $sth->fetchrow_hashref()) {

        $properties{$row->{giftcard_id}} = $row;

    }

    return \%properties;

}

## Public class methods that exposes the 
## underlying object data structure as an API

sub get_balance {

    my $self    = shift;
    my $gc_num  = shift;

    if (!$gc_num) {
     
        return $self->properties->{$self->giftcard_id}->{balance};
                                                                    
    } else {
                                                                    
        if (exists($self->properties->{$gc_num})) {
                                                                    
            return $self->properties->{$gc_num}->{balance};
                                                                    
        } else {
                                                                    
            print "ERROR: That giftcard ID does not exist...\n";
            return;
                                                                    
        }
                                                                    
    }

}

sub get_status {

    my $self    = shift;
    my $gc_num  = shift;

    if (!$gc_num) {                                                     
         
        return $self->properties->{$self->giftcard_id}->{status};
                                                                        
    } else {
                                                                        
        if (exists($self->properties->{$gc_num})) {
                                                                        
            return $self->properties->{$gc_num}->{status};
                                                                        
        } else {
                                                                        
            print "ERROR: That giftcard ID does not exist...\n";
            return;
                                                                        
        }
                                                               
    }

}

sub get_transaction_date {

    my $self    = shift;
    my $gc_num  = shift;
    

    if (!$gc_num) {
     
        return $self->properties->{$self->giftcard_id}->{transaction_date};
                                                                    
    } else {
                                                                    
        if (exists($self->properties->{$gc_num})) {
                                                                    
            return $self->properties->{$gc_num}->{transaction_date};
                                                                    
        } else {
                                                                    
            print "ERROR: That giftcard ID does not exist...\n";
            return;
                                                                    
        }
                                                                    
    }

}

1;
