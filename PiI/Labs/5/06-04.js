const {mailF} = require("laba5xnext");
const http = require("http");
const fs = require("fs");


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
                mailF(from, to, mesage);
            });


        }
    }
}).listen(2000, '127.0.0.1', () => {
    console.log("Сервер запущен!");
});