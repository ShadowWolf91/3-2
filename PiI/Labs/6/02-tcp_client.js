const net=require('net');

let HOST ='127.0.0.1';
let PORT=40000;

var client = new net.Socket();
client.connect(PORT,HOST,()=>{
    console.log('Client CONNECTED: '+client.remoteAddress + ':' + client.remotePort);
    client.write('Hello from client! ');
});
client.on('data', (data)=>{
    console.log('Client DATA: '+ data.toString());
    client.destroy();
});

client.on('close', ()=>{console.log('Client CLOSE');});
client.on('error', (e)=>{console.log('Client ERROR');});