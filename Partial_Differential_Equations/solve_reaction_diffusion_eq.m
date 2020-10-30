xmax = 20;
ymax = 20;
ku = 1;
kv = 8;
kappa = 0.2;
h = 0.001;
T = 1;

[U,V] = Reaction_Diffusion_Eq(ku,kv,kappa,h,xmax,ymax,T);
create_movie(U,xmax,ymax,T)