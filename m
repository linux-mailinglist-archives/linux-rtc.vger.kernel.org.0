Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E4220EE6C
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2020 08:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730313AbgF3G2P (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Jun 2020 02:28:15 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:35801 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730273AbgF3G2M (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Jun 2020 02:28:12 -0400
Received: by mail-ej1-f66.google.com with SMTP id rk21so19301179ejb.2;
        Mon, 29 Jun 2020 23:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IBkBLpidCraeYaB8aHMjDRRIIiX4iWGeZXOZd0wY14o=;
        b=B/eLdk6rbhR+Eb/sTI3RjUaz+aH/Ek6A2HyyHrtslWntPbI0wRzhjvzgBBnllw+hZx
         7c/aQg/QaOFrc+kDBp6yVHdNZAEykRXJGkowz+CY0aI37UdWFBW8MiCEmLgyl+jTrJd7
         gEm04pSpn35PI3RGyku5vg5EnN36o0hzIvBtFAFMlxPtLEyzp92hgkPFLubqkGbnq46y
         K1wOKwi0cj1kex/FHwvoBvBHXFkGYQ0DlpLrxvu06kb5KPIjtog/ebE2kTi1KIGYBVg6
         G7NrrzI8/K+J8HLJOvnClJrbWmX7fM5QWoFMAfTn0V2U4jjIhFdcK4ZN6ApRB57OE821
         TvBA==
X-Gm-Message-State: AOAM533z8340jhcQMAqti1sDBz8fWqTEyiK7RdLShrPd3jN7E/MNhR5s
        id5XUw3LaJhM3ZP+kTCUOEIBoorg
X-Google-Smtp-Source: ABdhPJxrnQJ8Sw8QlDZTRApQSzi8VhlGhavIsxexzeuYwAhLoHtisPXAuSYMS+fORpXHNKXE3Aj1Wg==
X-Received: by 2002:a17:906:1998:: with SMTP id g24mr12481950ejd.11.1593498488710;
        Mon, 29 Jun 2020 23:28:08 -0700 (PDT)
Received: from kozik-lap ([194.230.155.195])
        by smtp.googlemail.com with ESMTPSA id a13sm1774702edk.58.2020.06.29.23.28.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 23:28:07 -0700 (PDT)
Date:   Tue, 30 Jun 2020 08:28:05 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] rtc: max77686: Do not allow interrupt to fire before
 system resume
Message-ID: <20200630062805.GA12949@kozik-lap>
References: <20200615161455.4420-1-krzk@kernel.org>
 <20200629222353.GB3800@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200629222353.GB3800@piout.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Jun 30, 2020 at 12:23:53AM +0200, Alexandre Belloni wrote:
> Hi,
> 
> On 15/06/2020 18:14:55+0200, Krzysztof Kozlowski wrote:
> > The rtc-max77686 device shares the main interrupt line with parent MFD
> > device (max77686 driver).  During the system suspend, the parent MFD
> > device disables this IRQ to prevent an early event happening before
> > resuming I2C bus controller.
> > 
> > The same should be done by rtc-max77686 driver because otherwise the
> > interrupt handler max77686_rtc_alarm_irq() will be called before its
> > resume function (max77686_rtc_resume()).  Such issue is not fatal but
> > disabling shared IRQ by all users ensures correct behavior.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > ---
> > 
> > If this looks ok, I guess all maxim RTC drivers should be updated?
> 
> But then, shouldn't that means that this affects all RTCs on an i2c bus?
> 
> I'm not completely proficient with PM but shouldn't using _noirq
> propagate to the parents? Then you are sure that the resume is called
> with interrupts disabled and this also means that the i2c driver has
> resumed (hopefully with interrupts disabled).

This won't work, at least for Exynos platforms now, because of ordering
with other drivers.  The RTC and MFD enable wake up interrupt which goes
through pinctrl... but pinctrl suspends with "late", so before "noirq".
Therefore the wake does not work.

In the same time, the enable_irq_wake() (I am not sure why) also uses
I2C which goes to I2C bus driver... which suspends in "noirq" as well.
This results in some I2C timeouts during suspend and resume:

[   82.631344] wake enabled for irq 131
[   82.632743] wake enabled for irq 132
[   82.649868] samsung-pinctrl 11000000.pinctrl: Setting external wakeup interrupt mask: 0xfffbf7ff
[   82.658367] max77686_rtc_suspend:811
[   82.658488] max77686_rtc_suspend:815
[   87.695000] s3c-i2c 13860000.i2c: timeout waiting for bus idle
[   87.695574] dummy 0-0006: Failed to sync masks in 1
[   87.700446] wake enabled for irq 127
[   87.703883] max77686_rtc_suspend:818
[   87.707408] max77686_rtc_suspend:829
[   87.716862] max77686_suspend:236
[   87.716972] max77686_suspend:240
[   87.717714] max77686_suspend:252
[   87.723173] Disabling non-boot CPUs ...
[   87.745844] Enabling non-boot CPUs ...
[   87.751164] CPU1 is up
[   87.754842] CPU2 is up
[   87.759008] CPU3 is up
[   87.760598] s3c-i2c 13860000.i2c: slave address 0x00
[   87.760709] s3c-i2c 13860000.i2c: bus frequency set to 390 KHz
[   87.760851] s3c-i2c 13870000.i2c: slave address 0x00
[   87.760951] s3c-i2c 13870000.i2c: bus frequency set to 97 KHz
[   87.761085] s3c-i2c 13880000.i2c: slave address 0x00
[   87.761185] s3c-i2c 13880000.i2c: bus frequency set to 97 KHz
[   87.761319] s3c-i2c 138e0000.i2c: slave address 0x00
[   87.761418] s3c-i2c 138e0000.i2c: bus frequency set to 97 KHz
[   87.764159] max77686_resume:261
[   87.764236] max77686_resume:265
[   87.764303] max77686_resume:268
[   87.768204] max77686_rtc_resume:837
[   87.768283] max77686_rtc_resume:840
[   87.768370] max77686_rtc_resume:844
[   92.813964] s3c-i2c 13860000.i2c: timeout waiting for bus idle
[   92.814105] dummy 0-0006: Failed to sync masks in 1
[   92.814205] wake disabled for irq 127

In general, disabling and enabling this shared interrupt seems like a
nice way to be able to suspend/resume driver in the "normal" time,
without the need to order anything (noirq, late).

Best regards,
Krzysztof


> 
> I must admit that I don't know and I hope that the answer would also
> answer whether moving all the RTC resume to resume_early is safe. (See
> https://lore.kernel.org/linux-rtc/20200610132403.2539519-1-martin@geanix.com/#t)
> 
> > ---
> >  drivers/rtc/rtc-max77686.c | 20 ++++++++++++++++++--
> >  1 file changed, 18 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> > index 03ebcf1c0f3d..645de5af707b 100644
> > --- a/drivers/rtc/rtc-max77686.c
> > +++ b/drivers/rtc/rtc-max77686.c
> > @@ -805,17 +805,33 @@ static int max77686_rtc_remove(struct platform_device *pdev)
> >  #ifdef CONFIG_PM_SLEEP
> >  static int max77686_rtc_suspend(struct device *dev)
> >  {
> > +	struct max77686_rtc_info *info = dev_get_drvdata(dev);
> > +	int ret = 0;
> > +
> >  	if (device_may_wakeup(dev)) {
> >  		struct max77686_rtc_info *info = dev_get_drvdata(dev);
> >  
> > -		return enable_irq_wake(info->virq);
> > +		ret = enable_irq_wake(info->virq);
> >  	}
> >  
> > -	return 0;
> > +	/*
> > +	 * Main IRQ (not virtual) must be disabled during suspend because if it
> > +	 * happens while suspended it will be handled before resuming I2C.
> > +	 *
> > +	 * Since Main IRQ is shared, all its users should disable it to be sure
> > +	 * it won't fire while one of them is still suspended.
> > +	 */
> > +	disable_irq(info->rtc_irq);
> > +
> > +	return ret;
> >  }
> >  
> >  static int max77686_rtc_resume(struct device *dev)
> >  {
> > +	struct max77686_rtc_info *info = dev_get_drvdata(dev);
> > +
> > +	enable_irq(info->rtc_irq);
> > +
> >  	if (device_may_wakeup(dev)) {
> >  		struct max77686_rtc_info *info = dev_get_drvdata(dev);
> >  
> > -- 
> > 2.17.1
> > 
> 
> -- 
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
