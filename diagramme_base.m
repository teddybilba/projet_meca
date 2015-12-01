function diagramme_base();

global k k1 k2 m l l1 l2 A omega
t=[0:0.2:100];
x0=[1.1708;0];
theta = lsode("pendulum_double_ressort",x0,t);
figure('NumberTitle','off','Name','Le pendule à double ressort','Position',[35 35 600 600],'Color','w');

for i=2:max(size(theta))
  subplot(2,1,1,'replace')
  box on;grid on;
  title(('Le pendule à double ressort'))
  axis([-30 30 -15 15])
  xlabel('m');ylabel('m');

  line([0 +l*sin(theta(i,1))],[  0 -l*cos(theta(i,1))],'Color','r','LineWidth',3);
  line([ +l*sin(theta(i,1)) 0],[-l*cos(theta(i,1)) -l*cos(theta(i,1))],'Color','b','LineWidth',2);
  line([ +l*sin(theta(i,1)) +l*sin(theta(i,1))],[-l*cos(theta(i,1)) 0],'Color','b','LineWidth',2);
  line([0 +l*sin(theta(i,1))],[  0 -l*cos(theta(i,1))],'Color','r','Marker','.','Markersize',30);
  line([-30 30],[0 0],'Color','k','LineWidth',2);
  line([0 0],[-15 15],'Color','k','LineWidth',2);

  text(-16,7,['t(s)=',num2str(t(i))])
  subplot(2,1,2);
  box on;grid on;
  line(t(i-1:i),theta(i-1:i,1),'Color','b','LineWidth',2);
  line(t(i-1:i),theta(i-1:i,2),'Color','r','LineWidth',2);
  xlabel('t(s)')
  ylabel('dq/dt - rouge (1/s) ou q - bleu (radian)')
  drawnow;
endfor

endfunction