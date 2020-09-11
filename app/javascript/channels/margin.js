window.addEventListener("load", calculation);

  function calculation() {
    const item_price = document.getElementById("item-price");
    let margin = document.getElementById("add-tax-price");
    let profit = document.getElementById("profit");
      item_price.addEventListener("input", () => {
        const price = document.getElementById("item-price").value;
          margin.innerHTML = Math.floor(price * 0.1);
          profit.innerHTML = (price - margin.innerHTML);
  });
  }