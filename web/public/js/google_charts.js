google.charts.load('current', { packages: ['corechart'] });
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
    // GET THE DATA
    var data = google.visualization.arrayToDataTable([
        ['Year', 'Sales'],
        ['2004',  1000],
        ['2005',  1170],
        ['2006',  660],
        ['2007',  1030]
    ]);

    // LEARN THE OPTIONS
    // https://developers.google.com/chart/interactive/docs/gallery/linechart#configuration-options
    var options = {
        title: 'Company Performance',
        curveType: 'none',
        vAxis: { title: 'Balance', titleTextStyle: { color: '#660000' } },
        hAxis: { title: 'Date', titleTextStyle: { color: '#660000' } },
        height: '430',
        width: '710',
    };

    // CREATE AND DRAW THE CHART
    var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
    chart.draw(data, options);
}