using MacroModelling

@model GEAR_baseline begin
	lambda_o_a_t[0] * pi_a_t[1] = betta_a * exp(e_rp_a_t[0]) * (1 + i_a_t[0]) * lambda_o_a_t[1]

	lambda_o_b_t[0] * pi_b_t[1] = exp(e_rp_a_t[0]) * betta_b * (1 + i_b_t[0]) * lambda_o_b_t[1]

	lambda_o_a_t[0] * pi_a_t[1] = lambda_o_a_t[1] * betta_a * (1 + i_Ga_t[0])

	lambda_o_b_t[0] * pi_b_t[1] = lambda_o_b_t[1] * betta_b * (1 + i_Gb_t[0])

	lambda_o_a_t[0] = exp(e_b_a_t[0]) * (c_o_a_t[0] - hab_a * c_o_a_t[-1]) ^ (-sigma_a) / (1 + tauc_a_t[0])

	lambda_o_b_t[0] = exp(e_b_b_t[0]) * (c_o_b_t[0] - hab_b * c_o_b_t[-1]) ^ (-sigma_b) / (1 + tauc_b_t[0])

	lambda_r_a_t[0] = exp(e_b_a_t[0]) * (c_r_a_t[0] - hab_a * c_r_a_t[-1]) ^ (-sigma_a) / (1 + tauc_a_t[0])

	lambda_r_b_t[0] = exp(e_b_b_t[0]) * (c_r_b_t[0] - hab_b * c_r_b_t[-1]) ^ (-sigma_b) / (1 + tauc_b_t[0])

	lambda_o_a_t[0] * ((1 - tauw_a_t[0]) * (wr_a_t[0] * nP_a_t[0] + wrG_a_t[0] * nG_a_t[0]) + UB_a * (l_o_a_t[0] - n_a_t[0])) = n_a_t[0] * kappaw_a_t[0] * exp(e_n_a_t[0]) * l_o_a_t[0] ^ psi_a

	lambda_o_b_t[0] * ((1 - tauw_b_t[0]) * (wr_b_t[0] * nP_b_t[0] + wrG_b_t[0] * nG_b_t[0]) + UB_b * (l_o_b_t[0] - n_b_t[0])) = n_b_t[0] * kappaw_b_t[0] * exp(e_n_b_t[0]) * l_o_b_t[0] ^ psi_b

	lambda_r_a_t[0] * ((1 - tauw_a_t[0]) * (wr_a_t[0] * nP_a_t[0] + wrG_a_t[0] * nG_a_t[0]) + UB_a * (l_r_a_t[0] - n_a_t[0])) = n_a_t[0] * kappaw_a_t[0] * exp(e_n_a_t[0]) * l_r_a_t[0] ^ psi_a

	lambda_r_b_t[0] * ((1 - tauw_b_t[0]) * (wr_b_t[0] * nP_b_t[0] + wrG_b_t[0] * nG_b_t[0]) + UB_b * (l_r_b_t[0] - n_b_t[0])) = n_b_t[0] * kappaw_b_t[0] * exp(e_n_b_t[0]) * l_r_b_t[0] ^ psi_b

	l_a_t[0] = l_r_a_t[0] * mu_a + l_o_a_t[0] * (1 - mu_a)

	l_b_t[0] = l_r_b_t[0] * mu_b + l_o_b_t[0] * (1 - mu_b)

	kappaw_a_t[0] = kappaw_a_ts * (l_a_t[0] / l_a_ts) ^ psi_l_a

	kappaw_b_t[0] = kappaw_b_ts * (l_b_t[0] / l_b_ts) ^ psi_l_b

	ur_a_t[0] = (l_a_t[0] - n_a_t[0]) / l_a_t[0]

	ur_b_t[0] = (l_b_t[0] - n_b_t[0]) / l_b_t[0]

	n_a_t[0] = nP_a_t[0] + nG_a_t[0]

	n_b_t[0] = nP_b_t[0] + nG_b_t[0]

	pi_w_a_t[0] = wr_a_t[0] / wr_a_t[-1] * pi_a_t[0]

	pi_w_b_t[0] = wr_b_t[0] / wr_b_t[-1] * pi_b_t[0]

	(lambda_r_a_t[0] * mu_a + lambda_o_a_t[0] * (1 - mu_a)) * ((1 - tauw_a_t[0]) * (nP_a_t[0] * thetaw_a_t[0] - nP_a_t[0]) - nP_a_t[0] * UB_a * thetaw_a_t[0] / wr_a_t[0] + pi_w_a_t[0] * upsilon_w_a * (pi_w_a_t[0] / (pi_w_a_t[-1] ^ xiw_a * pi_ts ^ (1 - xiw_a)) - 1) / (pi_w_a_t[-1] ^ xiw_a * pi_ts ^ (1 - xiw_a))) - ((1 - tauw_a_t[0]) * (nP_a_t[0] * thetaw_a_t[0] - nP_a_t[0]) - nP_a_t[0] * UB_a * thetaw_a_t[0] / wr_a_t[0]) * (lambda_o_a_t[0] * omega_o_a_t[0] + lambda_r_a_t[0] * omega_r_a_t[0]) + exp(e_b_a_t[0]) * exp(e_n_a_t[0]) * kappaw_a_t[0] * thetaw_a_t[0] * nP_a_t[0] * l_r_a_t[0] ^ psi_a * omega_r_a_t[0] / wr_a_t[0] + exp(e_b_a_t[0]) * exp(e_n_a_t[0]) * kappaw_a_t[0] * thetaw_a_t[0] * nP_a_t[0] * l_o_a_t[0] ^ psi_a * omega_o_a_t[0] / wr_a_t[0] = exp(e_b_a_t[0]) * exp(e_n_a_t[0]) * nP_a_t[0] * kappaw_a_t[0] * thetaw_a_t[0] * n_a_t[0] ^ psi_a / wr_a_t[0] + upsilon_w_a * betta_a * (mu_a * lambda_r_a_t[1] + lambda_o_a_t[1] * (1 - mu_a)) * (pi_w_a_t[1] / (pi_ts ^ (1 - xiw_a) * pi_w_a_t[0] ^ xiw_a) - 1) * pi_w_a_t[1] ^ 2 / (pi_a_t[1] * pi_w_a_t[-1] ^ xiw_a * pi_ts ^ (1 - xiw_a))

	(lambda_r_b_t[0] * mu_b + lambda_o_b_t[0] * (1 - mu_b)) * ((1 - tauw_b_t[0]) * (nP_b_t[0] * thetaw_b_t[0] - nP_b_t[0]) - nP_b_t[0] * UB_b * thetaw_b_t[0] / wr_b_t[0] + pi_w_b_t[0] * upsilon_w_b * (pi_w_b_t[0] / (pi_w_b_t[-1] ^ xiw_b * pi_ts ^ (1 - xiw_b)) - 1) / (pi_w_b_t[-1] ^ xiw_b * pi_ts ^ (1 - xiw_b))) - ((1 - tauw_b_t[0]) * (nP_b_t[0] * thetaw_b_t[0] - nP_b_t[0]) - nP_b_t[0] * UB_b * thetaw_b_t[0] / wr_b_t[0]) * (lambda_o_b_t[0] * omega_o_b_t[0] + lambda_r_b_t[0] * omega_r_b_t[0]) + exp(e_b_b_t[0]) * exp(e_n_b_t[0]) * kappaw_b_t[0] * thetaw_b_t[0] * nP_b_t[0] * l_r_b_t[0] ^ psi_b * omega_r_b_t[0] / wr_b_t[0] + exp(e_b_b_t[0]) * exp(e_n_b_t[0]) * kappaw_b_t[0] * thetaw_b_t[0] * nP_b_t[0] * l_o_b_t[0] ^ psi_b * omega_o_b_t[0] / wr_b_t[0] = exp(e_b_b_t[0]) * exp(e_n_b_t[0]) * nP_b_t[0] * kappaw_b_t[0] * thetaw_b_t[0] * n_b_t[0] ^ psi_b / wr_b_t[0] + upsilon_w_b * betta_b * (mu_b * lambda_r_b_t[1] + lambda_o_b_t[1] * (1 - mu_b)) * (pi_w_b_t[1] / (pi_ts ^ (1 - xiw_b) * pi_w_b_t[0] ^ xiw_b) - 1) * pi_w_b_t[1] ^ 2 / (pi_b_t[1] * pi_ts ^ (1 - xiw_b) * pi_w_b_t[0] ^ xiw_b)

	UB_a * lambda_r_a_t[0] * mu_a = omega_r_a_t[0] * (lambda_r_a_t[0] * UB_a - kappaw_a_t[0] * n_a_t[0] * psi_a * l_r_a_t[0] ^ (psi_a - 1))

	UB_b * lambda_r_b_t[0] * mu_b = omega_r_b_t[0] * (lambda_r_b_t[0] * UB_b - kappaw_b_t[0] * n_b_t[0] * psi_b * l_r_b_t[0] ^ (psi_b - 1))

	UB_a * lambda_o_a_t[0] * (1 - mu_a) = omega_o_a_t[0] * (lambda_o_a_t[0] * UB_a - kappaw_a_t[0] * n_a_t[0] * psi_a * l_o_a_t[0] ^ (psi_a - 1))

	UB_b * lambda_o_b_t[0] * (1 - mu_b) = omega_o_b_t[0] * (lambda_o_b_t[0] * UB_b - kappaw_b_t[0] * n_b_t[0] * psi_b * l_o_b_t[0] ^ (psi_b - 1))

	log(cG_a_t[0] / cG_a_ts) = rho_eg_a * log(cG_a_t[-1] / cG_a_ts) - xi_b_eg_a * log(BG_a_t[-1] / BG_a_ts) - xi_y_eg_a * log(y_a_t[-1] / y_a_ts) + psi_cG_a * nua_ecG[x] + (1 - psi_cG_a) * AUX_EXO_LAG_211_0[-1]

	log(cG_b_t[0] / cG_b_ts) = rho_eg_b * log(cG_b_t[-1] / cG_b_ts) - xi_b_eg_b * log(BG_b_t[-1] / BG_b_ts) - xi_y_eg_b * log(y_b_t[-1] / y_b_ts) + psi_cG_b * nub_ecG[x] + (1 - psi_cG_b) * AUX_EXO_LAG_212_0[-1]

	log(inG_a_t[0] / inG_a_ts) = rho_einG_a * log(inG_a_t[-1] / inG_a_ts) - log(BG_a_t[-1] / BG_a_ts) * xi_b_ein_a - log(y_a_t[-1] / y_a_ts) * xi_y_ein_a + psi_inG_a * nua_einG[x] + (1 - psi_inG_a) * AUX_EXO_LAG_221_0[-1]

	log(inG_b_t[0] / inG_b_ts) = rho_einG_b * log(inG_b_t[-1] / inG_b_ts) - log(BG_b_t[-1] / BG_b_ts) * xi_b_ein_b - log(y_b_t[-1] / y_b_ts) * xi_y_ein_b + psi_inG_b * nub_einG[x] + (1 - psi_inG_b) * AUX_EXO_LAG_222_0[-1]

	log(TR_a_t[0] / TR_a_ts) = rho_eTR_a * log(TR_a_t[-1] / TR_a_ts) - log(BG_a_t[-1] / BG_a_ts) * xi_b_eTR_a - log(y_a_t[-1] / y_a_ts) * xi_y_eTR_a + psi_TR_a * nua_eTR[x] + (1 - psi_TR_a) * AUX_EXO_LAG_225_0[-1]

	log(TR_b_t[0] / TR_b_ts) = rho_eTR_b * log(TR_b_t[-1] / TR_b_ts) - log(BG_b_t[-1] / BG_b_ts) * xi_b_eTR_b - log(y_b_t[-1] / y_b_ts) * xi_y_eTR_b + psi_TR_b * nub_eTR[x] + (1 - psi_TR_b) * AUX_EXO_LAG_226_0[-1]

	(T_a_t[0] - T_a_ts) / y_a_ts = rho_eT_a * (T_a_t[-1] - T_a_ts) / y_a_ts + log(BG_a_t[-1] / BG_a_ts) * xi_b_eT_a + log(y_a_t[-1] / y_a_ts) * xi_y_eT_a + psi_T_a * nua_eT[x] + (1 - psi_T_a) * AUX_EXO_LAG_227_0[-1]

	(T_b_t[0] - T_b_ts) / y_b_ts = rho_eT_b * (T_b_t[-1] - T_b_ts) / y_b_ts + log(BG_b_t[-1] / BG_b_ts) * xi_b_eT_b + log(y_b_t[-1] / y_b_ts) * xi_y_eT_b + psi_T_b * nub_eT[x] + (1 - psi_T_b) * AUX_EXO_LAG_228_0[-1]

	tauw_a_t[0] - tauw_a = rho_etauw_a * (tauw_a_t[-1] - tauw_a) + log(BG_a_t[-1] / BG_a_ts) * xi_b_etauw_a + log(y_a_t[-1] / y_a_ts) * xi_y_etauw_a + psi_tauw_a * nua_etauw[x] + (1 - psi_tauw_a) * AUX_EXO_LAG_215_0[-1]

	tauw_b_t[0] - tauw_b = rho_etauw_b * (tauw_b_t[-1] - tauw_b) + log(BG_b_t[-1] / BG_b_ts) * xi_b_etauw_b + log(y_b_t[-1] / y_b_ts) * xi_y_etauw_b + psi_tauw_b * nub_etauw[x] + (1 - psi_tauw_b) * AUX_EXO_LAG_216_0[-1]

	tausc_a_t[0] - tausc_a = rho_etausc_a * (tausc_a_t[-1] - tausc_a) + log(BG_a_t[-1] / BG_a_ts) * xi_b_etausc_a + log(y_a_t[-1] / y_a_ts) * xi_y_etausc_a + psi_tausc_a * nua_etausc[x] + (1 - psi_tausc_a) * AUX_EXO_LAG_217_0[-1]

	tausc_b_t[0] = tausc_b + rho_etausc_b * (tausc_b_t[-1] - tausc_b) + log(BG_b_t[-1] / BG_b_ts) * xi_b_etausc_b + log(y_b_t[-1] / y_b_ts) * xi_y_etausc_b + psi_tausc_b * nub_etausc[x] + (1 - psi_tausc_b) * AUX_EXO_LAG_218_0[-1]

	tauc_a_t[0] = tauc_a + rho_etauc_a * (tauc_a_t[-1] - tauc_a) + log(BG_a_t[-1] / BG_a_ts) * xi_b_etauc_a + log(y_a_t[-1] / y_a_ts) * xi_y_etauc_a + psi_tauc_a * nua_etauc[x] + (1 - psi_tauc_a) * AUX_EXO_LAG_219_0[-1]

	tauc_b_t[0] = tauc_b + rho_etauc_b * (tauc_b_t[-1] - tauc_b) + log(BG_b_t[-1] / BG_b_ts) * xi_b_etauc_b + log(y_b_t[-1] / y_b_ts) * xi_y_etauc_b + psi_tauc_b * nub_etauc[x] + (1 - psi_tauc_b) * AUX_EXO_LAG_220_0[-1]

	nG_a_t[0] = nG_a_ts + rho_enG_a * (nG_a_t[-1] - nG_a_ts) - log(BG_a_t[-1] / BG_a_ts) * xi_b_enG_a + log(y_a_t[-1] / y_a_ts) * xi_y_enG_a + psi_nG_a * nua_enG[x] + (1 - psi_nG_a) * AUX_EXO_LAG_223_0[-1]

	nG_b_t[0] = nG_b_ts + rho_enG_b * (nG_b_t[-1] - nG_b_ts) - log(BG_b_t[-1] / BG_b_ts) * xi_b_enG_b + log(y_b_t[-1] / y_b_ts) * xi_y_enG_b + psi_nG_b * nub_enG[x] + (1 - psi_nG_b) * AUX_EXO_LAG_224_0[-1]

	TR_a_t[0] = mu_a * TR_r_a_t[0] + (1 - mu_a) * TR_o_a_t[0]

	TR_b_t[0] = (1 - mu_b) * TR_o_b_t[0] + mu_b * TR_r_b_t[0]

	mu_bar_a * (TR_o_a_t[0] / TR_o_a_ts - 1) = (1 - mu_bar_a) * (TR_r_a_t[0] / TR_r_a_ts - 1)

	mu_bar_b * (TR_o_b_t[0] / TR_o_b_ts - 1) = (1 - mu_bar_b) * (TR_r_b_t[0] / TR_r_b_ts - 1)

	TR_a_t[0] + cG_a_t[0] * pr_aa_t[0] + UB_a * ((l_r_a_t[0] - n_a_t[0]) * mu_a + (l_o_a_t[0] - n_a_t[0]) * (1 - mu_a)) + inG_a_t[0] * pr_aa_t[0] + nG_a_t[0] * wrG_a_t[0] * (1 + tausc_a_t[0]) + BG_a_t[-1] * (1 + i_Ga_t[-1]) / pi_a_t[0] = BG_a_t[0] + (wr_a_t[0] * nP_a_t[0] + wrG_a_t[0] * nG_a_t[0]) * (tauw_a_t[0] + tausc_a_t[0]) + tauk_a * (rk_a_t[0] - delta_a) * k_a_t[-1] + pr_aa_t[0] * tau_a * exp(e_tau_a_t[0]) * y_a_t[0] + tauc_a_t[0] * c_a_t[0] + (1 - mu_a) * T_a_t[0]

	TR_b_t[0] + cG_b_t[0] * pr_bb_t[0] + UB_b * ((l_r_b_t[0] - n_b_t[0]) * mu_b + (l_o_b_t[0] - n_b_t[0]) * (1 - mu_b)) + inG_b_t[0] * pr_bb_t[0] + nG_b_t[0] * wrG_b_t[0] * (1 + tausc_b_t[0]) + BG_b_t[-1] * (1 + i_Gb_t[-1]) / pi_b_t[0] = BG_b_t[0] + (wr_b_t[0] * nP_b_t[0] + wrG_b_t[0] * nG_b_t[0]) * (tauw_b_t[0] + tausc_b_t[0]) + tauk_b * (rk_b_t[0] - delta_b) * k_b_t[-1] + pr_bb_t[0] * tau_b * exp(e_tau_b_t[0]) * y_b_t[0] + tauc_b_t[0] * c_b_t[0] + (1 - mu_b) * T_b_t[0]

	kG_a_t[0] = inG_a_t[0] + (1 - delta_a) * kG_a_t[-1]

	kG_b_t[0] = inG_b_t[0] + (1 - delta_b) * kG_b_t[-1]

	yG_a_t[0] = z_a * kG_a_t[0] ^ eta_kG_a * nG_a_t[0] ^ eta_nG_a

	yG_b_t[0] = z_b * kG_b_t[0] ^ eta_kG_b * nG_b_t[0] ^ eta_nG_b

	log(wrG_a_t[0] / wrG_a_ts) = rho_emg_a * log(wrG_a_t[-1] / wrG_a_ts) - log(BG_a_t[-1] / BG_a_ts) * xi_b_emg_a + log(y_a_t[-1] / y_a_ts) * xi_y_emg_a + psi_mg_a * nua_emg[x] + (1 - psi_mg_a) * AUX_EXO_LAG_229_0[-1]

	log(wrG_b_t[0] / wrG_b_ts) = rho_emg_b * log(wrG_b_t[-1] / wrG_b_ts) - log(BG_b_t[-1] / BG_b_ts) * xi_b_emg_b + log(y_b_t[-1] / y_b_ts) * xi_y_emg_b + psi_mg_b * nub_emg[x] + (1 - psi_mg_b) * AUX_EXO_LAG_230_0[-1]

	y_a_t[0] = yG_a_t[0] * exp(a_a_t[0]) * A_a * exp(z_g_t[0]) * k_a_t[-1] ^ rho_a * nP_a_t[0] ^ (1 - rho_a) - FC_a

	y_b_t[0] = yG_b_t[0] * exp(z_g_t[0]) * exp(a_b_t[0]) * A_b * k_b_t[-1] ^ rho_b * nP_b_t[0] ^ (1 - rho_b) - FC_b

	rk_a_t[0] = yG_a_t[0] * rho_a * exp(z_g_t[0]) * A_a * exp(a_a_t[0]) * mcr_a_t[0] * (k_a_t[-1] / nP_a_t[0]) ^ (rho_a - 1)

	rk_b_t[0] = yG_b_t[0] * rho_b * exp(z_g_t[0]) * A_b * exp(a_b_t[0]) * mcr_b_t[0] * (k_b_t[-1] / nP_b_t[0]) ^ (rho_b - 1)

	wr_a_t[0] * (1 + tausc_a_t[0]) = yG_a_t[0] * (1 - rho_a) * exp(z_g_t[0]) * A_a * exp(a_a_t[0]) * mcr_a_t[0] * (k_a_t[-1] / nP_a_t[0]) ^ rho_a - wr_a_t[0] * (1 + tausc_a_t[0]) * upsilon_n_a * (nP_a_t[0] - nP_a_t[-1]) + betta_a * upsilon_n_a * lambda_r_a_t[1] / lambda_r_a_t[0] * wr_a_t[1] * (1 + tausc_a_t[1]) * (nP_a_t[1] - nP_a_t[0])

	wr_b_t[0] * (1 + tausc_b_t[0]) = yG_b_t[0] * (1 - rho_b) * exp(z_g_t[0]) * A_b * exp(a_b_t[0]) * mcr_b_t[0] * (k_b_t[-1] / nP_b_t[0]) ^ rho_b - wr_b_t[0] * (1 + tausc_b_t[0]) * upsilon_n_b * (nP_b_t[0] - nP_b_t[-1]) + betta_b * upsilon_n_b * lambda_r_b_t[1] / lambda_r_b_t[0] * wr_b_t[1] * (1 + tausc_b_t[1]) * (nP_b_t[1] - nP_b_t[0])

	k_o_a_t[0] = (1 - delta_a) * k_o_a_t[-1] + (in_o_a_t[0] - in_o_a_t[0] * upsilon_a / 2 * (in_o_a_t[0] / in_o_a_t[-1] - 1) ^ 2) * exp(e_in_a_t[0])

	k_o_b_t[0] = (1 - delta_b) * k_o_b_t[-1] + (in_o_b_t[0] - in_o_b_t[0] * upsilon_b / 2 * (in_o_b_t[0] / in_o_b_t[-1] - 1) ^ 2) * exp(e_in_b_t[0])

	1 = betta_a * lambda_o_a_t[1] / lambda_o_a_t[0] / pi_a_t[1] * (1 + Rk_a_t[1])

	1 = betta_b * lambda_o_b_t[1] / lambda_o_b_t[0] / pi_b_t[1] * (1 + Rk_b_t[1])

	Rk_a_t[0] = pi_a_t[0] * ((1 - delta_a) * q_a_t[0] + rk_a_t[0] * (1 - tauk_a) + tauk_a * delta_a) / q_a_t[-1] - 1

	Rk_b_t[0] = pi_b_t[0] * ((1 - delta_b) * q_b_t[0] + rk_b_t[0] * (1 - tauk_b) + tauk_b * delta_b) / q_b_t[-1] - 1

	1 = exp(e_in_a_t[0]) * q_a_t[0] * (1 - upsilon_a / 2 * (in_o_a_t[0] / in_o_a_t[-1] - 1) ^ 2 - (in_o_a_t[0] / in_o_a_t[-1] - 1) * upsilon_a * in_o_a_t[0] / in_o_a_t[-1]) + betta_a * lambda_o_a_t[1] / lambda_o_a_t[0] * q_a_t[1] * upsilon_a * (in_o_a_t[1] / in_o_a_t[0]) ^ 2 * (in_o_a_t[1] / in_o_a_t[0] - 1) * exp(e_in_a_t[1])

	1 = exp(e_in_b_t[0]) * q_b_t[0] * (1 - upsilon_b / 2 * (in_o_b_t[0] / in_o_b_t[-1] - 1) ^ 2 - (in_o_b_t[0] / in_o_b_t[-1] - 1) * upsilon_b * in_o_b_t[0] / in_o_b_t[-1]) + betta_b * lambda_o_b_t[1] / lambda_o_b_t[0] * q_b_t[1] * upsilon_b * (in_o_b_t[1] / in_o_b_t[0]) ^ 2 * (in_o_b_t[1] / in_o_b_t[0] - 1) * exp(e_in_b_t[1])

	1 - theta_a_t[0] + mcr_a_t[0] * theta_a_t[0] * pr_aa_t[0] ^ (-1) + betta_a * lambda_o_a_t[1] / lambda_o_a_t[0] * upsilon_p_a * (pi_aa_t[1] / (pi_aa_t[0] ^ xip_a * pi_ts ^ (1 - xip_a)) - 1) * pi_aa_t[1] ^ 2 / pi_a_t[1] * y_a_t[1] / y_a_t[0] / (pi_aa_t[0] ^ xip_a * pi_ts ^ (1 - xip_a)) = pi_aa_t[0] * upsilon_p_a * (pi_aa_t[0] / (pi_ts ^ (1 - xip_a) * pi_aa_t[-1] ^ xip_a) - 1) / (pi_ts ^ (1 - xip_a) * pi_aa_t[-1] ^ xip_a)

	1 - theta_b_t[0] + mcr_b_t[0] * theta_b_t[0] * pr_bb_t[0] ^ (-1) + betta_b * lambda_o_b_t[1] / lambda_o_b_t[0] * upsilon_p_b * (pi_bb_t[1] / (pi_bb_t[0] ^ xip_b * pi_ts ^ (1 - xip_b)) - 1) * pi_bb_t[1] ^ 2 / pi_b_t[1] * y_b_t[1] / y_b_t[0] / (pi_bb_t[0] ^ xip_b * pi_ts ^ (1 - xip_b)) = pi_bb_t[0] * upsilon_p_b * (pi_bb_t[0] / (pi_ts ^ (1 - xip_b) * pi_bb_t[-1] ^ xip_b) - 1) / (pi_ts ^ (1 - xip_b) * pi_bb_t[-1] ^ xip_b)

	pr_ba_t[0] = pr_aa_t[0] * rer_ba_t[0]

	pr_ab_t[0] = pr_bb_t[0] * 1 / rer_ba_t[0]

	pr_ca_t[0] = pr_aa_t[0] * rer_ca_t[0]

	pr_cb_t[0] = pr_bb_t[0] * rer_ca_t[0] / rer_ba_t[0]

	1 = n_aa * pr_aa_t[0] ^ (1 - eta_a) + n_ab * pr_ab_t[0] ^ (1 - eta_a) + n_ac * pr_ac_t[0] ^ (1 - eta_a)

	1 = n_bb * pr_bb_t[0] ^ (1 - eta_b) + n_ba * pr_ba_t[0] ^ (1 - eta_b) + n_bc * pr_bc_t[0] ^ (1 - eta_b)

	pi_a_t[0] = (n_aa * (pi_aa_t[0] * pr_aa_t[-1]) ^ (1 - eta_a) + n_ab * (pi_ab_t[0] * pr_ab_t[-1]) ^ (1 - eta_a) + n_ac * (pi_ac_t[0] * pr_ac_t[-1]) ^ (1 - eta_a)) ^ (1 / (1 - eta_a))

	pi_b_t[0] = (n_bb * (pi_bb_t[0] * pr_bb_t[-1]) ^ (1 - eta_b) + n_ba * (pi_ba_t[0] * pr_ba_t[-1]) ^ (1 - eta_b) + n_bc * (pi_bc_t[0] * pr_bc_t[-1]) ^ (1 - eta_b)) ^ (1 / (1 - eta_b))

	c_aa_t[0] = mu_a * c_r_a_t[0] * n_aa * pr_aa_t[0] ^ (-eta_a) + (1 - mu_a) * c_o_a_t[0] * n_aa * pr_aa_t[0] ^ (-eta_a)

	c_bb_t[0] = mu_b * c_r_b_t[0] * n_bb * pr_bb_t[0] ^ (-eta_b) + (1 - mu_b) * c_o_b_t[0] * n_bb * pr_bb_t[0] ^ (-eta_b)

	in_aa_t[0] = in_o_a_t[0] * pr_aa_t[0] ^ (-eta_a) * (1 - mu_a) * n_aa

	in_bb_t[0] = (1 - mu_b) * in_o_b_t[0] * n_bb * pr_bb_t[0] ^ (-eta_b)

	c_ab_t[0] = (c_r_a_t[0] * mu_a * n_ab * pr_ab_t[0] ^ (-eta_a) + c_o_a_t[0] * pr_ab_t[0] ^ (-eta_a) * (1 - mu_a) * n_ab) * exp(e_RoE_a_t[0])

	c_ba_t[0] = (c_r_b_t[0] * mu_b * n_ba * pr_ba_t[0] ^ (-eta_b) + c_o_b_t[0] * pr_ba_t[0] ^ (-eta_b) * (1 - mu_b) * n_ba) * exp(e_RoE_b_t[0])

	in_ab_t[0] = exp(e_RoE_a_t[0]) * in_o_a_t[0] * pr_ab_t[0] ^ (-eta_a) * (1 - mu_a) * n_ab

	in_ba_t[0] = exp(e_RoE_b_t[0]) * in_o_b_t[0] * pr_ba_t[0] ^ (-eta_b) * (1 - mu_b) * n_ba

	c_ac_t[0] = c_r_a_t[0] * mu_a * n_ac * pr_ac_t[0] ^ (-eta_a) + c_o_a_t[0] * pr_ac_t[0] ^ (-eta_a) * (1 - mu_a) * n_ac

	c_bc_t[0] = c_r_b_t[0] * mu_b * n_bc * pr_bc_t[0] ^ (-eta_b) + c_o_b_t[0] * pr_bc_t[0] ^ (-eta_b) * (1 - mu_b) * n_bc

	in_ac_t[0] = in_o_a_t[0] * pr_ac_t[0] ^ (-eta_a) * (1 - mu_a) * n_ac

	in_bc_t[0] = in_o_b_t[0] * pr_bc_t[0] ^ (-eta_b) * (1 - mu_b) * n_bc

	(1 + tauc_a_t[0]) * c_r_a_t[0] = (1 - tauw_a_t[0]) * (wr_a_t[0] * nP_a_t[0] + wrG_a_t[0] * nG_a_t[0]) + UB_a * (l_r_a_t[0] - n_a_t[0]) + TR_r_a_t[0]

	(1 + tauc_b_t[0]) * c_r_b_t[0] = (1 - tauw_b_t[0]) * (wr_b_t[0] * nP_b_t[0] + wrG_b_t[0] * nG_b_t[0]) + UB_b * (l_r_b_t[0] - n_b_t[0]) + TR_r_b_t[0]

	c_a_t[0] = c_r_a_t[0] * mu_a + c_o_a_t[0] * (1 - mu_a)

	c_b_t[0] = c_r_b_t[0] * mu_b + c_o_b_t[0] * (1 - mu_b)

	k_a_t[0] = (1 - mu_a) * k_o_a_t[0]

	k_b_t[0] = (1 - mu_b) * k_o_b_t[0]

	in_a_t[0] = (1 - mu_a) * in_o_a_t[0]

	in_b_t[0] = (1 - mu_b) * in_o_b_t[0]

	y_a_t[0] = inG_a_t[0] + cG_a_t[0] + c_aa_t[0] + in_aa_t[0] + pop_b / pop_a * (c_ba_t[0] + in_ba_t[0]) + pop_c / pop_a * exp(e_RoW_a_t[0]) * (n_ca * pr_ca_t[0] ^ (-eta_c) * c_c * y_c_t[0] + y_c_t[0] * n_ca * pr_ca_t[0] ^ (-eta_c) * in_c)

	y_b_t[0] = inG_b_t[0] + cG_b_t[0] + pop_a / pop_b * (c_ab_t[0] + in_ab_t[0]) + c_bb_t[0] + in_bb_t[0] + pop_c / pop_b * exp(e_RoW_b_t[0]) * (y_c_t[0] * c_c * n_cb * pr_cb_t[0] ^ (-eta_c) + y_c_t[0] * in_c * n_cb * pr_cb_t[0] ^ (-eta_c))

	log((1 + i_policy_t[0]) / (1 + i_policy_ts)) = rho_a_i * log((1 + i_policy_t[-1]) / (1 + i_policy_ts)) + (1 - rho_a_i) * phi_a_pi * (pop_a / (pop_b + pop_a) * log(pi_a_t[0] / pi_ts) + pop_b / (pop_b + pop_a) * log(pi_b_t[0] / pi_ts)) + (1 - rho_a_i) * phi_a_y * (pop_a / (pop_b + pop_a) * log(y_a_t[0] / y_a_ts) + pop_b / (pop_b + pop_a) * log(y_b_t[0] / y_b_ts)) + phi_a_dpi * (pop_a / (pop_b + pop_a) * log(pi_a_t[0] / pi_a_t[-1]) + pop_b / (pop_b + pop_a) * log(pi_b_t[0] / pi_b_t[-1])) + phi_a_dy * (pop_a / (pop_b + pop_a) * log(y_a_t[0] / y_a_t[-1]) + pop_b / (pop_b + pop_a) * log(y_b_t[0] / y_b_t[-1])) + nua_eM[x]

	log((1 + i_policy_t[0]) / (1 + i_policy_ts)) = pop_a / (pop_b + pop_a) * log((1 + i_a_t[0]) / (1 + i_a_ts)) + pop_b / (pop_b + pop_a) * log((1 + i_b_t[0]) / (1 + i_b_ts))

	y_c_t[0] = exp(z_g_t[0]) * y_c_aux_t[0]

	y_c_var_t[0] = log(y_c_aux_t[0] / y_c_ts)

	pi_c_var_t[0] = pi_c_t[0] - pi_ts

	i_c_var_t[0] = i_c_t[0] - i_c_ts

	y_c_var_t[0] = a11 * y_c_var_t[-1] + a12 * pi_c_var_t[-1] + a13 * i_c_var_t[-1] + c11 * eps_y_c[x]

	pi_c_var_t[0] = y_c_var_t[-1] * a21 + pi_c_var_t[-1] * a22 + i_c_var_t[-1] * a23 + a24 * z_g_t[-1] + eps_y_c[x] * c21 + c22 * eps_pi_c[x] + c24 * eps_z_g[x]

	i_c_var_t[0] = y_c_var_t[-1] * a31 + pi_c_var_t[-1] * a32 + i_c_var_t[-1] * a33 + z_g_t[-1] * a34 + eps_y_c[x] * c31 + eps_pi_c[x] * c32 + c33 * eps_i_c[x] + eps_z_g[x] * c34

	z_g_t[0] = z_g_t[-1] * a44 + eps_z_g[x] * c44

	pr_ac_t[0] = 1 / rer_ca_t[0]

	pr_bc_t[0] = rer_ba_t[0] / rer_ca_t[0]

	lambda_o_b_t[0] = lambda_o_b_t[1] * exp(e_rp_a_t[0]) * betta_b * (1 + i_ba_t[0]) / pi_b_t[1]

	lambda_o_a_t[0] = lambda_o_a_t[1] * betta_a * exp(e_rp_b_t[0]) * (1 + i_ac_t[0]) * Del_S_ac_t[1] / pi_a_t[1]

	lambda_o_b_t[0] = lambda_o_b_t[1] * betta_b * exp(e_rp_b_t[0]) * (1 + i_bc_t[0]) * Del_S_bc_t[1] / pi_b_t[1]

	rer_ac_t[0] * B_ac_t[0] + B_a_t[0] = rer_ac_t[0] * (1 + i_ac_t[-1]) * B_ac_t[-1] / pi_c_t[0] + (1 + i_ba_t[-1]) * B_a_t[-1] / pi_a_t[0] + pr_aa_t[0] * y_a_t[0] - c_a_t[0] - in_a_t[0] - cG_a_t[0] * pr_aa_t[0] - inG_a_t[0] * pr_aa_t[0]

	rer_bc_t[0] * B_bc_t[0] + rer_ba_t[0] * B_ba_t[0] = rer_bc_t[0] * (1 + i_bc_t[-1]) * B_bc_t[-1] / pi_c_t[0] + rer_ba_t[0] * (1 + i_ba_t[-1]) * B_ba_t[-1] / pi_a_t[0] + pr_bb_t[0] * y_b_t[0] - c_b_t[0] - in_b_t[0] - cG_b_t[0] * pr_bb_t[0] - inG_b_t[0] * pr_bb_t[0]

	B_c_t[0] = ( - (B_ac_t[0] * pop_a / pop_c + B_bc_t[0] * pop_b / pop_c))

	B_a_t[0] = B_ba_t[0] * ( - pop_b) / pop_a

	nfa_a_t[0] = rer_ac_t[0] * B_ac_t[0] - pop_b / pop_a * B_ba_t[0]

	nfa_b_t[0] = rer_bc_t[0] * B_bc_t[0] + rer_ba_t[0] * B_ba_t[0]

	nfa_c_t[0] = B_c_t[0]

	ca_a_t[0] = nfa_a_t[0] - nfa_a_t[-1]

	ca_b_t[0] = nfa_b_t[0] - nfa_b_t[-1]

	ca_c_t[0] = nfa_c_t[0] - nfa_c_t[-1]

	1 + i_bc_t[0] = (1 + i_c_t[0]) * (1 - phi * (exp(rer_bc_t[0] * B_bc_t[0] / (pr_bb_t[0] * y_b_t[0]) - B_bc_ts / y_b_ts) - 1))

	1 + i_ac_t[0] = (1 + i_c_t[0]) * (1 - phi * (exp(rer_ac_t[0] * B_ac_t[0] / (pr_aa_t[0] * y_a_t[0]) - B_ac_ts / y_a_ts) - 1))

	1 + i_ba_t[0] = (1 + i_a_t[0]) * (1 - phi * (exp(rer_ba_t[0] * B_ba_t[0] / (pr_bb_t[0] * y_b_t[0]) - B_ba_ts / y_b_ts) - 1))

	rer_bc_t[0] = rer_ba_t[0] / rer_ca_t[0]

	rer_ac_t[0] = 1 / rer_ca_t[0]

	1 = pi_b_t[0] * rer_ba_t[0] / rer_ba_t[-1] / pi_a_t[0]

	Del_S_bc_t[0] = pi_b_t[0] * rer_bc_t[0] / rer_bc_t[-1] / pi_c_t[0]

	Del_S_ac_t[0] = pi_a_t[0] * rer_ac_t[0] / rer_ac_t[-1] / pi_c_t[0]

	pi_ab_t[0] = pi_bb_t[0]

	pi_ba_t[0] = pi_aa_t[0]

	pi_ac_t[0] = pi_c_t[0] * Del_S_ac_t[0]

	pi_bc_t[0] = pi_c_t[0] * Del_S_bc_t[0]

	a_a_t[0] = rho_a_a * a_a_t[-1] + nua_a[x]

	a_b_t[0] = rho_a_b * a_b_t[-1] + nub_a[x]

	theta_a_t[0] / (theta_a_t[0] - 1) = rho_etheta_a * theta_a_t[-1] / (theta_a_t[-1] - 1) + (1 - rho_etheta_a) * theta_a / (theta_a - 1) + nua_etheta[x]

	theta_b_t[0] / (theta_b_t[0] - 1) = rho_etheta_b * theta_b_t[-1] / (theta_b_t[-1] - 1) + (1 - rho_etheta_b) * theta_b / (theta_b - 1) + nub_etheta[x]

	thetaw_a_t[0] / (thetaw_a_t[0] - 1) = rho_ethetaw_a * thetaw_a_t[-1] / (thetaw_a_t[-1] - 1) + (1 - rho_ethetaw_a) * thetaw_a / (thetaw_a - 1) + nua_ethetaw[x]

	thetaw_b_t[0] / (thetaw_b_t[0] - 1) = rho_ethetaw_b * thetaw_b_t[-1] / (thetaw_b_t[-1] - 1) + (1 - rho_ethetaw_b) * thetaw_b / (thetaw_b - 1) + nub_ethetaw[x]

	e_b_a_t[0] = rho_eb_a * e_b_a_t[-1] + nua_eb[x]

	e_b_b_t[0] = rho_eb_b * e_b_b_t[-1] + nub_eb[x]

	e_n_a_t[0] = rho_en_a * e_n_a_t[-1] + nua_en[x]

	e_n_b_t[0] = rho_en_b * e_n_b_t[-1] + nub_en[x]

	e_in_a_t[0] = rho_ein_a * e_in_a_t[-1] + nua_ein[x]

	e_in_b_t[0] = rho_ein_b * e_in_b_t[-1] + nub_ein[x]

	e_rp_a_t[0] = rho_erp_a * e_rp_a_t[-1] + nua_erp[x]

	e_rp_b_t[0] = rho_erp_b * e_rp_b_t[-1] + nub_erp[x]

	e_RoW_a_t[0] = rho_eRoW_a * e_RoW_a_t[-1] + nua_RoW[x]

	e_RoW_b_t[0] = rho_eRoW_b * e_RoW_b_t[-1] + nub_RoW[x]

	e_RoE_a_t[0] = rho_eRoE_a * e_RoE_a_t[-1] + nua_RoE[x]

	e_RoE_b_t[0] = rho_eRoE_b * e_RoE_b_t[-1] + nub_RoE[x]

	e_tau_a_t[0] = rho_etau_a * e_tau_a_t[-1] + log(BG_a_t[-1] / BG_a_ts) * xi_b_etau_a + nua_etau[x]

	e_tau_b_t[0] = rho_etau_b * e_tau_b_t[-1] + log(BG_b_t[-1] / BG_b_ts) * xi_b_etau_b + nub_etau[x]

	ex_a_t[0] = y_a_t[0] - (inG_a_t[0] + in_aa_t[0] + cG_a_t[0] + c_aa_t[0])

	ex_b_t[0] = y_b_t[0] - (inG_b_t[0] + in_bb_t[0] + cG_b_t[0] + c_bb_t[0])

	im_a_t[0] = c_a_t[0] + in_a_t[0] - pr_aa_t[0] * (c_aa_t[0] + in_aa_t[0])

	im_b_t[0] = c_b_t[0] + in_b_t[0] - pr_bb_t[0] * (c_bb_t[0] + in_bb_t[0])

	GDP_a_t[0] = y_a_t[0] + nG_a_t[0] * wrG_a_t[0] * (1 + tausc_a_t[0]) / pr_aa_t[0]

	GDP_b_t[0] = y_b_t[0] + nG_b_t[0] * wrG_b_t[0] * (1 + tausc_b_t[0]) / pr_bb_t[0]

	y_a_obs[0] = log(y_a_t[0]) - log(y_a_ts)

	y_b_obs[0] = log(y_b_t[0]) - log(y_b_ts)

	y_c_obs[0] = log(y_c_t[0]) - log(y_c_ts)

	dgdp_a_t[0] = y_a_t[0] * y_a_ts / GDP_a_ts / y_a_ts + nG_a_t[0] * (1 - y_a_ts / GDP_a_ts) / nG_a_ts - 1

	dgdp_b_t[0] = y_b_t[0] * y_b_ts / GDP_b_ts / y_b_ts + nG_b_t[0] * (1 - y_b_ts / GDP_b_ts) / nG_b_ts - 1

	BG_a_obs[0] = log(BG_a_t[0]) - log(BG_a_ts)

	BG_b_obs[0] = log(BG_b_t[0]) - log(BG_b_ts)

	c_a_obs[0] = log(c_a_t[0] / pr_aa_t[0]) - log(c_a_ts)

	c_b_obs[0] = log(c_b_t[0] / pr_bb_t[0]) - log(c_b_ts)

	in_a_obs[0] = log(in_a_t[0] / pr_aa_t[0]) - log(in_a_ts)

	in_b_obs[0] = log(in_b_t[0] / pr_bb_t[0]) - log(in_b_ts)

	n_a_obs[0] = n_a_t[0] - n_a_ts

	n_b_obs[0] = n_b_t[0] - n_b_ts

	wr_a_obs[0] = log(wr_a_t[0] / pr_aa_t[0]) - log(wr_a_ts)

	wr_b_obs[0] = log(wr_b_t[0] / pr_bb_t[0]) - log(wr_b_ts)

	pi_a_obs[0] = pi_aa_t[0] - pi_ts

	pi_b_obs[0] = pi_bb_t[0] - pi_ts

	pi_c_obs[0] = pi_c_t[0] - pi_ts

	rer_ba_obs[0] = rer_ba_t[0] - 1

	ca_a_obs[0] = ca_a_t[0] / pr_aa_t[0] / y_a_t[0]

	ca_b_obs[0] = ca_b_t[0] / pr_bb_t[0] / y_b_t[0]

	ca_c_obs[0] = ca_c_t[0] / y_c_t[0]

	i_EMU_obs[0] = i_policy_t[0] - i_policy_ts

	i_c_obs[0] = i_c_t[0] - i_c_ts

	l_a_obs[0] = l_a_t[0] - l_a_ts

	l_b_obs[0] = l_b_t[0] - l_b_ts

	ur_a_obs[0] = ur_a_t[0] - ur_a_ts

	ur_b_obs[0] = ur_b_t[0] - ur_b_ts

	ur_a_dif[0] = ur_a_t[0] - ur_a_t[-1]

	ur_b_dif[0] = ur_b_t[0] - ur_b_t[-1]

	def_a_obs[0] = ( - (BG_a_t[0] - BG_a_t[-1])) / (pr_aa_t[0] * GDP_a_t[0])

	def_b_obs[0] = ( - (BG_b_t[0] - BG_b_t[-1])) / (pr_bb_t[0] * GDP_b_t[0])

	AUX_EXO_LAG_211_0[0] = nua_ecG[x]

	AUX_EXO_LAG_212_0[0] = nub_ecG[x]

	AUX_EXO_LAG_221_0[0] = nua_einG[x]

	AUX_EXO_LAG_222_0[0] = nub_einG[x]

	AUX_EXO_LAG_225_0[0] = nua_eTR[x]

	AUX_EXO_LAG_226_0[0] = nub_eTR[x]

	AUX_EXO_LAG_227_0[0] = nua_eT[x]

	AUX_EXO_LAG_228_0[0] = nub_eT[x]

	AUX_EXO_LAG_215_0[0] = nua_etauw[x]

	AUX_EXO_LAG_216_0[0] = nub_etauw[x]

	AUX_EXO_LAG_217_0[0] = nua_etausc[x]

	AUX_EXO_LAG_218_0[0] = nub_etausc[x]

	AUX_EXO_LAG_219_0[0] = nua_etauc[x]

	AUX_EXO_LAG_220_0[0] = nub_etauc[x]

	AUX_EXO_LAG_223_0[0] = nua_enG[x]

	AUX_EXO_LAG_224_0[0] = nub_enG[x]

	AUX_EXO_LAG_229_0[0] = nua_emg[x]

	AUX_EXO_LAG_230_0[0] = nub_emg[x]

