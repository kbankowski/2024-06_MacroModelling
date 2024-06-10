function T = dynamic_g2_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g2_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 435);

T = GEAR_baseline.dynamic_g1_tt(T, y, x, params, steady_state, it_);

T(378) = getPowerDeriv(y(127)-params(11)*y(9),(-params(9)),2);
T(379) = (-params(11))*T(378);
T(380) = getPowerDeriv(y(128)-params(12)*y(10),(-params(10)),2);
T(381) = (-params(12))*T(380);
T(382) = getPowerDeriv(y(129)-params(11)*y(11),(-params(9)),2);
T(383) = (-params(11))*T(382);
T(384) = getPowerDeriv(y(130)-params(12)*y(12),(-params(10)),2);
T(385) = (-params(12))*T(384);
T(386) = getPowerDeriv(y(163),params(15),2);
T(387) = getPowerDeriv(y(164),params(16),2);
T(388) = getPowerDeriv(y(165),params(15),2);
T(389) = getPowerDeriv(y(166),params(16),2);
T(390) = T(1)*T(7)*y(199)*y(252)*T(11)*y(195)/y(145)+T(1)*T(7)*y(199)*y(252)*T(8)*y(193)/y(145)-T(1)*T(7)*T(21)/y(145);
T(391) = (-((-((-(y(141)*params(100)*y(252)))*(y(145)+y(145))))/(y(145)*y(145)*y(145)*y(145))));
T(392) = T(1)*T(7)*(-(y(199)*y(252)*y(141)*T(11)*y(195)))/(y(145)*y(145))+T(1)*T(7)*(-(y(199)*y(252)*y(141)*T(8)*y(193)))/(y(145)*y(145))-T(1)*T(7)*(-(y(141)*T(21)))/(y(145)*y(145));
T(393) = T(15)*getPowerDeriv(y(49),params(31),2);
T(394) = T(1)*T(7)*y(199)*y(141)*T(11)*y(195)/y(145)+T(1)*T(7)*y(199)*y(141)*T(8)*y(193)/y(145)-T(1)*T(7)*y(141)*y(199)*T(19)/y(145);
T(395) = T(3)*T(9)*y(200)*y(253)*T(12)*y(196)/y(146)+T(3)*T(9)*y(200)*y(253)*T(10)*y(194)/y(146)-T(3)*T(9)*T(33)/y(146);
T(396) = (-((-((-(y(142)*params(101)*y(253)))*(y(146)+y(146))))/(y(146)*y(146)*y(146)*y(146))));
T(397) = T(3)*T(9)*(-(y(200)*y(253)*y(142)*T(12)*y(196)))/(y(146)*y(146))+T(3)*T(9)*(-(y(200)*y(253)*y(142)*T(10)*y(194)))/(y(146)*y(146))-T(3)*T(9)*(-(y(142)*T(33)))/(y(146)*y(146));
T(398) = T(27)*getPowerDeriv(y(50),params(32),2);
T(399) = T(27)*getPowerDeriv(y(198),params(32),2);
T(400) = T(3)*T(9)*y(200)*y(142)*T(12)*y(196)/y(146)+T(3)*T(9)*y(200)*y(142)*T(10)*y(194)/y(146)-T(3)*T(9)*y(142)*y(200)*T(31)/y(146);
T(401) = (-(T(175)*T(175)))/(T(46)*T(46));
T(402) = (-(1/params(301)*1/params(301)))/(T(44)*T(44));
T(403) = (-(T(180)*T(180)))/(T(52)*T(52));
T(404) = (-(1/params(302)*1/params(302)))/(T(50)*T(50));
T(405) = getPowerDeriv(T(77),params(21)-1,2);
T(406) = getPowerDeriv(T(80),params(22)-1,2);
T(407) = getPowerDeriv(T(77),params(21),2);
T(408) = getPowerDeriv(T(80),params(22),2);
T(409) = (-((-y(133))*(y(13)+y(13))))/(y(13)*y(13)*y(13)*y(13));
T(410) = T(90)*(2*T(91)*T(409)+T(193)*2*T(193));
T(411) = (-((-y(134))*(y(14)+y(14))))/(y(14)*y(14)*y(14)*y(14));
T(412) = T(93)*(2*T(94)*T(411)+T(201)*2*T(201));
T(413) = T(110)*getPowerDeriv(y(59),params(29),2);
T(414) = T(110)*getPowerDeriv(y(212),params(29),2);
T(415) = T(122)*getPowerDeriv(y(60),params(30),2);
T(416) = T(122)*getPowerDeriv(y(213),params(30),2);
T(417) = getPowerDeriv(y(212)*y(51),1-params(41),2);
T(418) = getPowerDeriv(T(132),1/(1-params(41)),2);
T(419) = getPowerDeriv(y(214)*y(54),1-params(41),2);
T(420) = getPowerDeriv(y(216)*y(55),1-params(41),2);
T(421) = getPowerDeriv(y(217)*y(52),1-params(42),2);
T(422) = getPowerDeriv(T(133),1/(1-params(42)),2);
T(423) = getPowerDeriv(y(213)*y(53),1-params(42),2);
T(424) = getPowerDeriv(y(215)*y(56),1-params(42),2);
T(425) = getPowerDeriv(y(201),(-params(41)),2);
T(426) = params(44)*T(425);
T(427) = params(47)*getPowerDeriv(y(204),(-params(42)),2);
T(428) = getPowerDeriv(y(205),(-params(41)),2);
T(429) = getPowerDeriv(y(202),(-params(42)),2);
T(430) = getPowerDeriv(y(207),(-params(41)),2);
T(431) = getPowerDeriv(y(208),(-params(42)),2);
T(432) = params(51)*getPowerDeriv(y(203),(-params(43)),2);
T(433) = params(52)*getPowerDeriv(y(206),(-params(43)),2);
T(434) = (-1)/(y(201)*y(201));
T(435) = (-1)/(y(204)*y(204));

end
