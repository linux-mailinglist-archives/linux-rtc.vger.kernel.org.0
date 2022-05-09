Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D460B5200A4
	for <lists+linux-rtc@lfdr.de>; Mon,  9 May 2022 17:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237853AbiEIPD6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 May 2022 11:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237851AbiEIPD5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 9 May 2022 11:03:57 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF5742C8BD7;
        Mon,  9 May 2022 07:59:53 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 8AEDC1BF212;
        Mon,  9 May 2022 14:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652108390;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IVtqCvMASNA9pIuuP5Mp+l/ROYTNTakgxxTILKeChdg=;
        b=aw45/FZaVjTb17yj4n2Oy5F6bGOQQ9BIXmRgF+KQELYjWOeueUkBw06kLfa3MJnQ9owKOy
        Oa7Hzhe3oCxsvUzaquM4ffJR8IL9auOMQZL9SJGV1PBcqw3DCsVlDyRM9isDG3ODrKaUtL
        K8r6jlRXe0vVLPzlT7Q7/3mM9WzfM2eRFRPjAzba4SdS44Rx7tb5++HjN+BtuN/VtsrvmS
        pzkFN4JqwVULprj3+LxGd64jQjjBfdeSVusYcS+7NWO9FokClJKdKB98edKSPP8EBhHVvC
        N4Rkbh4k552hLhtjlDSeu+O2AU+V1JEMrPNyYe4ZKL+vLqGJQ1rxbzrbtc3dlQ==
Date:   Mon, 9 May 2022 16:59:46 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Michel Pollet <michel.pollet@bp.renesas.com>
Subject: Re: [PATCH v3 2/6] rtc: rzn1: Add new RTC driver
Message-ID: <20220509165946.1e2d581d@xps13>
In-Reply-To: <CAMuHMdVU2RDmPC014LjdB=L_b=Kn+htHnC0v4wAAUESbhWTA5w@mail.gmail.com>
References: <20220429104602.368055-1-miquel.raynal@bootlin.com>
        <20220429104602.368055-3-miquel.raynal@bootlin.com>
        <CAMuHMdVU2RDmPC014LjdB=L_b=Kn+htHnC0v4wAAUESbhWTA5w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Geert,

geert@linux-m68k.org wrote on Mon, 2 May 2022 16:41:20 +0200:

> Hi Miquel,
>=20
> On Fri, Apr 29, 2022 at 12:46 PM Miquel Raynal
> <miquel.raynal@bootlin.com> wrote:
> > From: Michel Pollet <michel.pollet@bp.renesas.com>
> >
> > Add a basic RTC driver for the RZ/N1.
> >
> > Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> > Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com> =20
>=20
> Thanks for your patch!
>=20
> > --- /dev/null
> > +++ b/drivers/rtc/rtc-rzn1.c
> > @@ -0,0 +1,246 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Renesas RZN1 Real Time Clock interface for Linux =20
>=20
> RZ/N1

Done.

>=20
> > +static int rzn1_rtc_probe(struct platform_device *pdev)
> > +{
> > +       struct rzn1_rtc *rtc;
> > +       int ret;
> > +
> > +       rtc =3D devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> > +       if (!rtc)
> > +               return -ENOMEM;
> > +
> > +       platform_set_drvdata(pdev, rtc);
> > +
> > +       rtc->base =3D devm_platform_ioremap_resource(pdev, 0);
> > +       if (IS_ERR(rtc->base))
> > +               return dev_err_probe(&pdev->dev, PTR_ERR(rtc->base), "M=
issing reg\n");
> > +
> > +       rtc->rtcdev =3D devm_rtc_allocate_device(&pdev->dev);
> > +       if (IS_ERR(rtc->rtcdev))
> > +               return PTR_ERR(rtc);
> > +
> > +       rtc->rtcdev->range_min =3D RTC_TIMESTAMP_BEGIN_2000;
> > +       rtc->rtcdev->range_max =3D RTC_TIMESTAMP_END_2099;
> > +       rtc->rtcdev->ops =3D &rzn1_rtc_ops;
> > +       clear_bit(RTC_FEATURE_ALARM, rtc->rtcdev->features);
> > +       clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtcdev->features);
> > +
> > +       pm_runtime_enable(&pdev->dev);
> > +       pm_runtime_get_sync(&pdev->dev); =20
>=20
> While this call cannot really fail on this platform, you may want to
> call pm_runtime_resume_and_get() instead, and check its return
> value (else the janitors will make that change later ;-)

Right, I misunderstood the doc, I'll change it.

>=20
> > +
> > +       /*
> > +        * Ensure the clock counter is enabled.
> > +        * Set 24-hour mode and possible oscillator offset compensation=
 in SUBU mode.
> > +        */
> > +       writel(RZN1_RTC_CTL0_CE | RZN1_RTC_CTL0_AMPM | RZN1_RTC_CTL0_SL=
SB_SUBU,
> > +              rtc->base + RZN1_RTC_CTL0);
> > +
> > +       /* Disable all interrupts */
> > +       writel(0, rtc->base + RZN1_RTC_CTL1);
> > +
> > +       ret =3D devm_rtc_register_device(rtc->rtcdev);
> > +       if (ret)
> > +               goto dis_runtime_pm;
> > +
> > +       return 0;
> > +
> > +dis_runtime_pm:
> > +       pm_runtime_put_sync(&pdev->dev); =20
>=20
> pm_runtime_put() should be fine, no need for the synchronous version.

Right, there is no need for the _sync() version here and below I
believe.

>=20
> > +       pm_runtime_disable(&pdev->dev);
> > +
> > +       return ret;
> > +}
> > +
> > +static int rzn1_rtc_remove(struct platform_device *pdev)
> > +{
> > +       pm_runtime_put_sync(&pdev->dev); =20
>=20
> pm_runtime_put().
>=20
> > +       pm_runtime_disable(&pdev->dev);
> > +
> > +       return 0;
> > +} =20
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds


Thanks,
Miqu=C3=A8l
