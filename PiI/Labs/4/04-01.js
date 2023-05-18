const id = "127.0.0.1";
const port = 5000;

const http = require("http");
const url = require("url");
let data = require("./DataBase.js");

let db = new data.DB();

db.on("GET", (request, response) => 
{
    console.log("DB.GET");
    setImmediate(() => response.end(JSON.stringify(db.get())));
});

db.on("POST", (request, response) =>
{
    console.log("DB.POST");
    request.on("data", data => 
    {
        let obj = JSON.parse(data);
        setImmediate(() => {
            if (db.post(obj) === -1) 
            { 
                response.writeHead(400); 
                response.end(); 
            }
            else response.end(JSON.stringify(obj));
        });
    })
})

db.on("PUT", (request, response) =>
{
    console.log("DB.PUT");
    request.on("data", data => 
    {
        let obj = JSON.parse(data);
        setImmediate(() => {
            if(db.put(obj) === -1)
            {
                response.writeHead(404); 
                response.end();
            }
            else response.end(JSON.stringify(obj));
        });
    })
})

db.on("DELETE", (request, response) =>
{
    console.log("DB.DELETE");
    let id_to_del = url.parse(request.url, true).query.id;
    if (typeof id_to_del != 'undefined')
    {
        var idx = parseInt(id_to_del);
        if (Number.isInteger(idx))
        {
            setImmediate(() => { 
                deletedobj = db.delete(idx);
                if(deletedobj == null)
                {
                    response.writeHead(404); 
                    response.end();
                }
                response.end(JSON.stringify(deletedobj));
            });
        }
        else 
        {
            response.writeHead(400); 
            response.end();
        }
    }
})

const server = http.createServer((request,response) => {
    if (url.parse(request.url).pathname === "/api/db")
    {
        {
            response.setHeader('Content-type', 'application/json', 'Accept', 'application/json');
            db.emit(request.method, request, response);            
        }
    }     
});

server.listen(port, id,function(){
    console.log("Прослушивание запросов началось");
});