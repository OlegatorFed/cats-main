use strict;
use warnings;

use File::Spec;
use FindBin;
use Test::Exception;
use Test::More tests => 19;

use lib File::Spec->catdir($FindBin::Bin, '..');
use lib File::Spec->catdir($FindBin::Bin, '..', 'cats-problem');

use CATS::Config;
use CATS::Messages qw(res_str);
use CATS::Settings;
use CATS::Time;

$CATS::Config::cats_dir = File::Spec->catdir($FindBin::Bin, '..');

CATS::Settings::init('', 'en');
CATS::Messages::init;

is res_str(500), 'login', 'messages loaded';

*fd = *CATS::Time::format_diff;

is fd(0), '', 'exact zero';
is fd(1e-5), '0:00', 'almost zero';
is fd(2.6/24/60/60, seconds => 1), '0:00:02.6', 'seconds';
is fd(1.0), '1 d.', '1 day';
is fd(1/24), '1:00', '1 hour';
is fd(1/24/60), '0:01', '1 minute';
is fd(23/24 + 15/24/60), '23:15', '23:15';
is fd(1 + 1/7, seconds => 1), '1 d. 03:25:42.9', 'day and 1/7';

is fd(-1.5), '-1 d. 12:00', 'minus day';
is fd(1/3, display_plus => 1), '+8:00', 'force plus';

is fd(1.9999999), '2 d.', 'rounding';
is fd(-1.9999999), '-2 d.', 'negative rounding';

is fd(1 + 1/24/60), '1 d. 00:01', 'day + minute';

*sdt = *CATS::Time::set_diff_time;

throws_ok { sdt({}, { ext_units => 'zzz', ext_time => 5 }, 'ext') }
    qr/units/, 'set_diff_time bad units';

{
    my $p = { ext_time => undef };
    ok !sdt($p, { ext_units => 'day', ext_time => undef }, 'ext'),
        'set_diff_time undef no change';
    ok sdt($p, { ext_units => 'day', ext_time => 1 }, 'ext'), 'set_diff_time day change';
    is $p->{ext_time}, 1, 'set_diff_time day';
    ok !sdt($p, { ext_units => 'day', ext_time => 1 }, 'ext'), 'set_diff_time day no change';
}
1;
