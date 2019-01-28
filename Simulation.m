close all
%%transfer function of a low pass filter with cut off frequency of 345Hz
H=tf([6.447*10^6],[1 4449 6.447*10^6])
Te=131.06e-06;

bode(H)
figure;

%%convert into discrete
Hd=c2d(H,Te, 'Tustin');
bode(Hd)
%%multiples the number to don't have to work with floating point
[num, den] = tfdata(Hd);
bits=8;

num{1} = num{1} * 2^bits;

num{1} = round(num{1});

den{1} = den{1} * 2^bits;

den{1} = round(den{1});

%%represent the function in discret z^-1
Hc=tf(num,den,'Variable', 'z^-1','Ts',Te)
bode(Hc)
hold on
bode(H)
title('Comparatie')
figure
%%generate a sin
t=0:Te:0.02;
usim=(sin(t*2*pi*1000))*256+256;
plot(t, usim)
%usim=ones(size(t))*31
ysim=[0];

u=[0 0 0];
y=[0 0 0];

den=den{1};
num=num{1};

%%calculate the output based on curent and previous values
for i=2:size(t,2)
    u=[u(2:3) usim(i)];
    y=[y(2:3) 0];
    y1=y(1);
    y2=y(2);
    y3=y(3);
    
    u1=u(1);
    u2=u(2);
    u3=u(3);
    
    y(3) = y(3) - (den(2)*y(2) + den(3)*y(1));

    y(3) = y(3) + num(1)*u(3) + num(2)*u(2) + num(3)*u(1);
y(3)=y(3)/2^bits;

    
    y(3)=floor(y(3));
    ysim=[ysim y(3)];
end

%%plot the input and output


plot(t,[ysim],t,usim);
legend('output', 'input')
title('System response - input and output of filter - 333 Hz')
xlabel('Timp(s)')
ylabel('Amplitudine(V)')


