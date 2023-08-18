using SparseArrays, LinearMaps, IterativeSolvers, LinearAlgebra, ForwardDiff, Zygote

A = sparse([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18], [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0], 18, 18)

B = sparse([1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 17, 18, 1, 2, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 17, 18, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 17, 18, 1, 2, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 17, 18, 1, 2, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 17, 18, 1, 2, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 17, 18, 1, 2, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 17, 18], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17], [1.9105128802627558, 0.9136289125526084, 1.014095336423411, 1.409571304402255, -1.9369534683778251, 0.08756642215140704, 1.4095713044024158, 1.907596429400461, 0.7264906184729739, 2.913647938673469, 1.4095713044024158, 1.923495407555922, 0.7203416184879494, 0.35427513675760103, 0.9766944702956436, -0.939775749579313, 0.05812718092628177, -1.4548733553311646, 0.9527817982544415, -0.058931633419138124, -1.4548733553313307, -0.938341155851346, -0.7498392173658792, -1.9608661404190224, -1.4548733553313307, -0.9461618171344768, -0.7434925953736434, -0.3656611448567409, -1.0080843421645809, 0.9574859808445675, -0.027858360088902277, 1.0002523208127987, -0.04468365049289784, -0.9707371306834436, 1.0282439065211098, -0.04468365049290272, 0.9560243519577287, -0.02302987637505952, 0.939775749579319, -0.04468365049290272, 0.9639923949114692, -0.02283495202795231, -0.011230582191734628, -0.03096138110412458, -0.9269472413467594, 0.05733370969723406, -1.4350134527697904, 0.9397757495793124, -0.05812718092628155, -1.4350134527699538, -0.925532230692157, -0.7396034578483822, -1.9340991298459562, -1.4350134527699538, -0.9332461352115602, -0.7333434710906828, -0.3606696487373535, -0.9943233802666438, -0.9182538239572752, 0.056796002860584505, -1.421555113019701, 0.9309620194346079, -0.057582032483170516, -1.4215551130198623, -0.9168520840452585, -0.7326670527597382, -1.9159600920901925, -1.4215551130198623, -0.9244936433558963, -0.7264657755761222, -0.35728709182760193, -0.9849980726555846, -0.9332461352115986, 0.05772331002846293, -1.4447648140451963, 0.946161817134516, -0.058522173140493225, -1.444764814045361, -0.9318215091209353, -0.7446292926265152, -1.9472419330170165, -1.444764814045361, -0.9395878320129103, -0.7383267673181592, -0.36312051081054414, -1.0010801158825005, 0.047924103329497994, -0.0029642103727517506, 0.07419163672124508, -0.048587350089051365, 0.003005233632192716, 0.07419163672125352, 0.04785094585753116, 0.03823824156947933, 0.09999486746792695, 0.07419163672125352, 0.048249762468414704, 0.0379145939670749, 0.01864698306754725, 0.051407517378875583], 18, 18)

