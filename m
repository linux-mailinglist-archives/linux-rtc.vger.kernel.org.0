Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB9D219C71
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jul 2020 11:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgGIJjv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 9 Jul 2020 05:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgGIJjv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 9 Jul 2020 05:39:51 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A1C3C061A0B
        for <linux-rtc@vger.kernel.org>; Thu,  9 Jul 2020 02:39:51 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id o5so1604739iow.8
        for <linux-rtc@vger.kernel.org>; Thu, 09 Jul 2020 02:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=phzdrYDp3Te1ZAiCDveHan9yjq5P6qZmq9ALPcnW2Lg=;
        b=iCS1JNDAYv6JrjlYKN8Re5E0nDUhIciVrMvzGKJXc8LbCAsnoh181GIXoKJG/FNwtQ
         VrIceRJ9qN3TDDwplhBPyB++O+RLI4bNsWV7Pw+lWGlvJPm9k0xEyFGsv+PI7kdX0uWG
         OqO2gNGjqiArQlvBUvtCDJbxqTwGCiCdROJZsrNd0U1MrxoqC0cw1WXVY3QbJ5qdTxbG
         OuZqiLhOtIT7rKq7TlDvDb17Ht9lQ3B06lGFdRC3CbYypzrruFMEEWhv8gTuEF0Y8i7k
         bbX+3r+vNVPtJZPIb4ZARuWgO2i9mtZJpMYPc6FLaAmhWwUkK6WzSuqVWKv3L43sYBjS
         w0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=phzdrYDp3Te1ZAiCDveHan9yjq5P6qZmq9ALPcnW2Lg=;
        b=Cuef6fqefCa5p88Nl4wSNygxI5cbBciyb5mpLHJAhksXSxMwMUeYMsrcUtdAb923+a
         k+tcW/xfo5LjGIp7ZDB+7YDMUvGZlOCU9S0qql6abTx8rDVbHqB9KPsr88KsJW14KR6n
         6y00tXIyhd1cOHi2mzIwblyktf8h1xU33AkKGjszS9JwLIEYrK6N0PvJFAZxFejYdXmR
         wF8suy+Nn1PNAr9fux48C0rPJU0ekyZtnKFIwPIdmZl2/QyxduGJKqdFEvgYxqIqNaJT
         vOHvwXuYkhR1RvXjsBD6Vh2KJDuferA9pKc7TYYM4g50Uh0x3w1SbM44YF0drjSzRdpC
         MIZQ==
X-Gm-Message-State: AOAM531RSHzRpEf1G3GtBawkuSyvLswO1cxvQTbi0hJj+CoaRHB68WLJ
        MZTxrzCE/PNUfMk2nKW7iZcf42pCzppn5yVA4mCBxsHp2qWhiA==
X-Google-Smtp-Source: ABdhPJyY+U9agQdKSApMKxQnIjQTfOjusgjwb2WwdFXzCVnONIBq8YGhH2ZD+sVyuuO4UJ7l7jegPQLsoLFQamRVXjI=
X-Received: by 2002:a5e:da06:: with SMTP id x6mr41323608ioj.196.1594287590474;
 Thu, 09 Jul 2020 02:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <1592654683-31314-1-git-send-email-chenhc@lemote.com> <CAAhV-H4iaAdxQD8GYYAZAusS+-dD6APy=jUMXm0QpdOXNS_N_Q@mail.gmail.com>
In-Reply-To: <CAAhV-H4iaAdxQD8GYYAZAusS+-dD6APy=jUMXm0QpdOXNS_N_Q@mail.gmail.com>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Thu, 9 Jul 2020 17:39:39 +0800
Message-ID: <CAAhV-H77Qm91qhvLiTTMYkEZd7NLFZa5KD0mDrHsiSrtxT7wpQ@mail.gmail.com>
Subject: Re: [PATCH] rtc: goldfish: Enable interrupt in set_alarm() when necessary
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        miodrag.dinic@syrmia.com
Cc:     linux-rtc@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi, Midorag,

Maybe miodrag.dinic@syrmia.com is your new email address? Please
review this patch.
And Alessandro, Alexandre, could you please help to review this patch?

Huacai

On Fri, Jul 3, 2020 at 11:00 AM Huacai Chen <chenhuacai@gmail.com> wrote:
>
> Ping?
>
> On Sat, Jun 20, 2020 at 8:03 PM Huacai Chen <chenhc@lemote.com> wrote:
> >
> > When use goldfish rtc, the "hwclock" command fails with "select() to
> > /dev/rtc to wait for clock tick timed out". This is because "hwclock"
> > need the set_alarm() hook to enable interrupt when alrm->enabled is
> > true. This operation is missing in goldfish rtc (but other rtc drivers,
> > such as cmos rtc, enable interrupt here), so add it.
> >
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> >  drivers/rtc/rtc-goldfish.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/rtc/rtc-goldfish.c b/drivers/rtc/rtc-goldfish.c
> > index 1a3420e..d5083b0 100644
> > --- a/drivers/rtc/rtc-goldfish.c
> > +++ b/drivers/rtc/rtc-goldfish.c
> > @@ -73,6 +73,7 @@ static int goldfish_rtc_set_alarm(struct device *dev,
> >                 rtc_alarm64 = rtc_tm_to_time64(&alrm->time) * NSEC_PER_SEC;
> >                 writel((rtc_alarm64 >> 32), base + TIMER_ALARM_HIGH);
> >                 writel(rtc_alarm64, base + TIMER_ALARM_LOW);
> > +               writel(1, base + TIMER_IRQ_ENABLED);
> >         } else {
> >                 /*
> >                  * if this function was called with enabled=0
> > --
> > 2.7.0
> >
