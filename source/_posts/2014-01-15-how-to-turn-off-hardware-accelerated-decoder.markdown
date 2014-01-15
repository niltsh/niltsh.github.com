---
layout: post
title: "How to turn off Hardware Accelerated Decoder"
date: 2014-01-15 11:16
comments: true
categories: MPlayerX 
---

MPlayerX supports to decode the video with Hardware Accelerated Decoder (HAD). This feature uses your modern GPU to decode video frame, so that free your CPU for other tasks, and decrease the power consumption in the meantime, hopefully.

Currently, there is no easy way to turn on/off the HAD. And ideally, this feature should be transparent to users, and HAD should be always turned on.

However, the development on HAD is still in the preliminary stage, sometimes HAD may fail to decode the frame and even cause MPlayerX's core crash.

If you found MPlayerX failed to play some H264, MP4, MPEG2, AVC contents, please try the following instructions to turn off HAD.

#### in Preference → Advanced → Extra options, copy&paste the following string

```
-vc -ffh264vda,
```

As you could tell in the snapshot,

{% img /images/turn-off-had.png %}