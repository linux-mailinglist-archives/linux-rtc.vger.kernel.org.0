Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9EF9433F08
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Oct 2021 21:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234749AbhJSTOg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Oct 2021 15:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234715AbhJSTOf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Oct 2021 15:14:35 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52823C061746
        for <linux-rtc@vger.kernel.org>; Tue, 19 Oct 2021 12:12:22 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id 34so10879485vkl.13
        for <linux-rtc@vger.kernel.org>; Tue, 19 Oct 2021 12:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Paa52ALECI3wUgugNy8CX4++EAERrhUzLClLzz2TeNo=;
        b=hh3mY9mbnyhpcdRWYDvhD2yUXHW8hgFnt3kUIWZ22dBTVZ+gi5IeJ1qesyZWkqPzwN
         +aOQNt9Pgi6oky9KfgTvuPgk5JWQdaxqMet37tg+BFtstHZJOtpuJqQWjL1lY6AdRFEC
         aeBQDsDVpVUUIwXdfjti+9Kl1dzW1Vxx7ZfNScNF7jKmK5GOA45gwI8FTRYBJkY9TJ/e
         cROr8c6AbzibsRO18sfK5ZOrbUK8RkYkyM4Iu69q4pIbwOkHZXhhOYPbWdaCMUN3SjfB
         /gSXNEQst1CrUPrDAkiuTLxmD3F9lmMZ/K84fGgncj9TQPGEgEZsRkDDR953i3rZ2mlc
         R/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Paa52ALECI3wUgugNy8CX4++EAERrhUzLClLzz2TeNo=;
        b=fLzQNA3YlAFksFlukmzqSeoC6uXYsYpt+ApSE52opGJFHfBZuHvwfRgLxC52D6GuI3
         bXp5Onn8D4/QpVUsqCbvjVePcW6ysPMzRIFUk2hqVJ9d2Ts1HOuXj5YYgLnkQZjeEmCJ
         NQedlYpm/Y3FkG3wWL+aNsT1lximma20/szOL/xchvg/7RCayW0dOF25qvmBBT/RVM1A
         vHzVqgzhepybKVdRZP4maUEEaJBgdXSMBeRRmYcVLa1csJWiSW+VjdhyFFuvll11GGFc
         RD8Xca4qYFb0SEJOvyWqD4897bFrGcuRP36EitilkPd7A7HJ9bgrISRTbAsvq09nfNiK
         vmgQ==
X-Gm-Message-State: AOAM530wgy5umVcIS6ns0WH+Pa/ZG4jRvxJT1deqi4Fdywiv1klst1PH
        ZTtNMws8LvAhQeN1u9mBbSh3t6920ZW/hCoBcL5FlQ==
X-Google-Smtp-Source: ABdhPJx845gtrTjm894uIjrixRTNWXu9JloLMW6uMUJ2a4I4qovMj6pHpPkts51wz84kHFITnZsXoTuCa0oF9HNSAuw=
X-Received: by 2002:a05:6122:da0:: with SMTP id bc32mr34368591vkb.4.1634670741090;
 Tue, 19 Oct 2021 12:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-3-semen.protsenko@linaro.org> <6dbd4812-bac3-55dc-108e-c322e8a493de@canonical.com>
 <6ce55971-bee5-1bc9-c3a2-28e6ede37401@canonical.com> <CAPLW+4mE09AOSco+X9qE=1sjXvNVkOxtJqur+HoBJExxiw0J=g@mail.gmail.com>
 <YW8E6oeIoRdpmPL8@piout.net>
In-Reply-To: <YW8E6oeIoRdpmPL8@piout.net>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 19 Oct 2021 22:12:09 +0300
Message-ID: <CAPLW+4k26qZDug4JkuPaM_gZMgz8LPg7GHe-5C7zKzEGtzdp=g@mail.gmail.com>
Subject: Re: [PATCH 2/4] rtc: s3c: Add time range
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 19 Oct 2021 at 20:48, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 19/10/2021 19:35:26+0300, Sam Protsenko wrote:
> > On Tue, 19 Oct 2021 at 19:22, Krzysztof Kozlowski
> > <krzysztof.kozlowski@canonical.com> wrote:
> > >
> > > On 19/10/2021 18:17, Krzysztof Kozlowski wrote:
> > > > On 19/10/2021 15:17, Sam Protsenko wrote:
> > > >> This RTC driver only accepts dates from 2000 to 2099 year. It starts
> > > >> counting from 2000 to avoid Y2K problem,
> > > >
> > > > 1. Where is the minimum (2000) year set in the RTC driver?
> > >
> > > Ah, indeed. I found it now in the driver.
> > >
> > > >
> > > >> and S3C RTC only supports 100
> > > >
> > > > On some of the devices 100, on some 1000, therefore, no. This does not
> > > > look correct.
> > >
> > > That part of sentence is still incorrect, but change itself makes sense.
> > > Driver does not support <2000.
> > >
> >
> > Driver itself does not allow setting year >= 2100:
> >
> > <<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>
> >     if (year < 0 || year >= 100) {
> >         dev_err(dev, "rtc only supports 100 years\n");
> >         return -EINVAL;
> >     }
> > <<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>
> >
> > Devices might allow it, so the commit message phrasing is incorrect
> > and should be replaced, yes. But the code should be correct. Should I
> > send v2 with fixed commit message?
> >
>
> It would be better to pass the proper values because else nobody will
> ever come back and fix it (hence why I didn't move that driver to
> devm_rtc_register_device yet).
>

Krzysztof, do you have by chance the doc for different SoCs supported
by S3C RTC driver? I can implement proper values for min/max range for
each SoC, as Alexandre asked, by adding those to driver data. But I
need max year register value (100, 1000, etc) for each of those chips:

  - "samsung,s3c2410-rtc"
  - "samsung,s3c2416-rtc"
  - "samsung,s3c2443-rtc"
  - "samsung,s3c6410-rtc"
  - "samsung,exynos3250-rtc"

For example Exynos850 TRM states that BCDYEAR register has [11:0] bits
for holding the year value in BCD format, so it's 10^(12/4)=1000 years
max.

> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
