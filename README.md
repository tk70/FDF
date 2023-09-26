# Factional Delay Filter design too

for Octave (Matlab)
It is sometimes desired to introduce a delay the signal, less than a sample size long. For integer size delay a simple delay line can be employed. For less than one sample delay, FDF IIR can be used.

Generalized formula for any-order IIR and optimized formula for Biquad filter are implemented.

The implementation is based on the following paper:
https://www.researchgate.net/publication/224396596_Closed-Form_Design_of_Maxflat_Fractional_Delay_IIR_Filters
