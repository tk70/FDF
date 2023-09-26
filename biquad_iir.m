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
## @deftypefn {} {@var{retval} =} biquad_iir (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: turowski <turowski@turowski>
## Created: 2023-07-24

biquad_iir is the command-line function:

function y = biquad_iir(x, numerator, denominator)
  n = length(x);
  y = zeros(1, n);
  k = 1 / denominator(1);
  numerator = numerator * k;
  denominator = denominator * k;
  a0 = 1;
  a1 = denominator(2);
  a2 = denominator(3);
  b0 = numerator(1);
  b1 = numerator(2);
  b2 = numerator(3);
  for i = 3:n
    y(i) = b0 * x(i) + b1*x(i-1) + b2*x(i-2) ...
         - a1 * y(i-1) - a2*y(i-2);
  endfor
endfunction

