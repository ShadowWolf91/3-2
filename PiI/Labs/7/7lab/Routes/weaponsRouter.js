const express = require('express');
const weaponsController = require('../Controllers/weaponsController.js');
const { bodyMiddleware } = require("../Middlewares/body");

const weaponsRouter = express.Router();

weaponsRouter.get('/weapons', weaponsController.findAllWeapons);
weaponsRouter.get('/weapons/:weapons_id', weaponsController.findWeaponsById);
weaponsRouter.post('/weapons',bodyMiddleware, weaponsController.addWeapon);
weaponsRouter.put('/weapons',bodyMiddleware, weaponsController.updateWeapon);
weaponsRouter.delete('/weapons', bodyMiddleware, weaponsController.deleteWeapon);
  
module.exports = weaponsRouter;
