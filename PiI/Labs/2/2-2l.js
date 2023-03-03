const http = require('http'); // включение модуля из стандартной библиотеки Node.js
const fs = require('fs');

const hostname = 'localhost'; // веб-сервер работает локально
const port = 5000; // веб-сервер возвратит такой ответ на любой запрос
const server = http.createServer((req, res) => {
  switch(req.url){
    case "/png":
      let html = fs.readFileSync('pic.png');
      res.writeHead(200,{'Content-Type': 'image/png;'});
      res.end(html);
      break
      default:
            res.writeHead(404);
            res.end(JSON.stringify({error:"Resource not found"}));
  }
}); // запуск веб-сервера
server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/png`);
});