#!/usr/bin/perl

use 5.010; use strict;
use encoding 'utf8';
use XML::Twig;
use Text::Wrap;

XML::Twig
->new(
    twig_handlers => {
        Query       => sub { say $_->text },
        Text        => sub { say "\t", $_->text },
        Description => sub { say wrap "\t\t", "\t\t", $_->text },
    }
)
->parse(`w3m -dump 'http://ru.wikipedia.org/w/api.php?action=opensearch&search=$ARGV[0]&limit=$ARGV[1]&namespace=0&format=xml' 2>/dev/null`);
