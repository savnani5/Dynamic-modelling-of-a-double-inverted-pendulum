clc


h = l1*sin(y(:,1)) + l2*sin(y(:,2));
l = -l1*cos(y(:,1)) - l2*cos(y(:,2));


for i=1:65
   alpha(i) = atan((l(i)+0.0716)/(h(i)+0.2619)).*180./pi;
   disp(alpha)
end

plot(t(1:44),alpha(1:44))
hold on
xlabel('time(s)')
ylabel('Angle with horizontal(deg)')
title('Angle vs time')




