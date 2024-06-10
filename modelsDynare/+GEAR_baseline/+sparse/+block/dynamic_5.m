function [y, T, residual, g1] = dynamic_5(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(1, 1);
  residual(1)=(y(356)/(y(356)-1))-(params(69)*y(141)/(y(141)-1)+(1-params(69))*params(28)/(params(28)-1)+x(6));
if nargout > 3
    g1_v = NaN(1, 1);
g1_v(1)=(y(356)-1-y(356))/((y(356)-1)*(y(356)-1));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 1, 1);
end
end
