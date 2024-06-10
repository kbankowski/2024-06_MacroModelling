function ds = dynamic_set_auxiliary_series(ds, params)
%
% Computes auxiliary variables of the dynamic model
%
ds.AUX_EXO_LAG_211_0=ds.nua_ecG;
ds.AUX_EXO_LAG_212_0=ds.nub_ecG;
ds.AUX_EXO_LAG_221_0=ds.nua_einG;
ds.AUX_EXO_LAG_222_0=ds.nub_einG;
ds.AUX_EXO_LAG_225_0=ds.nua_eTR;
ds.AUX_EXO_LAG_226_0=ds.nub_eTR;
ds.AUX_EXO_LAG_227_0=ds.nua_eT;
ds.AUX_EXO_LAG_228_0=ds.nub_eT;
ds.AUX_EXO_LAG_215_0=ds.nua_etauw;
ds.AUX_EXO_LAG_216_0=ds.nub_etauw;
ds.AUX_EXO_LAG_217_0=ds.nua_etausc;
ds.AUX_EXO_LAG_218_0=ds.nub_etausc;
ds.AUX_EXO_LAG_219_0=ds.nua_etauc;
ds.AUX_EXO_LAG_220_0=ds.nub_etauc;
ds.AUX_EXO_LAG_223_0=ds.nua_enG;
ds.AUX_EXO_LAG_224_0=ds.nub_enG;
ds.AUX_EXO_LAG_229_0=ds.nua_emg;
ds.AUX_EXO_LAG_230_0=ds.nub_emg;
end
