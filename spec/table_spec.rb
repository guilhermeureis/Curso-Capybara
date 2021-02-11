describe 'Tabelas', :table do
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/tables'
    end

    # it 'pega o Tony Stark na lista' do
    #     expect(page).to have_content 'Robert Downey Jr'
    # end
    it 'deve exibir o salario do Tony Stark' do
        atores = all('table tbody tr')
        stark = atores.detect { |ator| ator.text.include?('Robert Downey Jr')}
        expect(stark.text).to include '10.000.000'
    end

    it 'deve exibir o salario do Vin Diesel' do
        ator = find('table tbody tr', text:'@vindiesel')
        expect(ator).to have_content '10.000.000'
    end

    it 'deve exibir o filme Velozes' do
        ator = find('table tbody tr', text:'@vindiesel')
        expect(ator).to have_content 'Velozes e Furiosos'
    end

    it 'deve exibir o filme Velozes 2' do
        ator = find('table tbody tr', text:'@vindiesel')
        filme = ator.all('td')[2].text
        expect(filme).to eql 'Velozes e Furiosos'
    end

    it 'deve exibir o insta do Chris Evans' do
        ator = find('table tbody tr', text:'Chris Evans')
        insta = ator.all('td')[4].text
        expect(insta).to eql '@teamcevans'
    end

    it 'deve selecionar Chris Pratt para remoção' do
        ator = find('table tbody tr', text:'Chris Pratt')
        ator.find('a', text: 'delete').click
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'
    end

    it 'deve selecionar Chris Pratt para edição' do
        ator = find('table tbody tr', text:'Chris Pratt')
        ator.find('a', text: 'edit').click
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para edição!'
    end
end