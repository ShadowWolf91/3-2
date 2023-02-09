const http = require('http'); // require - это функция которая импортирует модуль

const hostname = 'localhost';
const port = 3000;

const server = http.createServer((req, res) => { // передача в функцию createServer анонимной функции, в которой есть два параметра: req и res
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/html');
    res.write(`
        <div style=" 
        width: 75%;
        height: 100%;
        background-color: #f5f5f5;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin: auto;">
        `)
    res.write(`<h1>Method: ${req.method}</h1>`);
    res.write(`<h1>URI: ${req.url}</h1>`);
    res.write(`<h1>Version: ${req.httpVersion}</h1>`);
    res.write(`<h1>Headers: ${JSON.stringify(req.headers)}</h1>`);
    res.write(`<h1>Body: ${JSON.stringify(req.body)}</h1>`);
    res.end(`</div>`);
});

server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
});