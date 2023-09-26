pkg load signal;
close all;
clear all;

t0 = 0;
t1 = 1;

f0 = 0;
f1 = 100;

N = 1000;

TS = (t1 - t0) / N;
FS = 1 / TS;

t = linspace(t0, t1, N);

x = chirp(t, f0, t1, f1);

#[numerator, denominator] = calculate_fdf_coeff(2, 2, 1, 0.5)
#[numerator, denominator] = calculate_fdf_coeff(1, 1, 0, 0.5)
[numerator, denominator] = calculate_biquad_fdf_coeff(1, 0.5)
#[numerator, denominator] = calculate_bilinear_fdf_coeff(0.5)

y  = filter(numerator, denominator, x);

close all;

figure(1);
subplot(3, 1, 1);
zoom on;
plot(t, x);
title('Signal before');
ylabel('x(t)');
xlabel('t');

subplot(3, 1, 2);
zoom on;
specgram(x, N / 20, FS);
xlabel('t');

subplot(3, 1, 3);
hold on;
zoom on;
plot(t, x);
plot(t, y);
title('Signal after');
ylabel('x(t)');
xlabel('t');
legend('x(t)', 'y(t)');

sys = tf(numerator, denominator, TS)
figure(2);
bodex(sys);


