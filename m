Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81E113F1E70
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Aug 2021 18:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhHSQ4M (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Aug 2021 12:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhHSQ4M (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Aug 2021 12:56:12 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A033C061575;
        Thu, 19 Aug 2021 09:55:36 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id j186so4412417vsc.10;
        Thu, 19 Aug 2021 09:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sH8eWequPHDWgDssOzyKI1BjAJXBRn3U8UTRbb2OxeA=;
        b=isIMmXKXhlbg9KCfgacH/IeQnaRJHDNTP8PwE7sAxFrwQQiL+x8bcsJQfZpYSwAHCX
         /iKpfW5xkVPhDJ3cSkSHdTOAKPZDfaYDRvoC4D7kbQM4uplQxBYzWWr4tL2gksFOtHKc
         nHCyz6wJbc6Ftf88HqQt6ZQqjlqyELHKsDwI1+QHJSvy+BLcaF0YlgjyPZVGYwHPTJqV
         t16DJstAMrBvpr1CSLvObzAe1thRMcC20HyXAPnP0tATuOKyPfJwp6IeswZKnBAgji52
         w28OTwIyGulUIIm68m0l2YVwJpxKfjeTyS7A9rrnejKmt8pr5H6GDcG6FOahzt+Phgco
         yfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sH8eWequPHDWgDssOzyKI1BjAJXBRn3U8UTRbb2OxeA=;
        b=B/mbSJxpb2cmOIApLiEEW7BzZNZh4nv5wqauKStBREkV+oy9sujrZWTuoGONA4CyoM
         +OBmuik1xiyOM/ILhxDANxPqb2ldTfeEOaKPVqdEIOye7V4Yy4ywGjb8xMHEbOOwaF7i
         hO4wW8YPyTjq6z7TVd7UDyXff+5QjwDOKZrtq5pWHs8iXaPNHDUyRjjJg4iZ6nUGG4j6
         rTC6+ZEQjmQ0HK9Pu+WP0C5v45VA1tPntU/V2nLfQkrdPmF3qN9tJ0ltj+hvFgjt9S1u
         SoWRIJ0u26KKW4OSGWEDn3Vb2pskSrNZdo8HZgaf9//J2eKfSygOUT8kh0W3qOqRKQ8r
         CBFQ==
X-Gm-Message-State: AOAM533a5Qc1WtOlLv/GmNFzEauAmgqh49n1O3UKbD4ijT58Ep4bwBXG
        KOGfnazGZ2mZZVN58V1RX/J3AHoam9Z6kus66Ek=
X-Google-Smtp-Source: ABdhPJxbJWiDarEkH1g0STsXWOZfjOOH2SuXX0PhD8lcQpwI3W2zoiPJvcDBXD9KnylYa93O21UL63bSv/uU7Dph0W8=
X-Received: by 2002:a05:6102:3181:: with SMTP id c1mr13191231vsh.45.1629392135269;
 Thu, 19 Aug 2021 09:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210801160921.233081-1-romain.perier@gmail.com>
 <20210801160921.233081-3-romain.perier@gmail.com> <YQ2Pm7nrEFmdS6Ky@piout.net>
In-Reply-To: <YQ2Pm7nrEFmdS6Ky@piout.net>
From:   Romain Perier <romain.perier@gmail.com>
Date:   Thu, 19 Aug 2021 18:55:22 +0200
Message-ID: <CABgxDo+deU3J1JCCSFTscQP8sm=XeXKJ=cPf4u78o37f3XBqwA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rtc: Add support for the MSTAR MSC313 RTC
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

Le ven. 6 ao=C3=BBt 2021 =C3=A0 21:38, Alexandre Belloni
<alexandre.belloni@bootlin.com> a =C3=A9crit :
>
> Hello,
>
> On 01/08/2021 18:09:20+0200, Romain Perier wrote:
> > +static int msc313_rtc_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct msc313_rtc *priv;
> > +     int ret;
> > +     int irq;
> > +     unsigned long rate;
> > +     u16 reg;
> > +
> > +     priv =3D devm_kzalloc(&pdev->dev, sizeof(struct msc313_rtc), GFP_=
KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->rtc_base =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(priv->rtc_base))
> > +             return PTR_ERR(priv->rtc_base);
> > +
> > +     irq =3D platform_get_irq(pdev, 0);
> > +     if (irq < 0)
> > +             return -EINVAL;
> > +
> > +     priv->rtc_dev =3D devm_rtc_allocate_device(dev);
> > +     if (IS_ERR(priv->rtc_dev))
> > +             return PTR_ERR(priv->rtc_dev);
> > +
> > +     priv->rtc_dev->ops =3D &msc313_rtc_ops;
> > +     priv->rtc_dev->range_min =3D RTC_TIMESTAMP_BEGIN_0000;
>
> I'm pretty sure this doesn't fit in this RTC registers, you should
> probably leave range_min to 0 (i.e. not set it at all).

ack

>
> > +     priv->rtc_dev->range_max =3D U32_MAX - 1; /* 2106-02-07 06:28:14 =
*/
>
> I guess this one should be U32_MAX

ack

> > +
> > +     ret =3D devm_request_irq(dev, irq, msc313_rtc_interrupt, IRQF_SHA=
RED,
> > +                            dev_name(&pdev->dev), &pdev->dev);
> > +     if (ret) {
> > +             dev_err(dev, "Could not request IRQ\n");
> > +             return ret;
> > +     }
> > +
> > +     priv->clk =3D devm_clk_get(dev, NULL);
> > +     if (IS_ERR(priv->clk)) {
> > +             dev_err(dev, "No input reference clock\n");
> > +             return PTR_ERR(priv->clk);
> > +     }
> > +
> > +     ret =3D clk_prepare_enable(priv->clk);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to enable the reference clock, %d\n"=
, ret);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D devm_add_action_or_reset(dev, (void (*) (void *))clk_disa=
ble_unprepare, priv->clk);
> > +     if (ret)
> > +             return ret;
> > +
> > +     rate =3D clk_get_rate(priv->clk);
> > +     writew(rate & 0xFFFF, priv->rtc_base + REG_RTC_FREQ_CW_L);
> > +     writew((rate >> 16) & 0xFFFF, priv->rtc_base + REG_RTC_FREQ_CW_H)=
;
> > +
> > +     reg =3D readw(priv->rtc_base + REG_RTC_CTRL);
> > +     reg |=3D CNT_EN_BIT;
> > +     writew(reg, priv->rtc_base + REG_RTC_CTRL);
> > +
>
> If on POR, CNT_EN_BIT is not set, then it would be nice to use that to
> know whether the RTC is properly set. You can then check CNT_EN_BIT in
> .read_time and return -EINVAL if it is not set. Then you can set the bit
> in .set_time. It is anyway useless to let the RTC running if it is not
> set.

Yeah, this is to be sure that the RTC is alive with a valid value
(which makes sense).
Ok I will fix everything in v3, then.

Romain
