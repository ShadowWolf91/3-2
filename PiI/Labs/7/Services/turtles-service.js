const { Op } = require("sequelize");
const db = require("../models/db.js");
const path = require('path');
const multer = require('multer');

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'images/');
  },
  filename: async function (req, file, cb) {
    let turtle = await FindTurtleById(req.body.name);
    if (!turtle) {
      cb(`Черепашка с ID ${ req.body.name } не найдена`);
      return;
    }
    cb(null, 'turtle_' + req.body.name + path.extname(file.originalname));
    let result = await AddTurtleImage(req.body.name, `turtle_${ req.body.name + path.extname(file.originalname) }`)
    if (result.status === 401){
      console.log("Черепашки не существует")
      return;
    }
    if (result) {
      console.log("Файл добавлен");
    }
  }
});

async function getTurtleImage(turtlesId) {
  if (isNaN(turtlesId)) {
    return {
      status: 401,
      message: 'turtlesId не являетя числом'
    };
  }
  const turtle = await FindTurtleById(turtlesId);
  if (!turtle) {
    return {
      status: 404,
      message: 'Turtle not found'
    };
  }
  if (!turtle.turtles_image) {
    return {
      status: 401,
      message: 'Image not found'
    };
  }

  return path.join(__dirname, '..', 'images', turtle.turtles_image);
}


exports.sendForm = async (req, res) => {
  res.sendFile(path.join(__dirname, '../Pages/index.html'));
}

exports.getPhoto = async (req, res) => {
  if (!req.file) {
    return res.status(400).send({ message: 'Please upload a file' });
  }
  res.send({ message: 'File uploaded successfully' });
};


function pagination(data, pageSize, currentPage) {
  const startIndex = (currentPage - 1) * pageSize;
  const endIndex = startIndex + pageSize;
  return data.slice(startIndex, endIndex);
}

async function FindAllTurtles(query) {
  const favoritePizza = query["favoritePizza"];
  const data = favoritePizza ?
    await FindTurtlesByFavoritePizza(favoritePizza) :
    await db.turtles.findAll({
      include: [
        {
          model: db.weapons
        },
        {
          model: db.pizzas,
          as: "first"
        },
        {
          model: db.pizzas,
          as: "second"
        }
      ],
    });

  const pageSize = 3;
  const currentPage = query["page"] || 1;
  return pagination(data, pageSize, currentPage);
}

async function FindAllTurtlesJSON(query) {
  const favoritePizza = query["favoritePizza"];
  const data = favoritePizza ?
    await FindTurtlesByFavoritePizza(favoritePizza) :
    await db.turtles.findAll({
      include: [
        {
          model: db.weapons
        },
        {
          model: db.pizzas,
          as: "first"
        },
        {
          model: db.pizzas,
          as: "second"
        }
      ],
    });
  return data;
}

async function FindTurtleById(turtlesId) {
  if (isNaN(turtlesId)) {
    return {
      status: 401,
      message: 'turtlesId не являетя числом'
    };
  }

  let turtle = await db.turtles.findOne({
    where: {
      turtles_id: turtlesId
    }
  });

  if (!turtle) {
    return {
      status: 404,
      message: `Черепашка с ID ${ turtlesId } не найдена`
    };
  }

  return turtle
}

async function CreateTurtle(body) {
  const turtlesName = body.turtles_name;
  const turtlesColor = body.turtles_color;
  const image = body.turtles_image;
  const turtlesFavoritepizzaid = body.turtles_favoritepizzaid;
  const turtlesSecondfavoritepizzaid = body.turtles_secondfavoritepizzaid;
  const weaponId = body.turtles_weaponid;

  if (!(turtlesName && turtlesColor)) {
    return {
      status: 401,
      message: `Черепашка не создана`
    };
  }

  const turtle = await db.turtles.create({
    turtles_name: turtlesName,
    turtles_color: turtlesColor,
    turtles_image: image,
    turtles_favoritepizzaid: turtlesFavoritepizzaid,
    turtles_secondfavoritepizzaid: turtlesSecondfavoritepizzaid,
    turtles_weaponid: weaponId
  });

  if (!turtle) {
    return {
      status: 404,
      message: 'Обязательные поля: turtlesName, turtlesColor'
    };
  }

  return turtle
}

async function UpdateTurtle(body) {
  const turtlesId = parseInt(body.turtles_id);
  const turtlesName = body.turtles_name;
  const turtlesColor = body.turtles_color;
  const image = body.turtles_image;
  const turtlesFavoritepizzaid = body.turtles_favoritepizzaid;
  const turtlesSecondfavoritepizzaid = body.turtles_secondfavoritepizzaid;
  const weaponId = body.turtles_weaponid;

  if (!(turtlesId && turtlesName && turtlesColor)) {
    return {
      status: 401,
      message: 'Обязательные поля: turtlesId, turtlesName, turtlesColor'
    };
  }

  const turtle = await db.turtles.update({
    turtles_name: turtlesName,
    turtles_color: turtlesColor,
    turtles_image: image,
    turtles_favoritepizzaid: turtlesFavoritepizzaid,
    turtles_secondfavoritepizzaid: turtlesSecondfavoritepizzaid,
    turtles_weaponid: weaponId
  }, {
    where: {
      turtles_id: turtlesId
    },
    returning: true
  });

  if (!turtle) {
    return {
      status: 404,
      message: `Черепашка с ID ${ turtlesId } не найдена`
    };
  }

  return turtle[1][0]
}

