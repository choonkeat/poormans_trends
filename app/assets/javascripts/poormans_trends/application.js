// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require highcharts
//= require highcharts/highcharts-more
//= require_tree .

$(function() {
  var chartlineWidth = 6;
  $('.chart[data-chart]').each(function(index, ele) {
    ele = $(ele);
    ele.highcharts({
      credits: { enabled: false },
      chart: {
        type: 'area',
        height: 100,
      },
      tooltip: {
        backgroundColor: null,
        borderWidth: 0,
        shadow: false,
        useHTML: true,
        hideDelay: 0,
        padding: 0
      },
      title: { text: "" },
      xAxis: {
        type: "datetime",
        labels: {
          enabled: false
        },
        title: {
          text: null
        },
        startOnTick: false,
        endOnTick: false,
        tickPositions: []
      },
      yAxis: {
        endOnTick: false,
        startOnTick: false,
        labels: {
          enabled: true
        },
        title: {
          text: null
        }
      },
      legend: {
        enabled: false
      },
      plotOptions: {
        series: {
          animation: false,
          lineWidth: chartlineWidth,
          shadow: false,
          states: {
            hover: {
              lineWidth: chartlineWidth
            }
          },
          marker: {
            states: {
              hover: false,
              hover: {
                radius: chartlineWidth
              }
            },
            radius: 1
          },
          fillOpacity: 0.3
        },
        area: {
          states: {
            hover: false,
          }
        }
      },
      series: ele.data('chart')
    });
  });
})
