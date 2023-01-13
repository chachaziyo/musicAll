<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<div class="module-small bg-dark">
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<div class="widget">
					<h5 class="widget-title font-alt">About Titan</h5>
					<p>The languages only differ in their grammar, their pronunciation and their most common words.</p>
					<p>Phone: +1 234 567 89 10</p>Fax: +1 234 567 89 10
					<p>Email:<a href="#">somecompany@example.com</a></p>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="widget">
					<h5 class="widget-title font-alt">Quicks Links</h5>
					<ul class="icon-list">
						<li>Home <a href="#">Designer Desk Essentials</a></li>
						<li>공연 <a href="#">Realistic Business Card Mockup</a></li>
						<li>예매 <a href="#">Eco bag Mockup</a></li>
						<li>스토어 <a href="#">Bottle Mockup</a></li>
						<li>1:1 문의 <a href="#">Our trip to the Alps</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="widget">
					<h5 class="widget-title font-alt">Blog Categories</h5>
					<ul class="icon-list">
						<li><a href="#">Photography - 7</a></li>
						<li><a href="#">Web Design - 3</a></li>
						<li><a href="#">Illustration - 12</a></li>
						<li><a href="#">Marketing - 1</a></li>
						<li><a href="#">Wordpress - 16</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="widget">
					<h5 class="widget-title font-alt">Popular Posts</h5>
					<ul class="widget-posts">
						<li class="clearfix">
							<div class="widget-posts-image">
								<a href="#">
									<img src="${path}/resources/images/rp-1.jpg" alt="Post Thumbnail">
								</a>
							</div>
							<div class="widget-posts-body">
								<div class="widget-posts-title">
									<a href="#">Designer Desk Essentials</a>
								</div>
								<div class="widget-posts-meta">23 january</div>
							</div>
						</li>
						<li class="clearfix">
							<div class="widget-posts-image">
								<a href="#">
									<img src="${path}/resources/images/rp-2.jpg" alt="Post Thumbnail">
								</a>
							</div>
							<div class="widget-posts-body">
								<div class="widget-posts-title">
									<a href="#">Realistic Business Card Mockup</a>
								</div>
								<div class="widget-posts-meta">15 February</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</main>
</body>
</html>