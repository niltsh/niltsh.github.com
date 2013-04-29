---
layout: post
title: "mplayer的编译方法"
date: 2013-04-24 12:47
comments: true
categories: MPlayerX mplayer 编译 compile
---

网上类似的文章数不胜数，并且有想法自己搞这些开源玩意儿的同学想必水平也应该都在我之上，我本不该多此一举。不过记得当初为了编译出一个能够完全胜任MPlayerX的核心，我还是费了相当一些周折，这些周折如果在网上仔细调查也能得到答案，不过将它们总结到一起的文章，我还没有发现。所以我就做一个搬运工，把它们放到一起供有兴趣的同学翻阅。

我会尽力在我水平之内照顾到这篇文章的通用性，但请恕我精力有限，如果有什么出错的地方请和我联系。

<!-- more -->

_多点代码，少点废话。_

* ###准备工具链

编译所需要的所有的工具，都可以通过安装[Xcode](https://itunes.apple.com/en/app/xcode/id497799835?mt=12)得到。

* ###编译依赖库

    1. Fontconfig
        * 功能：用于 支持MKV格式的内嵌字体。
        * 地址：[http://www.freedesktop.org/software/fontconfig/release/](http://www.freedesktop.org/software/fontconfig/release/)
        * 编译方法：
                tar xvf fontconfig-2.10.92.tar.bz2
                cd fontconfig-2.10.92
                ./configure
                make
                sudo make install

    2. freetype2
        * 功能：用于 字幕和OSD的文字显示。
        * 地址：[http://sourceforge.net/projects/freetype/files/freetype2/](http://sourceforge.net/projects/freetype/files/freetype2/)
        * 编译方法：
                tar xvf freetype-2.4.11.tar.bz2
                cd freetype-2.4.11/
                ./configure
                make
                sudo make install

    3. yasm
        * 功能：用于编译 libvpx。
        * 地址：[http://yasm.tortall.net/Download.html](http://yasm.tortall.net/Download.html)
        * 编译方法：
                tar xvf yasm-1.2.0.tar.gz
                cd yasm-1.2.0
                ./configure
                make
                sudo make install

    4. libvpx
        * 功能：WebM解码模块。
        * 地址：[http://code.google.com/p/webm/downloads/list](http://code.google.com/p/webm/downloads/list)
        * 编译方法：
                tar xvf libvpx-1.1.0.tar.bz2
                cd libvpx-1.1.0/
                ./configure --enable-vp8 --enable-postproc --enable-multithread --enable-spatial-resampling --disable-examples --disable-codec-srcs --disable-install-srcs --disable-install-docs --disable-debug --target=x86_64-darwin10-gcc
                make
                sudo make install 

    5. live555
        * 功能：该模块可以让mplayer通过http协议传输rtsp协议的内容。
        * 地址：[http://www.live555.com/liveMedia/public/live555-latest.tar.gz](http://www.live555.com/liveMedia/public/live555-latest.tar.gz)
        * 编译方法：
                tar xvf live555-latest.tar.gz
                cd live
                ./genMakefiles macosx
                make
                sudo make install

    **注**

    编译流程比较简单，解压 → configure → make → sudo make install，需要注意的是 ./configure的选项。

* ###编译mplayer

    1. **下载源代码**
        1. mplayer
                git clone git://git.mplayerhq.hu/mplayer -b master mplayer
        2. ffmpeg
                git clone git://source.ffmpeg.org/ffmpeg.git -b master mplayer/ffmpeg
        3. libdvdnav
                git clone git://git.videolan.org/libdvdnav.git -b master libdvdnav
        4. libdvdread
                git clone git://git.videolan.org/libdvdread.git -b master libdvdread
        5. 制作 libdvdnav 和 libdvdread 的符号链接
                ln -s mplayer/libdvdnav libdvdnav/src
                ln -s mplayer/libdvdread4 libdvdread/src

    2. **编译**
            cd mplayer
            export CC="clang"
            ./configure --codecsdir=codecs --disable-mencoder --disable-gui --disable-apple-remote  --disable-unrarexec  --disable-pnm --disable-tga --disable-md5sum --disable-quartz  --disable-openal --disable-jpeg --disable-png --disable-yuv4mpeg --disable-faac --disable-faad --disable-tv --disable-libdca --disable-liba52 --disable-libvorbis --disable-theora --disable-qtx --disable-gl --disable-matrixview --disable-x11 --disable-xv --enable-decoder=vda --extra-cflags="-mmacosx-version-min=10.6" --extra-ldflags="-mmacosx-version-min=10.6 -framework CoreFoundation -framework VideoDecodeAcceleration -framework QuartzCore" --enable-runtime-cpudetection
            make -j8

        现在你已经可以使用刚刚生成的mplayer了，祝贺你。试试看
                ./mplayer test.mp4

    3. **重定向动态链接库文件路径**

    如果你只是自己用，那么以上的步骤就足够了，你可以离开这个网页。

    如果你将你做好的mplayer发给你的朋友，它们可能会得到下面的错误。
        QZYMBP17:binaries NILTSH$ ./mplayer 
        dyld: Library not loaded: /usr/local/lib/libfreetype.6.dylib
          Referenced from: /Volumes/Work/MPX/src/MPlayerX/MPlayerX/binaries/./mplayer
          Reason: image not found
        Trace/BPT trap: 5

    mplayer使用了动态链接库技术来链接到它需要使用的依赖库。因此如果我们试图在并没有编译安装依赖库的Mac中运行mplayer的话，将会得到以上的错误。

     * **那如何查看 某一个二进制文件会链接到哪些动态链接库**呢？
            otool -L mplayer
        这个命令会输出mplayer所连接到的所有的库，包括系统默认的，所以一般我们可以用下面的命令。
            otool -L mplayer | grep local

        我们会得到如下的输出：
            /usr/local/lib/libfreetype.6.dylib (compatibility version 15.0.0, current version 15.0.0)
            /usr/local/lib/libfontconfig.1.dylib (compatibility version 6.0.0, current version 6.4.0)
            /usr/local/lib/libspeex.1.dylib (compatibility version 7.0.0, current version 7.0.0)

        因此，我们不仅要将mplayer本身拷贝到对方的电脑，还要将
