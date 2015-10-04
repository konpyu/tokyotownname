class @Archive
  constructor: () ->
    options =
      segmentShowStroke : false
      segmentStrokeWidth : 0
      percentageInnerCutout : 10
      animateRotate : false
      animateScale : false
    data = [
      {
          value: 300,
          color:"Orange",
          highlight: "Orange",
          label: "Got"
      },
      {
          value: 100,
          color: "#CCC",
          highlight: "#CCC",
          label: "non"
      }
    ]

    for i in [1..23]
      ctx = $('#lineChartCanvas-' + i)[0].getContext("2d")
      data[0]["value"] = Math.floor(Math.random(100)* 100) + 100
      new Chart(ctx).Pie(data,options)

    return 1
