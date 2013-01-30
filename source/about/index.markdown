---
layout: page
title: "About"
date: 2013-01-28 22:59
comments: false
sharing: true
footer: true
---

<div style="position:relative; width:90%; height:400px;">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css" media="screen">
        #selfintro li {
            list-style: none;
            color: #555;
        }
    </style>
    <ul id="selfintro">
        <li>Male</li>
        <li>男</li>
        <li>Married</li>
        <li>已婚</li>
        <li>既婚者</li>
        <li>Middle-aged</li>
        <li>步入中年</li>
        <li>软件</li>
        <li>硬件</li>
        <li>MPlayerX</li>
        <li>工程师</li>
        <li>中国</li>
        <li>日本</li>
        <li>Mac</li>
        <li>Linux</li>
        <li>闷骚</li>
        <li>冥想</li>
        <li>旅行</li>
        <li>東京</li>
        <li>神奈川</li>
        <li>ソフトウェア</li>
        <li>ハードウェア</li>
        <li>エンジニア</li>
        <li>ペット好き</li>
        <li>非極客</li>
        <li>寡言</li>
        <li>抬杠</li>
        <li>理科男</li>
        <li>轻度洁癖</li>
        <li>Software</li>
        <li>Hardware</li>
        <li>Mandarin</li>
        <li>Japanese</li>
        <li>English</li>
        <li>Tokyo</li>
        <li>Travel</li>
        <li>Kanagawa</li>
        <li>Engineer</li>
        <li>Keeg</li>
        <li>Traveller</li>
        <li>Meditation</li>
    </ul>

    <script type="text/javascript">
    
    //Setup Arrays that will hold the x,y,inc of each element.
    var x = new Array();
    var y = new Array();
    var inc = new Array();
    
    //Get the list of items.
    var div = document.getElementById('selfintro');
    var items = div.getElementsByTagName('li');
    
    //Animate the items.
    function animate() {
        //Step through each item.
        for(i = items.length - 1; i >= 0; i--) {

            inc[i]++;

            //variables for movement.           
            var xVar = 50 + x[i] * inc[i];  // x value
            var yVar = 50 + y[i] * inc[i];  // y value, move towards bottom of screen
            var zVar = 8 * inc[i];          // inc value, text get larger.

            //Check to see if text position is still on the screen.
            // the #'s are %. 100 is far right or bottom, 0 is top or left.
            // for inc value it's the font size in %.
            if (!xVar | xVar < 0 | xVar > 90 | 
                yVar < 0 | yVar > 90 | 
                zVar < 0 | zVar > 1500) {
                //if it's off the screen randomly pick a starting place.
                x[i] = Math.random() * 2 - 1;
                y[i] = Math.random() * 2 - 1;
                inc[i] = 2;
            } else {
                //if it's still on the screen apply the appropiate styles.

                $(items[i]).css("position", "absolute"); // make sure we can move the text around.
                $(items[i]).css("top", xVar+"%");  // y value
                $(items[i]).css("left", yVar+"%"); // x value
                
                $(items[i]).css("fontSize", (zVar/8)+"%"); // font size (illusion of perspective.)
                $(items[i]).css("opacity",(zVar)/1500); // fade in from the distance.
            }
        }
        setTimeout(animate, 20);
    }
animate();
</script>

</div>
