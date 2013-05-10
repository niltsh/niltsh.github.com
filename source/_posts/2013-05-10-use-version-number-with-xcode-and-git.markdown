---
layout: post
title: "Use version number with Xcode and git"
date: 2013-05-10 13:25
comments: true
categories: MPlayerX git SCM Xcode
---

As a [Sparkled](http://sparkle.andymatuschak.org) application, MPlayerX needs an automatic count-up mechanism between versions.

### 1. Count up git versions

  Git doesn't provide version number, it only gives out checksum of the commits, so let's make one.

<!-- more -->
{% codeblock lang:bash version.sh %} 
#!/bin/bash

git rev-list HEAD | sort > config.git-hash
LOCALVER=`wc -l config.git-hash | awk '{print $1}'`

if [ $LOCALVER \> 1 ] ; then
    VER=`git rev-list origin/master | sort | join config.git-hash - | wc -l | awk '{print $1}'`

    if [ $VER != $LOCALVER ] ; then
        VER=$LOCALVER
    fi

	## 0 is initial number
    VER=`expr ${VER} + 0`

    echo $VER

else
    VER="unknown"
fi
rm -f config.git-hash
{% endcodeblock %}

  You could download this piece of script [here](https://raw.github.com/niltsh/MPlayerX/sparkle/MPlayerX/version.sh).

  Please note that this script always count up commits in the remote branch **origin/master** and local, so change the **7th** line if you want to work in other branches.

  You could set an initial number if necessary, in the **15th** line.

### 2. Modify the info.plist by the version number

  At first I implemented by some dirty string matching scripts, it works but ugly. Then I found [ScriptingBridge](http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/ScriptingBridgeConcepts/Introduction/Introduction.html), thanks to it I could access the plist by ruby as I do by ObjC, this is much easier.

{% codeblock lang:ruby updateInfoPlist.rb %}
require 'osx/cocoa'
include OSX
OSX.require_framework 'ScriptingBridge'

info = NSMutableDictionary.alloc.initWithContentsOfFile_(ARGV[0])

if info != nil then
	## could read the plist file
	currentVersion = %x[bash version.sh]

	if currentVersion == "unknown" then
		puts "version is invalid!"
	else
		puts "version is valid:" + currentVersion

		currentVersion = currentVersion.chomp
		info.setValue_forKey_(currentVersion, "CFBundleVersion")

		## also grab the commit checksum
		commitHash = %x[git rev-list --max-count=1 HEAD]
		commitHash = commitHash.chomp
		info.setValue_forKey_(commitHash, "CommitHash")
		info.writeToFile_atomically_(ARGV[0], 0)
	end
end
{% endcodeblock %}

  This piece of script could be downloaded [here](https://raw.github.com/niltsh/MPlayerX/sparkle/MPlayerX/updateInfoPlist.rb).

### 3. Automate it
0\. Put the two script files above into your project folder, and then open your project.

1\. Add a new _Aggregate Target_, let's say **Update version in info.plist**.

2\. Inside of this target, add a _Run Script_ build phase.

3\. Add the following code into the shell area.
{% codeblock lang:bash %}
# shell script goes here

export PATH=${PATH}:/usr/local/bin:/usr/local/git/bin:/sw/bin

ruby updateInfoPlist.rb Info.plist
touch -amfc Info.plist

exit 0
{% endcodeblock %}
4\. Then go back to your application target, _add the dependency_.

{% img /images/use-version-number-with-xcode-and-git-1.png 1000 800 0-1-2-3 %}
{% img /images/use-version-number-with-xcode-and-git-2.png 800 150 4 %}

### Notice
   Remember to deploy your application always in the same branch, otherwise the number could be messed up, since the script only count up commits in origin/master and you current local branch.