module.exports = (sequelize, DataTypes) => {
  const weapons = sequelize.define('weapons',
    {
      weapons_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
      },
      weapons_name: {
        type: DataTypes.STRING,
        allowNull: false
      },
      weapons_dps: {
        type: DataTypes.INTEGER,
        allowNull: false
      }
    },
    {
      timestamps: false
    }
  )

  // weapons.associate = (models) => {
  //   console.log(models.turtles.tableAttributes)
  //   weapons.hasMany(models.turtles,
  //     {
  //       foreignKey: 'turtles_weaponid'
  //     }
  //   );
  // };
  return weapons;
};
