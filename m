Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2F0C512FCB
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Apr 2022 11:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbiD1JtY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 28 Apr 2022 05:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345056AbiD1JMl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 28 Apr 2022 05:12:41 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C125E155;
        Thu, 28 Apr 2022 02:09:23 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id B55D4FF805;
        Thu, 28 Apr 2022 09:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1651136961;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Cyjk/rYZ5RbPgXHXClEZBRH80ut/XSY3BS5BdGb88a8=;
        b=MpFCGfDt1NXLuUbjX/3/cWVgWOMWIeQAdGZOW9ufWTR4sgbVscriQ1y91tyhm3X9n4VmHM
        Sa5dQbjK1qhQWXx613BBTD2MyQx08MXoJ3U2Z6UpS5QAi3SXqduI9FJ8lWAl0QcooatqJX
        JMs/8M/ri/e6pXv+SDvifFju9kCezV2MLHiVNEzczchJr35I5M7gckrwINYKbPiWEQPkfj
        y9lCJenSedXBQUAejC7cl/C5thpgyitXB2q/+m9niAWPOP/trg2IZ9BhL0jTF/EtGBN2A/
        h3chtUgQjIIhWxSpif/q3qQ7igeoRMdNHnfAMMUJf2Ogt384lRstmyCw3QM5VQ==
Date:   Thu, 28 Apr 2022 11:09:17 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-rtc@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Michel Pollet <michel.pollet@bp.renesas.com>
Subject: Re: [PATCH v2 3/7] rtc: rzn1: Add new RTC driver
Message-ID: <20220428110917.6b1a19ce@xps13>
In-Reply-To: <CAMuHMdVBxeH=G8Dj0d=vS80c356Z+D2fsxRr6n+bzMxXX=D9+Q@mail.gmail.com>
References: <20220421090016.79517-1-miquel.raynal@bootlin.com>
        <20220421090016.79517-4-miquel.raynal@bootlin.com>
        <CAMuHMdVBxeH=G8Dj0d=vS80c356Z+D2fsxRr6n+bzMxXX=D9+Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Geert,

geert@linux-m68k.org wrote on Thu, 28 Apr 2022 10:58:03 +0200:

> Hi Miquel,
>=20
> On Thu, Apr 21, 2022 at 11:00 AM Miquel Raynal
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
> > --- a/drivers/rtc/Kconfig
> > +++ b/drivers/rtc/Kconfig
> > @@ -1548,6 +1548,13 @@ config RTC_DRV_RS5C313
> >         help
> >           If you say yes here you get support for the Ricoh RS5C313 RTC=
 chips.
> >
> > +config RTC_DRV_RZN1
> > +       tristate "Renesas RZN1 RTC" =20
>=20
> RZ/N1
>=20
> > +       depends on ARCH_RZN1 || COMPILE_TEST
> > +       depends on OF && HAS_IOMEM
> > +       help
> > +         If you say yes here you get support for the Renesas RZ/N1 RTC.
> > +
> >  config RTC_DRV_GENERIC
> >         tristate "Generic RTC support"
> >         # Please consider writing a new RTC driver instead of using the=
 generic =20
>=20
> > --- /dev/null
> > +++ b/drivers/rtc/rtc-rzn1.c =20
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
> > +       rtc->clk =3D devm_clk_get(&pdev->dev, "hclk");
> > +       if (IS_ERR(rtc->clk))
> > +               return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk), "Mi=
ssing hclk\n"); =20
>=20
> As you don't care about the clock rate, only about enabling/disabling
> the clock, I recommend using Runtime PM instead of explicit clock
> handling.

That's right.

> That does depend on:
> [PATCH v3 4/8] soc: renesas: rzn1: Select PM and PM_GENERIC_DOMAINS confi=
gs[1]
> [PATCH v3 5/8] ARM: dts: r9a06g032: Add missing '#power-domain-cells'[2]

There should not be any dependency with the RTC tree so that should not
be too complex to handle.

> and on documenting the power-domains property to the RTC DT bindings,
> and on adding a proper power-domains property to the RTC node in DTS.

Right.

Do we need to define these properties in the UART, DMA and NAND
controller nodes as well? I seem to remember that you mentioned it but
I don't recall for which one and I was too focused (lazy?) on other
features so I forgot about it.

> [1] https://lore.kernel.org/linux-renesas-soc/20220422120850.769480-5-her=
ve.codina@bootlin.com
> [2] https://lore.kernel.org/linux-renesas-soc/20220422120850.769480-6-her=
ve.codina@bootlin.com

Thanks,
Miqu=C3=A8l
