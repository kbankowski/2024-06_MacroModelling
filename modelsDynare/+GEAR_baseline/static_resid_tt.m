function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 89);

T(1) = exp(y(142));
T(2) = T(1)*(y(15)-y(15)*params(11))^(-params(9));
T(3) = exp(y(143));
T(4) = T(3)*(y(16)-y(16)*params(12))^(-params(10));
T(5) = T(1)*(y(17)-params(11)*y(17))^(-params(9));
T(6) = T(3)*(y(18)-params(12)*y(18))^(-params(10));
T(7) = exp(y(144));
T(8) = y(51)^params(15);
T(9) = exp(y(145));
T(10) = y(52)^params(16);
T(11) = y(53)^params(15);
T(12) = y(54)^params(16);
T(13) = (1-y(59))*(y(29)*y(140)-y(29))-y(29)*params(100)*y(140)/y(33);
T(14) = params(316)^(1-params(31));
T(15) = y(85)^params(31)*T(14);
T(16) = y(85)/T(15)-1;
T(17) = T(13)+y(85)*params(106)*T(16)/T(15);
T(18) = y(27)^params(15);
T(19) = y(140)*T(18);
T(20) = y(87)*T(19);
T(21) = y(85)^2;
T(22) = (1-y(60))*(y(30)*y(141)-y(30))-y(30)*params(101)*y(141)/y(34);
T(23) = params(316)^(1-params(32));
T(24) = y(86)^params(32)*T(23);
T(25) = y(86)/T(24)-1;
T(26) = T(22)+y(86)*params(107)*T(25)/T(24);
T(27) = y(28)^params(16);
T(28) = y(141)*T(27);
T(29) = y(88)*T(28);
T(30) = y(86)^2;
T(31) = params(15)*y(53)^(params(15)-1);
T(32) = params(16)*y(54)^(params(16)-1);
T(33) = params(15)*y(51)^(params(15)-1);
T(34) = params(16)*y(52)^(params(16)-1);
T(35) = log(y(73)/params(301));
T(36) = log(y(10)/params(239));
T(37) = log(y(74)/params(302));
T(38) = log(y(11)/params(240));
T(39) = params(112)*y(75)^params(116);
T(40) = y(31)^params(118);
T(41) = params(113)*y(76)^params(117);
T(42) = y(32)^params(119);
T(43) = y(37)^params(21);
T(44) = y(79)*exp(y(135))*params(110)*exp(y(137))*T(43);
T(45) = y(29)^(1-params(21));
T(46) = y(38)^params(22);
T(47) = y(80)*exp(y(137))*exp(y(136))*params(111)*T(46);
T(48) = y(30)^(1-params(22));
T(49) = y(37)/y(29);
T(50) = T(49)^(params(21)-1);
T(51) = y(38)/y(30);
T(52) = T(51)^(params(22)-1);
T(53) = T(49)^params(21);
T(54) = T(51)^params(22);
T(55) = y(89)^(-1);
T(56) = params(316)^(1-params(29));
T(57) = y(100)^params(29)*T(56);
T(58) = params(104)*(y(100)/T(57)-1);
T(59) = y(100)^2;
T(60) = T(58)*T(59);
T(61) = y(92)^(-1);
T(62) = params(316)^(1-params(30));
T(63) = y(101)^params(30)*T(62);
T(64) = params(105)*(y(101)/T(63)-1);
T(65) = y(101)^2;
T(66) = T(64)*T(65);
T(67) = params(44)*(y(89)*y(100))^(1-params(41))+params(45)*(y(93)*y(102))^(1-params(41))+params(46)*(y(95)*y(104))^(1-params(41));
T(68) = params(47)*(y(92)*y(101))^(1-params(42))+params(48)*(y(90)*y(105))^(1-params(42))+params(49)*(y(96)*y(103))^(1-params(42));
T(69) = y(89)^(-params(41));
T(70) = params(44)*T(69);
T(71) = params(47)*y(92)^(-params(42));
T(72) = y(93)^(-params(41));
T(73) = y(90)^(-params(42));
T(74) = y(95)^(-params(41));
T(75) = y(96)^(-params(42));
T(76) = params(54)/params(53);
T(77) = params(55)/params(53)*exp(y(152));
T(78) = params(51)*y(91)^(-params(43));
T(79) = params(55)/params(54)*exp(y(153));
T(80) = params(52)*y(94)^(-params(43));
T(81) = log((1+y(9))/(1+params(238)));
T(82) = params(53)/(params(54)+params(53));
T(83) = params(54)/(params(54)+params(53));
T(84) = exp(y(122)*y(126)/(y(11)*y(92))-params(319)/params(240));
T(85) = 1-params(38)*(T(84)-1);
T(86) = exp(y(123)*y(125)/(y(10)*y(89))-params(318)/params(239));
T(87) = 1-params(38)*(T(86)-1);
T(88) = exp(y(120)*y(128)/(y(11)*y(92))-params(321)/params(240));
T(89) = 1-params(38)*(T(88)-1);

end
