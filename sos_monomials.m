function sos_monomials()
% sos_monomials.m
% Monomial enumeration and a simple SOS / Gram matrix example.

%% Monomials with multi-index upper bounds: x = [x1, x2], nu_max = [2, 2]

x_symbols = {'x1','x2'};
nu_max = [2 2];

fprintf('Monomials for x = [x1, x2], nu_max = [2, 2]:\n');
k = 1;
exponents_full = [];
labels_full    = {};

for nu1 = 0:nu_max(1)
    for nu2 = 0:nu_max(2)
        exponents_full(k,:) = [nu1 nu2]; %#ok<AGROW>
        labels_full{k} = sprintf('%s^%d * %s^%d', ...
            x_symbols{1},nu1,x_symbols{2},nu2);
        fprintf('nu = (%d,%d): %s\n',nu1,nu2,labels_full{k});
        k = k + 1;
    end
end

fprintf('\n');

%% Monomials with total degree bound d: |nu| <= d

d = 2;
fprintf('Monomials for x = [x1, x2] with total degree |nu| <= %d:\n',d);

exponents_deg = [];
labels_deg    = {};
k = 1;

for nu1 = 0:nu_max(1)
    for nu2 = 0:nu_max(2)
        if nu1 + nu2 <= d
            exponents_deg(k,:) = [nu1 nu2]; %#ok<AGROW>
            labels_deg{k} = sprintf('%s^%d * %s^%d', ...
                x_symbols{1},nu1,x_symbols{2},nu2);
            fprintf('nu = (%d,%d): %s\n',nu1,nu2,labels_deg{k});
            k = k + 1;
        end
    end
end

fprintf('\nCanonical basis for R[x]_d with d = %d (up to ordering):\n',d);
disp(labels_deg(:));

%% Numerical example: x = [5, 6], nu_max = [3, 2]

x_num   = [5 6];
nu_max2 = [3 2];

fprintf('\nNumerical monomials for x = [5, 6], nu_max = [3, 2]:\n');

k = 1;
exponents_num = [];
values_num    = [];

for nu1 = 0:nu_max2(1)
    for nu2 = 0:nu_max2(2)
        exponents_num(k,:) = [nu1 nu2]; %#ok<AGROW>
        val = x_num(1)^nu1 * x_num(2)^nu2;
        values_num(k,1) = val; %#ok<AGROW>
        fprintf('nu = (%d,%d): 5^%d * 6^%d = %g\n', ...
            nu1,nu2,nu1,nu2,val);
        k = k + 1;
    end
end

%% SOS example: p(x) = x^2 + 2x + 1 = (x + 1)^2

fprintf('\nSOS / Gram matrix example in one variable:\n');
fprintf('p(x) = x^2 + 2x + 1 = (x + 1)^2.\n');

% Basis h(x) = [1; x], Gram matrix Q such that p(x) = h(x)^T Q h(x)
Q = [1 1; 1 1];

fprintf('Gram matrix Q for basis h(x) = [1; x]:\n');
disp(Q);

eigQ = eig(Q);
fprintf('Eigenvalues of Q: [%g, %g]\n',eigQ(1),eigQ(2));

end
