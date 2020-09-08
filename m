Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B61260EC2
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Sep 2020 11:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728925AbgIHJf7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Sep 2020 05:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728739AbgIHJfx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Sep 2020 05:35:53 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42782C061756
        for <linux-rtc@vger.kernel.org>; Tue,  8 Sep 2020 02:35:43 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id z9so16460457wmk.1
        for <linux-rtc@vger.kernel.org>; Tue, 08 Sep 2020 02:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=BeqWiKyy2q9h196I07hlm698YeqsB6n9xDnRMOn41fE=;
        b=zRfCxghfDE520rmBsbZWLpRUQoNwbS7ZJswAcOp3EFCxZF/qxDkslg0bMkhEaPbnvQ
         uQoIootj9J20mEuW52nBQncMupNt1Z/lrCEUp/hTHF2cbW4ze5phqMwUHXT88Onf6T6U
         XPt1SuCD3Pnx/vROIgCZq2UKCI8XwvSjGmQKOioKp15LciAkortrb6a+oqK2wy+7ceiI
         6hNREpWE+8PRikBCPMWWciaHI7emd+oSPkxLRmdsOyvZBcQbUOS4zc4yyIT4eFeywSTO
         0Inzytl0SCyaQ4Yegfmjydgu/XZk4F5SHVzA2/rJ6rW8YxtvwaYnGVSSvD2+AazINpeM
         5Kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BeqWiKyy2q9h196I07hlm698YeqsB6n9xDnRMOn41fE=;
        b=L6H5d39N3n83OJdZ2nxRUdz0SHxcKTo8yXNYHby8+VCOYNvqdbZAD3Uty5bIxlNVTx
         ZjSnG2uV/sy+fONCN1lIJt7/dEskW0VheioRxTLKQelqAZsxpANJej9vC1w+vCPFXKkD
         QdRcMNVfHYivmy4hHdGm3Jp+HA4TTxGl3H9oh7IYorPXDGKbpNH/lG9wI1rVodaJjeYX
         PKyCbdKugXm1C98omVy78YuZLdPoyORwdiBbngihBc2mNSwmrqFvoWBrHTmtZiAGyDIJ
         fblrpqmxNByX3csE03SlzqADdkp/fArJ7D7DbW86yO+cnR9RyQ593110OjVHrPZgoKpy
         nb0A==
X-Gm-Message-State: AOAM533SgeMvX0URPxLiwhETKX+TcpIKjJYkhUVwwTEXL+hLmFOf/imd
        Wr21tFbx+db0Z2sXDn3CuobzyA==
X-Google-Smtp-Source: ABdhPJwSGVcSB7tECrf90WTk449mkRJzFsiMZbiOsDL0m1RNcYjJzM6A1ZUkahuSc+wylUXYyogdpQ==
X-Received: by 2002:a1c:7d0c:: with SMTP id y12mr3504117wmc.103.1599557742367;
        Tue, 08 Sep 2020 02:35:42 -0700 (PDT)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id q12sm32786028wrp.17.2020.09.08.02.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 02:35:41 -0700 (PDT)
Date:   Tue, 8 Sep 2020 10:35:38 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Mark Brown <broonie@kernel.org>, allen <allen.chen@ite.com.tw>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Josua Mayer <josua.mayer@jm0.eu>,
        Andreas Kemnade <andreas@kemnade.info>,
        Arnd Bergmann <arnd@arndb.de>, Daniel Palmer <daniel@0x0f.com>
Subject: Re: [PATCH v2 05/10] pwm: ntxec: Add driver for PWM function in
 Netronix EC
Message-ID: <20200908093538.GM4400@dell>
References: <20200905133230.1014581-1-j.neuschaefer@gmx.net>
 <20200905133230.1014581-6-j.neuschaefer@gmx.net>
 <CAHp75VdUHoOyM3bObzhdfiqpne0AmSK_UakteTZxnjqJVrNV9A@mail.gmail.com>
 <20200908081445.GC4400@dell>
 <CAHp75Veb5nVasy28FSksf06eVVhC8N5hHsEPM-2YcFbMjZ5Rhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Veb5nVasy28FSksf06eVVhC8N5hHsEPM-2YcFbMjZ5Rhw@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 08 Sep 2020, Andy Shevchenko wrote:

> On Tue, Sep 8, 2020 at 11:14 AM Lee Jones <lee.jones@linaro.org> wrote:
> > On Sat, 05 Sep 2020, Andy Shevchenko wrote:
> > > On Saturday, September 5, 2020, Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> > > wrote:
> 
> ...
> 
> > > > +config PWM_NTXEC
> > > > +       tristate "Netronix embedded controller PWM support"
> > >
> > >
> > >
> > >
> > > > +       depends on MFD_NTXEC && OF
> > >
> > >
> > > I don’t see need to reduce test coverage and use of the driver by sticking
> > > with OF. Actually it’s not used.
> >
> > If the device is only known to boot with OF, then it's pointless
> > building it when !OF.
> 
> No, it's not. As I pointed out the (compilation) test coverage is better.

No, it's a waste of disk space.

Why would you knowingly compile something you know you can't use?

That's the whole point of COMPILE_TEST.

Note that when you want real coverage and you use `allyesconfig`
and/or `allmodconfig` then CONFIG_OF is also enabled on platforms
which support it.

> > If you want to increase test coverage enable
> > COMPILE_TEST instead.
> 
> It is one way to achieve that, yes;
> 
>        depends on OF || COMPILE_TEST
>        depends on MFD_NTXEC

This is better.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
