# select => o campo from é necessario usar o id do elemento
# rspec --tag @dropdown => executar o cenário atravês de tag
# select_option => Seleciona uma opção


describe 'Caixa de seleção', :dropdown do
    it 'item especifico simples por ID' do
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
        select('Loki', from:'dropdown')
        sleep 3
    end
    it 'item especifico com o find' do
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
        drop = find('.avenger-list')
        drop.find('option', text:'Scott Lang').select_option
        sleep 3
    end
    it 'qualquer item' do
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
        drop = find('.avenger-list')
        #sorteia uma seleção
        drop.all('option').sample.select_option
        sleep 3
    end
end