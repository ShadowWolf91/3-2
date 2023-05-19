const net = require('net');

let HOST = '0.0.0.0';
let PORT1 = 40000;
let PORT2 = 50000;
let sum = 0;

let server2 = net.createServer();
server2.on('connection', (sock)=>{
    console.log('server 2 connected: ' + sock.remoteAddress + ": " + sock.remotePort);

    sock.on('data', (data)=>{
        console.log('Data from client2:', data, sum);
        sum += data.readInt32LE();
    });

    let buf = Buffer.alloc(4);
    setInterval(() =>{
        buf.writeInt32LE(sum, 0);
        console.log('Data to client2:', sum);
        sock.write(buf)
    }, 5000);

    sock.on('close', (data)=>{console.log('server2 closed: ', sock.remoteAddress + " " + sock.remotePort);});
    sock.on('error', (e)=>{console.log('server2 error: ', sock.remoteAddress + " " + sock.remotePort);});
})

server2.on('listening', ()=>{console.log('tcp-server2', HOST+ " : " + PORT2);});
server2.on('error', (e)=>{console.log('tcp-server2 error ', e);});
server2.listen(PORT2, HOST);

let server1 = net.createServer();
server1.on('connection', (sock)=>{
    console.log('server 1 connected: ' + sock.remoteAddress + ": " + sock.remotePort);
let sum2=0;
    sock.on('data', (data)=>{
        console.log('Data from client1:', data, sum2);
        sum2 += data.readInt32LE();
    });

    let buf = Buffer.alloc(4);
    setInterval(() =>{
        buf.writeInt32LE(sum2, 0);
        console.log('Data to client1:', sum2);
        sock.write(buf)
    }, 5000);

    sock.on('close', (data)=>{console.log('server1 closed: ', sock.remoteAddress + " " + sock.remotePort);});
    sock.on('error', (e)=>{console.log('server1 error: ', sock.remoteAddress + " " + sock.remotePort);});
})

server1.on('listening', ()=>{console.log('tcp-server1', HOST+ " : " + PORT1);});
server1.on('error', (e)=>{console.log('tcp-server1 error ', e);});
server1.listen(PORT1, HOST);