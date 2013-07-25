<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SlideshowDemo.ascx.cs" Inherits="usercontrols_SlideshowDemo" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.js" type="text/javascript"></script>
<link href="/includes/Slideshow.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

    $(document).ready(function () {
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
    
</script>


<asp:Repeater ID="Slideshow" runat="server">
    <HeaderTemplate>
        
        <div style="margin:0 auto; width:960px;">
            <div class="slideshowInsideContainer">
                <div class="slideShowText">
                <div style="padding:10px;" class="SlideShowContent">
                    <%= firstText %>
                 </div>
                 </div>
                <img id="SlideShowImage" style="position:absolute; z-index:1; top:0;" src="<%= firstImage %>" />
                <img id="SlideShowImageBG" style="position:absolute; z-index:0; top:0;" src="<%= firstImage %>" />
                <img id="previousBttn" style="position:absolute; z-index:2; top:200px; cursor:pointer; left:0;" src="/images/SlideShow/leftButton.png" />
                <img id="nextBttn" style="position:absolute; z-index:2; top:200px; cursor:pointer; right:0;" src="/images/SlideShow/rightButton.png" />
                 <div class="slideshowItems">
                    <ul>
    </HeaderTemplate>
    <ItemTemplate>
        <li class='<%# Container.ItemIndex == 0 ? "selected" : "" %>' id="<%# Container.ItemIndex %>">
            <div class="slideshowtext">
                    <%# Eval("text") %>
                </div>
            <img style="position:absolute; z-index:1; top:0;" src=' <%# Eval("image") %>' />
        </li>
    </ItemTemplate>
    <FooterTemplate>
                 </ul>
                </div>
            </div>
        </div>
    </FooterTemplate>
</asp:Repeater>



       
              
                
           