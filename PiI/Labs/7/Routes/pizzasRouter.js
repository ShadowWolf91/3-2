const express = require('express');
const pizzasController = require('../Controllers/pizzasController');
const { bodyMiddleware } = require("../Middlewares/body");

const pizzasRouter = express.Router();

pizzasRouter.get('/pizzas', pizzasController.findPizzas);
pizzasRouter.get('/pizzas/:pizzas_id', pizzasController.findPizzasById);
pizzasRouter.post('/pizzas', bodyMiddleware, pizzasController.addPizza);
pizzasRouter.put('/pizzas', bodyMiddleware, pizzasController.updatePizza);
pizzasRouter.delete('/pizzas/', pizzasController.deletePizza);

module.exports = pizzasRouter;