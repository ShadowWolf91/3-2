const udp = require('dgram');
const PORT=3000;
let client =udp.createSocket('udp4');
const buffer=require('buffer');

client.on('message', (msg, info) => {
    console.log(`Data from server: `+msg.toString());
});
    let data = Buffer.from('Hello from udp client!');

    client.send(data, PORT, 'localhost',(err) => {
        if (err) {
client.close();
        } else {
            console.log(`Sent message to server`);
        }
    });
