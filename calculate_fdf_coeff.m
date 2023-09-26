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
## @deftypefn {} {@var{retval} =} calculate_fdf_coeff (@var{num_order}, @var{denom_order}, @var{int_delay}, @var{frac_delay})
##
## @seealso{}
## @end deftypefn

## Author: turowski <turowski@turowski>
## Created: 2023-07-24

## K + s > N - 1
function [numerator, denominator] = calculate_fdf_coeff(num_order, denom_order, int_delay, frac_delay)
  N = num_order;
  M = denom_order;
  K = int_delay;
  s = frac_delay;

  for n = 0:N
    a(n+1) = (-1)^(n+1) ...
         * factorial(M) / (factorial(n)*factorial(N-n)) ...
         * prod( (@(i) i-K-s) (0:N) ) ...
         / prod( (@(i) i-n+K+s) (0:M) );
  endfor

  for m = 0:M
    b(m+1) = (-1)^m ...
         * factorial(M) / (factorial(m)*factorial(M-m)) ...
         * prod( (@(i) (i-K-s)./(i-m-K-s)) (0:N) );
  endfor

  numerator = a;
  denominator = b;
endfunction
