#!/usr/bin/env python

###
  #
  # (c) Zarek Siegel
  # created 2016/11/07
  #

import argparse, datetime

global fmt_codes
fmt_codes = {
    'd4': '%m%d',
    'd6': '%y%m%d',
    'd8': '%Y%m%d',
    'd4/': '%m/%d',
    'd6/': '%m/%d/%y',
    'd8/': '%m/%d/%Y',
    '6_4': '%y%m%d_%H%M'
}
fmt_codes['default'] = fmt_codes['6_4']
fmt_codes['4'] = fmt_codes['d4']
fmt_codes['6'] = fmt_codes['d6']
fmt_codes['8'] = fmt_codes['d8']
fmt_codes['4'] = fmt_codes['d4']
fmt_codes['6'] = fmt_codes['d6']
fmt_codes['8'] = fmt_codes['d8']
fmt_codes['/'] = fmt_codes['6/']

global tz_codes
tz_codes = {
    'utc': {
        'Z': 'UTC',
        'z': '+0000'
    },
    'est': {
        'Z': 'EST',
        'z': '+0500'
    },
    '': {}
}

global formatting_info
formatting_info = """
    %a - Weekday as locale’s abbreviated name. (Sun, Mon, ..., Sat)
    %A - Weekday as locale’s full name. (Sunday, Monday, ..., Saturday)
    %w - Weekday as a decimal number, where 0 is Sunday and 6 is
            Saturday. (0, 1, ..., 6)
    %d - Day of the month as a zero-padded decimal number.
            (01, 02, ..., 31)
    %b - Month as locale’s abbreviated name. (Jan, Feb, ..., Dec)
    %B - Month as locale’s full name. (January, February, ..., December)
    %m - Month as a zero-padded decimal number. (01, 02, ..., 12)
    %y - Year without century as a zero-padded decimal number.
            (00, 01, ..., 99)
    %Y - Year with century as a decimal number.
            (0001, 0002, ..., 2013, 2014, ..., 9998, 9999)
    %H - Hour (24-hour clock) as a zero-padded decimal number.
            (00, 01, ..., 23)
    %I - Hour (12-hour clock) as a zero-padded decimal number.
            (01, 02, ..., 12)
    %p - Locale’s equivalent of either AM or PM. (AM, PM)
    %M - Minute as a zero-padded decimal number. (00, 01, ..., 59)
    %S - Second as a zero-padded decimal number. (00, 01, ..., 59)
    %f - Microsecond as a decimal number, zero-padded on the left.
            (000000, 000001, ..., 999999)
    %z - UTC offset in the form +HHMM or -HHMM (empty string if the
            object is naive).
            ((empty), +0000, -0400, +1030)
    %Z - Time zone name (empty string if the object is naive).
            ((empty), UTC, EST, CST)
    %j - Day of the year as a zero-padded decimal number.
            (001, 002, ..., 366)
    %U - Week number of the year
            (Sunday as the first day of the week) as a zero padded
            decimal number. All days in a new year preceding the
            first Sunday are considered to be in week 0.
            (00, 01, ..., 53)
    %W - Week number of the year (Monday as the first day of the
            week) as a decimal number. All days in a new year
            preceding the first Monday are considered to be in week 0.
            (00, 01, ..., 53)
    %c - Locale’s appropriate date and time representation.
            (Tue Aug 16 21:30:00 1988)
    %x - Locale’s appropriate date representation.
            (08/16/1988)
    %X - Locale’s appropriate time representation.
            (21:30:00)
"""

################################################################################

def parse_format(fmt_in):
    fmt_out = fmt_in

    return fmt_out

def parse_timezone(tz_in):
    tz_out = tz_in

    return tz_out

def main():

    parser = argparse.ArgumentParser(
        description="pydt.py - dates 'n' shit")

    parser.add_argument('-i', '--in-fmt', metavar='FMT', type=str, nargs=1,
        default='now', action='store', help='')
    parser.add_argument('-o', '--out-fmt', metavar='FMT', type=str, nargs=1,
        default=['default'], action='store', help='')
    parser.add_argument('-z', '--timezone', metavar='TZ', type=str, nargs=1,
        default=None, action='store', help='')
    parser.add_argument('-I', '--print-info', action='store_true', default=False,
        help='print the formatting info')
    parser.add_argument('-N', '--namespace', action='store_true', default=False,
        help='print the args namespace')

    # parser.add_argument('-u', '--utc', metavar='OPTARG', type=str, nargs='*',
    #     default='blorp', action='append', help='helptext')
    # parser.add_argument('-v', '--var', metavar='OPTARG', type=int, nargs=1,
    #     default='blorp', action='append', help='helptext')
#     parser.add_argument('-v', '--var', action='store_true', default=False,
#         help='helptext')

    args = parser.parse_args()

    if args.namespace:
        print(args)

    if args.print_info:
        print(formatting_info)

    # get the input time (create the datetime object)
    if args.in_fmt == 'now':
        dt_obj = datetime.datetime.now(datetime.timezone.utc).astimezone()
        args.timezone = 'UTC'

    # get the input timezone
#     if args.in_fmt == 'now' and args.timezone is None:
#         args.timezone = 'UTC1'

    # get the output format
    assert len(args.out_fmt) == 1, "args.out_fmt = {!r}".format(args.out_fmt)
    args.out_fmt = args.out_fmt[0]
    if args.out_fmt in fmt_codes.keys():
        out_fmt = fmt_codes[args.out_fmt]
    else:
        if args.out_fmt in ['a', 'A', 'w', 'd', 'b', 'B', 'm', 'y', 'Y', 'H', 'I', 'p',
                                'M', 'S', 'f', 'z', 'Z', 'j', 'U', 'W', 'c', 'x', 'X']:
            out_fmt = "%{}".format(args.out_fmt)
        else:
            out_fmt = args.out_fmt


    # format output
    output_str = dt_obj.strftime(out_fmt)

    print(output_str)


if __name__ == "__main__": main()
