<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="profile.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service Sprint</title>
<Style>


.responsive-container-block {
  min-height: 75px;
  height: fit-content;
  width: 100%;
  padding-top: 10px;
  padding-right: 10px;
  padding-bottom: 10px;
  padding-left: 10px;
  display: flex;
  flex-wrap: wrap;
  margin-top: 0px;
  margin-right: auto;
  margin-bottom: 0px;
  margin-left: auto;
  justify-content: flex-start;
}

.text-blk {
  margin-top: 0px;
  margin-right: 0px;
  margin-bottom: 0px;
  margin-left: 0px;
  padding-top: 10px;
  padding-right: 10px;
  padding-bottom: 10px;
  padding-left: 10px;
  line-height: 25px;
}

.responsive-container-block.bigContainer {
  padding-top: 10px;
  padding-right: 30px;
  padding-bottom: 10px;
  padding-left: 30px;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.mainImg {
  color: black;
  width: 55%;
  height: auto;
  box-shadow: rgba(0, 0, 0, 0.05) 0px 5px 10px 7px;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  border-bottom-right-radius: 10px;
  border-bottom-left-radius: 10px;
}

.text-blk.headingText {
  font-size: 20px;
  font-weight: 700;
  line-height: 34px;
  color: rgb(51, 51, 51);
  padding-top: 0px;
  padding-right: 10px;
  padding-bottom: 0px;
  padding-left: 10px;
  margin-top: 0px;
  margin-right: 0px;
  margin-bottom: 10px;
  margin-left: 0px;
}

.allText {
  padding-top: 0px;
  padding-right: 0px;
  padding-bottom: 0px;
  padding-left: 0px;
  margin-top: 0px;
  margin-right: 0px;
  margin-bottom: 0px;
  margin-left: 40px;
  width: 40%;
  margin: 0 0 0 0;
}

.text-blk.subHeadingText {
  color: rgb(102, 102, 102);
  font-size: 20px;
  line-height: 34px;
  font-weight: 700;
  padding-top: 0px;
  padding-right: 10px;
  padding-bottom: 0px;
  padding-left: 10px;
  margin-top: 0px;
  margin-right: 0px;
  margin-bottom: 15px;
  margin-left: 0px;
}

.text-blk.description {
  font-size: 20px;
  line-height: 34px;
  color: rgb(102, 102, 102);
  margin-top: 0px;
  margin-right: 0px;
  margin-bottom: 30px;
  margin-left: 0px;
  padding-top: 0px;
  padding-right: 10px;
  padding-bottom: 0px;
  padding-left: 10px;
}

.explore {
  font-size: 15px;
  line-height: 28px;
  color: rgb(255, 255, 255);
  background-color: orangered;
  padding-top: 10px;
  padding-right: 50px;
  padding-bottom: 10px;
  padding-left: 50px;
  border-top-width: 0px;
  border-right-width: 0px;
  border-bottom-width: 0px;
  border-left-width: 0px;
  border-top-style: outset;
  border-right-style: outset;
  border-bottom-style: outset;
  border-left-style: outset;
  border-top-color: rgb(244, 152, 146);
  border-right-color: rgb(244, 152, 146);
  border-bottom-color: rgb(244, 152, 146);
  border-left-color: rgb(244, 152, 146);
  border-image-source: initial;
  border-image-slice: initial;
  border-image-width: initial;
  border-image-outset: initial;
  border-image-repeat: initial;
  cursor: pointer;
}

.explore:hover {
  background-image: initial;
  background-position-x: initial;
  background-position-y: initial;
  background-size: initial;
  background-repeat-x: initial;
  background-repeat-y: initial;
  background-attachment: initial;
  background-origin: initial;
  background-clip: initial;
  background-color: rgb(255, 235, 234);
  color: rgb(244, 152, 146);
}

.responsive-container-block.Container {
  margin-top: 80px;
  margin-right: auto;
  margin-bottom: 30px;
  margin-left: auto;
  justify-content: center;
  align-items: center;
  max-width: 1320px;
  padding-top: 10px;
  padding-right: 10px;
  padding-bottom: 10px;
  padding-left: 10px;
}

.responsive-container-block.Container.bottomContainer {
  margin-top: 30px;
  margin-right: 0px;
  margin-bottom: 50px;
  margin-left: 0px;
  flex-direction: row-reverse;
  margin: 100px auto 50px auto;
}

.allText.aboveText {
  margin: 0 0 0 40px;
}

.allText.bottomText {
  margin: 0 40px 0 0;
}

@media (max-width: 1024px) {
  .responsive-container-block.Container {
    max-width: 850px;
  }

  .mainImg {
    width: 55%;
    height: auto;
  }

  .text-blk.description {
    font-size: 20px;
  }

  .allText {
    width: 40%;
    margin-top: 0px;
    margin-right: 0px;
    margin-bottom: 0px;
    margin-left: 20px;
  }

  .responsive-container-block.bigContainer {
    padding-top: 10px;
    padding-right: 10px;
    padding-bottom: 10px;
    padding-left: 10px;
  }

  .text-blk.subHeadingText {
    font-size: 18px;
  }

  .responsive-container-block.Container.bottomContainer {
    margin: 80px auto 50px auto;
  }

  .responsive-container-block.Container {
    max-width: 830px;
  }

  .allText.aboveText {
    margin: 30px 0 0 40px;
  }

  .allText.bottomText {
    margin: 30px 40px 0 0;
  }
}

@media (max-width: 768px) {
  .mainImg {
    width: 90%;
  }

  .allText {
    width: 100%;
    margin-top: 0px;
    margin-right: 0px;
    margin-bottom: 0px;
    margin-left: 0px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding-top: 0px;
    padding-right: 0px;
    padding-bottom: 0px;
    padding-left: 0px;
  }

  .responsive-container-block.Container {
    flex-direction: column;
    height: auto;
  }

  .text-blk.headingText {
    text-align: center;
  }

  .text-blk.subHeadingText {
    text-align: center;
    font-size: 20px;
  }

  .text-blk.description {
    text-align: center;
    font-size: 20px;
  }

  .allText {
    margin-top: 40px;
    margin-right: 0px;
    margin-bottom: 0px;
    margin-left: 0px;
  }

  .allText.aboveText {
    margin: 40px 0 0 0;
  }

  .responsive-container-block.Container {
    margin: 80px auto 50px auto;
  }

  .responsive-container-block.Container.bottomContainer {
    margin: 50px auto 50px auto;
  }

  .allText.bottomText {
    margin: 40px 0 0 0;
  }
}

@media (max-width: 500px) {
  .responsive-container-block.Container {
    padding-top: 10px;
    padding-right: 0px;
    padding-bottom: 10px;
    padding-left: 0px;
    width: 100%;
    max-width: 100%;
  }

  .mainImg {
    width: 100%;
  }

  .responsive-container-block.bigContainer {
    padding-top: 10px;
    padding-right: 25px;
    padding-bottom: 10px;
    padding-left: 25px;
  }

  .text-blk.subHeadingText {
    font-size: 20px;
    padding-top: 0px;
    padding-right: 0px;
    padding-bottom: 0px;
    padding-left: 0px;
  }

  .text-blk.description {
    font-size: 20px;
    padding-top: 0px;
    padding-right: 0px;
    padding-bottom: 0px;
    padding-left: 0px;
  }

  .allText {
    padding-top: 0px;
    padding-right: 0px;
    padding-bottom: 0px;
    padding-left: 0px;
    width: 100%;
  }
}
</Style>
</head>
<body>
<div class="responsive-container-block bigContainer">
  <div class="responsive-container-block Container">
    <img class="mainImg" src="img/about_2.png">
    <div class="allText aboveText">
      <p class="text-blk headingText">
        Our Mission
      </p>
      <p class="text-blk subHeadingText">
    	Providing seamless vehicle service experiences
      </p>
      <p class="text-blk description">
    	Our mission is to ensure a hassle-free and convenient process for our customers, delivering top-notch vehicle maintenance and service. We aim to exceed expectations by offering a streamlined reservation system and exceptional service quality, fostering trust and satisfaction among our clientele.
      </p>
      <button class="explore">
        Explore
      </button>
    </div>
  </div>
  <div class="responsive-container-block Container bottomContainer">
    <img class="mainImg" src="img/about_1.jpg">
    <div class="allText bottomText">
      <p class="text-blk headingText">
        Our Vision
      </p>
      <p class="text-blk subHeadingText">
    	Revolutionizing the vehicle service industry
      </p>
      <p class="text-blk description">
    	Our vision is to lead the way in transforming the vehicle service landscape. We aspire to innovate continuously, leveraging cutting-edge technology and customer-centric approaches to set new benchmarks in efficiency, reliability, and customer satisfaction. We envision a future where every vehicle service interaction is swift, transparent, and reliable, setting new standards in the industry.
      </p>
      <button class="explore">
        Explore
      </button>
    </div>
  </div>
</div>

</body>
</html>