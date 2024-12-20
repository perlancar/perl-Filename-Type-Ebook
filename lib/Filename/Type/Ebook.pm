package Filename::Type::Ebook;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

use Exporter qw(import);
our @EXPORT_OK = qw(check_ebook_filename);

our %SPEC;

our %SUFFIXES = (
    '.azw'     => {format=>'kindle'},
    '.azw3'    => {format=>'kindle'},
    '.kf8'     => {format=>'kindle'},
    '.kfx'     => {format=>'kindle'},

    '.cbr'     => {format=>'cbr'},
    '.cbz'     => {format=>'cbr'},
    '.cb7'     => {format=>'cbr'},
    '.cbt'     => {format=>'cbr'},
    '.cba'     => {format=>'cbr'},

    '.chm'     => {format=>'chm'},

    '.djvu'    => {format=>'djvu'},

    '.doc'     => {format=>'doc'},
    '.docx'    => {format=>'docx'},

    '.epub'    => {format=>'epub'},

    '.htm'     => {format=>'html'},
    '.html'    => {format=>'html'},

    '.mobi'    => {format=>'mobi'},
    '.prc'    => {format=>'mobi'},

    '.pdf'     => {format=>'pdf'},

    '.ps'      => {format=>'postscript'},

    '.rtf'     => {format=>'rtf'},

    '.text'    => {format=>'txt'},
    '.txt'     => {format=>'txt'},

    # old/unpopular
    # .pdb (palm)
    # .fb2 (fictionbook)
    # .xeb, .ceb (apabi)
    # .ibooks (apple ibook)
    # .inf (ibm)
    # .lit (microsoft lit)
    # .pkg (newton)
    # .opf (open ebook, superseded by epub)
    # .pdg (ssreader)
    # .tr2, .tr3 (tomeraider)
    # .oxps, .xps (open xml paper)

    # ambiguous
    # .xml
);

our %FORMATS = (
);

our $STR_RE = join "|", map {quotemeta} sort keys %SUFFIXES;

our $RE = qr((?:$STR_RE)\z)i;

$SPEC{check_ebook_filename} = {
    v => 1.1,
    summary => 'Check whether filename indicates being an e-book',
    description => <<'MARKDOWN',


MARKDOWN
    args => {
        filename => {
            schema => 'str*',
            req => 1,
            pos => 0,
        },
        ci => {
            summary => 'Whether to match case-insensitively',
            schema  => 'bool',
            default => 1,
        },
    },
    result_naked => 1,
};
sub check_ebook_filename {
    my %args = @_;

    $args{filename} =~ $RE ? {} : 0;
}

1;
# ABSTRACT:

=head1 SYNOPSIS

 use Filename::Type::Ebook qw(check_ebook_filename);
 my $res = check_ebook_filename(filename => "how not to die.pdf");
 if ($res) {
     print "Filename indicates an ebook\n",
 } else {
     print "Filename does not indicate an ebook\n";
 }

=head1 DESCRIPTION


=head1 SEE ALSO

Other C<Filename::Type::*>, e.g. L<Filename::Type::Image> or
L<Filename::Type::Video>

=cut
