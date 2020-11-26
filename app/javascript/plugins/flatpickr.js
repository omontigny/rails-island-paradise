import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css"; // Note this is important! 
import rangePlugin from "flatpickr/dist/plugins/rangePlugin" ;
import { totalPriceCalculation } from "../components/total_price_calculation";


flatpickr("#start_date_datepikr", {
  dateFormat: "d/m/Y",
   "plugins": [new rangePlugin({ input: "#end_date_datepikr"})],
   onChange: ( selectedDates ) => {
    totalPriceCalculation(selectedDates[0], selectedDates[1]);
   }
});
