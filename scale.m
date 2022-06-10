

function [newImg] = scale(Img, alpha, P)

image= imread('saturn.jpg');
image =double(image);
[m,n]=size(image);
[X, Y] =meshgrid(1:n, 1:m);

coords = [X(:)'; Y(:)'; ones(1, m*n)];
coords = double(coords);

tx=P(1,1); 
ty=P(2,1);

trans=[1 0 -tx; 0 1 -ty; 0 0 1];

%Create alpha matrix
Sx=alpha(1,1);
Sy=alpha(2,2);
alpha= [Sx 0 0;0 Sy 0; 0 0 1];


trans_undo=[1 0 tx; 0 1 ty; 0 0 1];

S= trans_undo*alpha*trans;

new_coords=S*coords;

sf = interp2(X, Y,image, new_coords(1,:)',new_coords(2,:)');

newImg=reshape(sf,m,n); %de-vectorize