imaging_2 = Imaging.new(
site_id: 1,
purpose: "脳出血",
identification: "SWIで低信号。経時変化により、ヘモジデリンの状態を反映した画像となる",
symptoms: "頭痛・吐き気",
treatment: "薬物治療・手術",
)
imaging_2.save!

imaging_3 = Imaging.new(
site_id: 1,
purpose: "脳腫瘍",
identification: "造影後、高信号になることが多い（腫瘍による）",
symptoms: "腫瘍の部位・大きさによって、様々な症状が出る",
treatment: "手術・放射線治療",
)
imaging_3.save!

imaging_4 = Imaging.new(
site_id: 1,
purpose: "脳動脈瘤",
identification: "血管が拡大。MRAで判別しやすい",
symptoms: "基本的には無症状",
treatment: "手術・カテーテル治療",
)
imaging_4.save!

imaging_5 = Imaging.new(
site_id: 1,
purpose: "認知症",
identification: "海馬の萎縮",
symptoms: "認知機能の低下",
treatment: "薬物療法・リハビリ等",
)
imaging_5.save!

height_data = [
    { id: 1, name: 'T1' },
    { id: 2, name: 'T2' },
    { id: 3, name: 'DWI' },
    { id: 4, name: 'ADC' },
    { id: 5, name: 'FLAIR' },
    { id: 6, name: 'STIR' },
    { id: 7, name: 'T2*' },
    { id: 8, name: 'PD' },
    { id: 9, name: 'heavy T2' },
    { id: 10, name: 'SWI' },
    { id: 11, name: 'CIS' },
    { id: 12, name: 'True FISP' }
    ]
    height_data.each do |data|
    Height.create(data)
    end

low_data = [
    { id: 1, name: 'T1' },
    { id: 2, name: 'T2' },
    { id: 3, name: 'DWI' },
    { id: 4, name: 'ADC' },
    { id: 5, name: 'FLAIR' },
    { id: 6, name: 'STIR' },
    { id: 7, name: 'T2*' },
    { id: 8, name: 'PD' },
    { id: 9, name: 'heavy T2' },
    { id: 10, name: 'SWI' },
    { id: 11, name: 'CIS' },
    { id: 12, name: 'True FISP' }
    ]
    low_data.each do |data|
    Low.create(data)
    end