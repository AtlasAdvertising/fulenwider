<script>
 var $ = jQuery.noConflict();
</script>

<!-- Hidden Search Bar -->
<div id="search-bar">
<div class="container-fluid">
<div class="row">
<div class="col-md-12">
<!-- Search -->
<div id="searchBoxItem">
<div class="search-wrapper" class="hidden-phone">
SEARCH GOES HERE!
</div>
</div>
<div class="search-close"><img src="/Leduc/images/x.png"/></div>
<!-- End Search -->
</div>
</div>
</div>
</div>


<!-- Header (two columns / one row) -->
<header>
    <div class="container">
        <div class="row">

          <!-- Left Column -->

          <!-- Logo -->
          <a href="/home.aspx" id="site-logo-wrapper">
              <div class="col-xs-4">
                  <div id="site-logo"></div>
              </div>
          </a>

          <!-- Right Column -->

          <!-- Utility Nav -->
          <div id="utility-nav-wrapper">
            <div class="col-sm-8 hidden-xs hidden-print">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="utility-nav">
                          <cms:CMSWebPartZone ID="wpzUtilityNav" runat="server" />
                        </div>
                    </div>
                </div>
              

                <!-- Main Nav -->
                <div id="main-nav-wrapper">
                    <div class="row">
                      <div class="col-sm-12">
                        <div id="main-nav-inner-wrapper">
                            <cms:CMSWebPartZone ID="wpzMainNav" runat="server" />
                        </div>
                      </div>
                    </div>
                </div>    
            </div>
          </div>

        </div>
    </div>
</header>


<!-- Main Content -->
<cms:CMSWebPartZone ID="wpzPagePlaceholder" runat="server" />


<!-- Footer -->
<footer>

    <div class="web-part-area">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-xs-12">
                    <cms:CMSWebPartZone ID="wpzFooterEmailSignup" runat="server" />
                </div>
                <div class="col-md-4 col-md-offset-2 col-xs-12">
                    <cms:CMSWebPartZone ID="wpzFooterContactInfo" runat="server" />
                </div>
            </div>
        </div>
    </div>

    <div id="copyright-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">                
                    <div id="copyright"><span>©2014 Leduc-Nisku Economic Development Association. All rights reserved. Created by <a href="http://atlas-advertising.com" target="_blank">Atlas Advertising</a>.</span></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 hidden-xs hidden-sm">
                    <div id="sitemap-open-close">[+] Site Map</div>      
                </div>
            </div>
        </div>
    </div>

    <div id="sitemap-wrapper">
        <div class="container">
            <div id="row sitemap">
                <div class="col-md-12 hidden-xs hidden-sm">
                    <cms:CMSWebPartZone ID="wpzSiteMap" runat="server" />
                </div>
            </div>  
        </div>
    </div>

</footer>

<!-- Mobile Menu -->
<a href="#my-menu" class="mobileBtn hidden-print hidden-sm hidden-md hidden-lg"><i class="fa fa-bars"></i></a>
<nav id="my-menu">
    <div>
    <cc1:CMSWebPartZone ID="wpzNewMobileMenu" runat="server" />
    </div>
</nav>

<!-- Scripts -->

