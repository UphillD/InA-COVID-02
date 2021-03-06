<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title> COVID-02 Project</title>
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<script src="https://unpkg.com/papaparse@5.2.0/papaparse.min.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="./src/script.js"></script>
	<script src="./src/chart.js"></script>
	<script src="./src/macros.js"></script>
	<link rel="stylesheet" type="text/css" href="./src/style.css">
	<link rel="icon" type="image/png" href="./src/favicon.png"/>
	
</head>
<body>

	<div id="topSection">
		<div class="header" id="hleft">
			Karteris Antonios<br>
			03112076
		</div>
		<div class="header" id="hcenter">
			COVID-02 Project<br>
			Internet & Applications
		</div>
		<div class="header" id="hright">
			<a href="https://github.com/UphillD/InA-COVID-02">GitHub</a><br>
			<a href="https://www.semanticscholar.org/cord19">CORD-19 Dataset</a>
		</div>
	</div>

	<div id="middleSection">
		<div id="formContainer">
			<form name="searchForm" method="post" action="searchServlet">
				<input type="text" name="query" id="input" placeholder="Search..."/>
				<input type="submit" id="submit" value="&#xf00e;"/>
			</form>
		</div>
	</div>
	
	<div id="tableSection">
		<table id="finalTable">
			<thead>
				<tr>
					<th>UID</th>
					<th>Title</th>
					<th>Publish Date</th>
					<th>Authors</th>
					<th>Drug Mentioned in</th>
					<th>Mentions</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	
	<div id="bottomSection">
		<div id="results">
		</div>
		<figure class="highcharts-figure">
			<div id="container"></div>
		</figure>
	</div>
	
	<% String query = (String) request.getAttribute("searchQuery"); %>
	
	<script>
		var query = "<%=query%>";
		if (query != "null") {
			parseCSV('./data/metadata.csv', query);
		}
	</script>

</body>