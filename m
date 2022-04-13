Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8D5D4FFA06
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Apr 2022 17:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234478AbiDMP0B (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Apr 2022 11:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231797AbiDMP0B (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 Apr 2022 11:26:01 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE9147566
        for <linux-rtc@vger.kernel.org>; Wed, 13 Apr 2022 08:23:39 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 1B091200007;
        Wed, 13 Apr 2022 15:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649863413;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=W8BfYBj4EiPXDdXWGpBdNp7BTk+bWEhw6PcxdbWPC5U=;
        b=exBAHR2/Wc4rkJGI565FgelNlGjkvILC/NsKCynnTTFPU14J1dS3KU7xRktK7nQtgTmDUu
        ja/YRK/kwVKigfDISerrtpiU41fF2vij6sWGwNQZcjkAVg5/MhXOMveWL0I347LVagFawW
        XJ/5ZMfdlCF4XlEhylUbDVUv/+siycujgmP6qq6485blJRuTrBLzbnFnDwYRHgNSWo5YGV
        3aVcPMVCWMiV6DTbE9qyi31J0Ss7SAkx1ux/jJ+ckmdEmEDGnW/RLkIDtmqRmfAxnl2jog
        O/C9ndLSP8sQN2qGMGQW1jfyjK207kNs+pMEZmEZ3UTDV8oMqmcZ5d0bq5ZXIg==
Date:   Wed, 13 Apr 2022 17:23:27 +0200
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
Message-ID: <20220413172327.73d1fcc1@xps13>
In-Reply-To: <Yk1UXjTk32Vc9+/k@mail.local>
References: <20220405184716.1578385-1-miquel.raynal@bootlin.com>
        <20220405184716.1578385-4-miquel.raynal@bootlin.com>
        <Yk1UXjTk32Vc9+/k@mail.local>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alex,

> > +	tm->tm_sec =3D bcd2bin(tm->tm_sec);
> > +	tm->tm_min =3D bcd2bin(tm->tm_min);
> > +	tm->tm_hour =3D bcd2bin(tm->tm_hour);
> > +	tm->tm_wday =3D bcd2bin(tm->tm_wday);
> > +	tm->tm_mday =3D bcd2bin(tm->tm_mday);
> > +	tm->tm_mon =3D bcd2bin(tm->tm_mon);
> > +	tm->tm_year =3D bcd2bin(tm->tm_year);
> > +
> > +	dev_dbg(dev, "%d-%d-%d(%d)T%d:%d:%d\n",
> > +		tm->tm_year, tm->tm_mon, tm->tm_mday, tm->tm_wday,
> > +		tm->tm_hour, tm->tm_min, tm->tm_sec);
> > + =20
>=20
> This is not really useful because we have tracepoints in the core.
> Anyway, please use %ptR.

Nice printk operator :)

I've dropped this dev_dbg call, it actually does not serve any useful
purpose.


[...]

> > +static int rzn1_rtc_probe(struct platform_device *pdev)
> > +{
> > +	struct rzn1_rtc *rtc;
> > +	int ret;
> > +
> > +	rtc =3D devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> > +	if (!rtc)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, rtc);
> > +
> > +	rtc->clk =3D devm_clk_get(&pdev->dev, "hclk");
> > +	if (IS_ERR(rtc->clk))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk), "Missing hclk\n"=
);
> > +
> > +	rtc->base =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(rtc->base))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->base), "Missing reg\n"=
);
> > +
> > +	rtc->rtcdev =3D devm_rtc_allocate_device(&pdev->dev);
> > +	if (IS_ERR(rtc->rtcdev))
> > +		return PTR_ERR(rtc);
> > +
> > +	rtc->rtcdev->range_max =3D 3178591199UL; /* 100 years */ =20
>=20
> I'm not sure how you came to this value, this is 2070-09-22T05:59:59.
> I'm pretty sure the RTC will not fail at that time. Also, the comment
> seems fishy.

The RTC itself as no "starting point", but just a counter that can
count up to 100. So the max range is start-year + 100 years. But at
this point I don't yet have access to the start-year value. What's
your advise?

> > +	rtc->rtcdev->ops =3D &rzn1_rtc_ops;
> > +
> > +	ret =3D r9a06g032_sysctrl_enable_rtc(true);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D clk_prepare_enable(rtc->clk);
> > +	if (ret)
> > +		goto disable_rtc;
> > +
> > +	/*
> > +	 * Ensure the clock counter is enabled.
> > +	 * Set 24-hour mode and possible oscillator offset compensation in SU=
BU mode.
> > +	 */
> > +	writel(RZN1_RTC_CTL0_CE | RZN1_RTC_CTL0_AMPM | RZN1_RTC_CTL0_SLSB_SUB=
U,
> > +	       rtc->base + RZN1_RTC_CTL0);
> > +
> > +	/* Disable all interrupts */
> > +	writel(0, rtc->base + RZN1_RTC_CTL1);
> > +
> > +	/* Enable counter operation */
> > +	writel(0, rtc->base + RZN1_RTC_CTL2);
> > + =20
>=20
> I don't think you should do that unconditionally. The RTC is either
> not already started (and doesn't carry the proper time/date) or already
> started. It would be better to start it in .set_time. Maybe you can even
> use that to detect whether it has already been set once.

Actually there is only one (interesting) writeable bit in this register
and it defaults to 0 whenever we enable the register interface so we
don't really need to enable anything.

But I've added the necessary logic to handle the situation where the
bootloader would disable the rtc (which is the only situation where
the driver can diagnose an erroneous time/date).

> > +	ret =3D devm_rtc_register_device(rtc->rtcdev);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Failed to register RTC\n"); =20
>=20
> No error message is needed here.

Ok.

>=20
> > +		goto disable_clk;
> > +	}
> > +
> > +	return 0;
> > +
> > +disable_clk:
> > +	clk_disable_unprepare(rtc->clk);
> > +disable_rtc:
> > +	r9a06g032_sysctrl_enable_rtc(false);
> > +
> > +	return ret;
> > +}
> > +
> > +static int rzn1_rtc_remove(struct platform_device *pdev)
> > +{
> > +	struct rzn1_rtc *rtc =3D platform_get_drvdata(pdev);
> > +
> > +	clk_disable_unprepare(rtc->clk);
> > +	r9a06g032_sysctrl_enable_rtc(false); =20
>=20
> Does this stop the RTC or just the register interface?

Mmmh actually if I reset the sysctrl bit manually I loose the counter
entirely, so I'll drop this call.

Thanks,
Miqu=C3=A8l
