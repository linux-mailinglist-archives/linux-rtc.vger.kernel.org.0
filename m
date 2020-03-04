Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAD91790B8
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Mar 2020 14:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388083AbgCDNAH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 4 Mar 2020 08:00:07 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:41352 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388081AbgCDNAH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 4 Mar 2020 08:00:07 -0500
Received: by mail-qv1-f66.google.com with SMTP id s15so710857qvn.8
        for <linux-rtc@vger.kernel.org>; Wed, 04 Mar 2020 05:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Beu3qvFTUH06Rlm0/R7E/eA87SF87SDv5KPlGbUEFUY=;
        b=SjfdFlS3wO55dVhIbilav3RQtVBWgW91Cnb/+8n7jkIY3LxEaXZNW4wSRZ1w0P+Y2Z
         m2wcVG3v4ccrUcE2gOaZ9eeheXa1jOFC15/2rUmkBSsjvSz5A70/65MZ8+07ABoV8gmL
         lUJOwfGxVQgX8ZwatFqrgLAj0QQ4QVNzVsKWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Beu3qvFTUH06Rlm0/R7E/eA87SF87SDv5KPlGbUEFUY=;
        b=qTvUQYacGgJ84QrwgPeVpnyUP7FFkgbxR4mnqMVCXzaAzkCVcq7YcoylO3Pz2KiGfM
         VD5mpINzX6aDQcCbrYmmuACm0VqfXUKGGL6zG5e8DUlDfk0RMUuqbmm2f6YERnX5APq3
         vo0Bnc4wIGwI0TB5Cgfkbjg9h/bS5k5gEP8Z9DZmPGKM2kkQ1AcEzTdMvXVtvIiQN5sf
         SMNHus2R8JfEwpYJMEfPaYvCZbIDC+TlGUbVAbM4HHzgnC00BRLpvCFwPUFHVBF313Kd
         GxlkpwAyTXj6xEscTt+VyFAQURjms9NM3XaBHSpPvCJafXUtzgYw6hSHK1e528Ka+1pH
         /a3w==
X-Gm-Message-State: ANhLgQ3h00kFadE+95bsccYULhZSKkDOcBTreOVdFO20dvTVCA0stAMb
        tAD0zLQuGjwCk6N6Q4EXWr57L4D8IsOGh+wP80pK0m8A1Gw=
X-Google-Smtp-Source: ADFU+vvAPd9eUBLgxOcz8KO1mdbkjC+PQUvSPfxQ3LEaj+3mlGdcvGhxsv7PsukxnD5IbwUM3xFfAimQpPOT+wKAGoo=
X-Received: by 2002:a05:6214:1750:: with SMTP id dc16mr1985308qvb.47.1583326806377;
 Wed, 04 Mar 2020 05:00:06 -0800 (PST)
