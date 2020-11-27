// yarn install moment
import moment from "moment"

const totalPriceCalculation = (startDate, endDate) => {
  const startDateMoment = moment(startDate);
  const endDateMoment = moment(endDate);
  const numberOfDays = endDateMoment.diff(startDateMoment, "days");
  if (document.getElementById("price_per_day")) {
    const pricePerDay = document.getElementById("price_per_day").dataset.price;
    const totalPrice = numberOfDays * Number.parseInt( pricePerDay, 10 );
    const totalPriceBox = document.getElementById("total_price");
    if (numberOfDays > 0 ){
      totalPriceBox.innerHTML = totalPrice;
   } else {
      totalPriceBox.innerHTML = 0;
    }
  }
};

export { totalPriceCalculation };
