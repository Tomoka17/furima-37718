const pay = () => {
  Payjp.setPublicKey("pk_test_3758c5a1b90e1759b7b3231c");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) =>{
    e.preventDefault();

    const formResult = document.querySelector(".transaction-form-wrap");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_destination[number]"),
      cvc: formData.get("order_destination[cvc]"),
      exp_month: formData.get("order_destination[exp_month]"),
      exp_year: `20${formData.get("order_destination[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.querySelector(".transaction-form-wrap");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.querySelector(".transaction-form-wrap").submit();
    });
  });
};

window.addEventListener("load", pay);