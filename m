Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB1D76B0475
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Mar 2023 11:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbjCHKdq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 8 Mar 2023 05:33:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbjCHKdS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 8 Mar 2023 05:33:18 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5375B5C0;
        Wed,  8 Mar 2023 02:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678271573; x=1709807573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+A9YZu+0i0gdrAHhttFNWmIXgGQkvnuT8OPaxaa6Rsg=;
  b=SrqYBDqlsx1WiZd8xNLM5AeAA7S9NXE9Ggb/+14neXcL4UJ2CXhHAQYB
   30xoETZa90Y6YmR0CHx2VeJq0ywxE0/sUIpaxi4hopGCqeoAK02GXIJ0d
   4nb7Eb2P/TyOlxxyT+aW9xq8DwrM8+XWJ1x5LH34NI5WCzO3/TlWMw58R
   67JhD1RYP0zl+iGN4Ke66PoiefmbJdJXiZfL/QWJt6kpTa2UdJVjsEA+W
   qFkQjdlcA8D3gQp9pgQSS2ZKcEq2VfvPnSaoINmNttyk/NnO9HlbI505K
   zDAltJkBW7DVnCH0BMpT6aTNHWdyNr6vi67cwSfSpPK1hZxAmHiDOvRE7
   A==;
X-IronPort-AV: E=Sophos;i="5.98,243,1673910000"; 
   d="scan'208";a="29542949"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 08 Mar 2023 11:32:50 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 08 Mar 2023 11:32:50 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 08 Mar 2023 11:32:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678271570; x=1709807570;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+A9YZu+0i0gdrAHhttFNWmIXgGQkvnuT8OPaxaa6Rsg=;
  b=ipB+fNyvbo/ew2n3eD1pK/IZCiwAtBQiKgqjhxaS92ftP2UhY5hbNlu+
   g45imvoKyOOGBfFwbJpxh5Cl9Y8ILPu4N3Okz/6DPj4fvXL+n74HL2Lwd
   fKe/dt6eCFRaePRUEQ/+MAWO25EUXsTkuHF7jnu+pQ5sStHVfKGSn/wz/
   f3vcErqN3xpcyGL8GF/7NDIOsFWYV+Ipl+2rQifpPzH05HXiheRC+bRkB
   WgPpwYgL7BHG3rhia9DOHk0meycf/Vw/r/zGoEtBqeQmuPKEkgfv3RBQt
   ri4Rzfg+/kLEPc+Iv9FObneLepxgvxR1kfoprWo54yNt2OH0C/KRp8T8q
   w==;
X-IronPort-AV: E=Sophos;i="5.98,243,1673910000"; 
   d="scan'208";a="29542947"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 08 Mar 2023 11:32:50 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 048FD280056;
        Wed,  8 Mar 2023 11:32:50 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "lee@kernel.org" <lee@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH v5 3/3] arm64: dts: imx93: Add the bbnsm dts node
Date:   Wed, 08 Mar 2023 11:32:47 +0100
Message-ID: <2904532.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <AM9PR04MB8650E01C4772DF3D48A3564587B49@AM9PR04MB8650.eurprd04.prod.outlook.com>
References: <20230215024117.3357341-1-ping.bai@nxp.com> <20230215024117.3357341-4-ping.bai@nxp.com> <AM9PR04MB8650E01C4772DF3D48A3564587B49@AM9PR04MB8650.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

Am Mittwoch, 8. M=E4rz 2023, 10:58:00 CET schrieb Jacky Bai:
> Hi Shawn,
>=20
> Can you help pick this patch?

Just for completeness:
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
on TQMa93xx

Best regards,
Alexander

> BR
>=20
> > Subject: [PATCH v5 3/3] arm64: dts: imx93: Add the bbnsm dts node
> >=20
> > Add the bbnsm node for RTC & ON/OFF button support
> >=20
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > ---
> >=20
> >   - v5 changes: no
> >  =20
> >   - v4 changes:
> >     - update the compatible string to align with binding file
> >  =20
> >   - v3 changes:
> >     - remove 'nxp,bbnsm-regmap' property to align with binding doc
> >  =20
> >   - v2 changes:
> >     - update the regmap property to align with binding doc
> >=20
> > ---
> >=20
> >  arch/arm64/boot/dts/freescale/imx93.dtsi | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi
> > b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > index 2076f9c9983a..e772c136e895 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > @@ -243,6 +243,22 @@ iomuxc: pinctrl@443c0000 {
> >=20
> >  				status =3D "okay";
> >  		=09
> >  			};
> >=20
> > +			bbnsm: bbnsm@44440000 {
> > +				compatible =3D "nxp,imx93-bbnsm",=20
"syscon", "simple-mfd";
> > +				reg =3D <0x44440000 0x10000>;
> > +
> > +				bbnsm_rtc: rtc {
> > +					compatible =3D "nxp,imx93-
bbnsm-rtc";
> > +					interrupts =3D <GIC_SPI 73=20
IRQ_TYPE_LEVEL_HIGH>;
> > +				};
> > +
> > +				bbnsm_pwrkey: pwrkey {
> > +					compatible =3D "nxp,imx93-
bbnsm-pwrkey";
> > +					interrupts =3D <GIC_SPI 73=20
IRQ_TYPE_LEVEL_HIGH>;
> > +					linux,code =3D <KEY_POWER>;
> > +				};
> > +			};
> > +
> >=20
> >  			clk: clock-controller@44450000 {
> >  		=09
> >  				compatible =3D "fsl,imx93-ccm";
> >  				reg =3D <0x44450000 0x10000>;
> >=20
> > --
> > 2.34.1
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


