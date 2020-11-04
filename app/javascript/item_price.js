window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const addProfit = document.getElementById("profit")
  priceInput.addEventListener("input", () => {
  const input_price = document.getElementById("item-price").value;
  const tax = 0.1
  const price = input_price * tax
  const profit = input_price - price
    
    addTaxDom.innerHTML = Math.floor(price)
    addProfit.innerHTML = Math.floor(profit)
    console.log(inputPrice)
 })
});
