const http = require('http');

const hostname = 'localhost';
const port = 3000;

const server = http.createServer((req, res) => {
    let b = '';
    req.on('data', str => {b += str;})
    res.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'});
    req.on('end', () => res.end(
    '<!DOCTYPE html><html><head></head>' + 
    '<body>' +
    '<div>' +
    '<h1>Method: ' + req.method + '</h1>' +
    '<h1>URI: '+ req.url + '</h1>' +
    '`<h1>Version: ' + req.httpVersion + '</h1>' +
    '<h1>Headers: ' + JSON.stringify(req.headers) + '</h1>' +
    '<h1>Body: ' + b + '</h1>' +
    '</div>' +
    '</body>' +
    '</html>'
    ));
});

server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
});