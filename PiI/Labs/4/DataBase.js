const EventEmitter = require('events');

let data = [
    {id: 1, name: "Дмитрий Пирейко", bday: "27-08-2002"},
    {id: 2, name: "Евгений Гончаревич", bday: "10-03-2003"},
    {id: 3, name: "Шкабров Данила", bday: "04-09-2002"},
    {id: 4, name: "Бла Бла", bday: "04-09-2002"}
];

class DB extends EventEmitter
{
    get()
    {
        return data;
    };

    post(object)
    {
        for (let str = 0; str < data.length; str++) {
            if(object.id == data[str].id)
            {
                console.error("Данная строка с таким id уже существует!");
                return -1;
            }
        }
        data.push(object);
        return object;
    };
    
    put(object)
    {
        var res;
        for (let str = 0; str < data.length; str++) {
            if(object.id == data[str].id)
            {
                data[str].name = object.name;
                data[str].bday = object.bday;
                res = data[str].id;
                return res;
            }
        }
        console.error("Данной строки с таким id не существует!");
        return -1;
    };

    delete(id)
    {
        let object;
        for (let str = 0; str < data.length; str++)
        {
            if(id == data[str].id)
            {
                object = data[str];
                data.splice(str, 1);
                return object;
            }             
        }
        console.error("Данной строки с таким id не существует!");
        return object;
    };
}

exports.DB = DB;