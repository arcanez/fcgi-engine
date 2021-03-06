use strict;
use warnings;
use inc::Module::Install;

die "This module is not for use on Windows, sorry."
    if  $^O eq 'Win32' or $^O eq 'cygwin';

name 'FCGI-Engine';
all_from 'lib/FCGI/Engine.pm';
license 'perl';

# prereqs
requires 'Moose'                    => 0.93;
requires 'MooseX::Daemonize'        => 0.09;
requires 'MooseX::Getopt'           => 0.26;
requires 'MooseX::Types::Path::Class';
requires 'Declare::Constraints::Simple';
requires 'FCGI';
requires 'CGI::Simple';
requires 'POSIX';
requires 'Config::Any';

feature 'Plack Support',
  -default           => 0,
  'MooseX::NonMoose' => 0.07,
  'Plack'            => 0.9910,
  'FCGI::Client'     => 0.04, # for the tests
  'IO::String'       => 0;    # for the tests

# things the tests need
build_requires 'Test::More';
build_requires 'Test::Exception';
build_requires 'Test::WWW::Mechanize';
build_requires 'File::Spec';
build_requires 'FindBin';
build_requires 'Cwd';

tests('t/*.t');

WriteAll();