C = sparse([1, 2, 3, 7, 8, 10, 1, 2, 3, 4, 5, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 11, 12, 13, 14, 15, 21, 28, 1, 2, 3, 7, 8, 10, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 14, 1, 2, 3, 7, 8, 10, 1, 2, 3, 4, 5, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 1, 2, 3, 4, 5, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], [3, 3, 3, 3, 3, 3, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 12, 12, 12, 13, 13, 13, 13, 15, 15, 15, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 18, 18, 18, 20, 20, 20, 21, 21, 21, 21, 21, 21, 23, 23, 23, 23, 23, 23, 23, 23, 23, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 26, 26, 26, 26, 27, 27, 27, 27, 27, 27, 27, 27, 27, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28], [0.0008787445147661617, -0.05722280818931371, 0.9315704741389867, -0.0008070300140296685, 0.026276422168124567, 0.00018529203670706283, -0.0042709727464168455, 0.138597836881153, 0.015059426875340263, -0.003824027650295395, 0.12450808913539275, 0.001978755337388139, -0.00035891288663220827, 0.0017559740268131068, -8.05721665843297e-6, 0.02075826123988897, 0.004495997578339544, 0.00024344517576443167, 0.03717193701129889, 0.004025504276433408, 0.01664100000000003, -0.0001705619476941929, -1.8470865525008416e-5, -0.00015271312714838214, 3.503590409746693e-7, -0.02964362519608831, 0.9651789855456794, 0.013612201758241127, 0.14407727523759245, 0.015602729753617848, 0.12900000000000011, -0.0005919113455363644, 1.0, 1.0, 1.0, -0.0005913069328857652, 0.038505211279227985, -0.6268535058527802, 0.0005430502658325363, -0.017681396968469494, -0.00012468295855316852, 0.0028739363406376137, -0.0932624448331327, -0.010133484041200088, 0.0025731871131716134, -0.08378145760114214, -0.0013315039011011212, 0.00024151237885580655, -0.001181594420874719, 5.421698787117949e-6, 0.01994718692381094, -0.6494686635747446, -0.009159646673447425, 0.00039789026617345413, -0.025910145666966224, 0.42180954496556483, -0.0003654183687026377, 0.011897806967641509, 8.389912718239648e-5, -0.0002934645763631136, 0.009523253342998918, 0.001034754513933726, -0.0002627543468490321, 0.008555126853139791, 0.00013596307709995163, -2.4661411926670085e-5, 0.00012065545824792916, -5.53622749131123e-7, 0.001426329481008657, 0.0003089263507391589, 1.672746224692852e-5, 0.0025541363514363456, 0.00027659809070954455, 0.001143426639600001, -1.1719552592735168e-5, -1.2691592871687091e-6, -1.0493134895629802e-5, 2.407366509678348e-8, 0.009899753300140847, 0.0010720856229051764, 0.008863772399999999, -4.067106548695898e-5, 0.0001974722295775237, -0.006408194453243724, -0.0006962860167459225, 0.0001768073249129163, -0.005756742414858706, -9.14895157292442e-5, 1.6594657038481958e-5, -8.11890233778551e-5, 3.725325896931862e-7, 9.800511540364959e-5, 2.1226766366778153e-5, 1.14936758283998e-6, 0.0001754983201371947, 1.900544590948742e-5, 7.856646115900174e-5, -8.052670295495334e-7, -8.720572915360728e-8, -7.20998135483799e-7, 1.6541355678445058e-9], 28, 28)

