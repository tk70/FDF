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
## @deftypefn {} {@var{retval} =} bodex (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: turowski <turowski@turowski>
## Created: 2023-07-24

function [mg, ph, w] = bodex(sys)
  [mg, ph, w] = bode(sys);

  freq = w/2/pi();                  % Convert from rps to hz
  mdb = 20*log10(mg);                % Conver from ratio to dB

  subplot(3,1,1);
  semilogx(freq, mdb);              % Plot the magnitude
  zoom on;
  grid on;
  title('Bode');
  ylabel('Magnitude[dB]');

  subplot(3,1,2);
  semilogx(freq, ph);              % Plot the phase
  grid on;
  zoom on;
  ylabel('Phase[deg]');

  unit_ph = ph ./ 360;
  T = freq .^ (-1);
  offset = unit_ph .* T';
  offsetms = -offset .* 1000;
  subplot(3,1,3);
  semilogx(freq, offsetms);              %
  grid on;
  zoom on;
  ylabel('Time offset [ms]');

  xlabel('Frequency[Hz]');

endfunction
