close all
%%transfer function of a low pass filter
H=tf([6.447*10^6],[1 4449 6.447*10^6])
Te=208e-06;
Hd=c2d(H,Te, 'Tustin');

%%inmultire coeficienti sa lucram in multimea nr intregi
[num, den] = tfdata(Hd);
bits=22;

num{1} = num{1} * 2^bits;
num{1} = round(num{1});
den{1} = den{1} * 2^bits;
den{1} = round(den{1});

Hc=tf(num,den,'Variable', 'z^-1','Ts',Te)

t=0:0.1:10;
usim=sin(t);
ysim=[0];

u=[0 0 0];
y=[0 0 0];

den=den{1};
num=num{1};

digits(60)

for i=5:length(t)
    u=[u(2:3) usim(i)];
    y=[y(2:3) 0];
    
    y(3) = y(3) - (den(2)*y(2) + den(3)*y(1));
    y(3) = y(3) + num(1)*u(3) + num(2)*u(2) + num(3)*u(1);
    y(3) = y(3) / 2^bits;
    ysim=[ysim y(3)];
end

samples=size(ysim);
samples=samples(2);

ysim=[0 0 0 ysim];
plot(t,[ysim],t,usim);

