describe 'Teclado', :key do
    
    before(:each) do
        visit '/key_presses'
    end

    it 'enviando tecla espaço' do
        # Simulando o espaço
        find('#campo-id').send_keys :space
        expect(page).to have_content 'You entered: SPACE'
        sleep 3
    end

    it 'enviando tecla TAB' do
        # Simulando o espaço
        find('#campo-id').send_keys :tab
        expect(page).to have_content 'You entered: TAB'
        sleep 3
    end

    it 'enviando teclas de simbolos' do
        # Array de simbolo => %i
        teclas = %i[tab escape space enter shift control alt]

        teclas.each do |t|
            find('#campo-id').send_keys t
            expect(page).to have_content 'You entered: ' + t.to_s.upcase
            sleep 1
        end
    end

    it 'enviando teclas de letras' do
        # Array de simbolo => %i
        letras = %w[a s d f g h j k l]

        letras.each do |l|
            find('#campo-id').send_keys l
            expect(page).to have_content 'You entered: ' + l.to_s.upcase
            sleep 1
        end
    end
end