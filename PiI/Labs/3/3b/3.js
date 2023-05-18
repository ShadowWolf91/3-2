function thirdJob(data) {
    return new Promise((resolve, reject) => {
        if (typeof data !== 'number') {
            reject('error');
        } else if (data % 2 !== 0) {
            setTimeout(() => {
                resolve('odd');

            }, 1000);
        } else {
            setTimeout(() => {
                reject('even');

            }, 2000);
        }
    });
}

// Обработка с помощью обработчиков Promise
thirdJob(3)
    .then(result => console.log(result)) // 'odd'
    .catch(error => console.log(error)) // не выполнится
thirdJob(4)
    .then(result => console.log(result)) // не выполнится
    .catch(error => console.log(error)) // 'even'
thirdJob('adsfg').then(result => console.log(result)) // не выполнится
    .catch(error => console.log(error)) // 'even'

// Обработка с помощью конструкции async/await c try/catch
async function processResult() {
    try {
        const result1 = await thirdJob(3);
        console.log(result1); // 'odd'

        const result2 = await thirdJob(4);
        console.log(result2); // не выполнится
    } catch (error) {
        console.log(error); // 'even'
    }
}

processResult();