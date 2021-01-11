Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5A412F17BB
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 15:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729929AbhAKOMT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Jan 2021 09:12:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728213AbhAKOMQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Jan 2021 09:12:16 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AAA9C061786
        for <linux-rtc@vger.kernel.org>; Mon, 11 Jan 2021 06:11:36 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id t16so24811731ejf.13
        for <linux-rtc@vger.kernel.org>; Mon, 11 Jan 2021 06:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dVZC7Hwy0sID9sYDNRf3c2kgpntf1fr82m9IY+c7BlU=;
        b=Ib8512zkd50nS7IVCHQp+GRbvpumxwNf9N2PwrwRV/wh72d3zZiOobRA2Nn+w/Uxji
         mmhLqbbiIY3V5vU1QlmalJkPc7LyL1p8cMLvu6HTw8MlGr3fyhd+U8/OandNlQWNOUwW
         M2fz/4drHPlUbiAjL8aFcaP0/+yOr5wr2BuhIyZsAk2Z/LqQI9Wqq3uIUti1hAbeiSDH
         4gHKpw8fzOmuJGFPQ6kDTTkdD9+UpfnKD5h3dZdC2XKrqILfIapC5WxwFdJyTyVJpIj5
         zyYDBIFP0Rgf7699ajXvCzMxnpGQeKkGGbTS6EJPYNgZxzCohF9gtyvnEQnheJlNCFCP
         UbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dVZC7Hwy0sID9sYDNRf3c2kgpntf1fr82m9IY+c7BlU=;
        b=p7sLSrdHc4j/zXKkorQOHHkz1kRA5Bohdgy+BCw5O9ISdo1AF5m4K2HJnltjxLzVul
         oImtYyD6M4z9XzUYRJpzV6rUOALfrYTXpowpJ7c6/izujJY0HZpj2Z4g/nHr3uFZhyjC
         UruosXeHOGAoOCtDjRfLmtbCjfDyopPtg0KIeuOYamsfuXFxNLuuN4lZVA7ieB0X91nu
         5wHlDUrmQoNmlcc5Px9DMsuelmHm3KU1WTXgzKF110irKJfxetoYZfx6SYDE8ZXQMNkd
         /WBC2CODoU42WBjLlT4+/QeUhtQARFbSv49KKCA3gCxXk9nZl4Eb4aJdbqY6rVRicdQT
         KMJA==
X-Gm-Message-State: AOAM533M/J0QgWdaV9mwnBWf4da9ObIUY+CLFFiaJ7w5ZochYg/q6wF6
        yXyigCzANdSFJZp7r83baYofNbKq5h7U+4gOKhQPpg==
X-Google-Smtp-Source: ABdhPJz6IfLBiFPclFxJ3y3AOA57uKbDMPB7SMWZj3vQH9CWqAEn0YJ9bDdugqVm7l4H/R5Mao3MHYZk4pQudIYqjG8=
X-Received: by 2002:a17:906:b04f:: with SMTP id bj15mr10358264ejb.383.1610374294969;
 Mon, 11 Jan 2021 06:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20210111124027.21586-1-brgl@bgdev.pl> <20210111124027.21586-3-brgl@bgdev.pl>
 <20210111133521.GB34341@kozik-lap>
In-Reply-To: <20210111133521.GB34341@kozik-lap>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Jan 2021 15:11:24 +0100
Message-ID: <CAMRc=MdLAupcMkSEpdVJiBTogbN6G2aqr=kC+0GT6s-igSSL0g@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] rtc: s5m: check the return value of s5m8767_rtc_init_reg()
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

On Mon, Jan 11, 2021 at 2:35 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Jan 11, 2021 at 01:40:26PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > This function can fail if regmap operations fail so check its return
> > value in probe().
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  drivers/rtc/rtc-s5m.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
> > index eb9dde4095a9..e0011d3cf61b 100644
> > --- a/drivers/rtc/rtc-s5m.c
> > +++ b/drivers/rtc/rtc-s5m.c
> > @@ -791,6 +791,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
> >       platform_set_drvdata(pdev, info);
> >
> >       ret = s5m8767_rtc_init_reg(info);
> > +     if (ret)
> > +             return ret;
>
> You leak I2C device.
>

Yes, the next patch fixes it but I changed the order. Actually this
can be moved after 3/3 with no conflicts when applying.

Bartosz
