function [y, T, residual, g1] = static_5(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(1, 1);
  residual(1)=(y(138)/(y(138)-1))-(y(138)*params(66)/(y(138)-1)+(1-params(66))*params(25)/(params(25)-1)+x(3));
if nargout > 3
    g1_v = NaN(1, 1);
g1_v(1)=(y(138)-1-y(138))/((y(138)-1)*(y(138)-1))-((y(138)-1)*params(66)-y(138)*params(66))/((y(138)-1)*(y(138)-1));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 1, 1);
end
end
