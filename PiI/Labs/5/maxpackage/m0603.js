
const nodeMailer = require("nodemailer");

module.exports.mailF = function(from,to,message) {

    let transporter = nodeMailer.createTransport({
       host: 'smtp.mail.ru',
       port: 465,
       secure: true,
       auth: {
           user: from,
           pass: '***'
       }
   });
   // 'bstulearning@mail.ru'

   let mailOptions = {
       from: from, 
       to: to, 
       subject: 'Пересылка', 
       text: message, 
   
   };

   transporter.sendMail(mailOptions, (error, info) => {
       if (error) {
           return console.log(error);
       }
       console.log('Message %s sent: %s', info.messageId, info.response);
           res.render('index');
   });
}

