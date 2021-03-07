google.charts.load('current', { packages: ['corechart'] });
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
    // GET THE DATA
    // USE ARRAY OR DATATABLE
    const data = google.visualization.arrayToDataTable([
        ['Year', 'Sales'],
        ['2004',  2000],
        ['2005',  4000],
        ['2006',  10000],
        ['2007',  3500],
    ]);

    const dataTable = new google.visualization.DataTable();
    dataTable.addColumn({type: 'string', 'id': 'Year'});
    dataTable.addColumn({type: 'number', 'id': 'Sales'});
    dataTable.addRows([
        ['2004', 2000],
        ['2005', 4000],
        ['2006', 10000],
        ['2007', 3500],
    ]);

    // LEARN THE OPTIONS
    // https://developers.google.com/chart/interactive/docs/gallery/linechart#configuration-options
    var options = {
        curveType: 'none',
        chartArea : {
            width: '90%',
            height: '90%',
        },
        animation: {
            startup: true,
            easing: 'in',
            duration: 3000,
        },
        legend: {
            position: 'none',
        },
        explorer: {
            axis: 'horizontal',
        },
        vAxis: { 
            title: 'Balance', 
            titleTextStyle: { 
                color: '#660000',
                italic: false,
            },
            format: 'currency',
        },
        hAxis: {
            title: 'Date', 
            titleTextStyle: { 
                color: '#660000',
                italic: false,
            },
        },
        height: 550,
        width: 900,
    };

    // CREATE AND DRAW THE CHART
    var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
    chart.draw(dataTable, options);
}