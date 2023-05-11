admin_occupation_1 = Occupation.create(post_code:"000-0000", prefecture1_id: 40, phone_number:"0000000000", name: "yh_hospital")
default_occupation = Occupation.create(post_code:"000-0000", prefecture1_id: 13, phone_number:"0123456789", name: "未登録")
test_occupation_1 = Occupation.create(post_code:"111-1111", prefecture1_id: 1, phone_number:"1111111111", name: "a_hospital")
test_occupation_2 = Occupation.create(post_code:"222-2222", prefecture1_id: 1, phone_number:"2222222222", name: "b_hospital")

admin_user_1 = User.create(nickname: "和井 英知", email: "y@h", password: "yh4410" , prefecture2_id: 40, occupation_id: 1)
test_user_1 = User.create(nickname: "a", email: "a@a", password: "aa1111" , prefecture2_id: 1, occupation_id: 3)
test_user_2 = User.create(nickname: "aa", email: "aa@a", password: "aaaa11" , prefecture2_id: 1, occupation_id: 3)
test_user_3 = User.create(nickname: "b", email: "b@b", password: "bb1111" , prefecture2_id: 1, occupation_id: 4)

imaging_1 = Imaging.new(
site_id: 1,
purpose: "急性脳梗塞",
indentification: "DWIで高信号、ADCで低信号",
symptoms: "めまい・吐き気・呂律不良・四肢の脱力",
treatment: "・血栓溶解療法（t-PA）・血栓回収療法",
)
imaging_1.save!

imaging_2 = Imaging.new(
site_id: 1,
purpose: "脳出血",
indentification: "SWIで低信号。経時変化により、ヘモジデリンの状態を反映した画像となる",
symptoms: "頭痛・吐き気",
treatment: "薬物治療・手術",
)
imaging_2.save!
