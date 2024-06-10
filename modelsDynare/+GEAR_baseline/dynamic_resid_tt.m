function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 172);

T(1) = exp(y(254));
T(2) = T(1)*(y(127)-params(11)*y(9))^(-params(9));
T(3) = exp(y(255));
T(4) = T(3)*(y(128)-params(12)*y(10))^(-params(10));
T(5) = T(1)*(y(129)-params(11)*y(11))^(-params(9));
T(6) = T(3)*(y(130)-params(12)*y(12))^(-params(10));
T(7) = exp(y(256));
T(8) = y(163)^params(15);
T(9) = exp(y(257));
T(10) = y(164)^params(16);
T(11) = y(165)^params(15);
T(12) = y(166)^params(16);
T(13) = y(137)*params(1)+y(135)*(1-params(1));
T(14) = (1-y(171))*(y(141)*y(252)-y(141))-y(141)*params(100)*y(252)/y(145);
T(15) = params(316)^(1-params(31));
T(16) = y(49)^params(31)*T(15);
T(17) = y(197)*params(106)*(y(197)/T(16)-1);
T(18) = T(14)+T(17)/T(16);
T(19) = y(139)^params(15);
T(20) = y(252)*T(19);
T(21) = y(199)*T(20);
T(22) = T(15)*y(197)^params(31);
T(23) = y(346)/T(22)-1;
T(24) = y(346)^2;
T(25) = y(138)*params(2)+y(136)*(1-params(2));
T(26) = (1-y(172))*(y(142)*y(253)-y(142))-y(142)*params(101)*y(253)/y(146);
T(27) = params(316)^(1-params(32));
T(28) = y(50)^params(32)*T(27);
T(29) = y(198)*params(107)*(y(198)/T(28)-1);
T(30) = T(26)+T(29)/T(28);
T(31) = y(140)^params(16);
T(32) = y(253)*T(31);
T(33) = y(200)*T(32);
T(34) = T(27)*y(198)^params(32);
T(35) = params(107)*params(6)*(params(2)*y(335)+y(333)*(1-params(2)))*(y(347)/T(34)-1);
T(36) = y(347)^2;
T(37) = T(35)*T(36);
T(38) = params(15)*y(165)^(params(15)-1);
T(39) = params(16)*y(166)^(params(16)-1);
T(40) = params(15)*y(163)^(params(15)-1);
T(41) = params(16)*y(164)^(params(16)-1);
T(42) = y(169)/params(290);
T(43) = y(31)/params(290);
T(44) = y(43)/params(301);
T(45) = log(T(44));
T(46) = y(7)/params(239);
T(47) = log(T(46));
T(48) = y(170)/params(291);
T(49) = y(32)/params(291);
T(50) = y(44)/params(302);
T(51) = log(T(50));
T(52) = y(8)/params(240);
T(53) = log(T(52));
T(54) = y(189)/params(305);
T(55) = y(47)/params(305);
T(56) = y(190)/params(306);
T(57) = y(48)/params(306);
T(58) = y(181)/params(297);
T(59) = y(39)/params(297);
T(60) = y(182)/params(298);
T(61) = y(40)/params(298);
T(62) = params(112)*y(187)^params(116);
T(63) = y(143)^params(118);
T(64) = params(113)*y(188)^params(117);
T(65) = y(144)^params(119);
T(66) = y(147)/params(264);
T(67) = y(21)/params(264);
T(68) = y(148)/params(265);
T(69) = y(22)/params(265);
T(70) = y(23)^params(21);
T(71) = y(191)*exp(y(247))*params(110)*exp(y(249))*T(70);
T(72) = y(141)^(1-params(21));
T(73) = y(24)^params(22);
T(74) = y(192)*exp(y(249))*exp(y(248))*params(111)*T(73);
T(75) = y(142)^(1-params(22));
T(76) = params(21)*exp(y(249))*params(110)*exp(y(247))*y(153);
T(77) = y(23)/y(141);
T(78) = T(77)^(params(21)-1);
T(79) = params(22)*exp(y(249))*params(111)*exp(y(248))*y(154);
T(80) = y(24)/y(142);
T(81) = T(80)^(params(22)-1);
T(82) = (1-params(21))*exp(y(249))*params(110)*exp(y(247))*y(153);
T(83) = T(77)^params(21);
T(84) = y(334)/y(137)*y(338);
T(85) = T(84)*(1+y(344));
T(86) = (1-params(22))*exp(y(249))*params(111)*exp(y(248))*y(154);
T(87) = T(80)^params(22);
T(88) = y(335)/y(138)*y(339);
T(89) = T(88)*(1+y(345));
T(90) = params(23)/2;
T(91) = y(133)/y(13)-1;
T(92) = T(90)*T(91)^2;
T(93) = params(24)/2;
T(94) = y(134)/y(14)-1;
T(95) = T(93)*T(94)^2;
T(96) = params(5)*y(332)/y(135);
T(97) = T(96)/y(348);
T(98) = params(6)*y(333)/y(136);
T(99) = T(98)/y(349);
T(100) = params(23)*y(133)/y(13);
T(101) = params(23)*(y(330)/y(133))^2;
T(102) = y(330)/y(133)-1;
T(103) = T(101)*T(102);
T(104) = params(24)*y(134)/y(14);
T(105) = params(24)*(y(331)/y(134))^2;
T(106) = y(331)/y(134)-1;
T(107) = T(105)*T(106);
T(108) = y(201)^(-1);
T(109) = y(332)/y(135)*params(104);
T(110) = params(316)^(1-params(29));
T(111) = y(212)^params(29)*T(110);
T(112) = y(350)/T(111)-1;
T(113) = T(109)*T(112);
T(114) = y(350)^2;
T(115) = T(113)*T(114);
T(116) = T(115)/y(348);
T(117) = T(116)*y(328);
T(118) = T(110)*y(59)^params(29);
T(119) = y(212)*params(104)*(y(212)/T(118)-1);
T(120) = y(204)^(-1);
T(121) = y(333)/y(136)*params(105);
T(122) = params(316)^(1-params(30));
T(123) = y(213)^params(30)*T(122);
T(124) = y(351)/T(123)-1;
T(125) = T(121)*T(124);
T(126) = y(351)^2;
T(127) = T(125)*T(126);
T(128) = T(127)/y(349);
T(129) = T(128)*y(329);
T(130) = T(122)*y(60)^params(30);
T(131) = y(213)*params(105)*(y(213)/T(130)-1);
T(132) = params(44)*(y(212)*y(51))^(1-params(41))+params(45)*(y(214)*y(54))^(1-params(41))+params(46)*(y(216)*y(55))^(1-params(41));
T(133) = params(47)*(y(213)*y(53))^(1-params(42))+params(48)*(y(217)*y(52))^(1-params(42))+params(49)*(y(215)*y(56))^(1-params(42));
T(134) = y(201)^(-params(41));
T(135) = params(44)*T(134);
T(136) = params(47)*y(204)^(-params(42));
T(137) = y(205)^(-params(41));
T(138) = y(202)^(-params(42));
T(139) = y(207)^(-params(41));
T(140) = y(208)^(-params(42));
T(141) = params(54)/params(53);
T(142) = params(55)/params(53)*exp(y(264));
T(143) = params(51)*y(203)^(-params(43));
T(144) = params(55)/params(54)*exp(y(265));
T(145) = params(52)*y(206)^(-params(43));
T(146) = (1+y(121))/(1+params(238));
T(147) = (1+y(6))/(1+params(238));
T(148) = params(53)/(params(54)+params(53));
T(149) = y(209)/params(316);
T(150) = params(54)/(params(54)+params(53));
T(151) = y(210)/params(316);
T(152) = y(122)/params(239);
T(153) = y(123)/params(240);
T(154) = y(209)/y(57);
T(155) = y(210)/y(58);
T(156) = y(122)/y(7);
T(157) = y(123)/y(8);
T(158) = (1+y(113))/(1+params(233));
T(159) = (1+y(114))/(1+params(234));
T(160) = y(271)/params(241);
T(161) = exp(y(234)*y(238)/(y(204)*y(123))-params(319)/params(240));
T(162) = 1-params(38)*(T(161)-1);
T(163) = exp(y(235)*y(237)/(y(201)*y(122))-params(318)/params(239));
T(164) = 1-params(38)*(T(163)-1);
T(165) = exp(y(232)*y(240)/(y(204)*y(123))-params(321)/params(240));
T(166) = 1-params(38)*(T(165)-1);
T(167) = y(125)/y(201);
T(168) = y(126)/y(204);
T(169) = y(131)/y(201);
T(170) = y(132)/y(204);
T(171) = y(145)/y(201);
T(172) = y(146)/y(204);

end
