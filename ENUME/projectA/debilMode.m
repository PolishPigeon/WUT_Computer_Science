% ------- Solving a system of n linear equations Ax = b. ------- %
% -------------------- The Indicated Method -------------------- %
function x = debilMode(A, b)
        
    [M,N] = size(A);
    if M ~= N
        error ('A is not square matrix!');
    end % end if

    for j = 1 : N - 1  
        %--- Find the greatest value within column ---%
                
        m = max(A(j:N,j));
        %--- Find row whitin greatest value occure ---%
        for k = j : N
            if A(k,j) == m
            %--- SwapRow in matrix A ---%
                            
            tempRow =  A(j , :);
                            
            A(j , :) = A(k, :);
                            
            A(k, :) = tempRow;
            %--- SwapValue in vector b ---%
                            
            tempVal = b(j);
                            
            b(j) = b(k);
                            
            b(k) = tempVal;
            break;
            end % end if
        end % end for
        for i = j + 1 : N
                        
            l = A(i,j) / A(j,j);
                        
            b(i,1) = b(i,1) - l * b(j, 1);
            for t = 1 : N
                A(i,t) = A(i,t) - l * A(j, t);
            end % end for
        end % end for
    end % end for
        
    x = zeros(N,1);
    % -------------------- The back-substitution phase -------------------- %
    for k = N : -1 : 1
         
        E = 0;
        for iter = k+1 : N
            E = E + A(k,iter) * x(iter,1);
        end % end for
      
        x(k, 1) = (b(k,1) - E) / A(k,k);
    end % end for
        
    r = A*x - b;
    euclideanNormOfR = norm(r);
    new_euclideanNormOfR = euclideanNormOfR;    
    while new_euclideanNormOfR <= euclideanNormOfR
        euclideanNormOfR = new_euclideanNormOfR;
        r = A*x - b;
        x = x - r;
        new_euclideanNormOfR = norm(r);
    end % end while
    
end % end function