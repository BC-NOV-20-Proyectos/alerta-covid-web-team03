import "daterangepicker";
import "moment";
document.addEventListener("turbolinks:load", () => {
  $("#reservation").daterangepicker({
    locale: {
      format: 'YYYY/MM/DD'
    }
  });
});

