const { DataTypes } = require('sequelize');

module.exports = (sequelize) => {
  let pizzas = sequelize.define('pizzas',
    {
      pizzas_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
      },
      pizzas_name: {
        type: DataTypes.STRING,
        allowNull: false
      },
      pizzas_calories: {
        type: DataTypes.INTEGER,
        allowNull: false
      },
      pizzas_description: {
        type: DataTypes.STRING,
        allowNull: true
      }
    },
    {
      timestamps: false,
      tableName: 'pizzas'
    }
  );

  pizzas.associate = (models) => {
    pizzas.hasMany(models.turtles,
      {
        foreignKey: {
          name: 'turtles_favoritepizzaid',
        }
      }
    );
    pizzas.hasMany(models.turtles,
      {
        foreignKey: {
          name: 'turtles_secondfavoritepizzaid'
        }
      }
    )
  };
  return pizzas;
};
