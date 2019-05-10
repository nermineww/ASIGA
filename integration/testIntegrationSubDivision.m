close all
% 
% rule = 'Freud';
rule = 'Legendre';
N = 64;
n_qpSub = 5;
I_gauss = zeros(N,1);
N_arr = 1:N;
epsilon = 1/4;
f = @(x) 1./(1+x.^2/epsilon.^2);
x = linspace(-1,1,1000);
plot(x,f(x))

for n = N_arr
    [W1D,Q1D] = gaussianQuadNURBS(n); 

    I_gauss(n) = sum(f(Q1D).*W1D);
end
[W1D,Q1D] = gaussianQuadNURBS(n_qpSub); 
n_div_arr = 1:20;
I_gauss2 = zeros(numel(n_div_arr),1);
N_arr2 = zeros(numel(n_div_arr),1);
for n_div = n_div_arr
    Xi_e_arr  = linspace(-1,1,n_div+1);
    xi = zeros(n_qpSub,n_div);
    counter = 1;
    for i_xi = 1:n_div
        Xi_e_sub = Xi_e_arr(i_xi:i_xi+1);
        xi(:,counter) = parent2ParametricSpace(Xi_e_sub, Q1D(:,1));
        counter = counter + 1;
    end
    xi = reshape(xi,n_div*n_qpSub,1);
    W2D_1 = repmat(W1D,n_div,1);
    J_2 = 1/n_div;
    I_gauss2(n_div) = sum(f(xi).*W2D_1*J_2);
    N_arr2(n_div) = n_div*n_qpSub;
end
I = 2*epsilon*atan(1/epsilon);
    
figure(2)
totError = abs(I_gauss - I)/abs(I);
totError2 = abs(I_gauss2 - I)/abs(I);
semilogy(N_arr,totError,N_arr2,totError2)
legend('Gauss','Sub Gauss')








