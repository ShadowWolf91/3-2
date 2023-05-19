const nodemailer = require("nodemailer")
const nodemailer_smtp_transport = require("nodemailer-smtp-transport")

let reciever = 'shadowwolfbel91@gmail.com';

function send(sender, password, message)
{
    const transporter = nodemailer.createTransport(nodemailer_smtp_transport(
        {
            host: "Smtp.gmail.com",
            port: 465,
            secure: true, // false with port 587 or 25
            auth:
            {
                user: sender,
                pass: password
            }
        }
    ));

    var mailOptions = {
        from: sender,
        to: reciever,
        text: message
    }

    transporter.sendMail(mailOptions, function(error, info)
    {
        error ? console.log(error) : console.log ('email sent: ' + info.response);
    })
}

module.exports.send = send;