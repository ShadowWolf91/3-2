module.exports.bodyMiddleware = (req, res, next) => {
  console.log(req.body)
  if (!req.body) {
    return res.json({
      status: 401,
      message: 'Тело не найдено'
    });
  }
  next()
}