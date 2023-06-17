const weaponsService = require('../Services/weapons-service.js');

exports.findAllWeapons = async (req, res) => {
  res.json(await weaponsService.FindAllWeapons(req.query["dps"]))
};

exports.findWeaponsById = async (req, res) => {
  res.json(await weaponsService.FindWeaponById(req.params["weapons_id"]))
};

exports.addWeapon = async (req, res) => {
  res.json(await weaponsService.CreateWeapons(req.body))
};

exports.updateWeapon = async (req, res) => {
  res.json(await weaponsService.UpdateWeapons(req.body))
};

exports.deleteWeapon = async (req, res) => {
  res.json(await weaponsService.DeleteWeapons(req.body))
};