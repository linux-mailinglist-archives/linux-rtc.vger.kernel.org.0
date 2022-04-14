Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB09500C01
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Apr 2022 13:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242599AbiDNLWO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 Apr 2022 07:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242618AbiDNLWM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 14 Apr 2022 07:22:12 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F76CE0A0
        for <linux-rtc@vger.kernel.org>; Thu, 14 Apr 2022 04:19:47 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 38EF8240002;
        Thu, 14 Apr 2022 11:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649935177;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZXu+LLMNfkUfWr3T7CXhJ1D/5v2k50j/CT0WpseHv5E=;
        b=GX1HCgY+ayJUwFdp5ht4sKpJN8GAVyXJ8Qr37WNL14jWfOSKoRPTXPcgeB115Q+tRIzp7o
        61e8s1FfJbEg0Zdsa6zhLCVOQx6nvfFRKo4TM49Cr+qSkNTiimx+D6uVNxhriG1EuxoXLP
        MzpOxKIgnFB7vVKycvuQxsoVJTkfPzTR0qn4XQg5JfZu50Mzg7WpTM6p8aeHrtzwBakVQD
        iOb/5ebsjHceMBSPFdhKZq66equNp/gxywTEU9V1APU20UQ0hZ3iDn27kTZZZ8qtyidEd9
        UuK3818tlpALWD+uyCLiWpM9tHF/S4kpO6mt5FHeimTxfBwkv60g1p5xDKTA9g==
Date:   Thu, 14 Apr 2022 13:19:32 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Michel Pollet <michel.pollet@bp.renesas.com>
Subject: Re: [PATCH 3/7] rtc: rzn1: Add new RTC driver
Message-ID: <20220414131932.5f5285d4@xps13>
In-Reply-To: <Ylbw3bEc+QK4m9hX@mail.local>
References: <20220405184716.1578385-1-miquel.raynal@bootlin.com>
        <20220405184716.1578385-4-miquel.raynal@bootlin.com>
        <Yk1UXjTk32Vc9+/k@mail.local>
        <20220413172327.73d1fcc1@xps13>
        <Ylbw3bEc+QK4m9hX@mail.local>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alex,

alexandre.belloni@bootlin.com wrote on Wed, 13 Apr 2022 17:48:45 +0200:

> Hi Miqu=C3=A8l,
>=20
> On 13/04/2022 17:23:27+0200, Miquel Raynal wrote:
> > > > +static int rzn1_rtc_probe(struct platform_device *pdev)
> > > > +{
> > > > +	struct rzn1_rtc *rtc;
> > > > +	int ret;
> > > > +
> > > > +	rtc =3D devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> > > > +	if (!rtc)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	platform_set_drvdata(pdev, rtc);
> > > > +
> > > > +	rtc->clk =3D devm_clk_get(&pdev->dev, "hclk");
> > > > +	if (IS_ERR(rtc->clk))
> > > > +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk), "Missing hcl=
k\n");
> > > > +
> > > > +	rtc->base =3D devm_platform_ioremap_resource(pdev, 0);
> > > > +	if (IS_ERR(rtc->base))
> > > > +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->base), "Missing re=
g\n");
> > > > +
> > > > +	rtc->rtcdev =3D devm_rtc_allocate_device(&pdev->dev);
> > > > +	if (IS_ERR(rtc->rtcdev))
> > > > +		return PTR_ERR(rtc);
> > > > +
> > > > +	rtc->rtcdev->range_max =3D 3178591199UL; /* 100 years */   =20
> > >=20
> > > I'm not sure how you came to this value, this is 2070-09-22T05:59:59.
> > > I'm pretty sure the RTC will not fail at that time. Also, the comment
> > > seems fishy. =20
> >=20
> > The RTC itself as no "starting point", but just a counter that can
> > count up to 100. So the max range is start-year + 100 years. But at
> > this point I don't yet have access to the start-year value. What's
> > your advise? =20
>=20
> The question is why is this limited to 100 years? My guess is that it
> doesn't handle leap years properly if this is the case, there is only
> one range that works, this is 2000-01-01 to 2099-12-31 like many other
> RTCs.

I don't know the real reason, actually there is just written that the
"year" register counts up from 00 to 99 (in bcd).

> You can run rtc-range from rtc-tools after removing range_max to find
> out.

Here is the result. It fails at 2069, which I believe means "100 years"
from 1970. So what do you conclude with this? Shall I use
rtc_time64_to_tm(2069-12-31 23:59:59) as the range_max value?

# rtc-range=20

Testing 2000-02-28 23:59:59.
OK

Testing 2038-01-19 03:14:07.
OK

Testing 2069-12-31 23:59:59.
KO RTC_RD_TIME returned 22 (line 124)

Thanks,
Miqu=C3=A8l
