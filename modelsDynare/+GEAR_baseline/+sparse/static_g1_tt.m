function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = GEAR_baseline.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 135
    T = [T; NaN(135 - size(T, 1), 1)];
end
T(90) = 1/(1+params(238))/((1+y(9))/(1+params(238)));
T(91) = 1/params(239)/(y(10)/params(239));
T(92) = 1/params(240)/(y(11)/params(240));
T(93) = 1/y(89);
T(94) = 1/y(92);
T(95) = getPowerDeriv(T(49),params(21)-1,1);
T(96) = getPowerDeriv(T(49),params(21),1);
T(97) = getPowerDeriv(T(51),params(22)-1,1);
T(98) = getPowerDeriv(T(51),params(22),1);
T(99) = 1/params(264)/(y(35)/params(264));
T(100) = 1/params(265)/(y(36)/params(265));
T(101) = getPowerDeriv(y(51),params(15),1);
T(102) = getPowerDeriv(y(52),params(16),1);
T(103) = getPowerDeriv(y(53),params(15),1);
T(104) = getPowerDeriv(y(54),params(16),1);
T(105) = 1/params(290)/(y(57)/params(290));
T(106) = 1/params(291)/(y(58)/params(291));
T(107) = 1/params(297)/(y(69)/params(297));
T(108) = 1/params(298)/(y(70)/params(298));
T(109) = 1/params(301)/(y(73)/params(301));
T(110) = 1/params(302)/(y(74)/params(302));
T(111) = 1/params(305)/(y(77)/params(305));
T(112) = 1/params(306)/(y(78)/params(306));
T(113) = T(14)*getPowerDeriv(y(85),params(31),1);
T(114) = T(23)*getPowerDeriv(y(86),params(32),1);
T(115) = getPowerDeriv(y(89)*y(100),1-params(41),1);
T(116) = getPowerDeriv(T(67),1/(1-params(41)),1);
T(117) = getPowerDeriv(y(89),(-params(41)),1);
T(118) = params(44)*T(117);
T(119) = getPowerDeriv(y(90)*y(105),1-params(42),1);
T(120) = getPowerDeriv(T(68),1/(1-params(42)),1);
T(121) = getPowerDeriv(y(90),(-params(42)),1);
T(122) = params(51)*getPowerDeriv(y(91),(-params(43)),1);
T(123) = getPowerDeriv(y(92)*y(101),1-params(42),1);
T(124) = params(47)*getPowerDeriv(y(92),(-params(42)),1);
T(125) = getPowerDeriv(y(93)*y(102),1-params(41),1);
T(126) = getPowerDeriv(y(93),(-params(41)),1);
T(127) = params(52)*getPowerDeriv(y(94),(-params(43)),1);
T(128) = getPowerDeriv(y(95)*y(104),1-params(41),1);
T(129) = getPowerDeriv(y(95),(-params(41)),1);
T(130) = getPowerDeriv(y(96)*y(103),1-params(42),1);
T(131) = getPowerDeriv(y(96),(-params(42)),1);
T(132) = T(56)*getPowerDeriv(y(100),params(29),1);
T(133) = T(62)*getPowerDeriv(y(101),params(30),1);
T(134) = T(1)*T(7)*y(87)*y(140)*y(29)*T(11)*y(83)/y(33)+T(1)*T(7)*y(87)*y(140)*y(29)*T(8)*y(81)/y(33)-T(1)*T(7)*y(29)*T(20)/y(33);
T(135) = T(3)*T(9)*y(88)*y(141)*y(30)*T(12)*y(84)/y(34)+T(3)*T(9)*y(88)*y(141)*y(30)*T(10)*y(82)/y(34)-T(3)*T(9)*y(30)*T(29)/y(34);
end
