function [lhs, rhs] = static_resid(y, x, params)
T = NaN(89, 1);
lhs = NaN(215, 1);
rhs = NaN(215, 1);
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
lhs(1) = y(23)*y(97);
rhs(1) = y(23)*params(5)*exp(y(148))*(1+y(1));
lhs(2) = y(24)*y(98);
rhs(2) = y(24)*exp(y(148))*params(6)*(1+y(2));
lhs(3) = y(23)*y(97);
rhs(3) = y(23)*params(5)*(1+y(4));
lhs(4) = y(24)*y(98);
rhs(4) = y(24)*params(6)*(1+y(5));
lhs(5) = y(23);
rhs(5) = T(2)/(1+y(63));
lhs(6) = y(24);
rhs(6) = T(4)/(1+y(64));
lhs(7) = y(25);
rhs(7) = T(5)/(1+y(63));
lhs(8) = y(26);
rhs(8) = T(6)/(1+y(64));
lhs(9) = y(23)*((1-y(59))*(y(33)*y(29)+y(35)*y(31))+params(100)*(y(51)-y(27)));
rhs(9) = y(27)*y(87)*T(7)*T(8);
lhs(10) = y(24)*((1-y(60))*(y(34)*y(30)+y(36)*y(32))+params(101)*(y(52)-y(28)));
rhs(10) = y(28)*y(88)*T(9)*T(10);
lhs(11) = y(25)*((1-y(59))*(y(33)*y(29)+y(35)*y(31))+params(100)*(y(53)-y(27)));
rhs(11) = y(27)*y(87)*T(7)*T(11);
lhs(12) = y(26)*((1-y(60))*(y(34)*y(30)+y(36)*y(32))+params(101)*(y(54)-y(28)));
rhs(12) = y(28)*y(88)*T(9)*T(12);
lhs(13) = y(49);
rhs(13) = y(53)*params(1)+y(51)*(1-params(1));
lhs(14) = y(50);
rhs(14) = y(54)*params(2)+y(52)*(1-params(2));
lhs(15) = y(87);
rhs(15) = params(19)*(y(49)/params(282))^params(17);
lhs(16) = y(88);
rhs(16) = params(20)*(y(50)/params(283))^params(18);
lhs(17) = y(55);
rhs(17) = (y(49)-y(27))/y(49);
lhs(18) = y(56);
rhs(18) = (y(50)-y(28))/y(50);
lhs(19) = y(27);
rhs(19) = y(29)+y(31);
lhs(20) = y(28);
rhs(20) = y(30)+y(32);
lhs(21) = y(85);
rhs(21) = y(97);
lhs(22) = y(86);
rhs(22) = y(98);
lhs(23) = (y(25)*params(1)+y(23)*(1-params(1)))*T(17)-T(13)*(y(23)*y(81)+y(25)*y(83))+T(1)*T(7)*y(87)*y(140)*y(29)*T(11)*y(83)/y(33)+T(1)*T(7)*y(87)*y(140)*y(29)*T(8)*y(81)/y(33);
rhs(23) = T(1)*T(7)*y(29)*T(20)/y(33)+T(16)*params(106)*params(5)*(y(25)*params(1)+y(23)*(1-params(1)))*T(21)/(y(97)*T(15));
lhs(24) = (y(26)*params(2)+y(24)*(1-params(2)))*T(26)-T(22)*(y(24)*y(82)+y(26)*y(84))+T(3)*T(9)*y(88)*y(141)*y(30)*T(12)*y(84)/y(34)+T(3)*T(9)*y(88)*y(141)*y(30)*T(10)*y(82)/y(34);
rhs(24) = T(3)*T(9)*y(30)*T(29)/y(34)+T(25)*params(107)*params(6)*(y(26)*params(2)+y(24)*(1-params(2)))*T(30)/(y(98)*T(24));
lhs(25) = params(100)*y(25)*params(1);
rhs(25) = y(83)*(y(25)*params(100)-y(87)*y(27)*T(31));
lhs(26) = params(101)*y(26)*params(2);
rhs(26) = y(84)*(y(26)*params(101)-y(88)*y(28)*T(32));
lhs(27) = params(100)*y(23)*(1-params(1));
rhs(27) = y(81)*(y(23)*params(100)-y(87)*y(27)*T(33));
lhs(28) = params(101)*y(24)*(1-params(2));
rhs(28) = y(82)*(y(24)*params(101)-y(88)*y(28)*T(34));
lhs(29) = log(y(57)/params(290));
rhs(29) = log(y(57)/params(290))*params(56)-params(138)*T(35)-params(140)*T(36)+params(170)*x(15)+(1-params(170))*y(198);
lhs(30) = log(y(58)/params(291));
rhs(30) = log(y(58)/params(291))*params(57)-params(139)*T(37)-params(141)*T(38)+params(180)*x(16)+(1-params(180))*y(199);
lhs(31) = log(y(77)/params(305));
rhs(31) = log(y(77)/params(305))*params(92)-T(35)*params(152)-T(36)*params(154)+params(171)*x(25)+(1-params(171))*y(200);
lhs(32) = log(y(78)/params(306));
rhs(32) = log(y(78)/params(306))*params(93)-T(37)*params(153)-T(38)*params(155)+params(181)*x(26)+(1-params(181))*y(201);
lhs(33) = log(y(69)/params(297));
rhs(33) = log(y(69)/params(297))*params(58)-T(35)*params(142)-T(36)*params(144)+params(172)*x(29)+(1-params(172))*y(202);
lhs(34) = log(y(70)/params(298));
rhs(34) = log(y(70)/params(298))*params(59)-T(37)*params(143)-T(38)*params(145)+params(182)*x(30)+(1-params(182))*y(203);
lhs(35) = (y(71)-params(299))/params(239);
rhs(35) = (y(71)-params(299))*params(60)/params(239)+T(35)*params(146)+T(36)*params(148)+params(173)*x(31)+(1-params(173))*y(204);
lhs(36) = (y(72)-params(300))/params(240);
rhs(36) = (y(72)-params(300))*params(61)/params(240)+T(37)*params(147)+T(38)*params(149)+params(183)*x(32)+(1-params(183))*y(205);
lhs(37) = y(59)-params(213);
rhs(37) = (y(59)-params(213))*params(84)+T(35)*params(122)+T(36)*params(124)+params(174)*x(19)+(1-params(174))*y(206);
lhs(38) = y(60)-params(214);
rhs(38) = (y(60)-params(214))*params(85)+T(37)*params(123)+T(38)*params(125)+params(184)*x(20)+(1-params(184))*y(207);
lhs(39) = y(61)-params(215);
rhs(39) = (y(61)-params(215))*params(86)+T(35)*params(126)+T(36)*params(128)+params(175)*x(21)+(1-params(175))*y(208);
lhs(40) = y(62);
rhs(40) = params(216)+params(87)*(y(62)-params(216))+T(37)*params(127)+T(38)*params(129)+params(185)*x(22)+(1-params(185))*y(209);
lhs(41) = y(63);
rhs(41) = params(219)+params(90)*(y(63)-params(219))+T(35)*params(134)+T(36)*params(136)+params(176)*x(23)+(1-params(176))*y(210);
lhs(42) = y(64);
rhs(42) = params(220)+params(91)*(y(64)-params(220))+T(37)*params(135)+T(38)*params(137)+params(186)*x(24)+(1-params(186))*y(211);
lhs(43) = y(31);
rhs(43) = params(260)+params(94)*(y(31)-params(260))-T(35)*params(156)+T(36)*params(158)+params(178)*x(27)+(1-params(178))*y(212);
lhs(44) = y(32);
rhs(44) = params(261)+params(95)*(y(32)-params(261))-T(37)*params(157)+T(38)*params(159)+params(188)*x(28)+(1-params(188))*y(213);
lhs(45) = y(69);
rhs(45) = params(1)*y(65)+(1-params(1))*y(67);
lhs(46) = y(70);
rhs(46) = (1-params(2))*y(68)+params(2)*y(66);
lhs(47) = params(3)*(y(67)/params(295)-1);
rhs(47) = (1-params(3))*(y(65)/params(293)-1);
lhs(48) = params(4)*(y(68)/params(296)-1);
rhs(48) = (1-params(4))*(y(66)/params(294)-1);
lhs(49) = y(69)+y(57)*y(89)+params(100)*((y(53)-y(27))*params(1)+(y(51)-y(27))*(1-params(1)))+y(77)*y(89)+y(31)*y(35)*(1+y(61))+(1+y(4))*y(73)/y(97);
rhs(49) = y(73)+(y(33)*y(29)+y(35)*y(31))*(y(59)+y(61))+params(217)*(y(43)-params(7))*y(37)+y(89)*y(10)*params(211)*exp(y(150))+y(63)*y(13)+(1-params(1))*y(71);
lhs(50) = y(70)+y(58)*y(92)+params(101)*((y(54)-y(28))*params(2)+(y(52)-y(28))*(1-params(2)))+y(78)*y(92)+y(32)*y(36)*(1+y(62))+(1+y(5))*y(74)/y(98);
rhs(50) = y(74)+(y(34)*y(30)+y(36)*y(32))*(y(60)+y(62))+params(218)*(y(44)-params(8))*y(38)+y(92)*y(11)*params(212)*exp(y(151))+y(64)*y(14)+(1-params(2))*y(72);
lhs(51) = y(75);
rhs(51) = y(77)+y(75)*(1-params(7));
lhs(52) = y(76);
rhs(52) = y(78)+y(76)*(1-params(8));
lhs(53) = y(79);
rhs(53) = T(39)*T(40);
lhs(54) = y(80);
rhs(54) = T(41)*T(42);
lhs(55) = log(y(35)/params(264));
rhs(55) = log(y(35)/params(264))*params(62)-T(35)*params(150)+T(36)*params(160)+params(179)*x(33)+(1-params(179))*y(214);
lhs(56) = log(y(36)/params(265));
rhs(56) = log(y(36)/params(265))*params(63)-T(37)*params(151)+T(38)*params(161)+params(189)*x(34)+(1-params(189))*y(215);
lhs(57) = y(10);
rhs(57) = T(44)*T(45)-params(98);
lhs(58) = y(11);
rhs(58) = T(47)*T(48)-params(99);
lhs(59) = y(43);
rhs(59) = y(79)*params(21)*exp(y(137))*params(110)*exp(y(135))*y(41)*T(50);
lhs(60) = y(44);
rhs(60) = y(80)*params(22)*exp(y(137))*params(111)*exp(y(136))*y(42)*T(52);
lhs(61) = y(33)*(1+y(61));
rhs(61) = y(79)*(1-params(21))*exp(y(137))*params(110)*exp(y(135))*y(41)*T(53);
lhs(62) = y(34)*(1+y(62));
rhs(62) = y(80)*(1-params(22))*exp(y(137))*params(111)*exp(y(136))*y(42)*T(54);
lhs(63) = y(39);
rhs(63) = (1-params(7))*y(39)+y(21)*exp(y(146));
lhs(64) = y(40);
rhs(64) = (1-params(8))*y(40)+y(22)*exp(y(147));
lhs(65) = 1;
rhs(65) = params(5)/y(97)*(1+y(47));
lhs(66) = 1;
rhs(66) = params(6)/y(98)*(1+y(48));
lhs(67) = y(47);
rhs(67) = y(97)*((1-params(7))*y(45)+y(43)*(1-params(217))+params(217)*params(7))/y(45)-1;
lhs(68) = y(48);
rhs(68) = y(98)*((1-params(8))*y(46)+y(44)*(1-params(218))+params(218)*params(8))/y(46)-1;
lhs(69) = 1;
rhs(69) = exp(y(146))*y(45);
lhs(70) = 1;
rhs(70) = exp(y(147))*y(46);
lhs(71) = 1-y(138)+y(41)*y(138)*T(55)+params(5)*T(60)/y(97)/T(57);
rhs(71) = y(100)*T(58)/T(57);
lhs(72) = 1-y(139)+y(42)*y(139)*T(61)+params(6)*T(66)/y(98)/T(63);
rhs(72) = y(101)*T(64)/T(63);
lhs(73) = y(90);
rhs(73) = y(89)*y(120);
lhs(74) = y(93);
rhs(74) = y(92)*1/y(120);
lhs(75) = y(91);
rhs(75) = y(89)*y(121);
lhs(76) = y(94);
rhs(76) = y(92)*y(121)/y(120);
lhs(77) = 1;
rhs(77) = params(44)*y(89)^(1-params(41))+params(45)*y(93)^(1-params(41))+params(46)*y(95)^(1-params(41));
lhs(78) = 1;
rhs(78) = params(47)*y(92)^(1-params(42))+params(48)*y(90)^(1-params(42))+params(49)*y(96)^(1-params(42));
lhs(79) = y(97);
rhs(79) = T(67)^(1/(1-params(41)));
lhs(80) = y(98);
rhs(80) = T(68)^(1/(1-params(42)));
lhs(81) = y(106);
rhs(81) = params(1)*y(17)*T(70)+(1-params(1))*y(15)*T(70);
lhs(82) = y(108);
rhs(82) = params(2)*y(18)*T(71)+(1-params(2))*y(16)*T(71);
lhs(83) = y(112);
rhs(83) = y(21)*T(69)*(1-params(1))*params(44);
lhs(84) = y(114);
rhs(84) = (1-params(2))*y(22)*T(71);
lhs(85) = y(109);
rhs(85) = (y(17)*params(1)*params(45)*T(72)+y(15)*T(72)*(1-params(1))*params(45))*exp(y(154));
lhs(86) = y(107);
rhs(86) = (y(18)*params(2)*params(48)*T(73)+y(16)*T(73)*(1-params(2))*params(48))*exp(y(155));
lhs(87) = y(115);
rhs(87) = exp(y(154))*y(21)*T(72)*(1-params(1))*params(45);
lhs(88) = y(113);
rhs(88) = exp(y(155))*y(22)*T(73)*(1-params(2))*params(48);
lhs(89) = y(110);
rhs(89) = y(17)*params(1)*params(46)*T(74)+y(15)*T(74)*(1-params(1))*params(46);
lhs(90) = y(111);
rhs(90) = y(18)*params(2)*params(49)*T(75)+y(16)*T(75)*(1-params(2))*params(49);
lhs(91) = y(116);
rhs(91) = y(21)*T(74)*(1-params(1))*params(46);
lhs(92) = y(117);
rhs(92) = y(22)*T(75)*(1-params(2))*params(49);
lhs(93) = (1+y(63))*y(17);
rhs(93) = (1-y(59))*(y(33)*y(29)+y(35)*y(31))+params(100)*(y(53)-y(27))+y(65);
lhs(94) = (1+y(64))*y(18);
rhs(94) = (1-y(60))*(y(34)*y(30)+y(36)*y(32))+params(101)*(y(54)-y(28))+y(66);
lhs(95) = y(13);
rhs(95) = y(17)*params(1)+y(15)*(1-params(1));
lhs(96) = y(14);
rhs(96) = y(18)*params(2)+y(16)*(1-params(2));
lhs(97) = y(37);
rhs(97) = (1-params(1))*y(39);
lhs(98) = y(38);
rhs(98) = (1-params(2))*y(40);
lhs(99) = y(19);
rhs(99) = (1-params(1))*y(21);
lhs(100) = y(20);
rhs(100) = (1-params(2))*y(22);
lhs(101) = y(10);
rhs(101) = y(77)+y(57)+y(106)+y(112)+T(76)*(y(107)+y(113))+T(77)*(T(78)*params(231)*y(12)+y(12)*T(78)*params(232));
lhs(102) = y(11);
rhs(102) = y(78)+y(58)+params(53)/params(54)*(y(109)+y(115))+y(108)+y(114)+T(79)*(y(12)*params(231)*T(80)+y(12)*params(232)*T(80));
lhs(103) = T(81);
rhs(103) = T(81)*params(33)+(1-params(33))*params(34)*(T(82)*log(y(97)/params(316))+T(83)*log(y(98)/params(316)))+(1-params(33))*params(35)*(T(36)*T(82)+T(38)*T(83))+x(35);
lhs(104) = T(81);
rhs(104) = T(82)*log((1+y(1))/(1+params(233)))+T(83)*log((1+y(2))/(1+params(234)));
lhs(105) = y(12);
rhs(105) = exp(y(137))*y(159);
lhs(106) = y(158);
rhs(106) = log(y(159)/params(241));
lhs(107) = y(156);
rhs(107) = y(99)-params(316);
lhs(108) = y(157);
rhs(108) = y(3)-params(235);
lhs(109) = y(158);
rhs(109) = y(158)*params(190)+y(156)*params(191)+y(157)*params(192)+params(193)*x(40);
lhs(110) = y(156);
rhs(110) = y(158)*params(194)+y(156)*params(195)+y(157)*params(196)+y(137)*params(197)+x(40)*params(198)+params(199)*x(42)+params(200)*x(43);
lhs(111) = y(157);
rhs(111) = y(158)*params(201)+y(156)*params(202)+y(157)*params(203)+y(137)*params(204)+x(40)*params(205)+x(42)*params(206)+params(207)*x(41)+x(43)*params(208);
lhs(112) = y(137);
rhs(112) = y(137)*params(209)+x(43)*params(210);
lhs(113) = y(95);
rhs(113) = 1/y(121);
lhs(114) = y(96);
rhs(114) = y(120)/y(121);
lhs(115) = y(24);
rhs(115) = y(24)*exp(y(148))*params(6)*(1+y(7))/y(98);
lhs(116) = y(23);
rhs(116) = y(23)*params(5)*exp(y(149))*(1+y(6))*y(119)/y(97);
lhs(117) = y(24);
rhs(117) = y(24)*params(6)*exp(y(149))*(1+y(8))*y(118)/y(98);
lhs(118) = y(123)*y(125)+y(127);
rhs(118) = y(125)*(1+y(6))*y(123)/y(99)+(1+y(7))*y(127)/y(97)+y(10)*y(89)-y(13)-y(19)-y(57)*y(89)-y(77)*y(89);
lhs(119) = y(122)*y(126)+y(120)*y(128);
rhs(119) = y(126)*(1+y(8))*y(122)/y(99)+y(128)*y(120)*(1+y(7))/y(97)+y(11)*y(92)-y(14)-y(20)-y(58)*y(92)-y(78)*y(92);
lhs(120) = y(124);
rhs(120) = (-(y(125)*params(53)/params(55)+y(126)*params(54)/params(55)));
lhs(121) = y(127);
rhs(121) = y(128)*(-params(54))/params(53);
lhs(122) = y(129);
rhs(122) = y(123)*y(125)-T(76)*y(128);
lhs(123) = y(130);
rhs(123) = y(122)*y(126)+y(120)*y(128);
lhs(124) = y(131);
rhs(124) = y(124);
lhs(125) = y(132);
rhs(125) = 0;
lhs(126) = y(133);
rhs(126) = 0;
lhs(127) = y(134);
rhs(127) = 0;
lhs(128) = 1+y(8);
rhs(128) = (1+y(3))*T(85);
lhs(129) = 1+y(6);
rhs(129) = (1+y(3))*T(87);
lhs(130) = 1+y(7);
rhs(130) = (1+y(1))*T(89);
lhs(131) = y(122);
rhs(131) = y(120)/y(121);
lhs(132) = y(123);
rhs(132) = 1/y(121);
lhs(133) = 1;
rhs(133) = y(98)/y(97);
lhs(134) = y(118);
rhs(134) = y(98)/y(99);
lhs(135) = y(119);
rhs(135) = y(97)/y(99);
lhs(136) = y(102);
rhs(136) = y(101);
lhs(137) = y(105);
rhs(137) = y(100);
lhs(138) = y(104);
rhs(138) = y(99)*y(119);
lhs(139) = y(103);
rhs(139) = y(99)*y(118);
lhs(140) = y(135);
rhs(140) = y(135)*params(64)+x(1);
lhs(141) = y(136);
rhs(141) = y(136)*params(65)+x(2);
lhs(142) = y(138)/(y(138)-1);
rhs(142) = y(138)*params(66)/(y(138)-1)+(1-params(66))*params(25)/(params(25)-1)+x(3);
lhs(143) = y(139)/(y(139)-1);
rhs(143) = y(139)*params(67)/(y(139)-1)+(1-params(67))*params(26)/(params(26)-1)+x(4);
lhs(144) = y(140)/(y(140)-1);
rhs(144) = y(140)*params(68)/(y(140)-1)+(1-params(68))*params(27)/(params(27)-1)+x(5);
lhs(145) = y(141)/(y(141)-1);
rhs(145) = y(141)*params(69)/(y(141)-1)+(1-params(69))*params(28)/(params(28)-1)+x(6);
lhs(146) = y(142);
rhs(146) = y(142)*params(70)+x(7);
lhs(147) = y(143);
rhs(147) = y(143)*params(71)+x(8);
lhs(148) = y(144);
rhs(148) = y(144)*params(72)+x(9);
lhs(149) = y(145);
rhs(149) = y(145)*params(73)+x(10);
lhs(150) = y(146);
rhs(150) = y(146)*params(74)+x(11);
lhs(151) = y(147);
rhs(151) = y(147)*params(75)+x(12);
lhs(152) = y(148);
rhs(152) = y(148)*params(76)+x(13);
lhs(153) = y(149);
rhs(153) = y(149)*params(77)+x(14);
lhs(154) = y(152);
rhs(154) = y(152)*params(78)+x(36);
lhs(155) = y(153);
rhs(155) = y(153)*params(79)+x(37);
lhs(156) = y(154);
rhs(156) = y(154)*params(80)+x(38);
lhs(157) = y(155);
rhs(157) = y(155)*params(81)+x(39);
lhs(158) = y(150);
rhs(158) = y(150)*params(82)+T(35)*params(120)+x(17);
lhs(159) = y(151);
rhs(159) = y(151)*params(83)+T(37)*params(121)+x(18);
lhs(160) = y(164);
rhs(160) = y(10)-(y(77)+y(112)+y(57)+y(106));
lhs(161) = y(165);
rhs(161) = y(11)-(y(78)+y(114)+y(58)+y(108));
lhs(162) = y(166);
rhs(162) = y(13)+y(19)-y(89)*(y(106)+y(112));
lhs(163) = y(167);
rhs(163) = y(14)+y(20)-y(92)*(y(108)+y(114));
lhs(164) = y(162);
rhs(164) = y(10)+y(31)*y(35)*(1+y(61))/y(89);
lhs(165) = y(163);
rhs(165) = y(11)+y(32)*y(36)*(1+y(62))/y(92);
lhs(166) = y(168);
rhs(166) = log(y(10))-log(params(239));
lhs(167) = y(169);
rhs(167) = log(y(11))-log(params(240));
lhs(168) = y(170);
rhs(168) = log(y(12))-log(params(241));
lhs(169) = y(160);
rhs(169) = y(10)*params(239)/params(309)/params(239)+y(31)*(1-params(239)/params(309))/params(260)-1;
lhs(170) = y(161);
rhs(170) = y(11)*params(240)/params(310)/params(240)+y(32)*(1-params(240)/params(310))/params(261)-1;
lhs(171) = y(193);
rhs(171) = log(y(73))-log(params(301));
lhs(172) = y(194);
rhs(172) = log(y(74))-log(params(302));
lhs(173) = y(171);
rhs(173) = log(y(13)/y(89))-log(params(242));
lhs(174) = y(172);
rhs(174) = log(y(14)/y(92))-log(params(243));
lhs(175) = y(173);
rhs(175) = log(y(19)/y(89))-log(params(250));
lhs(176) = y(174);
rhs(176) = log(y(20)/y(92))-log(params(251));
lhs(177) = y(175);
rhs(177) = y(27)-params(256);
lhs(178) = y(176);
rhs(178) = y(28)-params(257);
lhs(179) = y(177);
rhs(179) = log(y(33)/y(89))-log(params(262));
lhs(180) = y(178);
rhs(180) = log(y(34)/y(92))-log(params(263));
lhs(181) = y(179);
rhs(181) = y(100)-params(316);
lhs(182) = y(180);
rhs(182) = y(101)-params(316);
lhs(183) = y(181);
rhs(183) = y(99)-params(316);
lhs(184) = y(197);
rhs(184) = y(120)-1;
lhs(185) = y(182);
rhs(185) = y(132)/y(89)/y(10);
lhs(186) = y(183);
rhs(186) = y(133)/y(92)/y(11);
lhs(187) = y(184);
rhs(187) = y(134)/y(12);
lhs(188) = y(185);
rhs(188) = y(9)-params(238);
lhs(189) = y(186);
rhs(189) = y(3)-params(235);
lhs(190) = y(187);
rhs(190) = y(49)-params(282);
lhs(191) = y(188);
rhs(191) = y(50)-params(283);
lhs(192) = y(189);
rhs(192) = y(55)-params(288);
lhs(193) = y(190);
rhs(193) = y(56)-params(289);
lhs(194) = y(191);
rhs(194) = 0;
lhs(195) = y(192);
rhs(195) = 0;
lhs(196) = y(195);
rhs(196) = 0;
lhs(197) = y(196);
rhs(197) = 0;
lhs(198) = y(198);
rhs(198) = x(15);
lhs(199) = y(199);
rhs(199) = x(16);
lhs(200) = y(200);
rhs(200) = x(25);
lhs(201) = y(201);
rhs(201) = x(26);
lhs(202) = y(202);
rhs(202) = x(29);
lhs(203) = y(203);
rhs(203) = x(30);
lhs(204) = y(204);
rhs(204) = x(31);
lhs(205) = y(205);
rhs(205) = x(32);
lhs(206) = y(206);
rhs(206) = x(19);
lhs(207) = y(207);
rhs(207) = x(20);
lhs(208) = y(208);
rhs(208) = x(21);
lhs(209) = y(209);
rhs(209) = x(22);
lhs(210) = y(210);
rhs(210) = x(23);
lhs(211) = y(211);
rhs(211) = x(24);
lhs(212) = y(212);
rhs(212) = x(27);
lhs(213) = y(213);
rhs(213) = x(28);
lhs(214) = y(214);
rhs(214) = x(33);
lhs(215) = y(215);
rhs(215) = x(34);
end
