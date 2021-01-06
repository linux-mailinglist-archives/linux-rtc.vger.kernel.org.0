Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 306592EBA08
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Jan 2021 07:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbhAFGfc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 Jan 2021 01:35:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbhAFGfc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 6 Jan 2021 01:35:32 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F9EC06134C
        for <linux-rtc@vger.kernel.org>; Tue,  5 Jan 2021 22:34:51 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id q22so3743453eja.2
        for <linux-rtc@vger.kernel.org>; Tue, 05 Jan 2021 22:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0BSeqRkCM+aoGwHCkguo5YisOBwQa8OgLWvbVoLYyH0=;
        b=gJLV5vbxf1a/179odUydFTH8lmjKqtF0d7/aFz8xmjKorL8UNk0CHofsZEYltf2T66
         pXup4EWeBM/dd5H0rvzwl20rQ/uWhBmSDb5rjYaJizSw1OK42trxPs4FIQkKtzwpJUZ/
         q4AqggkZm96L2FTWsRIaDlyzkq7nRHkiroSOl0+wMBCmtOQC3v1cPAcNE447q1gggmH2
         IUJwwU4VzI5Z+o1JznT2H/gPLb0z80PBNwYje1P92nMuPAhSGNWqmrWdD3fvjZ9wu5am
         kHhqkh5I9ZNGbgi3g2ID7qj5TR6Noe3hf8jZIEDJk5xvmgN89m8xSPZsoyCLEUICQe98
         ofkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0BSeqRkCM+aoGwHCkguo5YisOBwQa8OgLWvbVoLYyH0=;
        b=VdRmvgHo1AOfTpXKZREdp6l/XCYJMgiabcSnoWDNFE8IK5g+gNW+hmi7DyGsmUtGlv
         n0+Bz3L2/QbJM19r7Y/UUnE0NHdJwNvZd6pexcNMh+qDhTkka79G4fLpIirEuSrMJOGc
         4K6ShhqgmAJl5aMsI5kxQPgpFCjf0P9tIdGAnKXadblerwwjt/lCvfMk2q64FKw4drAU
         7Q5ud2Uq8SFD0FUm4SOdXIgOoO579a4Z4DPjyVABkhdR8p61WEz+d/iRwju6j28FSfOe
         yl28xXHf9EHIFJ1ZNKB19yqrEc6G19nhpqzCHqMC9HczSMz3ixi2W/8Ky4i9ejTaD+eh
         eZ2A==
X-Gm-Message-State: AOAM533lePBD5krUUPhnNB6Fz5QBAbXS6NHhJ7BMyg4pIuSDT3dWqYgr
        HcPpkPHjxeEOLAKSlk27QvapCMlgw55vqMPXlzeEIg==
X-Google-Smtp-Source: ABdhPJyUqauHu3c/ORqQX039FTkRPFkAHZrIWHwoKd95sfGeNU1t0nioq+caOBkVHhjlOxs45IZEoOf2QQ3Xhv6HYAk=
X-Received: by 2002:a17:906:5912:: with SMTP id h18mr1875139ejq.261.1609914890538;
 Tue, 05 Jan 2021 22:34:50 -0800 (PST)
MIME-Version: 1.0
References: <20210105134424.30632-1-brgl@bgdev.pl> <20210105165014.GA20401@kozik-lap>
In-Reply-To: <20210105165014.GA20401@kozik-lap>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 6 Jan 2021 07:34:39 +0100
Message-ID: <CAMRc=MeEbDJMxoF6Pyfj6GKPVR6eRLd+2oh1ZJUWsz2L6j-Ymg@mail.gmail.com>
Subject: Re: [PATCH] rtc: s5m: use devm_i2c_new_dummy_device()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Jan 5, 2021 at 5:50 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, Jan 05, 2021 at 02:44:24PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Use the managed variant of i2c_new_dummy_device() to shrink code and
> > remove the goto label.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  drivers/rtc/rtc-s5m.c | 24 ++++++++----------------
> >  1 file changed, 8 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
> > index eb9dde4095a9..3432c6213b4c 100644
> > --- a/drivers/rtc/rtc-s5m.c
> > +++ b/drivers/rtc/rtc-s5m.c
> > @@ -760,7 +760,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
> >               return -ENODEV;
> >       }
> >
> > -     info->i2c = i2c_new_dummy_device(s5m87xx->i2c->adapter, RTC_I2C_ADDR);
> > +     info->i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
> > +                                           RTC_I2C_ADDR);
> >       if (IS_ERR(info->i2c)) {
> >               dev_err(&pdev->dev, "Failed to allocate I2C for RTC\n");
> >               return PTR_ERR(info->i2c);
> > @@ -768,10 +769,9 @@ static int s5m_rtc_probe(struct platform_device *pdev)
> >
> >       info->regmap = devm_regmap_init_i2c(info->i2c, regmap_cfg);
> >       if (IS_ERR(info->regmap)) {
> > -             ret = PTR_ERR(info->regmap);
> >               dev_err(&pdev->dev, "Failed to allocate RTC register map: %d\n",
> > -                             ret);
> > -             goto err;
> > +                     ret);
> > +             return PTR_ERR(info->regmap);
> >       }
> >
> >       info->dev = &pdev->dev;
> > @@ -781,10 +781,9 @@ static int s5m_rtc_probe(struct platform_device *pdev)
> >       if (s5m87xx->irq_data) {
> >               info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);
> >               if (info->irq <= 0) {
> > -                     ret = -EINVAL;
> >                       dev_err(&pdev->dev, "Failed to get virtual IRQ %d\n",
> >                               alarm_irq);
> > -                     goto err;
> > +                     return -EINVAL;
> >               }
> >       }
> >
> > @@ -797,10 +796,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
> >       info->rtc_dev = devm_rtc_device_register(&pdev->dev, "s5m-rtc",
> >                                                &s5m_rtc_ops, THIS_MODULE);
> >
> > -     if (IS_ERR(info->rtc_dev)) {
> > -             ret = PTR_ERR(info->rtc_dev);
> > -             goto err;
> > -     }
> > +     if (IS_ERR(info->rtc_dev))
> > +             return PTR_ERR(info->rtc_dev);
> >
> >       if (!info->irq) {
> >               dev_info(&pdev->dev, "Alarm IRQ not available\n");
> > @@ -813,15 +810,10 @@ static int s5m_rtc_probe(struct platform_device *pdev)
> >       if (ret < 0) {
> >               dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
> >                       info->irq, ret);
> > -             goto err;
> > +             return ret;
> >       }
> >
> >       return 0;
> > -
> > -err:
> > -     i2c_unregister_device(info->i2c);
> > -
> > -     return ret;
> >  }
> >
> >  static int s5m_rtc_remove(struct platform_device *pdev)
>
> Unbind should OOPS now.
>

Yes... Yes it should. And it won't in v2. :)

Thanks!
Bart