end


@parameters GEAR_baseline begin
	mu_a = 0.282477238710735000

	mu_bar_a = 0.476287322349070000

	hab_a = 0.494308239882487000

	eta_a = 0.978798953069214000

	upsilon_a = 4.950940456396190000

	upsilon_p_a = 69.810486611992200000

	upsilon_w_a = 61.801387405490500000

	xip_a = 0.351187547191756000

	xiw_a = 0.507403517488228000

	eta_kG_a = 0.083932208714118000

	eta_nG_a = 0.074302798757985500

	rho_etauw_a = 0.825931576173091000

	rho_etauc_a = 0.920601158040990000

	rho_etausc_a = 0.924865521659026000

	rho_eg_a = 0.822356083643030000

	rho_einG_a = 0.783423484437927000

	rho_enG_a = 0.951019923133490000

	rho_eTR_a = 0.843619277379409000

	rho_eT_a = 0.533263481090525000

	rho_emg_a = 0.896839087171709000

	xi_b_etauw_a = (-0.004672888129226880)

	xi_b_etausc_a = (-0.007226040751017210)

	xi_b_eg_a = 0.096938170950780100

	xi_b_ein_a = 0.219379534265127000

	xi_b_eTR_a = 0.165530467096634000

	xi_b_eT_a = 0.163396391108427000

	xi_y_etauw_a = 0.073188801245085200

	xi_y_etausc_a = (-0.005810721894570920)

	xi_y_eg_a = 0.166475842825658000

	xi_y_ein_a = 0.199132812845768000

	xi_y_eTR_a = 0.197202888715513000

	xi_y_eT_a = 0.188279768710148000

	psi_cG_a = 0.776597272114415000

	psi_inG_a = 0.785480757328960000

	psi_TR_a = 0.725262270856316000

	psi_T_a = 0.802347279850517000

	psi_tauw_a = 0.605289321142294000

	psi_tausc_a = 0.681118557613049000

	psi_tauc_a = 0.561299099089667000

	psi_nG_a = 0.518745682043223000

	psi_mg_a = 0.748727862656477000

	rho_a_i = 0.840454065296516000

	phi_a_pi = 1.796006986201710000

	phi_a_y = 0.054033948356913700

	rho_a_a = 0.899238331477406000

	rho_ein_a = 0.757438246499296000

	rho_eb_a = 0.564543968129862000

	rho_en_a = 0.970835725680206000

	rho_erp_a = 0.771845035216218000

	rho_erp_b = 0.529155487135554000

	rho_etheta_a = 0.557694014418680000

	rho_ethetaw_a = 0.709153568277062000

	rho_eRoE_a = 0.936606103891553000

	rho_eRoW_a = 0.861180514202767000

	mu_b = 0.208628385317963000

	mu_bar_b = 0.356282857869388000

	hab_b = 0.748045037838636000

	eta_b = 0.893052672859960000

	upsilon_b = 4.929755999302440000

	upsilon_p_b = 67.315854957548200000

	upsilon_w_b = 79.885363045336300000

	xip_b = 0.447240087236102000

	xiw_b = 0.300897704295267000

	eta_kG_b = 0.069941117409300700

	eta_nG_b = 0.091619392655143900

	rho_etauw_b = 0.842012112212371000

	rho_etauc_b = 0.928804467566795000

	rho_etausc_b = 0.869254031381510000

	rho_eg_b = 0.919707454883866000

	rho_einG_b = 0.856730081685878000

	rho_enG_b = 0.982751143611852000

	rho_eTR_b = 0.940556719212743000

	rho_eT_b = 0.808108784868906000

	rho_emg_b = 0.881236728633140000

	xi_b_etauw_b = 0.021701933365160200

	xi_b_etausc_b = 0.006961683797481780

	xi_b_eg_b = 0.160924182266452000

	xi_b_ein_b = 0.196902075163885000

	xi_b_eTR_b = 0.127793318575280000

	xi_b_eT_b = 0.093881033640800000

	xi_y_etauw_b = 0.035944107701462800

	xi_y_etausc_b = 0.016376414288795700

	xi_y_eg_b = 0.184944995830773000

	xi_y_ein_b = 0.188800575641822000

	xi_y_eTR_b = 0.219552713235174000

	xi_y_eT_b = 0.193910514397887000

	psi_cG_b = 0.822519302825855000

	psi_inG_b = 0.764103197722301000

	psi_TR_b = 0.744004703867267000

	psi_T_b = 0.297703971950222000

	psi_tauw_b = 0.737950304365973000

	psi_tausc_b = 0.737798429223208000

	psi_tauc_b = 0.664352046313142000

	psi_nG_b = 0.655850748243596000

	psi_mg_b = 0.829545941189254000

	rho_a_b = 0.915134443546581000

	rho_ein_b = 0.720515979553970000

	rho_eb_b = 0.815139919204029000

	rho_en_b = 0.970682594671610000

	rho_etheta_b = 0.582024312094825000

	rho_ethetaw_b = 0.511860144017268000

	rho_eRoE_b = 0.929338466342018000

	rho_eRoW_b = 0.864026540437001000

	eta_c = 0.477981757337902000

	a11 = 0.776167606195531000

	a12 = 0.207902765062088000

	a13 = 0.348053579664149000

	a21 = (-0.053895843117779000)

	a22 = 0.514680362717915000

	a23 = 0.532748186569371000

	a24 = (-0.134100575515807000)

	c21 = 0.466675489839798000

	c24 = 0.228228380609716000

	a31 = 0.024470606672294800

	a32 = (-0.002658659969743450)

	a33 = 0.925786973418931000

	a34 = (-0.109029422496454000)

	c31 = 0.071931190596677100

	c32 = 0.001956462802951850

	c34 = (-0.108015662733109000)

	a44 = 0.791628592989840000

	c11 = 1

	c22 = 1

	c33 = 1

	c44 = 1

	xi_y_emg_a = 0

	xi_y_emg_b = 0

	phi_a_dpi = 0

	phi_a_dy = 0

	tau_a = 0

	tau_b = 0

	tauw_a = 0.3039

	tauw_b = 0.2765

	tausc_a = 0.1667

	tausc_b = 0.2459

	tauk_a = 0.2143

	tauk_b = 0.3158

	tauc_a = 0.1831

	tauc_b = 0.1960

	i_a_ts = 0.00625

	i_b_ts = 0.00625

	pi_ts = 1.00475

	delta_a = 0.015

	delta_b = 0.015

	sigma_a = 1

	sigma_b = 1

	alpha_G_a = 1

	alpha_G_b = 1

	psi_a = 10

	psi_b = 9

	psi_l_a = 0

	psi_l_b = 0

	rho_a = 0.33

	rho_b = 0.33

	theta_a = 4

	theta_b = 4

	upsilon_n_a = 0

	upsilon_n_b = 0

	rrs_a = 0.3511

	rrs_b = 0.3511

	l_a_ts = 0.4717

	l_b_ts = 0.4013

	ur_a_ts = 0.0818

	ur_b_ts = 0.0946

	gn_a = 0.1278

	gn_b = 0.1848

	mg_a = 0.03

	mg_b = 0.03

	gc_a = 0.1112

	gc_b = 0.1006

	gc_c = 0.1059

	gTR_a = 0.1900

	gTR_b = 0.1825

	gin_a = 0.0165

	gin_b = 0.0277

	gin_c = 0.0221

	c_c = 0.6

	in_c = 0.2

	yG_a_ts = 1

	yG_b_ts = 1

	B_ba_ts = 0

	phi = 0.01

	gamma_a = 0.003163327

	gamma_b = 0.001341793

	pop_a = 1

	pop_b = 2.6

	pop_c = 56

	GDP_a_ts = 1

	GDP_b_ts = 0.871*GDP_a_ts

	rho_UB_a = 0

	rho_UB_b = 0

	nu_etauw_a = 0

	nu_etauw_b = 0

	nu_eg_a = 0

	nu_eg_b = 0

	nu_eT_r_a = 0

	nu_eT_r_b = 0

	nu_ein_a = 0

	nu_ein_b = 0

	xi_b_emg_a = 0

	xi_b_emg_b = 0

	rho_etau_a = 0

	rho_etau_b = 0

	xi_b_etau_a = 0

	xi_b_etau_b = 0

	rho_etauk_a = 0

	rho_etauk_b = 0

	xi_b_etauk_a = 0

	xi_b_etauk_b = 0

	xi_y_etauk_a = 0

	xi_y_etauk_b = 0

	xi_b_etauc_a = 0

	xi_b_etauc_b = 0

	xi_y_etauc_a = 0

	xi_y_etauc_b = 0

	xi_b_enG_a = 0

	xi_b_enG_b = 0

	xi_y_enG_a = 0

	xi_y_enG_b = 0

	psi_tauk_a = 0

	psi_tauk_b = 0

	pr_ts = 1

	betta_a = pi_ts/(1+i_a_ts)

	betta_b = pi_ts/(1+i_b_ts)

	i_c_ts = i_a_ts

	i_Ga_ts = i_a_ts

	i_Gb_ts = i_b_ts

	i_policy_ts = i_a_ts

	Rk_a_ts = i_a_ts

	Rk_b_ts = i_b_ts

	q_a_ts = 1

	q_b_ts = 1

	rk_a_ts = ((1+Rk_a_ts)/pi_ts-tauk_a*delta_a-(1-delta_a))/(1-tauk_a)

	rk_b_ts = ((1+Rk_b_ts)/pi_ts-tauk_b*delta_b-(1-delta_b))/(1-tauk_b)

	mcr_a_ts = (1-tau_a)*(theta_a-1)/theta_a

	mcr_b_ts = (1-tau_b)*(theta_b-1)/theta_b

	in_a_ts = GDP_a_ts*0.172

	in_b_ts = 0.193*GDP_b_ts

	k_a_ts = in_a_ts/delta_a

	k_b_ts = in_b_ts/delta_b

	l_o_a_ts = l_a_ts

	l_o_b_ts = l_b_ts

	l_r_a_ts = l_a_ts

	l_r_b_ts = l_b_ts

	n_a_ts = l_a_ts*(1-ur_a_ts)

	n_b_ts = l_b_ts*(1-ur_b_ts)

	nG_a_ts = n_a_ts*gn_a

	nG_b_ts = n_b_ts*gn_b

	nP_a_ts = n_a_ts-nG_a_ts

	nP_b_ts = n_b_ts-nG_b_ts

	n_k_a = nP_a_ts/k_a_ts

	n_k_b = nP_b_ts/k_b_ts

	wr_a_ts = rk_a_ts*n_k_a^(-1)*(1-rho_a)/(rho_a*(1+tausc_a))

	wr_b_ts = rk_b_ts*n_k_b^(-1)*(1-rho_b)/(rho_b*(1+tausc_b))

	wrG_a_ts = wr_a_ts*(1+mg_a)

	wrG_b_ts = wr_b_ts*(1+mg_b)

	y_a_ts = GDP_a_ts-nG_a_ts*(1+tausc_a)*wrG_a_ts

	y_b_ts = GDP_b_ts-nG_b_ts*(1+tausc_b)*wrG_b_ts

	A_a = (1+tausc_a)*wr_a_ts*n_k_a^rho_a/((1-rho_a)*mcr_a_ts)

	A_b = (1+tausc_b)*wr_b_ts*n_k_b^rho_b/((1-rho_b)*mcr_b_ts)

	k_o_a_ts = k_a_ts/(1-mu_a)

	k_o_b_ts = k_b_ts/(1-mu_b)

	in_o_a_ts = in_a_ts/(1-mu_a)

	in_o_b_ts = in_b_ts/(1-mu_b)

	FC_a = A_a*k_a_ts^rho_a*nP_a_ts^(1-rho_a)-y_a_ts

	FC_b = A_b*k_b_ts^rho_b*nP_b_ts^(1-rho_b)-y_b_ts

	BG_a_ts = GDP_a_ts*2.4

	BG_b_ts = GDP_b_ts*2.4

	cG_a_ts = GDP_a_ts*gc_a

	cG_b_ts = GDP_b_ts*gc_b

	inG_a_ts = GDP_a_ts*gin_a

	inG_b_ts = GDP_b_ts*gin_b

	kG_a_ts = inG_a_ts/delta_a

	kG_b_ts = inG_b_ts/delta_b

	z_a = yG_a_ts/(kG_a_ts^eta_kG_a*nG_a_ts^eta_nG_a)

	z_b = yG_b_ts/(kG_b_ts^eta_kG_b*nG_b_ts^eta_nG_b)

	UB_a = wr_a_ts*rrs_a*(1-tauw_a)

	UB_b = wr_b_ts*rrs_b*(1-tauw_b)

	c_a_ts = y_a_ts-in_a_ts-cG_a_ts-inG_a_ts

	c_b_ts = y_b_ts-in_b_ts-cG_b_ts-inG_b_ts

	y_c_ts = (y_a_ts+y_b_ts)/2

	cG_c_ts = gc_c*y_c_ts

	in_c_ts = in_c*y_c_ts

	c_c_ts = c_c*y_c_ts

	n_ab = GDP_a_ts*0.130/(in_a_ts+c_a_ts)

	n_ac = GDP_a_ts*0.229/(in_a_ts+c_a_ts)

	n_ba = GDP_b_ts*0.066/(in_b_ts+c_b_ts)

	n_bc = n_ac

	n_ca = ((in_a_ts+c_a_ts)*n_ab+(in_a_ts+c_a_ts)*n_ac-(in_b_ts+c_b_ts)*pop_b/pop_a*n_ba)/(pop_c/pop_a*(c_c_ts+in_c_ts))

	n_cb = ((in_b_ts+c_b_ts)*n_ba+(in_b_ts+c_b_ts)*n_bc-(in_a_ts+c_a_ts)*n_ab*pop_a/pop_b)/((c_c_ts+in_c_ts)*pop_c/pop_b)

	n_aa = 1-n_ab-n_ac

	n_bb = 1-n_ba-n_bc

	n_cc = 1-n_ca-n_cb

	vtheta_ab    = n_ab/pop_b*(pop_a + pop_b + pop_c)

	vtheta_ac    = n_ac/pop_c*(pop_a + pop_b + pop_c)

	vtheta_ba   = n_ba/pop_a*(pop_a + pop_b + pop_c)

	vtheta_bc  = n_bc/(pop_c)*(pop_a + pop_b + pop_c)

	nfa_a_ts = 0

	nfa_b_ts = 0

	nfa_c_ts = 0

	B_c_ts = 0

	B_a_ts = 0

	B_ac_ts = 0

	B_bc_ts = 0

	c_r_a_ts = c_a_ts

	c_r_b_ts = c_b_ts

	c_o_a_ts = c_a_ts

	c_o_b_ts = c_b_ts

	c_tild_a_ts = c_o_a_ts

	c_tild_b_ts = c_o_b_ts

	lambda_o_a_ts = (c_tild_a_ts-c_tild_a_ts*hab_a)^(-sigma_a)/(1+tauc_a)

	lambda_o_b_ts = (c_tild_b_ts-c_tild_b_ts*hab_b)^(-sigma_b)/(1+tauc_b)

	kappaw_a_ts = lambda_o_a_ts*(nP_a_ts*wr_a_ts*(1-tauw_a)+nG_a_ts*wrG_a_ts*(1-tauw_a)+UB_a*(l_o_a_ts-n_a_ts))/(n_a_ts*l_o_a_ts^psi_a)

	omega_o_a_ts = UB_a*(1-mu_a)*lambda_o_a_ts/(lambda_o_a_ts*UB_a-n_a_ts*psi_a*l_o_a_ts^(psi_a-1)*kappaw_a_ts)

	omega_r_a_ts = UB_a*mu_a*lambda_o_a_ts/(lambda_o_a_ts*UB_a-kappaw_a_ts*n_a_ts*psi_a*l_r_a_ts^(psi_a-1))

	thetaw_a = (1-tauw_a)*wr_a_ts*lambda_o_a_ts*(nP_a_ts-nP_a_ts*(omega_o_a_ts+omega_r_a_ts))/((1-tauw_a)*wr_a_ts*nP_a_ts*lambda_o_a_ts-nP_a_ts*kappaw_a_ts*n_a_ts^psi_a-nP_a_ts*lambda_o_a_ts*UB_a-(omega_o_a_ts+omega_r_a_ts)*(nP_a_ts*(1-tauw_a)*wr_a_ts*lambda_o_a_ts-lambda_o_a_ts*nP_a_ts*UB_a-l_o_a_ts^psi_a*nP_a_ts*kappaw_a_ts))

	kappaw_b_ts = lambda_o_b_ts*(nP_b_ts*wr_b_ts*(1-tauw_b)+nG_b_ts*wrG_b_ts*(1-tauw_b)+UB_b*(l_o_b_ts-n_b_ts))/(n_b_ts*l_o_b_ts^psi_b)

	omega_o_b_ts = UB_b*(1-mu_b)*lambda_o_b_ts/(lambda_o_b_ts*UB_b-n_b_ts*psi_b*l_o_b_ts^(psi_b-1)*kappaw_b_ts)

	omega_r_b_ts = UB_b*mu_b*lambda_o_b_ts/(lambda_o_b_ts*UB_b-kappaw_b_ts*n_b_ts*psi_b*l_r_b_ts^(psi_b-1))

	thetaw_b = (1-tauw_b)*wr_b_ts*lambda_o_b_ts*(nP_b_ts-nP_b_ts*(omega_o_b_ts+omega_r_b_ts))/((1-tauw_b)*wr_b_ts*nP_b_ts*lambda_o_b_ts-nP_b_ts*kappaw_b_ts*n_b_ts^psi_b-nP_b_ts*lambda_o_b_ts*UB_b-(omega_o_b_ts+omega_r_b_ts)*(nP_b_ts*(1-tauw_b)*wr_b_ts*lambda_o_b_ts-lambda_o_b_ts*nP_b_ts*UB_b-l_o_b_ts^psi_b*nP_b_ts*kappaw_b_ts))

	ex_a_ts = (in_b_ts+c_b_ts)*pop_b/pop_a*n_ba+pop_c/pop_a*n_ca*(y_c_ts*c_c+y_c_ts*in_c)

	im_a_ts = pr_ts*(c_a_ts*n_ab+in_a_ts*n_ab)+pr_ts*(c_a_ts*n_ac+in_a_ts*n_ac)

	ex_b_ts = (in_a_ts+c_a_ts)*n_ab*pop_a/pop_b+(y_c_ts*c_c+y_c_ts*in_c)*pop_c/pop_b*n_cb

	im_b_ts = pr_ts*(c_b_ts*n_ba+in_b_ts*n_ba)+pr_ts*(c_b_ts*n_bc+in_b_ts*n_bc)

	TR_r_a_ts = (1+tauc_a)*c_r_a_ts-(1-tauw_a)*(wr_a_ts*nP_a_ts+nG_a_ts*wrG_a_ts)-UB_a*(l_r_a_ts-n_a_ts)

	TR_a_ts = y_a_ts*gTR_a-UB_a*(l_a_ts-n_a_ts)

	TR_o_a_ts = (TR_a_ts-mu_a*TR_r_a_ts)/(1-mu_a)

	T_a_ts = (TR_a_ts+UB_a*(l_a_ts-n_a_ts)+nG_a_ts*(1+tausc_a)*wrG_a_ts+inG_a_ts+cG_a_ts-(wr_a_ts*nP_a_ts+nG_a_ts*wrG_a_ts)*(tausc_a+tauw_a)-k_a_ts*tauk_a*(rk_a_ts-delta_a)-tau_a*y_a_ts-c_a_ts*tauc_a+(1+i_Ga_ts)*BG_a_ts/pi_ts-BG_a_ts)/(1-mu_a)

	TR_r_b_ts = (1+tauc_b)*c_r_b_ts-(1-tauw_b)*(wr_b_ts*nP_b_ts+nG_b_ts*wrG_b_ts)-UB_b*(l_r_b_ts-n_b_ts)

	TR_b_ts = y_b_ts*gTR_b-UB_b*(l_b_ts-n_b_ts)

	TR_o_b_ts = (TR_b_ts-mu_b*TR_r_b_ts)/(1-mu_b)

	T_b_ts = (TR_b_ts+UB_b*(l_b_ts-n_b_ts)+nG_b_ts*(1+tausc_b)*wrG_b_ts+inG_b_ts+cG_b_ts-(wr_b_ts*nP_b_ts+nG_b_ts*wrG_b_ts)*(tausc_b+tauw_b)-k_b_ts*tauk_b*(rk_b_ts-delta_b)-tau_b*y_b_ts-c_b_ts*tauc_b+(1+i_Gb_ts)*BG_b_ts/pi_ts-BG_b_ts)/(1-mu_b)

end

