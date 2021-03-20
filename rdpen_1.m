%start

close all
clear all  %#ok<CLSCR>
clc

 m2 = 0.1;  %mass of link_1
 m1 = 0.4;  %mass of link_2
 g  = 9.81;  %gravity
 l1 = 0.57; %Length of Link_1
 l2 = 0.350; %Length of link_2
 R  = 0.08;   %Radius
 P  = 5.6*(10^5); %pressure
 D  = 0.025; %dia of piston
 F  = P*pi*(D^2/4);%force
 b  = pi/18; %angle of piston with horizontal
 c  = (-1*R^2*F)/(sin(b)*l1); %constant
 
y0 = [0.6944*pi;%initial angular displacement 1
      0;%initial angular displacement 2
      0;%initial angular velocity 1
      0];% initial angular velocity 2

f = @(t,y)[y(3);
    y(4);
(-1*m2*l1*(y(3)^2)*sin(y(1)- y(2))*cos(y(1)-y(2))/2)+ (g/2)*m2*sin(y(2))*(cos(y(1) - (y(2))))-(m2*l2*(y(4)^2)*sin(y(1)-y(2))) - ((m1/2)+m2)*g*sin(y(1))+(c*cos(y(1)))/(l1*((11/12)*m1 + m2) - (m2/2)*l1*(cos(y(1) - y(2))^2));
m2*l2*((y(4))^2)*sin(y(1)-y(2))*cos(y(1)-y(2))+g*sin(y(1))*(cos(y(1) - y(2)))*((m1/2)+m2)+l1*(y(3)^2)*sin(y(1)-y(2))*((11*m1/12)+m2) - ((11/12)*m1+m2)*g*sin(y(2)) - (c*cos(y(1))*cos(y(1)-y(2)))/(2*l2*( (11/12)*m1 + m2) - m2*l2*(cos(y(1) - y(2))^2))];

tspan = [0 0.5]; %time range
[t,y] = ode15s(f, tspan, y0); %solving matrix


figure
subplot(211)
plot(t,y(:,1).*180./pi)
hold on
plot(t,y(:,2).*180./pi)
legend('link_1','link_2')
xlabel('time(s)')
ylabel('angle1(rad)/angle2(rad)')
title('pos of link_1 and link_2')

subplot(212)
plot(t,y(:,3))
hold on
plot(t,y(:,4))
legend('link_1','link_2')
xlabel('time(s)')
ylabel('ang_vel_1/ang_vel_2 (rad/s)')
title('vel of link_1,link_2')
length(y)

% end