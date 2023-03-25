function genId() {
    return Date.now() * Math.random();
}

function createOrder(cardNumber) {
    return new Promise((resolve, reject) => {
        if (!validateCard(cardNumber)) {
            reject("Card is not valid");
        } else {
            setTimeout(() => {
                const orderNumber = genId();
                resolve(orderNumber);
            }, 5000);
        }
    });
}

function validateCard(cardNumber) {
    console.log(`Validating card number ${cardNumber}`);
    // Randomly return true or false
    return Math.random() < 0.5;
}

function proceedToPayment(orderNumber) {
    console.log(`OrderID ${orderNumber}`);
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            if (Math.random() < 0.5) {
                resolve("Payment successful");
            } else {
                reject("Payment failed");
            }
        }, 3000);
    });
}


createOrder("1234567890")
    .then((orderNumber) => {
        console.log(`OrderID ${orderNumber}`);
        return proceedToPayment(orderNumber);
    })
    .then((result) => {
        console.log(result); // Output: "Payment successful" or "Payment failed"
    })
    .catch((error) => {
        console.error(error); // Output: "Card is not valid"
    });

async function handleResult() {
    try {
        const orderNumber = await createOrder("1234567890");
        console.log(`OrderID ${orderNumber}`);
        const result = await proceedToPayment(orderNumber);
        console.log(result); // Output: "Payment successful" or "Payment failed"
    } catch (error) {
        console.error(error); // Output: "Card is not valid"
    }
}

handleResult();