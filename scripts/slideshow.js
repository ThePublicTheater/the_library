var slideimages=new Array()
var slidelinks=new Array()
function slideshowimages(){
for (i=0;i<slideshowimages.arguments.length;i++){
slideimages[i]=new Image()
slideimages[i].src=slideshowimages.arguments[i]
}
}

function slideshowlinks(){
for (i=0;i<slideshowlinks.arguments.length;i++)
slidelinks[i]=slideshowlinks.arguments[i]
}

function gotoshow(){
if (!window.winslide||winslide.closed)
winslide=window.open(slidelinks[whichlink])
else
winslide.location=slidelinks[whichlink]
winslide.focus()
}



  //configure the paths of the images, plus corresponding target links
  slideshowimages("/media/66/library_mini-site_placeholder-main.png","/media/1746/event.jpg")

  //configure the speed of the slideshow, in miliseconds
  var slideshowspeed=3000

  var whichlink=0
  var whichimage=0
  function slideit(){
  if (!document.images)
  return
  document.images.slide.src=slideimages[whichimage].src
  whichlink=whichimage
  if (whichimage<slideimages.length-1)
  whichimage++
  else
  whichimage=0
  setTimeout("slideit()",slideshowspeed)
  }
  slideit()