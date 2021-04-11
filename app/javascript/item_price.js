window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () =>{
    const inputValue = priceInput.value;
    console.log(inputValue)
    const addTaxDom = document.getElementById("add-tax-price");
    const proFit = (Math.floor(inputValue * 0.1));
    addTaxDom.innerHTML = proFit
    const profitValue = document.getElementById("profit");
    profitValue.innerHTML = (Math.floor(inputValue - proFit));
  });
});

