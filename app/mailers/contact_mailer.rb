class ContactMailer < ApplicationMailer
    def contact(user,item)
        @user = user.email
        @item = item.title
        mail(to: 'fenitraandrianaivosoa@gmail.com', subject:'Sujet de test')
    end
end
