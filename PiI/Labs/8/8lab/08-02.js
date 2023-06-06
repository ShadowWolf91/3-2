const express = require('express');
const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');

const app = express();
const port = 3000;

// Имитация списка пользователей и хранение их паролей
const users = {
  user1: 'password1',
  user2: 'password2',
  user3: 'password3'
};

// Секретный ключ для подписи токена
const secretKey = 'mySecretKey';

// middleware для обработки тела запроса в формате JSON
app.use(bodyParser.json());

// Обработчик POST-запроса для аутентификации
app.post('/login', (req, res) => {
  const { username, password } = req.body;

  // Проверка, что пользователь с таким логином существует и пароль верный
  if (!users[username] || users[username] !== password) {
    return res.status(401).json({ message: 'Неправильный логин или пароль' });
  }

  // Создание токена с данными пользователя и секретным ключом
  const token = jwt.sign({ username }, secretKey, { expiresIn: '1m' });

  // Возвращение токена в ответе
  res.json({ token });
});

// Middleware для проверки токена перед доступом к защищенным ресурсам
function authenticateToken(req, res, next) {
  // Получение заголовка Authorization с токеном
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];

  if (!token) {
    // Токен не найден
    return res.status(401).json({ message: 'Невалидный токен' });
  }

  // Проверка валидности токена
  jwt.verify(token, secretKey, (err, decoded) => {
    if (err) {
      return res.status(401).json({ message: 'Невалидный токен' });
    }
    console.log(decoded)
    // Сохранение декодированных данных токена в объекте запроса
    req.user = decoded;
    next();
  });
}

// Обработчик GET-запроса для получения информации о пользователе
app.get('/profile', authenticateToken, (req, res) => {
  // Получение данных пользователя из объекта запроса
  const { username } = req.user;
  res.json({ username });
});

// Обработчик остальных запросов
app.use((req, res) => {
  res.status(404).send('404 Not Found');
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
