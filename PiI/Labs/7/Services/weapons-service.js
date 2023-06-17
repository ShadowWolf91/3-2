const { Op } = require("sequelize");
const db = require("../models/db.js");

async function FindAllWeapons(dps) {
  if (dps) {
    if (!/(gt|lt)-(\d+)/.test(dps)) {
      return {
        message: 'invalid query',
        status: 401
      };
    }

    const values = dps.match(/(gt|lt)-(\d+)/)
    return await db.weapons.findAll({
      where: {
        weapons_dps: {
          [Op[values[1]]]: parseInt(values[2]),
        }
      }
    })
  }

  return await db.weapons.findAll();
}

async function FindWeaponById(weaponId) {
  const id = parseInt(weaponId)

  if (isNaN(id)) {
    return {
      status: 401,
      message: 'Id не являетя числом'
    };
  }

  const weapon = await db.weapons.findOne({
    where: {
      weapons_id: id
    }
  });

  if (!weapon) {
    return {
      status: 404,
      message: `Оружия с ID ${ weaponId } не найдено`
    };
  }

  return weapon
}

async function CreateWeapons(body) {
  const weaponName = body.weapons_name;
  const weaponDPS = parseInt(body.weapons_dps);

  if (!(weaponName && weaponDPS)) {
    return {
      status: 401,
      message: 'Обязательные поля: weapons_name, weapons_dps'
    };
  }

  if (isNaN(weaponDPS)) {
    return {
      status: 401,
      message: 'weapons_dps не являетя числом'
    };
  }

  if (weaponDPS > 500 || weaponDPS < 0) {
    return {
      status: 401,
      message: 'Поле weapons_dps значение должно быть в диапазоне от 0 до 500'
    }
  }

  const weapon = await db.weapons.create({
    weapons_name: weaponName,
    weapons_dps: weaponDPS
  })

  if (!weapon) {
    return {
      status: 401,
      message: 'Орудие не создано'
    };
  }

  return weapon
}

async function UpdateWeapons(body) {
  const weaponsId = parseInt(body.weapons_id);
  const weaponsName = body.weapons_name;
  const weaponsDPS = parseInt(body.weapons_dps);

  if (isNaN(weaponsId)) {
    return {
      status: 401,
      message: 'weapons_id не являетя числом'
    };
  }

  if (weaponsDPS && isNaN(weaponsDPS)) {
    return {
      status: 401,
      message: 'weapons_dps не являетя числом'
    };
  }

  if (weaponsDPS && (weaponsDPS > 500 || weaponsDPS < 0)) {
    return {
      status: 401,
      message: 'Поле weapons_dps значение должно быть в диапазоне от 0 до 500'
    }
  }

  const weapon = await db.weapons.update({
    weapons_name: weaponsName,
    weapons_dps: weaponsDPS ? weaponsDPS : undefined
  }, {
    where: {
      weapons_id: weaponsId
    },
    returning: true
  })

  if (!weapon) {
    return {
      status: 401,
      message: 'Оружие не обновлено'
    };
  }

  return weapon[1][0]
}

async function DeleteWeapons(body) {
  const weaponId = parseInt(body["weapons_id"]);

  if (isNaN(weaponId)) {
    return {
      status: 401,
      message: 'weapons_id не являетя числом'
    };
  }

  const deletedWeapon = await db.weapons.findOne({
    where: {
      weapons_id: weaponId
    }
  });

  if (!deletedWeapon) {
    return {
      status: 401,
      message: 'Оружие не найдено'
    };
  }

  await db.weapons.destroy({
    where: {
      weapons_id: weaponId
    }
  });

  return deletedWeapon;
}

module.exports = {
  FindAllWeapons,
  FindWeaponById,
  CreateWeapons,
  UpdateWeapons,
  DeleteWeapons
}