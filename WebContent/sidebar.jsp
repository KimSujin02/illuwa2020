<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>illuwa</title>
</head>
<body>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">HOME</div>
						<a class="nav-link" href="home.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-home"></i>
							</div> HOME
						</a>
						<div class="sb-sidenav-menu-heading">Communication</div>
						<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon"><i class="fas fa-list"></i></div>
							BOARD
							<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i> </div>
						</a>
						<div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="friendBoard.jsp">친구고민 게시판</a>
								<a class="nav-link" href="studyBoard.jsp">진로/학업고민 게시판</a>
								<a class="nav-link" href="privateBoard.jsp">성고민 게시판</a> 
								<a class="nav-link" href="loveBoard.jsp">연애고민 게시판</a> 
								<a class="nav-link" href="otherBoard.jsp">기타 게시판</a>
							</nav>
						</div>
						<a class="nav-link" href="report.jsp">
							<div class="sb-nav-link-icon"><i class="fas fa-comment"></i></div>
							REPORT
						</a>
					</div>
			</nav>
		</div>
</body>
</html>