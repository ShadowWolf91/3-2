// Информация о пакете
// npm view nodemailer;
// npm info nodemailer;

// Установка пакета 
// npm install nodemailer; - локально
// npm install -g nodemailer - глобально

// Проверка установлен ли пакет
// npm -v nodemailer 
// Проверить зависимости в package.json

const {mailF} = require("./m0603");
const http = require("http");
const fs = require("fs");


const nodeMailer = require("nodemailer");

function Mail(from, to, message) {

    let transporter = nodeMailer.createTransport({
        host: 'smtp.mail.ru',
        port: 465,
        secure: true,
        auth: {
            user: from,
            pass: 'bcGf3pLnbNr0tuHbiYdY'
        }
    });


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
//transporter, который создает SMTP-транспорт для отправки почты

let block;
http.createServer((req, res) => {
    let data = fs.readFileSync("index.html", 'utf-8');
    if (req.url == "/") {
        res.end(data);
    }
    if (req.method == "POST") {
        if (req.url == '/send-email') {

            req.on('data', (data) => {
                block = JSON.parse(data);
                from = block.from;
                to = block.toOne;
                mesage = block.message;
                Mail(from, to, mesage);
            });
        }
    }
}).listen(5000, '127.0.0.1', () => {
    console.log("Сервер запущен!");
});

 
