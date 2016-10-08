package App::Spec::Example::MySimpleApp;
use warnings;
use strict;
use 5.010;

use base 'App::Spec::Run::Cmd';

use App::Spec::Example::MyApp;

sub execute {
    my ($self, $run) = @_;
    my $opt = $run->options;
    my $param = $run->parameters;
    if ($ENV{PERL5_APPSPECRUN_TEST}) {
        say "Options: " . App::Spec::Example::MyApp->_dump_hash($opt);
        say "Parameters: " .  App::Spec::Example::MyApp->_dump_hash($param);
        return;
    }
    warn __PACKAGE__.':'.__LINE__.$".Data::Dumper->Dump([\$opt], ['opt']);
    warn __PACKAGE__.':'.__LINE__.$".Data::Dumper->Dump([\$param], ['param']);

}

1;
