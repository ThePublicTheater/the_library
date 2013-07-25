<script src="http://ajax.googleapis.com/ajax/libs/jQuery/1.2.6/jQuery.js" type="text/javascript"></script>
    //Set slideshow timer
    inter = setInterval("timedSwitch()", 8500);

    //Hover State for Buttons
    $("#nextBttn").hover(function () {
        $(this).attr("src", "/images/SlideShow/rightHover.png");
    }, function () {
        $(this).attr("src", "/images/SlideShow/rightButton.png");
    });

    $("#previousBttn").hover(function () {
        $(this).attr("src", "/images/SlideShow/leftHover.png");
    }, function () {
        $(this).attr("src", "/images/SlideShow/leftButton.png");
    });

    //Next Button Selected
    $().click(function () {

    });


    $("#nextBttn").bind('click', function (el, ev) {
        nextButtonClicked($(this), ev)
    });

    $("#previousBttn").bind('click', function (el, ev) {
        prevButtonClicked($(this), ev)
    });




//next button clicked
function nextButtonClicked(obj, ev) {
    obj.unbind('click');
    clearInterval(inter);
    inter = setInterval("timedSwitch()", 8500);
    var lastLiID = $(".slideshowItems ul li:last-child").attr("id");
    var currentID = $(".slideshowItems .selected").attr("id");
    var nextID = "";
    if (lastLiID == currentID) {
        nextID = "1";
    } else {
        nextID = $(".selected").next("li").attr("id");
    }

    $(".slideshowItems ul li").removeClass("selected");
    $(".slideshowItems #" + nextID).addClass("selected");
    var nexthtml = $(".selected .slideshowtext").html();
    $(".slideShowText").animate({ bottom: '-500px' }, 500, function () {
        var nextImg = $(".selected img").attr("src");
        $("#SlideShowImageBG").attr("src", nextImg);
        $("#SlideShowImage").animate({ opacity: 0 }, 500, function () {
            $("#SlideShowImage").attr("src", nextImg);
            $("#SlideShowImage").animate({ opacity: 1 }, 250, function () {
                $(".SlideShowContent").html(nexthtml);
                $(".slideShowText").animate({ bottom: '0' }, 250);
                obj.click(function () {
                    nextButtonClicked(obj);
                });


            });
        });


    });
}

//prev button clicked
function prevButtonClicked(obj, ev) {
    obj.unbind('click');
    clearInterval(inter);
    inter = setInterval("timedSwitch()", 8500);
    var firstLIID = $(".slideshowItems ul li:first-child").attr("id");
    var currentID = $(".slideshowItems .selected").attr("id");
    var nextID = "";
    if (firstLIID == currentID) {
        nextID = $(".slideshowItems ul li:last-child").attr("id");

    } else {
        nextID = $(".selected").prev("li").attr("id");
    }

    $(".slideshowItems ul li").removeClass("selected");
    $(".slideshowItems #" + nextID).addClass("selected");
    var nexthtml = $(".selected .slideshowtext").html();
    $(".slideShowText").animate({ bottom: '-500px' }, 500, function () {
        var nextImg = $(".selected img").attr("src");
        $("#SlideShowImageBG").attr("src", nextImg);
        $("#SlideShowImage").animate({ opacity: 0 }, 500, function () {
            $("#SlideShowImage").attr("src", nextImg);
            $("#SlideShowImage").animate({ opacity: 1 }, 250, function () {
                $(".SlideShowContent").html(nexthtml);
                $(".slideShowText").animate({ bottom: '0' }, 250);
                obj.click(function () {
                    prevButtonClicked(obj);
                });


            });
        });


    });
}

//Timed Slideshow
function timedSwitch() {
    var lastLiID = $(".slideshowItems ul li:last-child").attr("id");
    var currentID = $(".slideshowItems .selected").attr("id");
    var nextID = "";
    if (lastLiID == currentID) {
        nextID = "1";
    } else {
        nextID = $(".selected").next("li").attr("id");
    }

    $(".slideshowItems ul li").removeClass("selected");
    $(".slideshowItems #" + nextID).addClass("selected");
    var nexthtml = $(".selected .slideshowtext").html();
    $(".slideShowText").animate({ bottom: '-500px' }, 500, function () {
        var nextImg = $(".selected img").attr("src");
        $("#SlideShowImageBG").attr("src", nextImg);
        $("#SlideShowImage").animate({ opacity: 0 }, 500, function () {
            $("#SlideShowImage").attr("src", nextImg);
            $("#SlideShowImage").animate({ opacity: 1 }, 250, function () {
                $(".SlideShowContent").html(nexthtml);
                $(".slideShowText").animate({ bottom: '0' }, 250);
            });
        });


    });


}