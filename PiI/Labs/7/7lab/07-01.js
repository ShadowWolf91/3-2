const Express = require('express');
const exphds = require("express-handlebars");
const bodyParser = require('body-parser');
const db = require('./models/db.js');
const PORT = 3000;
const app = Express();

app.use('/images', Express.static(__dirname + "/images"))
app.use(bodyParser.urlencoded({ extended: true }));//для разбора и обработки данных, отправленных с помощью POST и PUT запросов в форматах URL-encoded и JSON.
app.use(bodyParser.json());

const pizzasRouter = require("./Routes/pizzasRouter.js");
const weaponsRouter = require("./Routes/weaponsRouter.js");
const turtlesRouter = require("./Routes/turtlesRouter.js");

app.use('/api', pizzasRouter);
app.use('/api', weaponsRouter);
app.use('/api', turtlesRouter);

const hbs = exphds.create({
  defaultLayout: "main",
  extname: "hbs"
});

app.engine('hbs', hbs.engine);
app.set('view engine', 'hbs');
app.set("views", "views");

app.listen(PORT, () => {
  console.log('Сервер запущен!');
})

db.sequelize.sync().then(result => {
  console.log(result);
})

// db.authenticate().catch(error => console.error(error))