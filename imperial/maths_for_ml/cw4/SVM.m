function SVM()

    % Solve the quadratic optimisation problem. Estimate the labels for 
    % each of the test samples and report the accuracy of your trained SVM 
    % utilising the ground truth labels for the test data.
    load('X.mat'); 
    load('l.mat');
    load('X_test.mat');
    load('l_test.mat');
    
    % Covariance matrix
    St = X * X.';
    St = 1/2*(St+St.');
    inSt = inv(St);
    nc = 15;
    
    % Features and sample size
    n = size(X,2);
    F = size(X,1);
    
    % Parameters for quadprog
    Aeq = l.';
    Ceq = 0;
    A = zeros(n,n);
    C = zeros(n,1);
    f = - ones(n,1).';
    gl = zeros(n,1);
    gu = nc* ones(n,1);
    H = zeros(n,n);
    
    for i= 1:n
        for j= 1:n
            H(i,j) = l(i) * l(j) * X(:,i).' * inSt * X(:,j);
        end
    end
    
    H = 1/2 * (H + H.');
    
    % Solving optimisation problem
    [alpha, fval] = quadprog(H,f,A,C,Aeq,Ceq,gl,gu);
    w = zeros(F,1);
    for i = 1:n
        w = w + alpha(i)*l(i)*X(:,i);
    end
    
    % Computing w (projection space)
    w = inSt*w;
    
    % Computing b, by computing the mean if the best values
    no_c_alpha = find(alpha <= nc);
    b =mean(l(no_c_alpha).' - w.'*X(:,no_c_alpha));
    
    % Getting the prediction
    pred = round(w.'*X_test + b*ones(1,length(X_test))).';
    
    
    accuracy = sum(pred == l_test)/length(l_test);
    fprintf('Accuracy on the test set is %3.2f\n', accuracy);

end
