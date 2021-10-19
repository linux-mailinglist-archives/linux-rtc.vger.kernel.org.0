Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD0D1433C41
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Oct 2021 18:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233961AbhJSQeV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Oct 2021 12:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234145AbhJSQeU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Oct 2021 12:34:20 -0400
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7225C061749
        for <linux-rtc@vger.kernel.org>; Tue, 19 Oct 2021 09:32:07 -0700 (PDT)
Received: by mail-ua1-x936.google.com with SMTP id r17so1035801uaf.8
        for <linux-rtc@vger.kernel.org>; Tue, 19 Oct 2021 09:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hahfVOoHWaswWYG6AOdwobrg+9oFJjD78UWkQSP5iBo=;
        b=E1IZ9VcAEyedR+jX7NNNMbreSe4uG0nyM9N7yuY3sk9PSqHBG4TwSPqkZTMjnEt4Mb
         EYxjZN2QTZ1MlUgbzFPWyM63ihdr0CEVc7xdZkZJ6vh8NcfJrtuC6aGBEhplNvqcFAAS
         3LBlZ1AMJkq8shq0fYFNBegn1EGMvj3bI6/LTjPKYvBZkQ3mDvSrOlcZLXJwKMrLK2JY
         QyY6EbHFuD+ZcTZS8Ar5KFCAxrfVu471RU28npVrh8BOf2QDxUPKusE9N+Cw+qhXvqTM
         jklyQCsP87Vnm6mZ/PnuaijjL8XqAD/lTxLZyODdRoznKt9LvAFAk4yBdijAFl/h5OxW
         D70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hahfVOoHWaswWYG6AOdwobrg+9oFJjD78UWkQSP5iBo=;
        b=QBXBk28zm9/IIA6ptAphW4x7ZzcjQ/jHkmry5KxTv5wyPDwq1hu1MLHb5xxs9PO7y6
         avtpaLTX3Qz69SHR83qI46TjLHmzhl67ZBRhhefhvznMeYAzXGN1ftkYuvp9GifXqlD0
         eZjbo81Lyyt5n7dzvmuyEUIIL7b9emjpjWWVKAb/95ymXQeRBxViQKYCwCru2WUACYtj
         B/HiNzH+tdI5NTNSLgQQ7+wddyqkaHyYQ8d1+0mBngpejhHvFN8b41bm2XenZI++nSnT
         d9O8GupBULfiaeglEnXpf1mHKokW3O2kzk+9tkkqwNefkGdUIX71vjKmhbumdJEmkLEL
         dI2Q==
X-Gm-Message-State: AOAM532ovV4bOXi9TBixK+5FM06t0BWbOWtVMfLUHjmsp3MykEebzQ4l
        ku+mQpwa+3vJ7oFflYtmB+98vPTbPJcGipxcV/Ft0pXN7B45Egnm
X-Google-Smtp-Source: ABdhPJzMkEBEDghfVNd7ZH6s9/IUFdm8ZBbkizGDdXiUVgEEgcgXk5j22Ilzem9n/a/TGoR5j2zFABdQFwTUh62jCyE=
X-Received: by 2002:ab0:3303:: with SMTP id r3mr1049741uao.17.1634661126908;
 Tue, 19 Oct 2021 09:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-3-semen.protsenko@linaro.org> <YW7wTY5VOsPMAT3v@piout.net>
In-Reply-To: <YW7wTY5VOsPMAT3v@piout.net>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 19 Oct 2021 19:31:55 +0300
Message-ID: <CAPLW+4=nO8oPRnGL5PhRJyRZ6gEhA0pe2SOjQ6hrwo=SV_z1zA@mail.gmail.com>
Subject: Re: [PATCH 2/4] rtc: s3c: Add time range
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-rtc@vger.kernel.org,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 19 Oct 2021 at 19:20, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 19/10/2021 16:17:22+0300, Sam Protsenko wrote:
> > This RTC driver only accepts dates from 2000 to 2099 year. It starts
> > counting from 2000 to avoid Y2K problem, and S3C RTC only supports 100
> > years range. Provide this info to RTC framework.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/rtc/rtc-s3c.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> > index 10e591794276..d9994efd70ef 100644
> > --- a/drivers/rtc/rtc-s3c.c
> > +++ b/drivers/rtc/rtc-s3c.c
> > @@ -454,6 +454,8 @@ static int s3c_rtc_probe(struct platform_device *pdev)
> >       }
> >
> >       info->rtc->ops = &s3c_rtcops;
> > +     info->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
> > +     info->rtc->range_max = RTC_TIMESTAMP_END_2099;
> >
>
> This change is missing the if (year < 0 || year >= 100)  removal in
> s3c_rtc_settime()
>

It's not actually removed in [PATCH 3/4] (if I'm following you
correctly), it was replaced with this code:

<<<<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>
    if (rtc_tm.tm_year < 0 || rtc_tm.tm_year >= 100) {
        dev_err(dev, "rtc only supports 100 years\n");
        return -EINVAL;
    }
<<<<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>

But [PATCH 3/4] is mostly needed for [PATCH 4/4], so you can drop it
if you don't like it. Or it might be kept as a cleanup.

+
+    if (rtc_tm.tm_year < 0 || rtc_tm.tm_year >= 100) {
+        dev_err(dev, "rtc only supports 100 years\n");
+        return -EINVAL;
+    }

> >       ret = devm_rtc_register_device(info->rtc);
> >       if (ret)
> > --
> > 2.30.2
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
