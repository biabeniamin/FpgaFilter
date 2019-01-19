close all
%%transfer function of a low pass filter with cut off frequency of 345Hz
H=tf([6.447*10^6],[1 4449 6.447*10^6])
Te=131e-06;

%%convert into discrete
Hd=c2d(H,Te, 'Tustin');

%%multiples the number to don't have to work with floating point
[num, den] = tfdata(Hd);
bits=20;

num{1} = num{1} * 2^bits;
num{1} = round(num{1});
den{1} = den{1} * 2^bits;
den{1} = round(den{1});

%%represent the function in discret z^-1
Hc=tf(num,den,'Variable', 'z^-1','Ts',Te)

%%generate a sin
t=0:Te:10;
usim=sin(t);
ysim=[0];

u=[0 0 0];
y=[0 0 0];

den=den{1};
num=num{1};

%%calculate the output based on curent and previous values
for i=2:length(t)
    u=[u(2:3) usim(i)];
    y=[y(2:3) 0];
    
    y(3) = y(3) - (den(2)*y(2) + den(3)*y(1));
    y(3) = y(3) + num(1)*u(3) + num(2)*u(2) + num(3)*u(1);
    y(3) = y(3) / 2^bits;
    ysim=[ysim y(3)];
end

%%plot the input and output

plot(t,ysim,t,usim);
legend('output', 'input')
title('System response - input and output of filter')
xlabel('Timp(s)')
ylabel('Amplitudine(V)')

figure

[num2, den2] = tfdata(Hd);
ys=dlsim(num2,den2, usim);
plot(t,ys,t,ysim)
