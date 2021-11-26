Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B74D45EA53
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Nov 2021 10:25:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376398AbhKZJ2O (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 26 Nov 2021 04:28:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376333AbhKZJ0I (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 26 Nov 2021 04:26:08 -0500
X-Greylist: delayed 373 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 26 Nov 2021 01:15:55 PST
Received: from forward108p.mail.yandex.net (forward108p.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D8BC061379
        for <linux-rtc@vger.kernel.org>; Fri, 26 Nov 2021 01:15:55 -0800 (PST)
Received: from postback1j.mail.yandex.net (postback1j.mail.yandex.net [IPv6:2a02:6b8:c04:242:0:640:5c69:b0ec])
        by forward108p.mail.yandex.net (Yandex) with ESMTP id 462562676D52;
        Fri, 26 Nov 2021 12:09:37 +0300 (MSK)
Received: from forward500j.mail.yandex.net (forward500j.mail.yandex.net [IPv6:2a02:6b8:0:801:2::110])
        by postback1j.mail.yandex.net (Yandex) with ESMTP id 391875169C58;
        Fri, 26 Nov 2021 12:09:37 +0300 (MSK)
Received: from iva4-d8b0e1d849e5.qloud-c.yandex.net (iva4-d8b0e1d849e5.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:825:0:640:d8b0:e1d8])
        by forward500j.mail.yandex.net (Yandex) with ESMTP id 360186CB640B;
        Fri, 26 Nov 2021 12:09:37 +0300 (MSK)
Received: from iva4-b3ebd202b141.qloud-c.yandex.net (iva4-b3ebd202b141.qloud-c.yandex.net [2a02:6b8:c0c:4e8e:0:640:b3eb:d202])
        by iva4-d8b0e1d849e5.qloud-c.yandex.net (mxback/Yandex) with ESMTP id qjXZFRsKQo-9aCajNSr;
        Fri, 26 Nov 2021 12:09:37 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1637917777;
        bh=oePM+HLWUxBfG3jAEg8TG/YPC4fVuNglt4wj6gC6RWI=;
        h=In-Reply-To:Subject:To:From:References:Date:Message-ID:Cc;
        b=M++atBQImzoRB0MFLGleAfttBhwtRlEzNhjkJ0kzp3dXEjXgIIgWv4X6eJYKLKR17
         FyKQ0Dv2zrhOUHbYEKX2YjamK5fgMin3DsZxTRuy1/TQ3SNybGNojBAfGg0wGwsjtR
         O8zZ/DTQevASNCZURSI4L51HUuHWYGnL0/MS9cYs=
Authentication-Results: iva4-d8b0e1d849e5.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva4-b3ebd202b141.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id uftgvbgBst-9aw0stCG;
        Fri, 26 Nov 2021 12:09:36 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
X-Yandex-Fwd: 2
Date:   Fri, 26 Nov 2021 12:09:35 +0300
From:   Nikita Shubin <nikita.shubin@maquefel.me>
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     David Abdurachmanov <david.abdurachmanov@sifive.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rtc: da9063: add as wakeup source
Message-ID: <20211126120935.188e672a@redslave.neermore.group>
In-Reply-To: <DB9PR10MB465224854946DABA0F75515980609@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
References: <20211123140604.21655-1-nikita.shubin@maquefel.me>
        <DB9PR10MB465224854946DABA0F75515980609@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Adam!

On Tue, 23 Nov 2021 14:37:42 +0000
Adam Thomson <Adam.Thomson.Opensource@diasemi.com> wrote:

> On 23 November 2021 14:06, Nikita Shubin wrote:
> 
> > As da9063 driver refuses to load without irq, we simply add it as a
> > wakeup source before registering rtc device.  
> 
> Can you please make the commit message more detailed, explaining why
> you're making this change; what it adds/fixes/removes/etc.? Right now
> just reading this I'm unclear as to why you're adding a call to
> device_init_wakeup() here. The generic I2C client code will mark the
> parent MFD device as a wake source, if the relevant boolean 'wakeup'
> is defined in DT, so what does this add?

Sorry for long response had to double check setting wakeup-source in
case i have missed something.

I2C_CLIENT_WAKE is set in of_i2c_get_board_info - the place da9063 rtc
would never get to.

Setting "wakeup-source" for pmic indeed marks it as wakeup source, but
that's not exactly we want.

What we want is "wakealarm" in RTC sysfs directory, to be able to set
alarm so we can wake up from SHUTDOWN/DELIVERY/RTC mode of da9063.

We do have /sys/class/rtc/rtc0/wakealarm if marking da9063-rtc as
device_init_wakeup.

Unfortunately marking pmic or rtc as wakeup-source in device tree gives
us nothing.

ls /proc/device-tree/soc/i2c\@10030000/pmic\@58/
compatible            interrupt-parent  name  regulators  wakeup-source
interrupt-controller  interrupts        reg   rtc         wdt

ls /proc/device-tree/soc/i2c\@10030000/pmic\@58/rtc/
compatible  name  wakeup-source

ls /sys/class/rtc/rtc0/wakealarm
ls: cannot access '/sys/class/rtc/rtc0/wakealarm': No such file or
directory

So i currently see that either da9063 RTC should be marked as wakeup
source, or the da9063 MFD should somehow set that for RTC.

And we want this even if CONFIG_PM is off.

Mentioning "/sys/class/rtc/rtc0/wakealarm" in commit message would be
enough ?

> 
> > 
> > Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> > ---
> > v1->v2:
> > Alexandre Belloni:
> > 
> > Dropped everything except device_init_wakeup, as driver refuses to
> > load without irq specified, we can always set it as a wakeup
> > source, before calling devm_rtc_register_device.
> > ---
> >  drivers/rtc/rtc-da9063.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
> > index d4b72a9fa2ba..b9a73356bace 100644
> > --- a/drivers/rtc/rtc-da9063.c
> > +++ b/drivers/rtc/rtc-da9063.c
> > @@ -494,6 +494,8 @@ static int da9063_rtc_probe(struct
> > platform_device *pdev)
> >  		dev_err(&pdev->dev, "Failed to request ALARM IRQ
> > %d: %d\n", irq_alarm, ret);
> > 
> > +	device_init_wakeup(&pdev->dev, true);
> > +
> >  	return devm_rtc_register_device(rtc->rtc_dev);
> >  }
> > 
> > --
> > 2.31.1  
> 

