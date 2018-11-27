$(document).on('turbolinks:load', function() {
  if ($('#echart8').length > 0) {
    'use strict' 

    /*-----echartArea2-----*/
    var areaData2 = [
      {
        name: 'Sales',
        type: 'line',
        smooth: true,
        data: [0, 100000, 200000, 300000, 600000, 650000],
        symbolSize: 20,
        lineStyle: {
          normal: {
            width: 4,
            color: new echarts.graphic.LinearGradient(
              0, 0, 0, 1,
              [
                { offset: 0, color: '#9f78ff' },
                { offset: 1, color: '#32cafe' }
              ]
            )
          }
        },
      },

    ];

    var optionArea2 = {
      grid: {
        top: '6',
        right: '12',
        bottom: '17',
        left: '50',
      },
      xAxis: {
        data: ['Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov'],
        boundaryGap: false,
        axisLine: {
          lineStyle: { color: '#c0dfd8' }
        },
        axisLabel: {
          fontSize: 10,
          color: '#000',
          display: 'false'
        }
      },
      tooltip: {
        show: true,
        showContent: true,
        alwaysShowContent: true,
        triggerOn: 'mousemove',
        trigger: 'axis',
        axisPointer:
        {
          label: {
            show: false,
          }
        }

      },
      yAxis: {
        splitLine: {
          lineStyle: { color: '#eaeaea' },
          display: false
        },
        axisLine: {
          lineStyle: { color: '#eaeaea' },
          display: false
        },
        axisLabel: {
          fontSize: 10,
          color: '#000'
        }
      },
      series: areaData2,
      color: ['#9f78ff', '#32cafe']
    };

    var chartArea2 = document.getElementById('echartArea2');
    var areaChart2 = echarts.init(chartArea2);
    areaChart2.setOption(optionArea2);

    var my_data = function () { 
      var tmp = []; 
      $.ajax({
        async: false,
        url: '/dashboard/get_bookings_per_day',
        type: 'GET',
        dataType: "json",
        success: function (data) {
          tmp = data;
        }
      });
      return tmp;
    }();

    var chartdata5 = [{
      name: 'data',
      type: 'line',
      smooth: true,
      data: my_data,
      lineStyle: {
        normal: { width: 1 }
      },
      symbolSize:15,
      itemStyle: {
        normal: {
          areaStyle: { 
            type: 'default',
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1,[{offset: 0, color: '#9f78ff'}, {offset: 1, color: '#32cafe'}])
          }
        }
      }
    }];

    var option8 = {
      grid: {
        top: '6',
        right: '0',
        bottom: '17',
        left: '25',
      },
      xAxis: {
        data: ['LUN', 'MAR', 'MIE', 'JUE', 'VIE', 'SAB','DOM'],
        axisLine: {
          lineStyle: {
            color: '#eaeaea'
          },		
        },	  
        axisLabel: {
          fontSize: 10,
          color: '#000'
        }
      },
    tooltip: {
      show: true,
      showContent: true,
      alwaysShowContent: true,
      triggerOn: 'mousemove',
      trigger: 'axis',
      axisPointer:
      {
        label: {
          show: false,
        },
      }
    },
    yAxis: {
      splitLine: {
        lineStyle: {
          color: '#eaeaea'
        }
      },
      axisLine: {
        lineStyle: {
          color: '#eaeaea'
        }
      },
      axisLabel: {
        fontSize: 10,
        color: '#000'
      }
    },
    series: chartdata5,
    color:[ '#32cafe']
    };

    var chart8 = document.getElementById('echart8');
    var lineChart2 = echarts.init(chart8);
    lineChart2.setOption(option8);
  }
});