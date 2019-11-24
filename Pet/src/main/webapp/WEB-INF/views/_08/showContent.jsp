<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>pET ʕ•ᴥ•ʔ 陪你</title>
<meta charset="UTF-8">
<link rel="icon"
	href="${pageContext.request.contextPath}/img/about_icon.png">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!-- animate CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/animate.css">
<!-- owl carousel CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
<!-- themify CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/themify-icons.css">
<!-- flaticon CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/flaticon.css">
<!-- font awesome CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/magnific-popup.css">
<!-- style CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!-- 自訂 - index CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/index.css">
<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i&display=swap"
	rel="stylesheet">
<!-- Stylesheets -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/magnific-popup.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/slicknav.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/owl.carousel.min.css" />

<!-- Main Stylesheets -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/08/style.css" />




</head>
<body>

	<!-- Header section  -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Header section end  -->


	<!--::breadcrumb part start::-->
	<div>
		<!-- Hero section  -->
		<div class="hero-section">
			<div class="hero-slider owl-carousel">
				<div class="hero-item set-bg"
					data-setbg="${pageContext.request.contextPath}/img/08_img/hero-slider/1.jpg">
					<div class="container">
						<div class="row">
							<div class="col-xl-8">
								<h2 id="h2_position">
									<span>Food</span><span>& Travel</span><span>pET ʕ•ᴥ•ʔ 陪你</span>
								</h2>
								<a id="btn1_position" href="#bookmark_content"
									class="site-btn sb-white mr-4 mb-3">Read More</a> <a
									id="btn2_position" href="#bookmark_service"
									class="site-btn sb-dark">our Services</a>
							</div>
						</div>
					</div>
				</div>
				<div class="hero-item set-bg"
					data-setbg="${pageContext.request.contextPath}/img/08_img/hero-slider/2.jpg">
					<div>
						<div class="row">
							<div class="col-xl-8">
								<h2>
									<span>Food</span><span>& Travel</span><span>pET ʕ•ᴥ•ʔ 陪你</span>
								</h2>
								<a href="#bookmark_content" class="site-btn sb-white mr-4 mb-3">Read
									More</a> <a href="#bookmark_service" class="site-btn sb-dark">our
									Services</a>
							</div>
						</div>
					</div>
				</div>
				<div class="hero-item set-bg"
					data-setbg="${pageContext.request.contextPath}/img/08_img/hero-slider/3.jpg">
					<div>
						<div class="row">
							<div class="col-xl-8">
								<h2>
									<span>Food</span><span>& Travel</span><span>pET ʕ•ᴥ•ʔ 陪你</span>
								</h2>
								<a href="#bookmark_content" class="site-btn sb-white mr-4 mb-3">Read
									More</a> <a href="#bookmark_service" class="site-btn sb-dark">our
									Services</a>
							</div>
						</div>
					</div>
				</div>
				<div class="hero-item set-bg"
					data-setbg="${pageContext.request.contextPath}/img/08_img/hero-slider/4.jpg">
					<div>
						<div class="row">
							<div class="col-xl-8">
								<h2>
									<span>Food</span><span>& Travel</span><span>pET ʕ•ᴥ•ʔ 陪你</span>
								</h2>
								<a href="#bookmark_content" class="site-btn sb-white mr-4 mb-3">Read
									More</a> <a href="#bookmark_service" class="site-btn sb-dark">our
									Services</a>
							</div>
						</div>
					</div>
				</div>
				<div class="hero-item set-bg"
					data-setbg="${pageContext.request.contextPath}/img/08_img/hero-slider/5.jpg">
					<div>
						<div class="row">
							<div class="col-xl-8">
								<h2>
									<span>Food</span><span>& Travel</span><span>pET ʕ•ᴥ•ʔ 陪你</span>
								</h2>
								<a href="#bookmark_content" class="site-btn sb-white mr-4 mb-3">Read
									More</a> <a href="#bookmark_service" class="site-btn sb-dark">our
									Services</a>
							</div>
						</div>
					</div>
				</div>
				<div class="hero-item set-bg"
					data-setbg="${pageContext.request.contextPath}/img/08_img/hero-slider/6.jpg">
					<div>
						<div class="row">
							<div class="col-xl-8">
								<h2>
									<span>Food</span><span>& Travel</span><span>pET ʕ•ᴥ•ʔ 陪你</span>
								</h2>
								<a href="#bookmark_content" class="site-btn sb-white mr-4 mb-3">Read
									More</a> <a href="#bookmark_service" class="site-btn sb-dark">our
									Services</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Hero section end  -->
	</div>
	<!--::breadcrumb part end::-->


	<!-- Services section  -->
	<div class="hero-section">
		<div class="services-warp">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-6">
						<div class="service-item">
							<div class="si-head">
								<div class="si-icon">
									<img
										src="${pageContext.request.contextPath}/img/08_img/icons/pet_hotel-g.png"
										alt="">
								</div>
								<h5>友善旅館 & 毛孩旅館</h5>
							</div>
							<p>提供毛孩友善旅館與毛孩旅館資訊，讓您度假出差不再手忙腳亂！</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="service-item">
							<div class="si-head">
								<div class="si-icon">
									<img
										src="${pageContext.request.contextPath}/img/08_img/icons/fork-g.svg"
										alt="">
								</div>
								<h5>與毛孩一起外出用餐</h5>
							</div>
							<p>假日不想煮飯？選擇寵物友善餐廳帶著你家毛孩子一起享受美食吧！</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="service-item">
							<div class="si-head">
								<div class="si-icon">
									<img
										src="${pageContext.request.contextPath}/img/08_img/icons/map-g.png"
										alt="">
								</div>
								<h5>假日放風好去處</h5>
							</div>
							<p>天氣這麼好怎麼能不出門？快來看哪裡適合跑跳～</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="service-item">
							<div class="si-head">
								<div class="si-icon">
									<img
										src="${pageContext.request.contextPath}/img/08_img/icons/cooking.svg"
										alt="">
								</div>
								<h5>自製餐點起步走</h5>
							</div>
							<p>想自製鮮食卻不知道從哪裡開始？讓我們一起踏出第一步！</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="service-item">
							<div class="si-head">
								<div class="si-icon">
									<img
										src="${pageContext.request.contextPath}/img/08_img/icons/fish_can-g.svg"
										alt="">
								</div>
								<h5>美味罐罐的召喚</h5>
							</div>
							<p>pET ʕ•ᴥ•ʔ 陪你商城為您嚴選最好的罐罐給重要的家人！</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="service-item">
							<div class="si-head">
								<div class="si-icon">
									<img
										src="${pageContext.request.contextPath}/img/08_img/icons/nanny-g.svg"
										alt="">
								</div>
								<h5>出差托寵新選擇</h5>
							</div>
							<p>臨時出差擔心自家毛孩無人照料？到府保母是您的好幫手～</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Services section end  -->

	<!-- Features section   -->
	<section id="bookmark_service" class="features-section spad set-bg"
		data-setbg="${pageContext.request.contextPath}/img/08_img/features-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="feature-box">
						<img style="height: 300px;"
							src="${pageContext.request.contextPath}/img/08_img/features/1.jpg"
							alt="">
						<div class="fb-text">
							<h5>一起出去玩</h5>
							<p></p>
							<a
								href="https://www.facebook.com/events/517224495737849/?active_tab=about"
								class="fb-more-btn">Read More</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="feature-box">
						<img style="height: 300px;"
							src="${pageContext.request.contextPath}/img/08_img/features/2.jpg"
							alt="">
						<div class="fb-text">
							<h5>為毛孩做頓飯</h5>
							<p></p>
							<a
								href="https://www.youtube.com/channel/UCOz7W0VH--2WlqAE_3jtL4w"
								class="fb-more-btn">Read More</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="feature-box">
						<img style="height: 300px;"
							src="${pageContext.request.contextPath}/img/08_img/features/3.jpg"
							alt="">
						<div class="fb-text">
							<h5>活動展覽</h5>
							<p></p>
							<a href="https://www.facebook.com/MEOWSEUMOFART/"
								class="fb-more-btn">Read More</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Features section end  -->


	<!-- Clients section  -->
	<section class="clients-section spad">
		<div class="container">
			<div class="client-text">
				<h2>歡迎你一起加入— pET ʕ•ᴥ•ʔ陪你 —的大家庭，讓我們一起給毛小孩更豐富多元的生活！</h2>
				<p>pET ʕ•ᴥ•ʔ 陪你團隊將盡最大的努力提供您與您的毛孩子最新的資訊與最好的商品！</p>
			</div>
		</div>
	</section>
	<!-- Clients section end  -->


	<!-- Testimonial section -->
	<section class="testimonial-section">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6 p-0">
					<div style="margin: 10px;" class="testimonial-bg set-bg"
						data-setbg="${pageContext.request.contextPath}/img/08_img/book_1.png"></div>
				</div>
				<div class="col-lg-6 p-0">
					<div class="testimonial-box">
						<div class="testi-box-warp">
							<h2>新書推薦</h2>
							<div class="testimonial-slider owl-carousel">
								<div class="testimonial">
									<p>
										近年寵物壽命延長，養在室內的貓咪平均年齡接近十六歲。原因包括選擇純室內飼養的飼主增加、貓咪因意外或傳染病死亡機率減少、飲食與居住環境品質提升，以及動物醫療進步等。換句話說，飼主對愛貓的寵愛，以及將貓咪視為家庭成員的意識提升，都與貓咪的長壽息息相關。

										儘管如此，調皮天真的幼貓時期卻結束得很快，當貓咪迎來成貓的年紀，就會以約人類四倍的速度老化，轉眼間年齡就超過人類了。

										變成老爺爺或老奶奶的貓咪，行動會慢半拍、會待在喜歡的地方懶洋洋地休息、身形會略小於成貓時期。幼貓當然可愛，但是這樣的愛貓也有不同於幼貓時期的魅力。長大的貓咪行為沉穩優雅，讓人看了就打從心底放鬆。漫長的相處時光裡，愛貓與飼主一家之間肯定會產生深刻的羈絆。

										但是現實並非全然都是美好的事情。貓咪與人類一樣，老化後會逐漸罹患必須一輩子打交道的疾病。高齡貓可能會對食物興趣缺缺，甚至發生愈來愈多令人困擾的事情，例如：罹患失智症的貓咪，可能會在便盆以外的場所排泄、毫無理由地大叫等。這段期間不僅必須耗費更多心力照顧貓咪，還會造成精神與經濟方面的負擔，遲早有一天也會迎來愛貓需要看護的日子。

										「我希望愛貓能夠健康長壽」是每位飼主的心願，那麼該怎麼做才能實現呢？

										最重要的就是飼主要有「做好愛貓的日常健康管理，自己守護愛貓」的覺悟。忍耐身體不適是貓咪的天性，所以飼主必須了解飲食、環境以及高齡貓常見疾病方面的正確知識，並在家中積極檢查貓咪的健康狀況，才能夠預防疾病或及早發現。只有平常就勤於與貓咪交流的飼主，才能夠在貓咪的身體與行為有些微變化時就立即注意到。

										年輕活潑的貓咪變得不愛動時，飼主很快就能夠意識到不對勁，但是面對活動力下降、整天都在睡覺的高齡貓時，往往會拖很久才發現貓咪身體不適。因此貓咪進入高齡期後，日常觀察與健康管理就必須更仔細。

										「但是我不知道具體作法有哪些⋯⋯」「我很擔心高齡貓生病」「市面上太多資訊，我不知道該怎麼篩選」本書專為這樣的飼主，彙整了需要注意的事項。

										現在有接近半數的家貓已達七歲以上，本書會針對這類型的高齡貓，盡可能詳細地介紹貓咪身體基本資訊、老化造成的身心變化、快速的自宅健康檢查方法、與動物醫院構通的方法、高齡貓易罹患的疾病（含症狀、診斷與療法）。另外也會談到適合高齡貓的飲食、環境、身體保養與照顧，甚至是遲早會迎來的離別時刻。

										各位愛貓已屆高齡的飼主，如果能藉本書稍微緩解不安的話，我將深感榮幸。我由衷希望各位能夠在思考愛貓當前需求的同時，以平靜的心情和獨具魅力的高齡愛貓，一起度過重要的每一天。

										最後要誠摯感謝科學書籍編輯部的石井顯一先生，謝謝您為本書的出版盡心盡力，以及為我畫出可愛插圖的Manaka Chihiro
										老師。</p>
									<img
										src="${pageContext.request.contextPath}/img/08_img/profile.jpg"
										alt="" class="testi-thumb">
									<div class="testi-info">
										<h5>壹岐田鶴子</h5>
										<span>獸醫師。主要著作包括《喵星人，想什麼？了解貓咪心情的89個祕訣》、《最想知道的貓咪問題行為學》。</span>
									</div>
								</div>
								<div class="testimonial">
									<p>本書將針對有如此想法的飼主，盡可能詳細地介紹貓咪的身體基本資訊、老化造成的身心變化，說明能夠在家中幫愛貓健康檢查的方法，彙整各種照顧高齡貓須注意的事項，包含適合高齡貓的飲食、環境、身體保養與照護等實用資訊！</p>
									<img
										src="${pageContext.request.contextPath}/img/08_img/profile.jpg"
										alt="" class="testi-thumb">
									<div class="testi-info">
										<h5>壹岐田鶴子</h5>
										<span>獸醫師。主要著作包括《喵星人，想什麼？了解貓咪心情的89個祕訣》、《最想知道的貓咪問題行為學》。</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Testimonial section end  -->


	<!-- Call to action section  -->
	<section class="cta-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 d-flex align-items-center">
					<h2>pET ʕ•ᴥ•ʔ 陪你商城提供豐富的選擇給你的毛孩子！</h2>
				</div>
				<div class="col-lg-3 text-lg-right">
					<a href="${pageContext.request.contextPath}/06/petProductSale"
						class="site-btn sb-dark">PET陪你購物</a>
				</div>
			</div>
		</div>
	</section>
	<!-- Call to action section end  -->

	<!-- Video section  -->
	<section class="video-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="video-text">
						<h2>貓咪小教室～原來曬太陽對貓咪來說這麼重要啊！</h2>
						<h6>◎貓咪們是靠著日光來調整體內機能的</h6>
						<span>不論是貓咪或是人，都是會依著生理時鐘而感到想睡及飢餓的動物，對貓咪來說陽光就是用來調整生理時鐘的重要工具，根據光線的強弱、日照的時間以及太陽的位置來修正，所以太陽對貓咪來說是必要的存在。</span>
						
						<h6>◎貓咪們是會根據日照時間的長短，來增減毛髮的數量</h6>
						<span>為什麼到了春天及秋天時，貓咪會有換毛期呢？原來是季節的不同而造成日照時間的變化，進而影響到貓咪的毛髮修護週期，這就是每到了春天及秋天時，貓咪的掉毛量會增加，日照的時間如果變長了，貓咪的毛量會變少，相反的，日照時間變短，毛量會慢慢的增加，貓咪們的毛可分為上毛跟下毛。夏天蓬鬆而細柔的下毛量會變少，冬天上毛就會長的長長的，而且密度也是夏天時下毛密度的兩倍左右。</span>
						
						<h6>◎曬太陽會讓貓咪們的毛更加的豔麗</h6>
						<span>曬曬太陽之後，貓咪們的身體就會變的暖呼呼的。不但血液循環會變好，營養素也會隨著血液的循環輸送到身體的各個角落。由於曬日光浴能夠讓貓咪們變得更健康，當然毛也就會更加的豔麗了。也因為會促進內臟的活動，讓血液循環變的更加順暢，這樣一來也就能夠預防一些貓咪們的疾病了。</span>
						
						<a href="https://travel.ettoday.net/article/915052.htm" class="site-btn">快來一起曬太陽</a>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="video-box set-bg"
						data-setbg="${pageContext.request.contextPath}/img/08_img/video-box.png">
						<a href="https://www.youtube.com/watch?v=O6NjriUkUx4"
							class="video-popup"> <i class="fa fa-play"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Video section end  -->
	<!-- Call to action section  -->
	<section class="cta-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 d-flex align-items-center">
					<h2 >pET ʕ•ᴥ•ʔ 動物趣新聞</h2>
				</div>
			</div>
		</div>
	</section>
	<!-- Call to action section end  -->

	<!--content from DB section start  -->
	<div style="height: 30px"></div>
	<div class="container" id="bookmark_content">
		<div class="row">
			<c:forEach var='cont' items='${allcontents}'>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="<c:url value='getContPicture/${cont.content_id}' />" />
						<div class="caption">
							<p>
								<b style='font-size: 16px;'>${cont.content_title}</b>
							</p>
							<p>${cont.content_sub}</p>
							<p>
								<%-- 																<a href="<spring:url value='/announcement?id=${ann.announce_id}' />" --%>
								<!-- 																	class="btn btn-primary"> <span -->
								<!-- 																	class="glyphicon-info-sigh glyphicon"></span>詳細資料 -->
								<!-- 																</a> <a -->
								<%-- 																	href="<spring:url value='/product.json?id=${ann.announce_id}' />" --%>
								<!-- 																	class="btn btn-primary">  -->
								<!-- 																</a> -->
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- content from DB section end  -->



	<!-- Footer section -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Footer section end -->


	<!-- jquery plugins here-->
	<!-- jquery -->
	<script
		src="${pageContext.request.contextPath}/js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<!-- counterup js -->
	<script
		src="${pageContext.request.contextPath}/js/jquery.counterup.min.js"></script>
	<!-- waypoints js -->
	<script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
	<!-- easing js -->
	<script
		src="${pageContext.request.contextPath}/js/jquery.magnific-popup.js"></script>
	<!-- particles js -->
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<!-- custom js -->
	<script src="${pageContext.request.contextPath}/js/custom.js"></script>

	<!--====== Javascripts & Jquery ======-->
	<script
		src="${pageContext.request.contextPath}/js/08/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/08/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/08/jquery.slicknav.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/08/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/08/circle-progress.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/08/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/08/main.js"></script>

</body>
</html>
