
const slidesNavigationCarousel = (event,labels,_this) => {
  var childNodeIndex = Array.prototype.indexOf.call(document.querySelector('.slides-navigation').children, event.currentTarget),
      count          = 1 + childNodeIndex;

  labels.forEach(element => {
    element.classList.remove('active');
  });

  if (event.currentTarget == _this) {
    _this.classList.add('active');
  }

  var scroll = document.querySelector(`.${_this.htmlFor}`).offsetLeft;
  document.querySelector('.slides').scroll({left: scroll,behavior:'smooth'});
};


const arrowNavigationCarousel = (right,left,count,labels) => {
  right.addEventListener('click', function(){
    labels.forEach(element => { element.classList.remove('active');});

    if (count < labels.length) {
      count ++;
    };

    labels[count -1].classList.add('active');

    var left = document.querySelector('.radio-1').offsetWidth;

    document.querySelector('.slides').scrollBy({
      left: left,
      behavior: "smooth",
    });
  });

  left.addEventListener('click', function(){
    labels.forEach(element => { element.classList.remove('active');});

    if (count > 1) {
      count --;
    };

    labels[count - 1].classList.add('active');

    var right = document.querySelector('.radio-1').offsetWidth;

    document.querySelector('.slides').scrollBy({
      left: -right,
      behavior: "smooth",
    });
  });
};
