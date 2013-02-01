---
layout: post
title: "Hidden Settings of MPlayerX"
date: 2013-02-01 13:33
comments: true
categories: MPlayerX
---

Some users want more settings, some users want more simplicity.

I think exposing all the settings in the software and stacking them to the GUI is a bad choice. Not only complicating the GUI is bad, making users make the unimportant choice is even worse.

Well, this is my choice of design.

For who does want some feature which is not available in GUI, you may find it here.

<!-- more -->

* #### Usage:

{% codeblock lang:bash In Terminal.app, type the following %}
cd ~/Library/Preferences
defaults write org.niltsh.MPlayerX Name -type Value
{% endcodeblock %}

* #### Name, type, Value

<div>
<style type="text/css" media="screen">
* + table {
  border-style:solid;
  border-width:1px;
  border-color:#b7b3b7;
  margin: 16px;
  font-size: 75%;
}
* + table th, * + table td {
  border-color:#b7b3b7;
  border-width:1px;
  padding-left: 4px;
  padding-right: 4px;
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
<th>Name</th>
	<th>type</th>
	<th>default value</th>
	<th>comment</th>
	<th>available from</th>
</tr>
<tr>
<td> SpeedStepIncre </td>
		<td> float </td>
		<td> 0.1 </td>
		<td> when changing the speed in the accessary control(the TextField), the increment value when press ↑↓ </td>
		<td> unknown </td>
	</tr>
<tr>
<td> SubDelayStepTime </td>
		<td> float </td>
		<td> 0.1 </td>
		<td> similar with SpeedStepTime, the time in seconds </td>
		<td> unknown </td>
	</tr>
<tr>
<td> AudioDelayStepTime </td>
		<td> float </td>
		<td> 0.1 </td>
		<td> similar with SpeedStepTime, the time in seconds </td>
		<td> unknown </td>
	</tr>
<tr>
<td> SubScaleStepValue </td>
		<td> float </td>
		<td> 0.1 </td>
		<td> similar with SpeedStepTime, it is rational to set this value within 0-1 </td>
		<td> unknown </td>
	</tr>
<tr>
<td> SeekStepTimeL </td>
		<td> float </td>
		<td> -10 </td>
		<td> when use ← to backward, the jump time in seconds </td>
		<td> unknown </td>
	</tr>
<tr>
<td> SeekStepTimeR </td>
		<td> float </td>
		<td> 10 </td>
		<td> when use → to forward, the jump time in seconds </td>
		<td> unknown </td>
	</tr>
<tr>
<td> SeekStepTimeU </td>
		<td> float </td>
		<td> 60 </td>
		<td> when use ↑ to forward, the jump time in seconds </td>
		<td> unknown </td>
	</tr>
<tr>
<td> SeekStepTimeB </td>
		<td> float </td>
		<td> -60 </td>
		<td> when use ↓ to backward, the jump time in seconds </td>
		<td> unknown </td>
	</tr>
<tr>
<td> VolumeStep </td>
		<td> float </td>
		<td> 10 </td>
		<td> when use =/- or menu to increase/decrease the volume, the increment value(should be within 0-100) </td>
		<td> unknown </td>
	</tr>
<tr>
<td> SnapshotSavePath </td>
		<td> string </td>
		<td> <em>(internal value)</em> </td>
		<td> if you don’t want to save the snapshot pics into your ~/Pictures, the <strong>Full Path</strong> of the folder where you want to save it </td>
		<td> unknown </td>
	</tr>
<tr>
<td> HideTitlebar </td>
		<td> boolean </td>
		<td> NO </td>
		<td> always hide titlebar even the mouse is hovering on the window </td>
		<td> unknown </td>
	</tr>
<tr>
<td> LogMode </td>
		<td> boolean </td>
		<td> NO </td>
		<td> output logs to console </td>
		<td> unknown </td>
	</tr>
<tr>
<td> Prefer64bitMPlayer </td>
		<td> boolean </td>
		<td> YES </td>
		<td> try to use 64bit mplayer, even with YES, this will fallback to NO, if you have a 32bit CPU </td>
		<td> unknown </td>
	</tr>
<tr>
<td> CloseOnStopped </td>
		<td> boolean </td>
		<td> YES </td>
		<td> When playback finished, whether to close the player window </td>
		<td> unknown </td>
	</tr>
<tr>
<td> SubBorderWidth </td>
		<td> integer </td>
		<td> 2 </td>
		<td> border width of the subtitle </td>
		<td> unknown </td>
	</tr>
<tr>
<td> CloseWndOnEsc </td>
		<td> boolean </td>
		<td> NO </td>
		<td> close window when pressing escape </td>
		<td> unknown </td>
	</tr>
<tr>
<td> PlayWhenEnterFullScrn </td>
		<td> boolean </td>
		<td> NO </td>
		<td> auto resume when entering full screen if paused </td>
		<td> unknown </td>
	</tr>
<tr>
<td> SupportAppleRemote </td>
		<td> boolean </td>
		<td> YES </td>
		<td> Support Apple Remote (Remote Buddy users may want to disable this) </td>
		<td> unknown </td>
	</tr>
<tr>
<td> AssSubMarginV </td>
		<td> integer </td>
		<td> 12 </td>
		<td> the position of Subtitle from bottom, in pixels </td>
		<td> unknown </td>
	</tr>
<tr>
<td> ResizeControlBar </td>
		<td> boolean </td>
		<td> YES </td>
		<td> let the control bar autoresizing with window, or keep it unchanged </td>
		<td> unknown </td>
	</tr>
<tr>
<td> InitialFrameSizeRatio </td>
		<td> float </td>
		<td> 1.0 </td>
		<td> the initial frame size ratio when opening a video </td>
		<td> unknown </td>
	</tr>
<tr>
<td> DisableLastStopBookmark </td>
		<td> boolean </td>
		<td> NO </td>
		<td> disable the last stopped time completely </td>
		<td> unknown </td>
	</tr>
<tr>
<td> ResizeStep </td>
		<td> float </td>
		<td> 0.1 </td>
		<td> the ratio when stepping up/down window size </td>
		<td> unknown </td>
	</tr>
<tr>
<td> OldFullScreenMethod </td>
		<td> boolean </td>
		<td> NO </td>
		<td> the old style of full screen animation(only for Lion) </td>
		<td> 1.0.9 </td>
	</tr>
<tr>
<td> ClickTogPlayPause </td>
		<td> boolean </td>
		<td> NO </td>
		<td> single click to toggle play/pause </td>
		<td> 1.0.11 </td>
	</tr>
<tr>
<td> ARMenuKeyTogTimeDisp </td>
		<td> boolean </td>
		<td> NO </td>
		<td> AppleRemote menu key to toggle the elapse/remaining time </td>
		<td> 1.0.11 </td>
	</tr>
<tr>
<td> FFPThreshRatio </td>
		<td> float </td>
		<td> 1.8 </td>
		<td> the threshold to judge pinch is happening with 4 fingers </td>
		<td> 1.0.11 </td>
	</tr>
<tr>
<td> PauseShowTime </td>
		<td> boolean </td>
		<td> NO </td>
		<td> Show current time when paused </td>
		<td> 1.0.14 </td>
	</tr>
<tr>
<td> ControlUIDetectMouseExit </td>
		<td> boolean </td>
		<td> YES </td>
		<td> Hide control bar immediately when it exit from player window </td>
		<td> 1.0.14 </td>
	</tr>
<tr>
<td> EnableHWAccel2 </td>
		<td> boolean </td>
		<td> YES </td>
		<td> Enable Hardware Accelerated Decoding </td>
		<td> 1.0.17 </td>
	</tr>
</table>
</div>

