function firstJob() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve('Hello World');
        }, 2000);
    });
}

// Обработка Promise
firstJob().then(result => {
    console.log(result); // "Hello World"
}).catch(error => {
    console.error(error);
});

// Обработка async/await
async function handleFirstJob() {
    try {
        const result = await firstJob();
        console.log(result); // "Hello World"
    } catch (error) {
        console.error(error);
    }
}

handleFirstJob();