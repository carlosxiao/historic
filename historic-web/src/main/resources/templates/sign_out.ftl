<!doctype html>
<html lang="en">

<#include "common/page_start.ftl">

<body>

<#include "common/main_menu.ftl">

<!--================Login Box Area =================-->
<section class="login_box_area p_120">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-lg-10 mg-40">
                        <div class="login_box_img">
                            <img class="img-fluid" src="img/login.jpg" alt="">
                            <div class="hover">
                                <h4>Already have an Account?</h4>
                                <p>There are advances being made in science and technology everyday, and a good example of this is the</p>
                                <a class="main_btn" href="/sign_in">Sign In</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="login_form_inner reg_form">
                    <h3>Create an Account</h3>
                    <form class="row login_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">
                        <div class="col-md-12 form-group">
                            <input type="text" class="form-control" id="name" name="name" placeholder="Name">
                        </div>
                        <div class="col-md-12 form-group">
                            <input type="email" class="form-control" id="email" name="email" placeholder="Email Address">
                        </div>
                        <div class="col-md-12 form-group">
                            <input type="text" class="form-control" id="password" name="password" placeholder="Password">
                        </div>
                        <div class="col-md-12 form-group">
                            <input type="password" class="form-control" id="pass" name="pass" placeholder="Confirm password">
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="creat_account">
                                <input type="checkbox" id="f-option2" name="selector">
                                <label for="f-option2">Keep me logged in</label>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <button type="submit" value="submit" class="btn submit_btn">Register</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================End Login Box Area =================-->


<#include "common/footer.ftl">

<#include "common/page_end.ftl">

</body>

</html>