describe 'Alertas de JS', :alerts do
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/javascript_alerts'
    end

    it 'alerta' do
        click_button 'Alerta'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Isto é uma mensagem de alerta'
    end

    it 'sim confirma' do
        click_button 'Confirma'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'
        sleep 2
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'Mensagem confirmada'
    end
    
    it 'não confirma' do
        click_button 'Confirma'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'
        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content 'Mensagem não confirmada'
    end

    it 'accept prompt', :accept_prompt do
        accept_prompt(with: 'Fernando') do
            click_button 'Prompt'
            sleep 2
        end
        expect(page).to have_content 'Olá, Fernando'
        sleep 3
    end

    it 'dismiss prompt' do
        click_button 'Prompt'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Qual o seu Nome?'
        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content 'Olá, null'
    end
end