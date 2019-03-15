<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>애널리스트 탑랭크</title>
<style type="text/css">
    th { padding: 5px; border: 1px solid gray;}
    td { padding: 5px; border: 1px solid gray;}
</style>
</head>
<body>
<div class="container" style="margin-top: 10%; margin-bottom: 5%; width: 60%;">
<ul class="nav nav-tabs">
	<li class="nav-item">
	  	<a class="nav-link" data-toggle="tab" href="#home">적중률 순위</a>
	</li>
	<li class="nav-item">
	 	 <a class="nav-link active" data-toggle="tab" href="#profile">목표주가 달성률 순위</a>
	</li>
	<li class="nav-item">
	 	 <a class="nav-link" data-toggle="tab" href="#solo">평균 주가 상승률 및 하락률 순위</a>
	</li>
</ul>
<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade" id="home">
	<p style="margin-top: 5%;">투자의견 적중률 순위는 이러쿵저러쿵에 의해서 산정된 순위입니다.</p>
		<div class="card border-secondary mb-3" style="max-width: 50rem; margin-top: 3%;">
			 <div class="card-header"><b>전병철</b>&nbsp;<small>(RANK 1)</small></div>
			 <div class="card-body">
			   	<table class="table table-hover">
				    <tr class="table-light" style="text-align: center;">
						<th scope="row" style="border: 1px solid gray;">Active</th>
						<td style="border: 1px solid gray;">Column content</td>
						<td style="border: 1px solid gray;">Column content</td>
						<td style="border: 1px solid gray;">Column content</td>
				    </tr>
				    <tr style="text-align: center;">
				    	<td scope="row">Column content</td>
				    	<td>Column content</td>
				    	<td>Column content</td>
				    	<td>Column content</td>
				    </tr>			   		
			   	</table>
			 </div>
		</div>
		<div class="card border-secondary mb-3" style="max-width: 50rem; margin-top: 5%;">
			 <div class="card-header"><b>최산</b>&nbsp;<small>(RANK 2)</small></div>
			 <div class="card-body">
			   	<table class="table table-hover">
				    <tr class="table-light" style="text-align: center;">
						<th scope="row" style="border: 1px solid gray;">Active</th>
						<td style="border: 1px solid gray;">Column content</td>
						<td style="border: 1px solid gray;">Column content</td>
						<td style="border: 1px solid gray;">Column content</td>
				    </tr>
				    <tr style="text-align: center;">
				    	<td scope="row">Column content</td>
				    	<td>Column content</td>
				    	<td>Column content</td>
				    	<td>Column content</td>
				    </tr>			   		
			   	</table>
			 </div>
		</div>
		<div class="card border-secondary mb-3" style="max-width: 50rem; margin-top: 5%;">
			<div class="card-header"><b>김상수</b>&nbsp;<small>(RANK 3)</small></div>
				<div class="card-body">
			   	<table class="table table-hover">
				    <tr class="table-light" style="text-align: center;">
						<th scope="row" style="border: 1px solid gray;">Active</th>
						<td style="border: 1px solid gray;">Column content</td>
						<td style="border: 1px solid gray;">Column content</td>
						<td style="border: 1px solid gray;">Column content</td>
				    </tr>
				    <tr style="text-align: center;">
				    	<td scope="row">Column content</td>
				    	<td>Column content</td>
				    	<td>Column content</td>
				    	<td>Column content</td>
				    </tr>			   		
			   	</table>
			 </div>
		</div>		
	</div>
	<div class="tab-pane fade active show" id="profile">
		<p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.</p>
	</div>
	<div class="tab-pane fade" id="solo">
	  	<p>Solo singer you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
	</div>
</div>
</div>
</body>
</html>