const express = require('express');
const turtlesController = require('../Controllers/turtlesController.js');
const { bodyMiddleware } = require("../Middlewares/body");

const turtlesRouter = express.Router();

turtlesRouter.get('/turtles/upload',  turtlesController.sendForm);
turtlesRouter.post('/turtles/upload', bodyMiddleware, turtlesController.uploadImage, turtlesController.getPhoto);
turtlesRouter.get('/turtles/images/:turtles_id', turtlesController.getTurtleImage);

turtlesRouter.get('/turtlesHTML', turtlesController.findAllTurtles);
turtlesRouter.get('/turtles', turtlesController.findAllTurtlesJSON);
turtlesRouter.get('/turtles/:turtles_id', turtlesController.findTurtleById);
turtlesRouter.post('/turtles',bodyMiddleware, turtlesController.addTurtle);
turtlesRouter.put('/turtles',bodyMiddleware, turtlesController.updateTurtle);
turtlesRouter.delete('/turtles', turtlesController.deleteTurtle);

turtlesRouter.put('/turtles/favoritePizzaBind',bodyMiddleware, turtlesController.AddFirstFavoritPizza);
turtlesRouter.delete('/turtles/favoritePizzaUnbind', bodyMiddleware, turtlesController.DeleteTurtleFavoritePizza);
turtlesRouter.put('/turtles/secondFavoritePizzaBind',bodyMiddleware, turtlesController.AddSecondFavoritePizza);
turtlesRouter.delete('/turtles/secondFavoritePizzaUnbind', bodyMiddleware, turtlesController.DeleteTurtleSecondFavoritePizza);
turtlesRouter.put('/turtles/weaponBind',bodyMiddleware, turtlesController.AddTurtleWeapon);
turtlesRouter.delete('/turtles/weaponUnbind', bodyMiddleware, turtlesController.DeleteTurtleWeapon);

module.exports = turtlesRouter;