async function DeleteTurtle(body) {
  const turtleId = parseInt(body.turtles_id);

  if (isNaN(turtleId)) {
    return {
      status: 401,
      message: 'Id не является числом'
    };
  }

  const deletedTurtle = await db.turtles.findOne({
    where: {
      turtles_id: turtleId
    }
  });

  if (!deletedTurtle) {
    return {
      status: 401,
      message: 'Черепаха не найдена'
    };
  }

  await db.turtles.destroy({
    where: {
      turtles_id: turtleId
    }
  });

  return deletedTurtle;
}

async function FindTurtlesByFavoritePizza(pizzasName) {
  const pizzas = await db.pizzas.findOne({
    where: { pizzas_name: pizzasName },
  });

  if (!pizzas) {
    return []
  }

  return await db.turtles.findAll({
    include: [
      {
        model: db.weapons
      },
      {
        model: db.pizzas,
        as: "first"
      },
      {
        model: db.pizzas,
        as: "second"
      }
    ],
    where: {
      [Op.or]: [
        { turtles_favoritepizzaid: pizzas.pizzas_id },
        { turtles_secondfavoritepizzaid: pizzas.pizzas_id }
      ]
    }
  });
}

async function AddTurtleImage(turtleId, image) {
  const turtle = await db.turtles.findByPk(turtleId);
  if (!turtle){
    return{
      status: 401,
      message: 'Такой черепашки нет'
    }
  }
  return await turtle.update({ turtles_image: image });
}

async function AddTurtleWeapon(body) {
  const turtlesId = body.turtles_id;
  const weaponId = body.weapons_id;

  if (isNaN(turtlesId)) {
    return {
      status: 401,
      message: 'Такой черепашки нет'
    };
  }

  if (isNaN(weaponId)) {
    return {
      status: 401,
      message: 'Такого оружия нет'
    };
  }

  return await db.turtles.update({
    turtles_weaponid: weaponId
  }, {
    where: {
      turtles_id: turtlesId
    },
    returning: true
  });
}

async function DeleteTurtleWeapon(body) {
  const turtlesId = body.turtles_id;

  if (isNaN(turtlesId)) {
    return {
      status: 401,
      message: 'Id не является числом'
    };
  }

  return await db.turtles.update({
    turtles_weaponid: null
  }, {
    where: {
      turtles_id: turtlesId
    },
    returning: true
  })
}

async function AddTurtleFirstFavoritePizza(body) {
  const turtlesId = body.turtles_id;
  const pizzaId = body.turtles_favoritepizzaid;

  if (isNaN(turtlesId)) {
    return {
      status: 401,
      message: 'Такой черепашки нет'
    };
  }

  if (isNaN(pizzaId)) {
    return {
      status: 401,
      message: 'Такого оружия нет'
    };
  }

  return await db.turtles.update({
    turtles_favoritepizzaid: pizzaId
  }, {
    where: {
      turtles_id: turtlesId
    },
    returning: true
  });
}

async function DeleteTurtleFirstFavoritePizza(body) {
  const turtlesId = body.turtles_id;

  if (isNaN(turtlesId)) {
    return {
      status: 401,
      message: 'Id не является числом'
    };
  }

  const [_, [updatedTurtle]] = await db.turtles.update(
    {
      turtles_favoritepizzaid: null
    },
    {
      where: {
        turtles_id: turtlesId
      },
      returning: true
    }
  );

  if (!updatedTurtle) {
    return {
      status: 401,
      message: 'Черепаха не найдена'
    };
  }

  return updatedTurtle;
}

async function AddTurtleSecondFavoritePizza(body) {
  const turtlesId = body.turtles_id;
  const pizzaId = body.turtles_secondfavoritepizzaid;

  if (isNaN(turtlesId)) {
    return {
      status: 401,
      message: 'Такой черепашки нет'
    };
  }

  if (isNaN(pizzaId)) {
    return {
      status: 401,
      message: 'Такого оружия нет'
    };
  }

  return await db.turtles.update({
    turtles_secondfavoritepizzaid: pizzaId
  }, {
    where: {
      turtles_id: turtlesId
    },
    returning: true
  });
}


async function DeleteTurtleSecondFavoritePizza(body) {
  const turtlesId = body.turtles_id;

  if (isNaN(turtlesId)) {
    return {
      status: 401,
      message: 'Id не является числом'
    };
  }

  return await db.turtles.update({
    turtles_secondfavoritepizzaid: null
  }, {
    where: {
      turtles_id: turtlesId
    },
    returning: true
  })
}

module.exports = {
  CreateTurtle,
  FindAllTurtles,
  AddTurtleWeapon,
  AddTurtleImage,
  AddTurtleFirstFavoritePizza,
  AddTurtleSecondFavoritePizza,
  FindTurtleById,
  DeleteTurtleWeapon,
  DeleteTurtleFirstFavoritePizza,
  DeleteTurtleSecondFavoritePizza,
  DeleteTurtle,
  UpdateTurtle,
  getTurtleImage,
  FindAllTurtlesJSON,
  storage
}

