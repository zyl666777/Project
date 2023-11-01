
<%@ page language="java" contentType="text/html; charset=BIG5"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<jsp:useBean id='objDBconfig' scope='session' class='hitstd.group.tool.database.DBconfig' />
<%@ page import="date.text.turndate" %>
<%@include file ="menu.jsp" %>
<!DOCTYPE html>
<html class="wide wow-animation" lang="en">

  <body>
   <%response.setCharacterEncoding("BIG5");%>
      
      <!--About-->
      <section class="section section-sm position-relative" id="about">
        <div class="container">
          <div class="row row-30">
            <div class="col-lg-6">
              <div class="block-decorate-img wow fadeInLeft" data-wow-delay=".2s"><img src="images/home-1-570x703.jpg" alt="" width="570" height="351"/>
              </div>
            </div>
            <div class="col-lg-6 col-12">
              <div class="block-sm offset-top-45">
                <div class="wow fadeInLeft text-capitalize devider-bottom" data-wow-delay=".3s"><font size="20">預約資料確認</font></div>
                <h3 class="section-name wow fadeInRight" data-wow-delay=".3s"><span class="text-primary">您所掛號的資料</span></h3>
                <p class="offset-xl-40 wow fadeInUp" data-wow-delay=".4s"></p>
                </p>
</p>
                
                <form action="appoint_take.jsp" method="post">
                <select name="MN">
                <option>看診時間:</option>
                <option value="M">早診</option>
                <option value="N">下午診</option>
            </select></p>
                <select name="role">
                <option>請選擇醫師</option>
                <option value="123456">王小美</option>
                <option value="789223">王大有</option>
                <option value="111213">王曉明</option>
            </select></p>
                  日期：<input type="date" name="Pdate"></p>
                  請輸入身份證字號：<input type="text" name="patientID"></p>
     
                  出生年月日-8碼：<input type="text" name="birth"></p>
                  初診：<br>
                  <input  type="radio" name="first-diagnosis" value="A">初診
                  <input  type="radio" name="Not-first-diagnosis" value="B">非初診<p>
                </p>
                  <div class="col-lg-6 col-12">
                    <div class="block-sm offset-top-45">

                      
                     <br><br><br><input type="submit" value="確認送出">
         </div>
              
            </div>
            </form>
          </div>
        </div>
        <div class="decor-text decor-text-1">ABOUT</div>
        
      <!--Counters-->
      <script src="js/core.min.js"></script>
      <script src="js/script.js"></script>
     
      <!--Pricing--> 
     
      <!--Owl Carousel--> 
    <!--Footer--><a class="section section-banner" href="https://www.templatemonster.com/intense-multipurpose-html-template.html" target="_blank" style="background-image: url(images/background-01-1920x310.jpg); background-image: -webkit-image-set( url(images/background-01-1920x310.jpg) 1x, url(images/background-01-3840x620.jpg) 2x )"><img src="images/foreground-01-1600x310.png" srcset="images/foreground-01-1600x310.png 1x, images/foreground-01-3200x620.png 2x" alt="" width="1600" height="310"></a> 

    <footer class="section footer-classic section-sm"> 

      <div class="container"> 

        <div class="row row-30"> 

          <div class="col-lg-3 wow fadeInLeft"> 

            <!--Brand--><a class="brand" href="index.html"><img class="brand-logo-dark" src="images/logo-default-200x34.png" alt="" width="100" height="17"/><img class="brand-logo-light" src="images/logo-inverse-200x34.png" alt="" width="100" height="17"/></a> 

            <p class="footer-classic-description offset-top-0 offset-right-25"></p> 

          </div> 

          <div class="col-lg-3 col-sm-8 wow fadeInUp"> 

            <P class="footer-classic-title">contact info</P> 

            <div class="d-block offset-top-0">2164 Wall St, New York<span class="d-lg-block">NY 10122, USA</span></div><a class="d-inline-block accent-link" href="mailto:#">info@demolink.org</a><a class="d-inline-block" href="tel:#">+1 800 123 45 67</a> 

            <ul> 

              <li>Mon-Thu:<span class="d-inline-block offset-left-10 text-white">9:30 AM - 9:00 PM</span></li> 

              <li>Fri:<span class="d-inline-block offset-left-10 text-white">10:00 AM - 9:00 PM</span></li> 

              <li>Sat:<span class="d-inline-block offset-left-10 text-white">10:00 AM - 3:00 PM</span></li> 

            </ul> 

          </div> 

          <div class="col-lg-2 col-sm-4 wow fadeInUp" data-wow-delay=".3s"> 

            <P class="footer-classic-title">Quick Links</P> 

            <ul class="footer-classic-nav-list"> 

              <li><a href="index.html">Home</a></li> 

              <li><a href="about.html">About us</a></li> 

              <li><a href="#">Services</a></li> 

              <li><a href="#">Blog</a></li> 

              <li><a href="contacts.html">Contacts</a></li> 

            </ul> 

          </div> 

          <div class="col-lg-4 wow fadeInLeft" data-wow-delay=".2s"> 

            <P class="footer-classic-title">newsletter</P> 

            <form class="rd-mailform text-left footer-classic-subscribe-form" data-form-output="form-output-global" data-form-type="contact" method="post" action="bat/rd-mailform.php"> 

              <div class="form-wrap"> 

                <label class="form-label" for="subscribe-email">Your Email Address</label> 

                <input class="form-input" id="subscribe-email" type="email" name="email" data-constraints="@Email @Required"> 

              </div> 

              <div class="form-button group-sm text-center text-lg-left"> 

                <button class="button button-primary button-circle" type="submit">sign up</button> 

              </div> 

            </form> 

            <p>Be the first to find out about our latest news, updates, and special offers.</p> 

          </div> 

        </div> 

      </div> 

      <div class="container wow fadeInUp" data-wow-delay=".4s"> 

        <div class="footer-classic-aside"> 

          <p class="rights"><span>&copy;&nbsp;</span><span class="copyright-year"></span>. All Rights Reserved. Design by <a href="https://www.templatemonster.com">TemplateMonster</a></p> 

          <ul class="social-links"> 

            <li><a class="fa fa-linkedin" href="#"></a></li> 

            <li><a class="fa fa fa-twitter" href="#"></a></li> 

            <li><a class="fa fa-facebook" href="#"></a></li> 

            <li><a class="fa fa-instagram" href="#"></a></li> 

          </ul> 

        </div> 

      </div> 

    </footer> 

  </div> 

  <div class="snackbars" id="form-output-global"></div> 


  </body>
</html>