function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

export default function(server) {
  var userCount = getRandomInt(5, 7),
  pricingCount = getRandomInt(3, 3);
  server.createList('user', userCount);
  server.createList('pricing', pricingCount);
}
