const net=require('net');

let HOST ='127.0.0.1';
let PORT=parseInt(process.argv[2]);
const x = parseInt(process.argv[3]);
var client = new net.Socket();
var buf = new Buffer.alloc(4);
let timerId=null;

client.connect(PORT,HOST,()=>{
    console.log('Client CONNECTED: '+client.remoteAddress + ':' + client.remotePort);

    timerId=setInterval(()=>{
        console.log(`Data to server: `+ x);
        client.write((buf.writeInt32LE(x, 0), buf)); 
    }, 1000);

    setTimeout(()=>{
        clearInterval(timerId);
        client.end();

    }, 30000);
});

client.on('data', (data)=>{console.log('Data from server: '+ data.readInt32LE());});
client.on('close', ()=>{console.log('Client CLOSE');});
client.on('error', (e)=>{console.log('Client ERROR',e);});