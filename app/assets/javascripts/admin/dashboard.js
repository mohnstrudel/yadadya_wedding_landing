if($("body").hasClass("dashboard")){
  var data = $('#chartData').data('labels');
  var keys = Object.keys(data);
  var values = Object.values(data);
  var lineData = {
    
    labels: keys,
    datasets: [
        {
            label: "Заявки",
            backgroundColor: "rgba(26,179,148,0.5)",
            borderColor: "rgba(26,179,148,0.7)",
            pointBackgroundColor: "rgba(26,179,148,1)",
            pointBorderColor: "#fff",
            data: values
        }
    ]
  };

  var lineOptions = {
    responsive: true
  };


  var ctx = document.getElementById("lineChart").getContext("2d");
  new Chart(ctx, {type: 'line', data: lineData, options:lineOptions});

}

  