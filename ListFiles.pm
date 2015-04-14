package ListFiles;

use Moose;
use File::Find::Rule;
use Path::Tiny;

has 'dir' => (
 	
	is          => 'ro',
 	isa         => 'Str',
  	required    => 1,

);

has 'ww_files' => (

  	is          => 'ro',
  	isa         => 'ArrayRef',
  	lazy        => 1,
  	default     => sub {
    
		my $self = shift;
    	my @files = File::Find::Rule->in($self->dir);
    	my @world_files;

    	for my $file (@files) {

     		my $p = path($file);
      		next unless $p->is_file or $p->is_dir;
      		my $st = $p->absolute->stat();

      		if ($st->mode & 0002) {
        
				push(@world_files, $file);
      		
			}
    
		}

    	return \@world_files;
  
	}

);

## Class methods

sub remove_ww_perms {

	my ($self, $file) = @_;
		

	print "Removing WW Permission on file: $file\n";
	chmod(0775, $file);	
	
}

1;