<script type="text/javascript">
$(document).ready(function() {
    // ********************************************
    // Footer Open Close
    // ********************************************

    $("#open-close").click(function() {
      $(".sitemap").slideToggle("slow");
      $("body, html").animate({scrollTop: $("#form").height()}, "slow");
      $("#open-close").toggleClass("active");
      if ( $("#open-close").text() === "[+] Site Map" ) {
          $("#open-close").text("[-] Hide Site Map");
      } else if ( $("#open-close").text() === "[-] Hide Site Map" ) {
          $("#open-close").text("[+] Site Map");
      } 
      return false;
    }); 
    
    // ********************************************
    // This calls the appropriate function to 
    // open or close the search box
    // ********************************************
    $(".search-icon").addClass("search-closed");
    
    $(".search-icon").click(function(e) {
        e.preventDefault();
        if ( $(".search-icon").hasClass("search-open") ) {
            console.log("Close Search");
            closeSearch();
        } else if ( $(".search-icon").hasClass("search-closed") ) {
            console.log("Open Search");
            openSearch();
        } else {
            console.log("Click");
        }
    });
    
    $(".search-close").click(function() {
        if ( $(".search-bar").hasClass("search-open") ) {
            console.log("Close Search");
            closeSearch();
        } else if ( $(".search-bar").hasClass("search-closed") ) {
            console.log("Open Search");
            openSearch();
        } else {
            console.log("Click");
        }
    });
    
    function openSearch() {
        $(".search-bar").show()
                    .animate({
                        marginTop: "0"
                    }, 500)
                    .addClass("search-open")
                    .removeClass("search-closed");
        $(".search-bar input#search").focus();
        $(".search-icon").removeClass("search-closed").addClass("search-open");
    };
    
    function closeSearch() {
        $(".search-bar").animate({
                        marginTop: "-40px"
                    }, 500, function() {
                        $(this).hide();
                    })
                    .addClass("search-closed")
                    .removeClass("search-open");
        $(".search-bar input#search").blur();
        $(".search-icon").addClass("search-closed").removeClass("search-open");
    };
    
    // ********************************************
    // Nav Drop-Down
    // ********************************************
    
    var $mainNavItems = $(".inner-wrapper #menuElem li");
    // navigation mouseover listeners
    $mainNavItems.on("mouseenter", showSubMenu);
    $mainNavItems.on("mouseleave", hideSubMenu);
    // fadeIn subMenu
    function showSubMenu() {
        $(this).children("ul").fadeIn("fast");
    }
    // fadeOut subMenu
    function hideSubMenu() {
        $(this).children("ul").stop().fadeOut("fast");
    }
    
    // ***************************************************************************
    // this code applies the appropriate classes to the secondary page columns
    // based on the presence or lack of widgets.
    // ***************************************************************************    
    if ( $("#sideWidgets").children("div").length > 0 ) {
        $("#sideWidgets").addClass("col-md-3 col-md-offset-0 col-sm-9 col-sm-offset-3 col-xs-12");
        $("#secondaryMainContent").addClass("col-md-7 col-sm-9 col-xs-12");
    } else {
        //$("#sideWidgets").remove();
        $("#secondaryMainContent").addClass("col-md-10 col-sm-9 col-xs-12");
    }
    
    // ********************************************
    // contact form validation
    // ********************************************
    var $firstName = $(".form-last-name input"),
        $lastName = $(".form-first-name input"),
        $company = $(".form-company input"),
        $industry = $(".form-industry input"),
        $email = $(".form-email input"),
        $button = $("#contact-form-wrapper .FormButton");
        
    $firstName.blur(function() {
        // on blur, check for valid input and assign respective CSS class
        if ( validFirstName($(this).val()) ) {
            $(this).addClass("valid-input");
            $(this).removeClass("invalid-input");
        } else {
            $(this).addClass("invalid-input");
            $(this).removeClass("valid-input");
        }
    });
    $lastName.blur(function() {
        // on blur, check for valid input and assign respective CSS class
        if ( validLastName($(this).val()) ) {
            $(this).addClass("valid-input");
            $(this).removeClass("invalid-input");
        } else {
            $(this).addClass("invalid-input");
            $(this).removeClass("valid-input");
        }
    });  
    $company.blur(function() {
        // on blur, check for valid input and assign respective CSS class
        if ( validCompany($(this).val()) ) {
            $(this).addClass("valid-input");
            $(this).removeClass("invalid-input");
        } else {
            $(this).addClass("invalid-input");
            $(this).removeClass("valid-input");
        }
    });  
    $industry.blur(function() {
        // on blur, check for valid input and assign respective CSS class
        if ( validIndustry($(this).val()) ) {
            $(this).addClass("valid-input");
            $(this).removeClass("invalid-input");
        } else {
            $(this).addClass("invalid-input");
            $(this).removeClass("valid-input");
        }
    });  
    $email.blur(function() {
        // on blur, check for valid input and assign respective CSS class
        if ( validEmail($(this).val()) ) {
            $(this).addClass("valid-input");
            $(this).removeClass("invalid-input");
        } else {
            $(this).addClass("invalid-input");
            $(this).removeClass("valid-input");
        }
    });
    $button.click(function(e) {
        var $firstNameVal = $firstName.val(),
            $lastNameVal = $lastName.val(),
            $companyVal = $company.val(),
            $industryVal = $industry.val(),
            $emailVal = $email.val();

        if ( validFirstName($firstNameVal) && validLastName($lastNameVal) && validCompany($companyVal) && validEmail($emailVal) ) {
        
        } else {
            e.preventDefault();
            $firstName.blur();
            $lastName.blur();
            $industry.blur();
            $company.blur();
            $email.blur();
        }
    });
    
    function validFirstName(firstName) {
        // if a value has been entered in the input box, return true else false
        return firstName !== "" ? true : false;
    }
  
    function validLastName(lastName) {
        // if a value has been entered in the input box, return true else false
        return lastName !== "" ? true : false;
    }
  
    function validCompany(company) {
        // if a value has been entered in the input box, return true else false
        return company !== "" ? true : false;
    }  
  
    function validIndustry(industry) {
        // if a value has been entered in the input box, return true else false
        return industry !== "" ? true : false;
    }    
    
    function validEmail(email) {
        // if a value matches with the regex, return true else false
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }

    
    // ********************************************************************
    // Checks for header image and adds no-image class if applicable
    // ********************************************************************    
    if ( $(".secondary-header-wrapper img").length < 1 ) {
        $(".secondary-header-wrapper").addClass("no-image");
    }
    
    // ********************************************************************    
    // Mobile Menu
    // ********************************************************************    
    $("#my-menu").mmenu({
        offCanvas: {
           position  : "right",
           zposition : "front",
           panelNodetype : "div"
        }
    });
        
});
</script>