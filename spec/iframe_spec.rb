describe 'iframes' do
    
    describe 'bom', :nice_iframe do
        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/nice_iframe'
        end

        it 'adicionar ao carrinho' do
            # within_frame só funciona com ID do elemento
            within_frame('burgerId') do
                produto = find('.menu-item-info-box', text: 'REFRIGERANTE')
                sleep 2
                produto.find('a').click
                sleep 2
                expect(find('#cart')).to have_content 'R$ 4,50'
                sleep 3
            end            
        end
    end


    describe 'ruim', :bad_iframe do
        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/bad_iframe'
        end

        it 'carrinho deve estar vazio' do
            # within_frame só funciona com ID do elemento
            # precisa colocar um ID atraves de um script JS
            sleep 3
            script = '$(".box-iframe").attr("id", "tempId")'
            page.execute_script(script)
            sleep 3
            within_frame('tempId') do
                expect(find("#cart")).to have_content 'Seu carrinho está vazio!'
            end
        end
    end
end