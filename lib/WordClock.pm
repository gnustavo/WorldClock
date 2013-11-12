package WordClock;
use Dancer ':syntax';

our $VERSION = '0.1';

any '/' => sub {
    sleep 2;
    template 'clock' => {
        datetime => `date -Iseconds`
    };
};

true;
