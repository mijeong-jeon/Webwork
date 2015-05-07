################################################################################
# WeBWorK Online Homework Delivery System
# Copyright © 2000-2007 The WeBWorK Project, http://openwebwork.sf.net/
# $CVSHeader: pg/macros/parserPopUp.pl,v 1.1.6.2.2.3 2009/06/25 23:27:20 gage Exp $
# 
# This program is free software; you can redistribute it and/or modify it under
# the terms of either: (a) the GNU General Public License as published by the
# Free Software Foundation; either version 2, or (at your option) any later
# version, or (b) the "Artistic License" which comes with this package.
# 
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See either the GNU General Public License or the
# Artistic License for more details.
################################################################################

=head1 NAME

QUpolynomialmacros.pl - Creation and manipulation of polynomials

=head1 DESCRIPTION

This file has utility functions for polynomials.

e.g.

$poly = QcreateRandomPolynomial([power], [leading_coeff], [min_coef], [max_coef]);

creates a MathObject of the form

[leading_coeff] * x^(power) + ([other coeffs] * lower powers)

Lower coefficients are taken from random(min, max, 1) 

=cut

loadMacros('PG.pl');
loadMacros('PGbasicmacros.pl');
loadMacros('MathObjects.pl');

#sub _QUpolynomialmacros_init {QUpolynomialmacros::Init()}; # don't reload this file
#
#  The package that implements pop-up menus
#
package Queens;
our @ISA = qw(Value::String);

#  Create a basic polynomial
sub CreateRandomPolynomial {
  my $pow = shift;
  my $leading_coeff = shift;
  my $min_coeff = shift;
  my $max_coeff = shift;

  my $poly = "$leading_coeff  x^($pow) ";
  my ($c, $coef);
  for ($c = ($pow-1); $c >= 0; $c--) {
    $coef = main::random($min_coeff, $max_coeff, 1);
# FIX ME: shouldn't be accessing main:: fix namespace lookup
    $poly = "$poly + $coef * x^($c) ";
  }
  $poly = main::Compute($poly)->reduce;
# FIX ME: shouldn't be accessing main:: fix namespace lookup
	#FIX this

}

1;
