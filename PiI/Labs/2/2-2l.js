const http = require('http');
const fs = require('fs');

const hostname = 'localhost';
const port = 5000;
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