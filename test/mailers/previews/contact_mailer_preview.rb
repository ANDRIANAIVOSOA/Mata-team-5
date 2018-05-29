# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
    def contact
        if user_signed_in?

        ContactMailer.contact(current_user, Item.last)

        end
    end
end
