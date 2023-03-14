const http = require('http');
const fs = require('fs');

const hostname = 'localhost';
const port = 5000;
const server = http.createServer((req, res) => {
  switch(req.url){
    case "/html":
      let html = fs.readFileSync('index.html');
      res.writeHead(200,{'Content-Type': 'text/html; charset=utf-8'});
      res.end(html);
      break
      default:
            res.writeHead(404);
            res.end(JSON.stringify({error:"Resource not found"}));
  }
}); // запуск веб-сервера
server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/html`);
});