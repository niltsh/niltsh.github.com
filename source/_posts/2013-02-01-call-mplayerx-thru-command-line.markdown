---
layout: post
title: "Call MPlayerX thru script"
date: 2013-02-01 09:35
comments: true
categories: MPlayerX script
---

MPlayerX supports __Shell__ script command line and __AppleScript__ as its integration to the OS. 

* ### For Shell script

Usage:

{% codeblock lang:bash In Terminal.app, the command looks like %}
open -a /path/to/MPlayerX.app --args -name1 value1 -name2 value2 ...
{% endcodeblock %}

Besides the names in the table below, the strings declared in [this file](https://github.com/niltsh/MPlayerX/blob/sparkle/MPlayerX/UserDefaults.m) could also be used as name.

<div>
<style type="text/css" media="screen">
* + table {
  border-style:solid;
  border-width:1px;
  border-color:#b7b3b7;
  margin: 16px;
}
* + table th, * + table td {
  border-color:#b7b3b7;
  border-width:1px;
  padding-left: 12px;
  padding-right: 12px;
}
* + table th {
  border-style:solid;
  font-weight:bold;
  background: url("/images/noise.png?1330434582") repeat scroll left top #F7F3F7;
  text-align:center;
}

* + table td {
	border-style:dashed;
}
</style>
<table>
    <tr>
        <th>name</th>
        <th>value</th>
    </tr>
    <tr>
        <td>url</td>
        <td>the url of the media<br></td>
    </tr>
    <tr>
        <td>file</td>
        <td>the path of the media file<br></td>
    </tr>
</table>
</div>

##### A real world example

{% codeblock lang:bash %}
open -a /Applications/MPlayerX.app --args -file /Movies/myfavorite.mp4 -volume 50 -StartByFullScreen YES
{% endcodeblock %}


* ### For AppleScript

MPlayerX just started to support AppleScript in 1.0.17, its implementation still stays in primary status.

Usually you could use _AppleScript Editor_ to look up all the functions provided by MPlayerX, for geeks, the source code is [here](https://github.com/niltsh/MPlayerX/blob/sparkle/MPlayerX/MPlayerXScript.sdef).
