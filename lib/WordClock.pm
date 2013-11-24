package WordClock;
use Dancer ':syntax';

our $VERSION = '0.1';

sub datetime {
    my ($timezone) = @_;
    local $ENV{TZ} = $timezone;
    sleep 2;
    return `date -Iseconds`;
}

sub timezones {
    my @tzs = grep {/^[A-Z]/} map {substr $_, length('/usr/share/zoneinfo/')} `find /usr/share/zoneinfo/Brazil -not -type d`;
    chomp(@tzs);
    unshift @tzs, 'UTC';
    return \@tzs;
}

any '/' => sub {
    my $timezone = params->{'timezone'} || 'UTC';
    template 'clock' => {
        datetime  => datetime($timezone),
        timezone  => $timezone,
        timezones => timezones,
    };
};

true;
