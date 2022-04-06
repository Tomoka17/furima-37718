const pay = () => {
  Payjp.setPublicKey("pk_test_3758c5a1b90e1759b7b3231c");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) =>{
    e.preventDefault();

    const formResult = document.getElementsByClassName("credit-card-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_destination[number]");
      cvc: formData.get("order_destination[cvc]");
      exp_month: formData.get("order_destination[exp_month]");
      exp_year: `20${formData.get("order_destination[exp_year]")}`;
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);