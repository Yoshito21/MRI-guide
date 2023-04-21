admin_user_1 = User.create(nickname: "和井 英知", email: "y@h", password: "yh4410" , prefecture_id: 40, occupation: "yh_hospital")
test_user_1 = User.create(nickname: "a", email: "a@a", password: "aa1111" , prefecture_id: 1)
test_user_2 = User.create(nickname: "b", email: "b@b", password: "bb1111" , prefecture_id: 1)

imaging_1 = Imaging.new(
site_id: 1,
purpose: "急性脳梗塞",
indentification: "DWIで高信号、ADCで低信号",
symptoms: "めまい・吐き気・呂律不良・四肢の脱力",
treatment: "・血栓溶解療法（t-PA）・血栓回収療法",
user_id: admin_user_1.id
)
imaging_1.save!

imaging_2 = Imaging.new(
site_id: 1,
purpose: "脳出血",
indentification: "SWIで低信号。経時変化により、ヘモジデリンの状態を反映した画像となる",
symptoms: "頭痛・吐き気",
treatment: "薬物治療・手術",
user_id: admin_user_1.id
)
imaging_2.save!