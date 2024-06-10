function [y, T, residual, g1] = static_24(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(3, 1);
  residual(1)=(y(158))-(y(158)*params(190)+y(156)*params(191)+y(157)*params(192)+params(193)*x(40));
  residual(2)=(y(156))-(y(158)*params(194)+y(156)*params(195)+y(157)*params(196)+y(137)*params(197)+x(40)*params(198)+params(199)*x(42)+params(200)*x(43));
  residual(3)=(y(157))-(y(158)*params(201)+y(156)*params(202)+y(157)*params(203)+y(137)*params(204)+x(40)*params(205)+x(42)*params(206)+params(207)*x(41)+x(43)*params(208));
if nargout > 3
    g1_v = NaN(9, 1);
g1_v(1)=(-params(191));
g1_v(2)=1-params(195);
g1_v(3)=(-params(202));
g1_v(4)=1-params(190);
g1_v(5)=(-params(194));
g1_v(6)=(-params(201));
g1_v(7)=(-params(192));
g1_v(8)=(-params(196));
g1_v(9)=1-params(203);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 3, 3);
end
end
