function U = LDA(data, labels)
    un = unique(labels);
    c = length(un);
    
    % Creation of the M idempotent matrix
    M=[];
    for j = 1:length(un)
        ind = find(labels == un(j));
        tmp = length(ind);
        M = blkdiag(M,1/tmp * ones(tmp));
        data(ind,:) = data(ind,:) - mean(data(ind,:).').';
    end
    
    % Simultaneaous diagonalisation
    X = data.';
    Xw = X*(eye(length(M))-M);
    A = Xw.'*Xw;
    A = 1/2 *(A + A.');
    [V,L] =eigs(A, length(A));
    
    Ui = Xw*V*inv(L);
    Ui = Ui(:,1:length(V)-c);
    
    % Projection of the data
    Xb = Ui.'*X*M;
    B = Xb*Xb.';
    B = 1/2 * (B + B.');
    
    % PCA 
    [Q,Ld] = eigs(B, c-1);
    U = Ui*Q;
    
    
        
end