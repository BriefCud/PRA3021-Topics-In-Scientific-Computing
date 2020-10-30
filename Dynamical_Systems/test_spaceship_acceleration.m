%% Test file for the function comp_acceleration

disp('Test 1...')
xm=[384e6;0]; xs=[384e6/2;0]; as=[-0.0107;0]; err=1e-3;
cas1=spaceship_acceleration(xm,xs)
if norm(cas1-as)<err,
  disp('passed')
else
  disp('failed')
end

disp('Test 2...')
xm=[0;384e6]; xs=[0;383e6]; as=[0;4.9019]; err=1e-3;
cas2=spaceship_acceleration(xm,xs)
if norm(cas2-as)<err,
  disp('passed')
else
  disp('failed')
end