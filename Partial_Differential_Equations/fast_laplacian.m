function [Lu] = fast_laplacian(u,k)
    % Discretised Laplacian with periodic boundary conditions
    lx=1; ly=1; [mx,my]=size(u);
    Lu=([u(lx+1:mx,:);u(lx,:)]+[u(mx,:);u(lx:mx-1,:)] +[u(:,ly+1:my),u(:,ly)]+[u(:,my),u(:,ly:my-1)] -4*u)/k^2;
end
