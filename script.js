let money = 50000;
let incomePerMinute = 1500;
let garageLevel = 1;
let carsOwned = 1;
let totalProfit = 0;

const moneyEl = document.getElementById("money");
const moneyStatEl = document.getElementById("moneyStat");
const incomeStatEl = document.getElementById("incomeStat");
const garageStatEl = document.getElementById("garageStat");
const carsStatEl = document.getElementById("carsStat");
const profitStatEl = document.getElementById("profitStat");
const statusText = document.getElementById("statusText");

function formatMoney(value) {
  const sign = value < 0 ? "-" : "";
  value = Math.abs(value);
  const formatted = value.toLocaleString("pt-BR");
  return sign + "$" + formatted;
}

function updateUI() {
  moneyEl.textContent = formatMoney(money);
  moneyStatEl.textContent = formatMoney(money);
  incomeStatEl.textContent = formatMoney(incomePerMinute);
  garageStatEl.textContent = "Nível " + garageLevel;
  carsStatEl.textContent = carsOwned;
  profitStatEl.textContent = formatMoney(totalProfit);
}

function setStatus(msg) {
  statusText.innerHTML = msg;
}

document.getElementById("workBtn").addEventListener("click", () => {
  const reward = 2500 + Math.random() * 3000;
  money += reward;
  totalProfit += reward;
  setStatus("Status: trabalho concluído.<br>Lucro recebido: " + formatMoney(reward));
  updateUI();
});

document.getElementById("buyCarBtn").addEventListener("click", () => {
  const price = 15000 + (carsOwned * 6500);

  if (money >= price) {
    money -= price;
    carsOwned += 1;
    incomePerMinute += 250;
    setStatus("Status: carro comprado.<br>Nova renda: " + formatMoney(incomePerMinute) + " por minuto");
    updateUI();
  } else {
    setStatus("Status: dinheiro insuficiente.<br>Faltam " + formatMoney(price - money));
  }
});

document.getElementById("upgradeBtn").addEventListener("click", () => {
  const price = 20000 * garageLevel;

  if (money >= price) {
    money -= price;
    garageLevel += 1;
    incomePerMinute += 600;
    setStatus("Status: garagem melhorada.<br>Renda aumentada para " + formatMoney(incomePerMinute) + " por minuto");
    updateUI();
  } else {
    setStatus("Status: upgrade bloqueado.<br>Faltam " + formatMoney(price - money));
  }
});

document.getElementById("bonusBtn").addEventListener("click", () => {
  const bonus = 5000;
  money += bonus;
  totalProfit += bonus;
  setStatus("Status: bônus recebido.<br>Você ganhou " + formatMoney(bonus));
  updateUI();
});

setInterval(() => {
  money += Math.floor(incomePerMinute / 60);
  totalProfit += Math.floor(incomePerMinute / 60);
  updateUI();
}, 1000);

updateUI();
