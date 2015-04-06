// Global Scripts

$(document).ready(function() {

  // ========================================================
  //  Mobile Menu
  // ========================================================

  $("#my-menu").mmenu({
    offCanvas: {
      position: "right",
      zposition: "front",
      panelNodetype: "div"
    }
  });


  // ========================================================
  //  Initialize Slick.js
  // ========================================================

  $('#hero-wrapper').slick({
    infinite: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    //autoplay: true,
    //autoplaySpeed: 9000,
    arrows: true,
    dots: true
  });

  // ========================================================
  // Secondary content classes for Bootstrap:
  // Dyanmically assigns column widths depending on sidebar content
  // ========================================================

  if ( $("#widget-wrapper").children("div").length > 0 ) {
      $("#secondary-content").wrap("<div class='col-md-9 col-sm-12'></div>");
      $("#widget-wrapper").wrap("<div class='col-md-3 col-sm-12'></div>");
  } else {
      $("#secondary-content").wrap("<div class='col-md-12 col-sm-12'></div>");
  }

  // ========================================================
  // Hide/Show Search in Utility Nav
  // ========================================================

  $(".SmartSearchButton").after("<div class='search-close-button'><i class='fa fa-times'></i></div>");
  // Show
  $(".search-button.nav").click(function() {
    $("#utilityNav").animate({
      'right' : "+=445px" 
    });
    $(".search-button.nav").animate({
      'right' : "+=445px" 
    });
    $(".searchBox").animate({
      'right' : "+=175px" 
    });
    $(".search-button.nav").toggleClass("active");
  });
  // Hide
  $(".search-close-button").click(function() {
    $("#utilityNav").animate({
      'right' : "-=445px" 
    });
    $(".search-button.nav").animate({
      'right' : "-=445px" 
    });
    $(".searchBox").animate({
      'right' : "-=175px" 
      });
    $(".search-button.nav").toggleClass("active");
  });

  // ********************************************
  // This calls the appropriate function to 
  // open or close the search box
  // ********************************************
  $("#utility-nav-search-button").addClass("search-closed");
  
  $("#utility-nav-search-button").click(function(e) {
      e.preventDefault();
      if ( $("#utility-nav-search-button").hasClass("search-open") ) {
          console.log("Close Search");
          closeSearch();
      } else if ( $("#utility-nav-search-button").hasClass("search-closed") ) {
          console.log("Open Search");
          openSearch();
      } else {
          console.log("Click");
      }
  });
  
  $(".search-close").click(function() {
      if ( $("#search-bar").hasClass("search-open") ) {
          console.log("Close Search");
          closeSearch();
      } else if ( $("#search-bar").hasClass("search-closed") ) {
          console.log("Open Search");
          openSearch();
      } else {
          console.log("Click");
      }
  });
  
  function openSearch() {
      $("#search-bar").show()
                  .animate({
                      marginTop: "0"
                  }, 500)
                  .addClass("search-open")
                  .removeClass("search-closed");
      $("#search-bar input#search").focus();
      $("#utility-nav-search-button").removeClass("search-closed").addClass("search-open");
  };
  
  function closeSearch() {
      $("#search-bar").animate({
                      marginTop: "-40px"
                  }, 500, function() {
                      $(this).hide();
                  })
                  .addClass("search-closed")
                  .removeClass("search-open");
      $("#search-bar input#search").blur();
      $("#utility-nav-search-button").addClass("search-closed").removeClass("search-open");
  };

  // ========================================================
  // sticky header 
  // ========================================================

  // variables
  var $window = $(window), // window object
    $nav = $("header"), // navigation bar
    $navSpacer = $("<div />", { // nav place holder
      "id": "navPlaceHolder"
    });

  // scroll event listener
  $window.scroll(stickyNavHandler);

  // stickyNav Handler function
  function stickyNavHandler() {
    if (!$nav.hasClass("stick") && $window.scrollTop() > $nav.offset().top) {
      stickNav();
    } else if ($nav.hasClass("stick") && $window.scrollTop() < $navSpacer.offset().top) {
      unstickNav();
    }
  };

  // this function sticks the nav to the top of the window
  function stickNav() {
    var navHeight = $nav.css("height");

    $navSpacer.css("height", navHeight);
    $nav.before($navSpacer);
    $nav.addClass("stick");
    $nav.removeClass("unstick");
  };

  // this function unsticks the nav to the top of the window
  function unstickNav() {
    $nav.addClass("unstick");
    $nav.removeClass("stick");
    $navSpacer.remove();
  };

});
