const Sequelize = require('sequelize')
const fs = require('fs');
const path = require('path');

const basename = path.basename(__filename);

const db = {};

const sequelize = new Sequelize('postgres', 'postgres', '1', {
  host: 'localhost',
  dialect: 'postgres',
  port: '5432',
  pool: {
    max: 10,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
});
fs.readdirSync(__dirname)
  .filter(file => {
    return (file.indexOf('.') !== 0) && (file !== basename) && (file.slice(-3) === '.js');
  })
  .forEach(file => {
    console.log(__dirname + file);
    const model = require(path.join(__dirname, file))(sequelize, Sequelize.DataTypes);
    db[model.name] = model;
  });

Object.keys(db).forEach(modelName => {
  if (db[modelName].associate) {
    db[modelName].associate(db);
  }
});

db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;