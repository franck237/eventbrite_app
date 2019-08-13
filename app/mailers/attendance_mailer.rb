class AttendanceMailer < ApplicationMailer
	default from: 'no-reply@the-majestical-eventbrite-app.herokuapp.com'
 
  def attendance_confirmation_email(attendance)
    #on récupère le user de l'instance attendance pour ensuite pouvoir la passer à la view en @user
    @user = attendance.user

    #on récupère l'event de l'instance attendance pour ensuite pouvoir la passer à la view en @event
    @event = attendance.event

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://the-majestical-eventbrite-app.herokuapp.com/login' 



    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Confirmation de votre inscription !') 
  end
end
