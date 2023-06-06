const express = require('express');
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const session = require('express-session');

const app = express();

// Загрузка списка пользователей
const users = require('./users.json');

// Настройка сессии
app.use(session({
  secret: 'secret-key',
  resave: false,
  saveUninitialized: false
}));

// Настройка Passport
app.use(passport.initialize());
app.use(passport.session());
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// Настройка стратегии аутентификации
passport.use(new LocalStrategy(
  function(username, password, done) {
    const user = users.find(u => u.username === username && u.password === password);
    if (!user) {
      return done(null, false);
    }
    return done(null, user);
  }
));

// Сериализация и десериализация пользователя в сессии
passport.serializeUser(function(user, done) {
  done(null, user.id);
});

passport.deserializeUser(function(id, done) {
  const user = users.find(u => u.id === id);
  if (!user) {
    return done(new Error('User not found'));
  }
  done(null, user);
});

// Маршрут для отображения страницы логина
app.get('/login', function(req, res) {
  res.send(`
    <form method="post" action="/login">
      <input type="text" name="username" placeholder="Username" required>
      <input type="password" name="password" placeholder="Password" required>
      <button type="submit">Login</button>
    </form>
  `);
});

// Маршрут для обработки POST-запроса логина
app.post('/login', passport.authenticate('local', {
  successRedirect: '/profile',
  failureRedirect: '/login'
}));

// Маршрут для выхода из системы
app.get('/logout', function (req, res){
  req.session.destroy(function (err) {
    res.redirect('/login');
  });
});

// Маршрут для отображения профиля пользователя
app.get('/profile', function(req, res) {
  if (!req.isAuthenticated()) {
    res.redirect('/login');
    return;
  }
  console.log(req.user)
  res.send(`Welcome, ${req.user.username}!`);
});

// Маршрут по умолчанию для обработки несуществующих URI
app.use(function(req, res) {
  res.status(404).send('Page not found');
});

// Запуск сервера на порте 3000
app.listen(3000, function() {
  console.log('Server is running on port 3000');
});
