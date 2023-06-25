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