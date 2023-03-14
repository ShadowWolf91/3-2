const http = require('http');
const fs = require('fs');

const hostname = 'localhost';
const port = 5000;
const server = http.createServer((req, res) => {
  switch(req.url){
    case "/jquery":
      let html = fs.readFileSync('jquery.html');
      res.writeHead(200,{'Content-Type': 'text/html; charset=utf-8'});
      res.end(html);
      break
      case "/api/name":
      let html2 = fs.readFileSync('index.txt');
      res.writeHead(200,{'Content-Type': 'text/plain;charset=utf-8'});
      res.end(html2);
      break
      default:
            res.writeHead(404);
            res.end(JSON.stringify({error:"Resource not found"}));
  }
}); // запуск веб-сервера
server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/jquery`);
});
