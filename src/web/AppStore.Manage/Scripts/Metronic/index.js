var Index = function () {


    return {

        //main function
        init: function () {
            App.addResponsiveHandler(function () {
                jQuery('.vmaps').each(function () {
                    var map = jQuery(this);
                    map.width(map.parent().width());
                });
            });
        },
        initCharts: function () {
            if (!jQuery.plot) {
                return;
            }

            function showTooltip(title, x, y, contents) {
                $('<div id="tooltip" class="chart-tooltip"><div class="date">' + title + '<\/div><div class="label label-success">CTR: ' + x / 10 + '%<\/div><div class="label label-danger">Imp: ' + x * 12 + '<\/div><\/div>').css({
                    position: 'absolute',
                    display: 'none',
                    top: y - 100,
                    width: 80,
                    left: x - 40,
                    border: '0px solid #ccc',
                    padding: '2px 6px',
                    'background-color': '#fff',
                }).appendTo("body").fadeIn(200);
            }

            function randValue() {
                return (Math.floor(Math.random() * (1 + 50 - 20))) + 10;
            }

            var pageviews = [
                [1, randValue()],
                [2, randValue()],
                [3, 2 + randValue()],
                [4, 3 + randValue()],
                [5, 5 + randValue()],
                [6, 10 + randValue()],
                [7, 15 + randValue()],
                [8, 20 + randValue()],
                [9, 25 + randValue()],
                [10, 30 + randValue()],
                [11, 35 + randValue()],
                [12, 25 + randValue()],
                [13, 15 + randValue()],
                [14, 20 + randValue()],
                [15, 45 + randValue()],
                [16, 50 + randValue()],
                [17, 65 + randValue()],
                [18, 70 + randValue()],
                [19, 85 + randValue()],
                [20, 80 + randValue()],
                [21, 75 + randValue()],
                [22, 80 + randValue()],
                [23, 75 + randValue()],
                [24, 70 + randValue()],
                [25, 65 + randValue()],
                [26, 75 + randValue()],
                [27, 80 + randValue()],
                [28, 85 + randValue()],
                [29, 90 + randValue()],
                [30, 95 + randValue()]
            ];

            var visitors = [
                [1, randValue() - 5],
                [2, randValue() - 5],
                [3, randValue() - 5],
                [4, 6 + randValue()],
                [5, 5 + randValue()],
                [6, 20 + randValue()],
                [7, 25 + randValue()],
                [8, 36 + randValue()],
                [9, 26 + randValue()],
                [10, 38 + randValue()],
                [11, 39 + randValue()],
                [12, 50 + randValue()],
                [13, 51 + randValue()],
                [14, 12 + randValue()],
                [15, 13 + randValue()],
                [16, 14 + randValue()],
                [17, 15 + randValue()],
                [18, 15 + randValue()],
                [19, 16 + randValue()],
                [20, 17 + randValue()],
                [21, 18 + randValue()],
                [22, 19 + randValue()],
                [23, 20 + randValue()],
                [24, 21 + randValue()],
                [25, 14 + randValue()],
                [26, 24 + randValue()],
                [27, 25 + randValue()],
                [28, 26 + randValue()],
                [29, 27 + randValue()],
                [30, 31 + randValue()]
            ];

            if ($('#site_statistics').size() != 0) {

                $.getJSON("/Home/GetRecentStatistics", null, function (data) {
                    if (data) {
                        pageviews = $.map(data[0], function (val, i) {
                            return [[val.Key, val.Value]];
                        });
                        visitors = $.map(data[1], function (val, i) {
                            return [[val.Key, val.Value]];
                        });
                        
                        $('#site_statistics_loading').hide();
                        $('#site_statistics_content').show();

                        var plot_statistics = $.plot($("#site_statistics"), [{
                                data: pageviews,
                                label: "用户数量"
                            }, {
                                data: visitors,
                                label: "新装应用"
                            }
                        ], {
                            series: {
                                points: {
                                    show: true
                                },
                                shadowSize: 2,
                                bars: {
                                    show: true,
                                    barWidth: 0.6,
                                    align: "center"
                                }
                            },
                            grid: {
                                hoverable: true,
                                clickable: true,
                                tickColor: "#eee",
                                borderWidth: 0
                            },
                            colors: ["#d12610", "#37b7f3", "#52e136"],
                            xaxis: {
                                labelWidth:10,
                                mode: "categories",
                                tickLength: 0
                            },
                            yaxis: {
                                ticks: 11,
                                tickDecimals: 0
                            }
                        });
                        
                        //var previousPoint = null;
                        //$("#site_statistics").bind("plothover", function (event, pos, item) {
                        //    $("#x").text(pos.x.toFixed(2));
                        //    $("#y").text(pos.y.toFixed(2));
                        //    if (item) {
                        //        if (previousPoint != item.dataIndex) {
                        //            previousPoint = item.dataIndex;

                        //            $("#tooltip").remove();
                        //            var x = item.datapoint[0].toFixed(2),
                        //                y = item.datapoint[1].toFixed(2);

                        //            showTooltip('24 Jan 2013', item.pageX, item.pageY, item.series.label + " of " + x + " = " + y);
                        //        }
                        //    } else {
                        //        $("#tooltip").remove();
                        //        previousPoint = null;
                        //    }
                        //});
                    }
                });
            }
        },
    };

}();