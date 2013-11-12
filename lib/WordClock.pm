package WordClock;
use Dancer ':syntax';

our $VERSION = '0.1';

sub datetime {
    my ($timezone) = @_;
    local $ENV{TZ} = $timezone;
    sleep 2;
    return `date -Iseconds`;
}

any '/' => sub {
    template 'clock' => {
        datetime => datetime('UTC')
    };
};

true;
