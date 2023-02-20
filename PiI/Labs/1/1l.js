const http = require('http'); // включение модуля из стандартной библиотеки Node.js

const hostname = 'localhost'; // веб-сервер работает локально
const port = 3000; // веб-сервер возвратит такой ответ на любой запрос
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html');
  res.end('<html><body><h1>Hello World!</h1></body></html>\n');
}); // запуск веб-сервера
server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});