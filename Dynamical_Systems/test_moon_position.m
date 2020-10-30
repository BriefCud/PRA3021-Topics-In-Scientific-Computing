% TEST_MOON_POSITION
% If you have created a correct function 'moon_position',
% executing this script will plot one revolution of
% the moon around the earth (red circle).

npt = 360;
one_month = 27.321582*24*3600;

xm0=moon_position(0);
assert(size(xm0,1)==2 && size(xm0,2)==1) % moon_position must return a 2x1 vector

t = linspace(0,one_month,npt+1); % s

pos = zeros(2,npt);
for k = 1:npt
  pos(:,k) = moon_position(t(k));
end

figure
line(pos(1,:),pos(2,:),'LineStyle','none','Marker','o','MarkerEdgeColor','r')
hold on
plot(0,0,'ro') % Earth is at the origin
xlabel('x-position (m)','FontSize',16)
ylabel('y-position (m)','FontSize',16)
set(gca,'FontSize',14)
axis equal