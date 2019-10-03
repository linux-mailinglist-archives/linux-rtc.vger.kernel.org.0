Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17760CB133
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2019 23:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731694AbfJCVey (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Oct 2019 17:34:54 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:57781 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731371AbfJCVey (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Oct 2019 17:34:54 -0400
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id AB04B100005;
        Thu,  3 Oct 2019 21:34:52 +0000 (UTC)
Date:   Thu, 3 Oct 2019 23:34:52 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Lukasz Majewski <lukma@denx.de>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: Add support for century bits to m41t62 (rv4162) RTC
 devices
Message-ID: <20191003213452.GT4106@piout.net>
References: <20190911154803.15969-1-lukma@denx.de>
 <20191003114831.GR4106@piout.net>
 <20191003142150.3d73a9d7@jawa>
 <20191003123538.GS4106@piout.net>
 <20191003151434.49762715@jawa>
 <20191003134329.GB575@piout.net>
 <20191003161054.1eeae401@jawa>
 <20191003142341.GD575@piout.net>
 <20191003164906.2f4a1676@jawa>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191003164906.2f4a1676@jawa>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 03/10/2019 16:49:06+0200, Lukasz Majewski wrote:
> Hi Alexandre,
> I'm rather thinking about following use cases:
> 
> I. Adjusting time:
> 
> 1. I start with time < 01.01.2099
> 
> 2. I issue ioctl to set the time to e.g. 2100
> 
> 	- When driver receives such request I setup century bits
> 
> 	- and also perform in kernel driver time correction (and store
> 	  corrected time in RTC)
> 
> 3. Subsequent reads from rtc use century bits to provide the time
> (after year 2100). Century bits are set, so the correction may be
> performed if needed.
> 
> 
> II. The system is started at year 2098 and is supposed to run for e.g. 3
> years:
> 
> 1. The time is read from the rtc - the "passing" of centuries need to
> be detected.
> 
> From the documentation [1] (point 4.5):
> 
> "The two century bits, CB1 and CB0, are bits 7 and 6, respectively, in
> the Month / Century register at address 06h. Together, they comprise a
> 2 - bit counter which increments at the turn of each century. CB1 is
> the most significant bit."
> 
> If those bits increment when we pass century boundaries, we can detect
> this fact and correct time when ioctl is issued.
> 

No, you can't because you simply don't know if you still need to
correct the time or if you already did it the last time the system was
started.

Example:

Date is set to 2100-02-28, some time pass, the rtc now thinks it is
2100-02-29. You correct it to 2100-03-01, fine.
Now, date is set to 2100-02-28, the system is shutdown, some time pass,
it starts on 2100-03-02, the rtc thinks 2100-03-01 you can't correct it
because you can't know whether a day has been missed.


> > The only useful range for an RTC is its fully contiguous range. 
> 
> Does the automatic increment of century bits count to "contiguous
> range" ?
> 

No, because of the leap day issue.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
