module.exports = (sequelize, DataTypes) => {
  const turtles = sequelize.define('turtles',
    {
      turtles_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
      },
      turtles_name: {
        type: DataTypes.STRING,
        allowNull: false
      },
      turtles_color: {
        type: DataTypes.STRING,
        allowNull: false
      },
      turtles_image: {
        type: DataTypes.STRING,
        allowNull: true
      }
    },
    {
      timestamps: false
    }
  )

  turtles.associate = (models) => {
    turtles.belongsTo(models.pizzas, {
      as: "first",
      foreignKey: {
        name: 'turtles_favoritepizzaid',
      }
    });

    turtles.belongsTo(models.pizzas, {
      as: "second",
      foreignKey: {
        name: 'turtles_secondfavoritepizzaid',
      }
    });

    turtles.belongsTo(models.weapons, {
      foreignKey: {
        name: 'turtles_weaponid',
      }
    });
  };
  return turtles;
};
