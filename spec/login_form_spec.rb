# 
# fill_in => 'name' do elemento 'input'
# with => valor do elemento 'input' 
# click_button => clicar no elemento 'button' (Usando a identificação do 'name')
# find => elemento procurado 

describe "Forms" do
    it "login com sucesso" do
        visit "https://training-wheels-protocol.herokuapp.com/login"
        
        sleep(3)
        fill_in 'username', with: 'stark'
        fill_in 'password', with: 'jarvis!'

        click_button 'Login'
        sleep(2)
        expect(find('#flash').visible?).to be true
        expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it "login com senha incorreta" do
        visit "https://training-wheels-protocol.herokuapp.com/login"
        
        sleep(3)
        fill_in 'username', with: 'stark'
        fill_in 'password', with: 'jarvis'

        click_button 'Login'
        sleep(2)
        expect(find('#flash').visible?).to be true
        expect(find('#flash').text).to include 'Senha é invalida!'
    end

    it "login com usuário não cadastrado" do
        visit "https://training-wheels-protocol.herokuapp.com/login"
        
        sleep(3)
        fill_in 'username', with: 'star'
        fill_in 'password', with: 'jarvis!'

        click_button 'Login'
        sleep(2)
        expect(find('#flash').visible?).to be true
        expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!'
    end
end