k=0.2; Nx=5; Ny=5;
xs=(0:Nx-1)*k; ys=(0:Ny-1)*k;
[X,Y]=meshgrid(xs,ys);

U=sin(2*pi*(2*X+Y));

% expected_LU=[
%      0.00000, -118.88206,  -73.47316,   73.47316,  118.88206;
%    -73.47316,   73.47316,  118.88206,    0.00000, -118.88206;
%    118.88206,    0.00000, -118.88206,  -73.47316,   73.47316;
%   -118.88206,  -73.47316,   73.47316,  118.88206,    0.00000;
%     73.47316,  118.88206,    0.00000, -118.88206,  -73.47316
% ];

expected_LU = 4*del2(U,k);

LU=fast_laplacian(U,k);

err=max(max(abs(LU-expected_LU)));
tol=1e-4;
if err<tol, disp('passed'); else disp(['failed; error=',num2str(err)]); end
