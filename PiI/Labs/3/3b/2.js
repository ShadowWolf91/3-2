function secondJob() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            reject('Error: Something went wrong');
        }, 3000);
    });
}

// Обработка Promise
secondJob().then(result => {
    console.log(result);
}).catch(error => {
    console.error(error); // "Error: Something went wrong"
});

// Обработка async/await
async function handleSecondJob() {
    try {
        await secondJob();
    } catch (error) {
        console.error(error); // "Error: Something went wrong"
    }
}

handleSecondJob();