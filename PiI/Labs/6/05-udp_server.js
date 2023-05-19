const udp = require('dgram');
const PORT=3000;
let server =udp.createSocket('udp4');

server.on('error', (err)=>{console.log('ERROR: '+err); server.close();});

server.on('message', (msg, info) => {
    console.log(`Data from client: `+msg.toString());

    const response = Buffer.from(`ECHO: `+msg.toString());

    server.send(response, 0, response.length, info.port, info.address, (err) => {
        if (err) {
            console.error(`Error sending response to ${info.address}:${info.port}: ${err}`);
        } else {
            console.log(`Sent response to ${info.address}:${info.port}: ${response}`);
        }
    });
});
server.on('listening',()=>{
    console.log('Server port: '+server.address().port);
    console.log('Server ip: '+server.address().address);
    console.log('Server family: '+server.address().family);
})
server.on('close', ()=>{console.log('Server closed');});
server.bind(PORT, () => {
    console.log('UDP server listening on port 3000');
});
