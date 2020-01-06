function U = PCA(data)
    % Centering the data
    data = data - mean(data.').';
    
    % Covariance Matrix
    A = data*data.';
    A = 1/2 *(A + A.');
    
    % Ordered eigen analysis
    [V,L] = eigs(A, length(A));
    U = data.'*V*sqrtm(inv(L));
end