MIME-Version: 1.0
References: <1580730044-30501-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1580730044-30501-5-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1580748607.31376.3.camel@mtksdaap41> <1581911502.20099.13.camel@mhfsdcap03>
In-Reply-To: <1581911502.20099.13.camel@mhfsdcap03>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Wed, 4 Mar 2020 20:59:55 +0800
Message-ID: <CANMq1KDTHcFV8Gue1PuOWkWXL20z_-j58u8JpwbBm_wUvLeqSg@mail.gmail.com>
Subject: Re: [PATCH v8 4/5] rtc: mt6397: Add support for the MediaTek MT6358 RTC
To:     Ran Bi <ran.bi@mediatek.com>
Cc:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Josef Friedl <josef.friedl@speed.at>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sean Wang <sean.wang@mediatek.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Richard Fontana <rfontana@redhat.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Eddie Huang <eddie.huang@mediatek.com>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On Mon, Feb 17, 2020 at 11:52 AM Ran Bi <ran.bi@mediatek.com> wrote:
>
> On Tue, 2020-02-04 at 00:50 +0800, Yingjoe Chen wrote:
> > > diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
> > > index f84b916..fffe34a 100644
> > > --- a/include/linux/mfd/mt6397/rtc.h
> > > +++ b/include/linux/mfd/mt6397/rtc.h
> > > @@ -18,7 +18,8 @@
> > >  #define RTC_BBPU_CBUSY         BIT(6)
> > >  #define RTC_BBPU_KEY            (0x43 << 8)
> > >
> > > -#define RTC_WRTGR              0x003c
> > > +#define RTC_WRTGR_MT6358       0x3a
> > > +#define RTC_WRTGR_MT6397       0x3c
> > >
> > >  #define RTC_IRQ_STA            0x0002
> > >  #define RTC_IRQ_STA_AL         BIT(0)
> > > @@ -57,6 +58,10 @@
> > >  #define MTK_RTC_POLL_DELAY_US  10
> > >  #define MTK_RTC_POLL_TIMEOUT   (jiffies_to_usecs(HZ))
> > >
> > > +struct mtk_rtc_data {
> > > +   u32                     wrtgr;
> > > +};
> > > +
> > >  struct mt6397_rtc {
> > >     struct device           *dev;
> > >     struct rtc_device       *rtc_dev;
> > > @@ -66,6 +71,15 @@ struct mt6397_rtc {
> > >     struct regmap           *regmap;
> > >     int                     irq;
> > >     u32                     addr_base;
> > > +   const struct mtk_rtc_data *data;
> > > +};
> > > +
> > > +static const struct mtk_rtc_data mt6358_rtc_data = {
> > > +   .wrtgr = RTC_WRTGR_MT6358,
> > > +};
> > > +
> > > +static const struct mtk_rtc_data mt6397_rtc_data = {
> > > +   .wrtgr = RTC_WRTGR_MT6397,
> > >  };
> >
> > Hi,
> >
> > Putting these in header file doesn't looks right to me.
> > Who need this? can you move them back to rtc-mt6397.c?
> > Joe.C
> >
>
> This could also effect kernel/drivers/power/reset/mt6323-poweroff.c
> which using same region of RTC registers.
> There are 2 ways of modification:
> 1. kernel/drivers/rtc/rtc-mt6397.c implement do_pwroff function and
> export to mt6323-poweroff.c
> 2. Just modify mt6323-poweroff.c file to compatible this patch. I mean
> using RTC_WRTGR_MT6397 to replace RTC_WRTGR. Or modify mt6323-poweroff.c
> like rtc-mt6397.c

Oh, I see, so basically both rtc-mt6397.c and mt6323-poweroff.c need
to know at what offset RTC_WRTGR actually is. Correct?

Is there any plan to have mt6323-poweroff.c support any of the other
PMICs (not just MT6323?)?

a. If not, I'd just add:
#define RTC_WRTGR_MT6323 RTC_WRTGR_MT6397
in rtc.h, for added clarity, use that in mt6323-poweroff.c
(s/RTC_WRTGR/RTC_WRTGR_MT6323/), and be done with it.

Actually, even if there's a plan, you can go ahead with this simpler
solution for now, and fix later when the issue comes up.

b. If you ever want to support multiple PMICs with mt6323-poweroff.c,
you'd need that offset for 2 different sub-devices under the same mfd,
so the matching logic belongs in the main mfd device, not in
rtc/poweroff driver.

So I'd move the matching logic in drivers/mfd/mt6397-core.c, and add
rtc_wrtgr offset (or a full _data structure) to `struct mt6397_chip`,
or, probably better, add a IORESOURCE_REG to the matching resources to
specify the offset (that's what drivers/mfd/88pm860x-core.c seems to
be doing, for example).

And then mt6323-poweroff.c should probably be renamed to mt6397-poweroff.c.

(actually, looking at this, I'm even questioning if mt6323-poweroff.c
should even exist, and if you should just fold it into rtc-mt6397.c?
Since they use the same registers?)

Hope this makes sense?

Best,
