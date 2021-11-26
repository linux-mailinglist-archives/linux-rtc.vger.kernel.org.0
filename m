Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A58945EB61
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Nov 2021 11:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377144AbhKZK20 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 26 Nov 2021 05:28:26 -0500
Received: from forward500p.mail.yandex.net ([77.88.28.110]:39234 "EHLO
        forward500p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1376791AbhKZK0Z (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 26 Nov 2021 05:26:25 -0500
X-Greylist: delayed 4414 seconds by postgrey-1.27 at vger.kernel.org; Fri, 26 Nov 2021 05:26:24 EST
Received: from myt6-0c96ceb81798.qloud-c.yandex.net (myt6-0c96ceb81798.qloud-c.yandex.net [IPv6:2a02:6b8:c12:2ca1:0:640:c96:ceb8])
        by forward500p.mail.yandex.net (Yandex) with ESMTP id D83EDF01DAE;
        Fri, 26 Nov 2021 13:23:10 +0300 (MSK)
Received: from myt5-ca5ec8faf378.qloud-c.yandex.net (myt5-ca5ec8faf378.qloud-c.yandex.net [2a02:6b8:c12:2514:0:640:ca5e:c8fa])
        by myt6-0c96ceb81798.qloud-c.yandex.net (mxback/Yandex) with ESMTP id cMbiGnzSOD-NAC4mgdG;
        Fri, 26 Nov 2021 13:23:10 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1637922190;
        bh=C8h7n/snmrr7VMsjaotT+OXGgDBbrOtd9iXOJRm2QR8=;
        h=In-Reply-To:Subject:To:From:References:Date:Message-ID:Cc;
        b=RIEak6uJM8ICqsffw3HIWdQ5sJMkOyM4wvX+XvqrvtakgvT51k7ELMJqQ08oQ2hHB
         Q08zfOOJZ13b6mIKIU17MhygAaR4zGRzs8vAnf67qZij+Dtiv4xcHWY62bsmDGlojS
         51X5WjyCSP4TwM0T7Jq66pqzcH1yV0/Zrji4NK0w=
Authentication-Results: myt6-0c96ceb81798.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by myt5-ca5ec8faf378.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id pmKXsvOiW4-N9wq2Gcw;
        Fri, 26 Nov 2021 13:23:09 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
X-Yandex-Fwd: 2
Date:   Fri, 26 Nov 2021 13:23:08 +0300
From:   Nikita Shubin <nikita.shubin@maquefel.me>
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     David Abdurachmanov <david.abdurachmanov@sifive.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rtc: da9063: add as wakeup source
Message-ID: <20211126132308.7b265f17@redslave.neermore.group>
In-Reply-To: <DB9PR10MB465287595152C33A43FDBCDA80639@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
References: <20211123140604.21655-1-nikita.shubin@maquefel.me>
        <DB9PR10MB465224854946DABA0F75515980609@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
        <20211126120935.188e672a@redslave.neermore.group>
        <DB9PR10MB465287595152C33A43FDBCDA80639@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Adam!

On Fri, 26 Nov 2021 09:50:18 +0000
Adam Thomson <Adam.Thomson.Opensource@diasemi.com> wrote:

> On 26 November 2021 09:10, Nikita Shubin wrote:
> 
> > > Can you please make the commit message more detailed, explaining
> > > why you're making this change; what it adds/fixes/removes/etc.?
> > > Right now just reading this I'm unclear as to why you're adding a
> > > call to device_init_wakeup() here. The generic I2C client code
> > > will mark the parent MFD device as a wake source, if the relevant
> > > boolean 'wakeup' is defined in DT, so what does this add?  
> > 
> > Sorry for long response had to double check setting wakeup-source in
> > case i have missed something.
> > 
> > I2C_CLIENT_WAKE is set in of_i2c_get_board_info - the place da9063
> > rtc would never get to.
> > 
> > Setting "wakeup-source" for pmic indeed marks it as wakeup source,
> > but that's not exactly we want.
> > 
> > What we want is "wakealarm" in RTC sysfs directory, to be able to
> > set alarm so we can wake up from SHUTDOWN/DELIVERY/RTC mode of
> > da9063.
> > 
> > We do have /sys/class/rtc/rtc0/wakealarm if marking da9063-rtc as
> > device_init_wakeup.
> > 
> > Unfortunately marking pmic or rtc as wakeup-source in device tree
> > gives us nothing.
> > 
> > ls /proc/device-tree/soc/i2c\@10030000/pmic\@58/
> > compatible            interrupt-parent  name  regulators
> > wakeup-source interrupt-controller  interrupts        reg   rtc
> >     wdt
> > 
> > ls /proc/device-tree/soc/i2c\@10030000/pmic\@58/rtc/
> > compatible  name  wakeup-source
> > 
> > ls /sys/class/rtc/rtc0/wakealarm
> > ls: cannot access '/sys/class/rtc/rtc0/wakealarm': No such file or
> > directory
> > 
> > So i currently see that either da9063 RTC should be marked as wakeup
> > source, or the da9063 MFD should somehow set that for RTC.
> > 
> > And we want this even if CONFIG_PM is off.
> > 
> > Mentioning "/sys/class/rtc/rtc0/wakealarm" in commit message would
> > be enough ?  
> 
> Thanks for the detailed response; it helped a lot. Having reviewed
> the core code along with your description I know understand what's
> happening here. Basically marking as 'wakeup-source' is simply a
> means to expose the sysfs attribute to user-space.
> 
> Yes I think in the commit message you should be clear that there's a
> need to access the sys attribute 'wakealarm' in the RTC core and
> clarify exactly why there is that need. Your commit log should be
> good enough so that if anyone else needs to look at this later they
> completely understand the intention behind the change.
> 
> By the way, I assume the functionality you're looking for could also
> have been achieved through using the /dev/rtcX instance for DA9063?

Thank you for pointing this out, indeed i missed that obvious thing.

We can also simply set alarm via rtcwake, even if CONFIG_PM is off:

rtcwake -m no -s 60

Now i am not sure we should make changes to da9063-rtc driver - what do
you think ?
