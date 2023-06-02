const pizzasService = require('../Services/pizzas-service');

exports.findPizzas = async (req, res) => {
  res.json(await pizzasService.FindPizzas(req.query['calories']));//методы из сервисов
};

exports.findPizzasById = async (req, res) => {
  res.json(await pizzasService.FindPizzaById(req.params['pizzas_id']));
};

exports.addPizza = async (req, res) => {
  res.json(await pizzasService.CreatePizza(req.body))
};


exports.updatePizza = async (req, res) => {
  res.json(await pizzasService.UpdatePizza(req.body))
};


exports.deletePizza = async (req, res) => {
  res.json(await pizzasService.DeletePizza(req.body))
};
