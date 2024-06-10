function [y, T, residual, g1] = dynamic_7(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(3, 1);
  residual(1)=(y(373))-(params(190)*y(158)+params(191)*y(156)+params(192)*y(157)+params(193)*x(40));
  residual(2)=(y(371))-(y(158)*params(194)+y(156)*params(195)+y(157)*params(196)+params(197)*y(137)+x(40)*params(198)+params(199)*x(42)+params(200)*x(43));
  residual(3)=(y(372))-(y(158)*params(201)+y(156)*params(202)+y(157)*params(203)+y(137)*params(204)+x(40)*params(205)+x(42)*params(206)+params(207)*x(41)+x(43)*params(208));
if nargout > 3
    g1_v = NaN(3, 1);
g1_v(1)=1;
g1_v(2)=1;
g1_v(3)=1;
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 3, 3);
end
end
