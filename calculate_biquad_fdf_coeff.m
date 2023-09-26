## Copyright (C) 2023 turowski
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} calculate_biquad_fdf_coeff (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: turowski <turowski@turowski>
## Created: 2023-07-25

function [numerator, denominator] = calculate_biquad_fdf_coeff(int_delay, frac_delay)
  d = int_delay + frac_delay;
  q = (1-d);
  p = q * (2-d) / (1+d);
  a0 = p / (d+2);
  a1 = 2 * p / q;

  numerator   = [a0, a1,  1];
  denominator = [ 1, a1, a0];
endfunction
