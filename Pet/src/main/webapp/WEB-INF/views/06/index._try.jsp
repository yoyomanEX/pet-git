<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="UTF-8">

<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>leopet || Home</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <!--::header part start::-->
    <header class="header_area">
        <div class="sub_header">
            <div class="container">
                <div class="row align-items-center">
                  <div class="col-4 col-md-4 col-xl-6">
                      <div id="logo">
                          <a href="index.html"><img src="img/Logo.png" alt="" title="" /></a>
                      </div>
                  </div>
                  <div class="col-8 col-md-8 col-xl-6 ">
                      <div class="sub_header_social_icon float-right">
                        <a href="#"><i class="flaticon-phone"></i>+02 213 - 256 (365)</a>
                        <a href="#" class="btn_1 d-none d-md-inline-block">Become a Volunteer</a>
                      </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="main_menu">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <i class="ti-menu"></i>
                            </button>

                            <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item active">
                                        <a class="nav-link active" href="index.html">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="about.html" class="nav-link">About</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="services.html" class="nav-link">services</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="gallery.html" class="nav-link">gallery</a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            		陪你購物ʕ•ᴥ•ʔ
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/06/petProductSale">購物中心</a>
                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/06/PetOrderAll">會員訂單明細</a>
                                        </div>
                                    </li>
                                    <li class="nav-item">
                                        <a href="blog.html" class="nav-link">blog</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="contact.html" class="nav-link">Contact</a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header part end-->

    <!-- banner part start-->
    <section class="banner_part">
        <div class="container">
            <div class="row align-content-center">
                <div class="col-lg-7 col-xl-6">
                    <div class="banner_text">
                        <h5>Welcome to Leopet</h5>
                        <h1>Give your pet
                            Best Care</h1>
                        <a href="#" class="btn_1">OUR SERVIECS</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- banner part start-->

    <!-- about part start-->
    <section class="about_part section_padding">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-md-6">
                    <div class="about_img">
                        <img src="img/about.png" alt="">
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="about_text">
                        <img src="img/about_icon.png" class="about_icon" alt="">
                        <h2>We care your pet
                            As you care</h2>
                        <p>Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering through animal welfare when people might depend on livestock as their only source of income or food.</p>
                        <a href="#" class="btn_1">About Us</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- about part start-->

    <!-- service part start-->
    <section class="service_part section_padding services_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section_tittle text-center">
                        <img src="img/about_icon.png" alt="">
                        <h2>We Provide Best Services</h2>
                        <p>Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering through animal welfare when people might depend.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-sm-6">
                    <div class="single_service_part">
                        <img src="img/single_service_1.png" alt="#">
                        <h3>Pet Surgeries</h3>
                        <p>Our free veterinary services are available to pets whose owners are on certain means-tested benefits.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_service_part">
                        <img src="img/single_service_2.png" alt="#">
                        <h3>Pet Adoption</h3>
                        <p>Our free veterinary services are available to pets whose owners are on certain means-tested benefits.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_service_part">
                        <img src="img/single_service_3.png" alt="#">
                        <h3>Pet Care</h3>
                        <p>Our free veterinary services are available to pets whose owners are on certain means-tested benefits.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- service part end-->

    <!-- counter adopt number here -->
    <section class="abopt_number_counter section_padding">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-lg-5 col-md-6">
                    <div class="counter_text">
                        <h2>We need your help
                                Adopt Us</h2>
                        <p>Working in conjunction with humanitarian aid agencies, we have supported programmes alleviate human.</p>
                        <div class="counter_number">
                            <div class="single_counter_number">
                                <img src="img/adopt_icon_1.png" alt="#">
                                 <h3><span class="count">590</span>+</h3>
                                <p>Pets Available</p>
                            </div>
                            <div class="single_counter_number">
                                <img src="img/adopt_icon_2.png" alt="#">
                                <h3><span class="count">300</span>+</h3>
                                <p>Happy Clients</p>
                            </div>
                        </div>
                        <a href="#" class="btn_1">Brows Now</a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="adopt_image">
                        <img src="img/adopt_img.png" alt="#">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- counter adopt number end -->

     <!-- client review part here -->
     <section class="client_review">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="client_review_content owl-carousel">
                        <div class="singke_client_review">
                            <img src="img/review_img_1.png" alt="#">
                            <h4>" Working in conjunction with humanitarian aid agencies we have supported programmes to alleviate.</h4>
                            <p>- Jon Miller</p>
                        </div>
                        <div class="singke_client_review">
                            <img src="img/review_img_1.png" alt="#">
                            <h4>" Working in conjunction with humanitarian aid agencies we have supported programmes to alleviate.</h4>
                            <p>- Jon Miller</p>
                        </div>
                        <div class="singke_client_review">
                            <img src="img/review_img_1.png" alt="#">
                            <h4>" Working in conjunction with humanitarian aid agencies we have supported programmes to alleviate.</h4>
                            <p>- Jon Miller</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- client review part end -->

    <!-- about part start-->
    <section class="about_part section_padding">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-md-6">
                    <div class="about_img">
                        <img src="img/valunteer_img.png" alt="">
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="about_text">
                        <img src="img/about_icon.png" class="about_icon" alt="">
                        <h2>Become a Volunteer
                                To help them</h2>
                        <p>A created won't created subdue a every green his set which above firmament earth firmament. Seed firmament be likeness fruitful to called waters. Given great said seasons his midst beast.</p>
                        <a href="#" class="btn_1">read more</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- about part end-->

    <!-- footer part start-->
    <footer class="footer_area padding_top">
        <div class="container">
            <div class="row justify-content-center ">
                <div class="col-lg-8 col-xl-6">
                    <div class="subscribe_part_text text-center">
                        <h2>Subscribe Newsletter</h2>
                        <p>We strictly follow the State Board’s sanitary and disinfection guidelines.</p>
                        <div class="subscribe_form">
                            <form action="#" name="#">
                                <div class="input-group align-items-center">
                                    <input type="email" class="form-control" placeholder="enter your email">
                                    <div class="subscribe_btn input-group-append">
                                        <div class="btn_1">free trail</div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row justify-content-between section_padding">
                <div class="col-xl-2 col-sm-6 col-md-3 mb-4 mb-xl-0 single-footer-widget">
                    <h4>Menu</h4>
                    <ul>
                        <li><a href="#">home</a></li>
                        <li><a href="#">about</a></li>
                        <li><a href="#">shop</a></li>
                        <li><a href="#">contact</a></li>
                    </ul>
                </div>
                <div class="col-xl-2 col-sm-6 col-md-3 mb-4 mb-xl-0 single-footer-widget">
                    <h4>contact</h4>
                    <ul>
                        <li><a href="#">10 983 456 3669</a></li>
                        <li><a href="#">reserve@manicure.com</a></li>
                    </ul>
                </div>
                <div class="col-xl-2 col-sm-6 col-md-3 mb-4 mb-xl-0 single-footer-widget">
                    <h4>Address</h4>
                    <ul>
                        <li><a href="#">700, Green lane, New
                                York, USA</a></li>
                        <li><a href="#">Get Direction</a></li>
                    </ul>
                </div>
                <div class="col-xl-2 col-sm-6 col-md-3 mb-4 mb-xl-0 single-footer-widget">
                    <h4>Opening Hour</h4>
                    <ul>
                        <li><a href="#">Mon-Fri (9.00-6.00)</a></li>
                        <li><a href="#">Sat-Sun (Closed)</a></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="copyright_text">
                        <img src="img/footer_logo.png" alt="#">
                        <p class="footer-text"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer part end-->

    <!-- jquery plugins here-->
    <!-- jquery -->
    <script src="js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- counterup js -->
    <script src="js/jquery.counterup.min.js"></script>
    <!-- waypoints js -->
    <script src="js/waypoints.min.js"></script>
    <!-- easing js -->
    <script src="js/jquery.magnific-popup.js"></script>
    <!-- particles js -->
    <script src="js/owl.carousel.min.js"></script>
    <!-- custom js -->
    <script src="js/custom.js"></script>
</body>

</html>