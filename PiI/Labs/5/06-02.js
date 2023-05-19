const id = "127.0.0.1";
const port = 5000;
const path = "./06-02.html"

const http = require("http");
const fs = require("fs");
const url = require("url");

const nodemailer = require("nodemailer");
const nodemailer_smtp_transport = require("nodemailer-smtp-transport");

const { parse } = require("qs");

const server = http.createServer((request,response) => {
    response.writeHead(200, {'Content-Type':'text/html; charset=utf-8'});
    if (url.parse(request.url).pathname == '/' && request.method == 'GET')
    {
        response.write(fs.readFileSync(path));
        response.end();
    }
    else if (url.parse(request.url).pathname == '/' && request.method == 'POST')
    {
        let body = '';
        request.on('data', chunk => {body += chunk.toString();});
        request.on('end', () =>
        {
            let parm = parse(body);
            
            let sender = parm.sender;
            let pass = parm.password;
            let reciever = parm.reciver;
            let subject = parm.subject;
            let message = parm.message;

            send(sender, pass, reciever, subject, message);
            
            response.end(`<h1> OK <br> кому: ${reciever} <br> от кого: ${sender} <br> тема: ${subject} <br> сообщение: ${message} </h1>`);  
        })
    }
    else 
    {
        response.end(`<h1> Not support </h1>`);
    }
});

server.listen(port, id,function(){
    console.log("Прослушивание запросов началось");
});

function send(sender, pass, reciever, subject, message)
{
        const transporter = nodemailer.createTransport(nodemailer_smtp_transport(
            {
                host: "Smtp.gmail.com",
                port: 465,
                secure: true, // false with port 587 or 25
                auth:
                {
                    user: sender,
                    pass: pass
                }
            }
        ));

        var mailOptions = {
            from: sender,
            to: reciever,
            subject: subject,
            text: message            
        }

        transporter.sendMail(mailOptions)
        .then((value) =>
        {
            console.log ('email sent')
        })
        .catch((error) => {
            console.log(error)
        });
}