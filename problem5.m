%%

%% Skeleton Code
Astar=imread("icarus.jpeg");
B=rgb2gray(Astar);

%Double precision
B=double(B);

[U,S,V]=svd(B);
[U_thin, S_thin, V_thin]=svd(B,0);

%U(resp. U_thin), S(resp. S_thin) and V(resp. V_thin) are left singular
%vectors, singular values and right singular vectors (resp. reducted)

k=rank(B);

%Rank-k approximation for B
A_k=U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
imagesc(A_k), colormap("gray");

%Energy Calculations
D=diag(S).^2;
cum_energy=100.*cumsum(D)./sum(D);
I=find(cum_energy >95);
scatter(0:k-1,diag(S),'filled'), 
xlabel('Index'), ylabel('Magnitude of Singular Values')
ylim([0 8000]);
m=size(B,1);


%% Compute Rank approximations 
rank10=rankApproximation(B, 10);
rank50=rankApproximation(B, 50);
rank100=rankApproximation(B, 100);
rank200=rankApproximation(B, 200);

%% Relative Error Calculations 
rel_err_10=D(11,1)/D(1,1);
rel_err_50=D(51,1)/D(1,1);
rel_err_100=D(101,1)/D(1,1);
rel_err_200=D(201,1)/D(1,1);

%% Store Rank Approximation Images
[X1,map1]=imread('pic5b.jpg');
[X2,map2]=imread('pic5c.jpg');
[X3,map3]=imread('pic5d.jpg');
[X4,map4]=imread('pic5e.jpg');

%% Subplot
subplot(2,2,1), imshow(X1,map1), 
title('Rank 10'),  xlabel(sprintf('Relative Error: %d', rel_err_10))

subplot(2,2,2), imshow(X2,map2), 
title('Rank 50'),  xlabel(sprintf('Relative Error: %d', rel_err_50))

subplot(2,2,3), imshow(X3,map3), 
title('Rank 100'), xlabel(sprintf('Relative Error: %d', rel_err_100))

subplot(2,2,4), imshow(X4,map4), 
title('Rank 200'), xlabel(sprintf('Relative Error: %d', rel_err_200)) 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Function
function [rankApprox] = rankApproximation(A_k,k)
[U,S,V]=svd(A_k);
rankApprox=U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
end