X = sparse([10, 14, 10, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 17, 18, 10, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 17, 18, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 16, 17, 18, 11, 11, 11, 15, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 17, 18, 10, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 17, 18, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 17, 18, 11, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 17, 18, 10, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 17, 18, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 16, 17, 18, 11, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 17, 18, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 16, 17, 18], [1, 1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 8, 9, 10, 10, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 16, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 19, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 22, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 25, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28], [-2.0105168181245245, -1.013636796251473, -0.029799503503457725, -0.00012352263478100954, -9.204432989257199e-5, 0.0016715843917784825, -0.00010790171952745518, -0.0016686876750801366, 9.331817956935708e-5, -0.00010790171952744275, -0.00012333407405554073, 0.0010683881931992999, 0.003105029472060587, -0.00010790171952744275, 0.0007663657652939376, 0.0011601351169416767, 2.665509641856634e-5, 0.00143634179698045, 1.1431087100084922, 0.003313379057894727, 5.6914863992411575e-5, -0.0005761020907293277, 0.0015388521973749335, 0.0014836006524960065, -5.770253859643791e-5, 0.0015388521973748596, 0.03290077598259579, -0.00032458263396999967, -0.0019199697613206195, 0.0015388521973748596, -0.0009933206357925087, -0.0003262181027885094, -0.00016334460148066234, -0.0004363691088246131, 0.12145388673961285, 0.01576266926083038, 0.014652708391997268, 0.3048576040066444, -0.014733126659252518, -0.0013909307349277609, -0.016103917974673643, -0.16638865912358097, -0.0003580919330802691, 0.014251707626434013, 0.09623261471878765, 1.1429206609384857, -0.0003548704730927353, 0.11233653269346129, -0.0001746763234568409, -0.0004814190328185048, 0.007467572323732598, -0.00032471901757954964, -1.0971880165104908, -0.5439507211118595, -0.0007282508243985531, 7.617689062094107e-5, 0.0009928774332597663, -0.0026431260660846763, 0.0007383294688773768, -7.72311424972841e-5, -0.002643126066084977, -0.0007271391293313663, -0.0013622626144948232, -0.002569756233154411, -0.002643126066084977, -0.0007331995145129709, -0.0013507324548711038, -0.0006643110891980146, -0.0018314267642770342, -0.01534280872672004, -0.0009677185239284641, -0.000952309060468357, -0.0011248086595741522, -0.0005319266019413104, 0.002188239410979252, 0.0009654885641954522, -0.0005319266019413875, -0.002015474012751403, -0.0007189181099129261, 0.032125256414118376, -0.0005319266019413875, -0.0015736649363493939, -0.0004247675721317762, -0.00016987689729204797, -0.00048397504462698954, -0.0022295718212625337, -3.8297995717127324e-5, 0.00038765893223117895, -0.001035493203888091, -0.0009983144551271447, 3.8828021733099405e-5, -0.0010354932038880386, 0.018109636466518118, 0.0002340190110060633, 0.0012919471037631735, -0.0010354932038880386, 0.0006684051719844921, 0.0002195120681498764, 0.00010991453566077498, 0.00029363264863602884, 0.02134295614185412, 0.0006511775182268495, 0.0006408084946677825, 0.0007568834256144834, 0.00035793325844879985, -0.0014724656743606776, -0.0006496769789597146, 0.0003579332584488518, -0.0012673584943203523, -0.001256631601, 0.0008159955978643136, -0.0005420782078937098, -0.021617075861299913, 0.0003579332584488518, 0.0010589186859962941, 0.00028582597791055334, 0.00011431011564566113, 0.00032566666923410196, 0.009951810252608469, 0.00022766696003182355, 3.910700779888951e-6, -3.958478923557291e-5, 0.00010573671034706458, 0.00010194029857531642, -3.964823015666853e-6, 0.00010573671034705954, 0.00022731942010746064, -2.2302531724824548e-5, -0.00013192383704827695, 0.00010573671034705954, -6.82524653944811e-5, -2.2414907099821478e-5, -1.1223638529405004e-5, -2.9983538472960527e-5, -0.0015525054573661352, -0.00016196337100909586, -0.00014444848571865967, -0.003081198511473198, 0.00010020021684275225, 1.573020326589008e-5, 0.0001850814885268067, -0.011432800034206155, 5.641138576488538e-6, -9.261626639145986e-5, -0.0009581165114731944, -0.0001172751677073836, 5.606486996039505e-6, -0.001143198000000001, 2.747356504931906e-6, 7.5839504512923844e-6, -2.2311902835502397e-5, -0.0001531970323498026, -2.6315094373083725e-6, 2.6636593365303998e-5, -7.115020217837863e-5, -6.859559778199108e-5, 2.667928274297947e-6, -7.11502021783752e-5, 0.00019743746783084797, 1.6079777138223514e-5, 8.877151225267884e-5, -7.11502021783752e-5, 4.59270644608725e-5, 1.5082984582431671e-5, 7.552383159292686e-6, 2.0175914470687765e-5, -0.0001066748451461338, -1.1128732230708393e-5, -9.925259697169447e-6, -0.000211713506394706, 6.884898577711634e-6, 1.0808445081750904e-6, 1.2717210773294048e-5, -0.00010651200303848529, 3.8761060789818844e-7, -6.363794618850014e-6, -6.583354023550593e-5, -8.058142594806454e-6, 3.8522964880981237e-7, -7.855075100879997e-5, 1.8877475008822996e-7, 5.211039588616202e-7], 18, 28)

lm = LinearMap{Float64}(x -> A * reshape(x, size(X)) - B * reshape(x, size(X)) * C, size(X)[1] * size(X)[2])

S = sparse(reshape(gmres(lm, vec(-X)), size(X)))

A |> findnz
B
C
X

X + A * S - B * S * C |> sum
(S |> vec |> findnz)[1]
Xind = (vec(X) .!= 0)
Sind = (vec(S) .!= 0)
Sindmat = Sind * Sind'
dS = sparse(Sind .* (I - kron(C', B)))
dS = sparse(((Sind .* (I - kron(C', B)))' .* Sind)')
(I - kron(B', C))[5,1]

dS = sparse(Xind .* Sind .* I(prod(size(X))))

dS[:,91]


Delta_S = sparse(ForwardDiff.jacobian(s -> collect(X) + collect(A) * s - collect(B) * s * collect(C), collect(S)))
Delta_S == (I - kron(C', B))

findnz(X)
Delta_S = ForwardDiff.jacobian(s -> X + A * s, S)
Delta_S = ForwardDiff.jacobian(s -> A * s, S)
Delta_S[:,91]
diag(Delta_S)


Delta_S = Zygote.jacobian(s -> X + A * s - B * s * C, S)[1]
Delta_S = Zygote.jacobian(s -> X + A * s, S)[1]
((Delta_S - dS) |> findnz)[1]|> unique
((Delta_S - dS) |> findnz)[2]|> unique


dS = sparse(((Sind .* (I - kron(C', B)))' .* Sind)')

dS == Delta_S