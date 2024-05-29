module.exports = function calculateSubscriptionPrice(data) {
  const { age, income } = data;

  let basePrice = 100;

  if (age < 18) {
    basePrice -= 20;
  } else if (age > 65) {
    basePrice -= 30;
  }

  if (income < 30000) {
    basePrice -= 10;
  } else if (income > 100000) {
    basePrice += 20;
  }

  return { ...data, subscriptionPrice: basePrice };
};
