const turtlesService = require('../Services/turtles-service.js');
const path = require('path');
const multer = require('multer');
const { storage } = require("../Services/turtles-service");

const upload = multer({ storage: storage });

exports.getTurtleImage = async (req, res) => {
  const turtleImage = await turtlesService.getTurtleImage(req.params["turtles_id"]);

  if (turtleImage.status === 404) {
    return res.status(404).json({ message: turtleImage.message });
  } else if (turtleImage.status === 401) {
    return res.status(401).json({ message: turtleImage.message });
  }

  res.sendFile(turtleImage);
  }

exports.uploadImage = upload.single('image');

exports.sendForm = async (req, res) => {
  res.sendFile(path.join(__dirname, '../Pages/index.html'));
}

exports.getPhoto = async (req, res) => {
  if (!req.file) {
    return res.status(400).send({ message: 'Please upload a file' });
  }
  const formData = JSON.parse(JSON.stringify(req.body));
  const name = formData.name;
  console.log('Name:', name);
  var statusCode = await turtlesService.FindTurtleById(Number(name));
  if (statusCode.status === 404){
    res.send({ message : 'turtle does not exiss'})
  }
  else{
  res.send({ message: 'Normal file' });
  }
};

exports.findAllTurtles = async (req, res) => {
  const turtles = await turtlesService.FindAllTurtles(req.query)
  console.log(turtles)
  res.render('turtles', {
    result: turtles,
    prevPage: Number(req.query["page"] || 1) - 1,
    nextPage: Number(req.query["page"] || 1) + 1,
    currentPage: req.query["page"],
    favoritePizza: req.query["favoritePizza"]
  });
};

exports.findAllTurtlesJSON = async (req, res) => {
  const turtles = await turtlesService.FindAllTurtlesJSON(req.query)
  res.json(turtles);
};

exports.findTurtleById = async (req, res) => {
  res.json(await turtlesService.FindTurtleById(req.params["turtles_id"]))
};

exports.DeleteTurtleWeapon = async (req, res) => {
  res.json(await turtlesService.DeleteTurtleWeapon(req.body))
};

exports.DeleteTurtleFavoritePizza = async (req, res) => {
  res.json(await turtlesService.DeleteTurtleFirstFavoritePizza(req.body))
};

exports.DeleteTurtleSecondFavoritePizza = async (req, res) => {
  res.json(await turtlesService.DeleteTurtleSecondFavoritePizza(req.body))
};

exports.deleteTurtle = async (req, res) => {
  res.json(await turtlesService.DeleteTurtle(req.body))
};

exports.addTurtle = async (req, res) => {
  res.json(await turtlesService.CreateTurtle(req.body))
};

exports.updateTurtle = async (req, res) => {
  res.json(await turtlesService.UpdateTurtle(req.body))
};

exports.AddTurtleWeapon = async (req, res) => {
  res.json(await turtlesService.AddTurtleWeapon(req.body))
};

exports.AddFirstFavoritPizza = async (req, res) => {
  res.json(await turtlesService.AddTurtleFirstFavoritePizza(req.body))
};

exports.AddSecondFavoritePizza = async (req, res) => {
  res.json(await turtlesService.AddTurtleSecondFavoritePizza(req.body))
};