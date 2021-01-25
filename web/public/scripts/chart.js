function onLoad() {
    const loadTheme = () => {
        const stylePrefix = '.bg-';
        const styleSheet = [...document.styleSheets].find((sheet) => sheet.href.includes('bootstrap'));
        const ruleFilter = rule => rule.selectorText && rule.selectorText.startsWith(stylePrefix);
        return [...styleSheet.rules].filter(ruleFilter).reduce((result, rule) => {
            result[rule.selectorText.substr(stylePrefix.length)] = rule.style.backgroundColor;
            return result;
        }, {});
    }

    const theme = loadTheme();

    const buildChart = (canvas) => {
        const context = canvas.getContext('2d');
        canvas.width = canvas.clientWidth;
        canvas.height = canvas.clientHeight;
        context.fillStyle = theme.dark;
        context.fillRect(0, 0, canvas.width, canvas.height);
    };

    const charts = document.getElementsByClassName('chart');
    for (let chart of charts) buildChart(chart);
}

addEventListener('load', onLoad);