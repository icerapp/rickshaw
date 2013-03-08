:: Assuming NodeJS is installed
:: Assuming jshint, clean-css and uglify-js are installed with "npm install -g"
:: Run this script in NodeJS command prompt

@echo off


:: cleanup
echo Cleanup ...
DEL /F /Q rickshaw.css rickshaw.js rickshaw.min.*


:: run jshint
echo Run jshint ...
@call jshint src\js


:: create rickshaw.css and rickshaw.js
echo Creating rickshaw.css ...
COPY /B src\css\detail.css + ^
src\css\graph.css + ^
src\css\legend.css ^
rickshaw.css > NUL

echo Creating rickshaw.js ...
COPY /B ^
src\js\Rickshaw.js + ^
src\js\Rickshaw.Class.js + ^
src\js\Rickshaw.Compat.ClassList.js + ^
src\js\Rickshaw.Graph.js + ^
src\js\Rickshaw.Fixtures.Color.js + ^
src\js\Rickshaw.Fixtures.RandomData.js + ^
src\js\Rickshaw.Fixtures.Time.js + ^
src\js\Rickshaw.Fixtures.Number.js + ^
src\js\Rickshaw.Color.Palette.js + ^
src\js\Rickshaw.Graph.Ajax.js + ^
src\js\Rickshaw.Graph.Annotate.js + ^
src\js\Rickshaw.Graph.Axis.Time.js + ^
src\js\Rickshaw.Graph.Axis.X.js + ^
src\js\Rickshaw.Graph.Axis.Y.js + ^
src\js\Rickshaw.Graph.Behavior.Series.Highlight.js + ^
src\js\Rickshaw.Graph.Behavior.Series.Order.js + ^
src\js\Rickshaw.Graph.Behavior.Series.Toggle.js + ^
src\js\Rickshaw.Graph.HoverDetail.js + ^
src\js\Rickshaw.Graph.JSONP.js + ^
src\js\Rickshaw.Graph.Legend.js + ^
src\js\Rickshaw.Graph.RangeSlider.js + ^
src\js\Rickshaw.Graph.Renderer.js + ^
src\js\Rickshaw.Graph.Renderer.Line.js + ^
src\js\Rickshaw.Graph.Renderer.Stack.js + ^
src\js\Rickshaw.Graph.Renderer.Bar.js + ^
src\js\Rickshaw.Graph.Renderer.Area.js + ^
src\js\Rickshaw.Graph.Renderer.ScatterPlot.js + ^
src\js\Rickshaw.Graph.Smoother.js + ^
src\js\Rickshaw.Graph.Unstacker.js + ^
src\js\Rickshaw.Series.js + ^
src\js\Rickshaw.Series.FixedDuration.js ^
rickshaw.js > NUL


:: generate rickshaw.min.css and rickshaw.min.js
echo Generating rickshaw.min.css ...
call cleancss rickshaw.css > rickshaw.min.css

echo Generating rickshaw.min.js ...
call uglifyjs --reserved-names "$super" rickshaw.js > rickshaw.min.js

echo Done!