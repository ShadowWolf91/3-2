const { Op } = require("sequelize");
const db = require("../models/db.js");

// транзакция
async function CheckTran() {
  await db.sequelize.transaction(async (t) => {
    try {
      const pizzas = await db.pizzas.findAll({
        where:
          { pizzas_calories: { [Op.gt]: 1500 } }, transaction: t
      });

      await Promise.all(pizzas.map((pizza) => {
        pizza.pizzas_description = pizza.pizzas_description ? pizza.pizzas_description + " SUPER FAT!" : "SUPER FAT!";
        return pizza.save({ transaction: t });
      }));
    } catch (err) {
      await t.rollback();
      console.error(err);
    }
  });
}

// CheckTran();

async function FindPizzas(calories) {
  if (calories) {
    if (!/(gt|lt)-(\d+)/.test(calories)) {
      return {
        message: 'invalid query',
        status: 401
      };
    }

    const values = calories.match(/(gt|lt)-(\d+)/)

    return await db.pizzas.findAll({
      where: {
        pizzas_calories: {
          [Op[values[1]]]: parseInt(values[2]),
        }
      }
    });
  }
  return await db.pizzas.findAll();
}

async function FindPizzaById(pizzasId) {
  const id = parseInt(pizzasId)

  if (isNaN(id)) {
    return {
      status: 401,
      message: 'Id не являетя числом'
    };
  }

  const pizza = await db.pizzas.findOne({
    where: {
      pizzas_id: id
    }
  })

  if (!pizza) {
    return {
      status: 404,
      message: `Пицца с ID ${ pizzasId } не найдена`
    };
  }

  return pizza
}

async function CreatePizza(body) {
  const pizzaName = body.pizzas_name;
  const pizzaCalories = parseInt(body.pizzas_calories);
  const pizzaDescription = body.pizzas_description;

  if (!(pizzaCalories && pizzaName && pizzaDescription)) {
    return {
      status: 401,
      message: 'Обязательные поля: pizzas_name, pizzas_calories, pizzas_description'
    };
  }

  if (isNaN(pizzaCalories)) {
    return {
      status: 401,
      message: 'pizzas_calories не являетя числом'
    };
  }

  if (pizzaCalories > 2000 || pizzaCalories < 0) {
    return {
      status: 401,
      message: 'Поле pizzaCalories значение должно быть в диапазоне от 0 до 2000'
    }
  }

  const pizza = await db.pizzas.create({
    pizzas_name: pizzaName,
    pizzas_calories: pizzaCalories,
    pizzas_description: pizzaDescription
  })

  if (!pizza) {
    return {
      status: 401,
      message: 'Пицца не создана'
    };
  }

  return pizza
}

async function UpdatePizza(body) {
  const pizzaId = parseInt(body.pizzas_id);
  const pizzaName = body.pizzas_name;
  const pizzaCalories = parseInt(body.pizzas_calories);
  const pizzaDescription = body.pizzas_description;

  if (isNaN(pizzaId)) {
    return {
      status: 401,
      message: 'pizzas_id не являетя числом'
    };
  }

  if (pizzaCalories && isNaN(pizzaCalories)) {
    return {
      status: 401,
      message: 'pizzas_calories не являетя числом'
    };
  }

  if (!pizzaId) {
    return {
      status: 401,
      message: 'Обязательные поля: pizzaId'
    };
  }

  if (pizzaCalories && (pizzaCalories > 2000 || pizzaCalories < 0)) {
    return {
      status: 401,
      message: 'Поле pizzaCalories значение должно быть в диапазоне от 0 до 2000'
    }
  }

  const pizza = await db.pizzas.update(
    {
      pizzas_name: pizzaName,
      pizzas_calories: pizzaCalories,
      pizzas_description: pizzaDescription
    },
    {
      where: {
        pizzas_id: pizzaId
      },
      returning: true
    });

  if (!pizza) {
    return {
      status: 401,
      message: 'Пицца не обновлена'
    };
  }

  return pizza[1][0]
}

async function DeletePizza(body) {
  const pizzaId = parseInt(body.pizzas_id);

  if (isNaN(pizzaId)) {
    return {
      status: 401,
      message: 'pizzas_id не являетя числом'
    };
  }
  const deletedPizza = await db.pizzas.findOne({
    where: {
      pizzas_id: pizzaId
    }
  });

  if (!deletedPizza) {
    return {
      status: 401,
      message: 'Пицца не найдена'
    };
  }

  await db.pizzas.destroy({
    where: {
      pizzas_id: pizzaId
    }
  });

  return deletedPizza;
}

module.exports = {
  FindPizzas,
  FindPizzaById,
  CreatePizza,
  UpdatePizza,
  DeletePizza
}

