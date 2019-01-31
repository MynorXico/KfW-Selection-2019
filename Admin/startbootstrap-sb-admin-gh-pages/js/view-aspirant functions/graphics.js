var densityCanvas = document.getElementById("densityChart");

Chart.defaults.global.defaultFontFamily = "Lato";
Chart.defaults.global.defaultFontSize = 18;

var densityData = {
  label: 'Porcentaje de ponderación',
  data: [79, 90, 80, 86],
  backgroundColor: [
    'rgba(240, 37, 20, 0.6)',
    'rgba(172, 204, 20, 0.6)',
    'rgba(92, 130, 255, 0.6)',
    'rgba(255, 126, 0, 0.6)'
  ],
  borderColor: [
    'rgba(240, 37, 20, 1)',
    'rgba(172, 204, 20, 1)',
    'rgba(92, 130, 255, 1)',
    'rgba(255, 126, 0, 1)'
  ],
  borderWidth: 2,
  hoverBorderWidth: 0
};

var chartOptions = {
  responsive: true,
  scales: {
    xAxes:[{
      gridLines: {
        borderDash: [2, 5],
        display: true,
        color: "gray"
      },
      ticks: {
        min: 0,
        max: 100,
        stepSize: 10,
        fontSize: 20
      },
      scaleLabel: {
        display: true,
        labelString: "Porcentaje",
        fontColor: "blue"
      }
    }],
    yAxes: [{
      barPercentage: 0.5,
      gridLines: {
        color: "gray",
        borderDash: [2, 5],
      },
      ticks: {
        fontSize: 20
      },
      scaleLabel: {
        display: true,
        labelString: "Ámbitos",
        fontColor: "blue"
      }
    }]
  },
  elements: {
    rectangle: {
      borderSkipped: 'left',
    }
  }
};

var barChart = new Chart(densityCanvas, {
  type: 'horizontalBar',
  data: {
    labels: ["Económico", "Demográfico", "Académico", "Laboral"],
    datasets: [densityData],
  },
  options: chartOptions
});