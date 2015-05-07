################################################################################
# WeBWorK Online  Delivery System
# Copyright © 2000-2007 The WeBWorK Project, http://openwebwork.sf.net/
# $CVSHeader: ');
loadMacros('PGbasicmacros.pl');

sub _QUpolynomialmacros_init {}; # don't reload this file
#
#
package Queens;
our @ISA = qw(Value::String);

#  Create a basic polynomial
sub createUploadButton {
# ^uses $envir{studentLogin}
# ^uses $envir{setNumber}
# ^uses $envir{probNum}
    my $buttonText = "Upload Image";
    if (@_) {
	$buttonText = shift @_;
    } 

    my $studentLogin = "NoIDDefined";
    if (defined($main::envir{studentLogin})) {
	$studentLogin = $main::envir{studentLogin};
    }
    my $setNumber = "NoSetDefined";
    if (defined($main::envir{setNumber})) {
	$setNumber = $main::envir{setNumber};
    }
    my $probNumber = "NoProbDefined";
    if (defined($main::envir{probNum})) {
	$probNumber = $main::envir{probNum};
    }

    my $url = "http://r140.n100.queensu.ca:8090/FileUpload/index.php?studentLogin=$studentLogin&setNumber=$setNumber&probNumber=$probNumber";

    my $text = " <INPUT TYPE='BUTTON' VALUE='$buttonText' ONCLICK=\"window.location.href='$url'\">";

    return $text;

}

1;
