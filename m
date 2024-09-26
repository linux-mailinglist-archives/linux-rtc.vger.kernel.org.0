Return-Path: <linux-rtc+bounces-2065-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8709878CC
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Sep 2024 20:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11194283858
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Sep 2024 18:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2965415A4B0;
	Thu, 26 Sep 2024 18:01:45 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8530F1A702;
	Thu, 26 Sep 2024 18:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.25.134.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727373705; cv=none; b=NxKOIEUZs+zjiUuaQwnWrwRXFtWXsl0sIbS16FZ9KwLNarRPK5KwiPzGez+bXbypN2biFgZuSJn6cBz+daVSDFlTAidjS101pMR7q1AO+cP4bMcOvVotTcj4L2F11JuWEr1cF+i4z8qxFazMfVBrUJyos4lF4qfEgcQEsGNSYHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727373705; c=relaxed/simple;
	bh=mEV8JFw8qbJLqzs4umPKQk8RShH0/ZlMVSGlyTU885Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZXkbiRTkQ9NF/rNpJ0O1MsIeC0u1Xj4R5JzZm+CMXcnz8laW2I1Cr85tICFS56fGCYp2gEPwuuRs0NcybCaSmhjelGVVm4pYT5ND6LqyXuhJfjnBWXhHrduNG18NA/7qncqPZa1Ba8DBxUhk41ANuFWgoRtDOpxL1NtUKxGZK6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de; spf=pass smtp.mailfrom=t-online.de; arc=none smtp.client-ip=194.25.134.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-online.de
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout04.t-online.de (Postfix) with SMTP id 57EFA1D60F;
	Thu, 26 Sep 2024 19:53:54 +0200 (CEST)
Received: from dino2.dhome ([77.47.123.226]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1stsgb-1icZjV0; Thu, 26 Sep 2024 19:53:54 +0200
Message-ID: <8a97a7d7be1b94fb4a92c486c458530792d0107a.camel@t-online.de>
Subject: Re: [PATCH v4 1/1] drivers/rtc: rtc-sun6i: AutoCal Internal OSC
From: Alois Fertl <A.Fertl@t-online.de>
To: Andre Przywara <andre.przywara@arm.com>
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com, wens@csie.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, linux-rtc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Thu, 26 Sep 2024 19:53:45 +0200
In-Reply-To: <20240530181022.6fbc5a7d@donnerap.manchester.arm.com>
References: <20240522182826.6824-1-a.fertl@t-online.de>
	 <20240530181022.6fbc5a7d@donnerap.manchester.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1727373234-EF7FC5A0-584B78DD/0/0 CLEAN NORMAL
X-TOI-MSGID: 3b30e07f-32f6-41af-83cd-c1ac5275b1e2

On Thu, 2024-05-30 at 18:10 +0100, Andre Przywara wrote:
> On Wed, 22 May 2024 20:28:26 +0200
> Alois Fertl <a.fertl@t-online.de> wrote:
>=20
> > I have a M98-8K PLUS Magcubic TV-Box based on the Allwinner H618
> > SOC.
> > On board is a Sp6330 wifi/bt module that requires a 32kHz clock to
> > operate correctly. Without this change the clock from the SOC is
> > ~29kHz and BT module does not start up. The patch enables the
> > Internal
> > OSC Clock Auto Calibration of the H616/H618 which than provides the
> > necessary 32kHz and the BT module initializes successfully.
> > Add a flag and set it for H6.
> > Also the code is developed on the H618 board it only modifies the
> > H6 as
> > there is no support for H616/H618 in the current code.
>=20
> I am a bit confused: so this patch doesn't fix your problem then,
> because
> the code you touch is not used on the H616/H618?
> Actually I would have expected your patch to only change
> drivers/clk/sunxi-ng/ccu-sun6i-rtc.c, since that's the only RTC clock
> driver relevant for the H616.

Thanks for your comment ans sorry for my late reaction.

I was using a community maintained version of drivers/rtc/rtc-sun6i.c
which adds support for the H616 into this file. The proposed change is
than common for H6 AND H616 based on the introduced flag has_auto_cal.
It does fix my problem.
The patch however is based on mainline and therefor does not have the
H616 extension.

>=20
> > Signed-off-by: Alois Fertl <a.fertl@t-online.de>
> > ---
> >=20
> > v1->v2
> > - add flag and activate for H6 AND H616
> >=20
> > v2->v3
> > - correct findings from review
> >=20
> > v3->v4
> > - adjust to mainline tree
> >=20
> > I have also tried to test this using the new driver in sunxi-ng
> > manually injecting the reverted patch
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D60d9f050da63b
>=20
> So this was done on a H6 device? Because out of the box rtc-sun6i.c
> is
> used on the H6 only, and ccu-sun6i-rtc.c is only used on the H616.
>=20
> Maybe I am missing something here ...

Please see above.
>=20
> > The code in drivers/clk/sunxi-ng/ccu-sun6i-rtc.c is being called
> > and it
> > initializes the relevant registers to the same values as the old
> > driver,
> > but the change ends up with a system that often hangs during
> > booting and
> > only ocasionally reaches the login state (one out of 10).
> > The main difference I see adhoc is that the old drivers init is
> > done
> > using CLK_OF_DECLARE_DRIVER so initialization is done very early.
> > The new driver does the initialisation via probe which is quite
> > some
> > time later.
> > Can't tell if this is the cause for the problems.
>=20
> That sounds odd, can you post your changes somewhere?
>=20

Just recently I was able to get the code in drivers/clk/sunxi-ng/ccu-
sun6i-rtc.c working for my H618 box. It requires a change in just this
ccu-sun6i-rtc.c file. Unfortunatly it is based on try and error picking
and I don't understand why it is required.

The change is that the name "osc32k-out" is now equal tho the string
used in drivers/rtc/rtc-sun6i.c.

--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -202,7 +202,7 @@ static const struct clk_hw *osc32k_parents[] =3D {
 };
=20
 static struct clk_init_data osc32k_init_data =3D {
-       .name           =3D "osc32k",
+       .name           =3D "osc32k-out",
        .ops            =3D &ccu_mux_ops,
        .parent_hws     =3D osc32k_parents,
        .num_parents    =3D ARRAY_SIZE(osc32k_parents), /* updated during
probe */
@@ -271,13 +271,13 @@ static struct ccu_mux osc32k_fanout_clk =3D {
 };
=20
May be someone has a clue on this?

> Generally, without a proper problem and without further testing, I
> would
> not like to touch the H6 RTC code needlessly.
> For the H616 we have a concrete problem at hand, that justifies a
> change,
> also it's the proper driver for new devices, so that's where the
> change
> should happen.

So the PATCH requested here looses importance because for the H6 it
would improve RTC only in the rare case where there is no external 32k
oscillator or when the external oscillator fails.

Probably not worth the effort.

Regards,
Alois
>=20
> Cheers,
> Andre
>=20
> >=20
> > ---
> > =C2=A0drivers/rtc/rtc-sun6i.c | 16 +++++++++++++++-
> > =C2=A01 file changed, 15 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> > index 8e0c66906..57aa52d3b 100644
> > --- a/drivers/rtc/rtc-sun6i.c
> > +++ b/drivers/rtc/rtc-sun6i.c
> > @@ -42,6 +42,11 @@
> > =C2=A0
> > =C2=A0#define SUN6I_LOSC_CLK_PRESCAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x0008
> > =C2=A0
> > +#define SUN6I_LOSC_CLK_AUTO_CAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x000c
> > +#define SUN6I_LOSC_CLK_AUTO_CAL_16MS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BIT(2)
> > +#define SUN6I_LOSC_CLK_AUTO_CAL_ENABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0BIT(1)
> > +#define SUN6I_LOSC_CLK_AUTO_CAL_SEL_CAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BIT(0)
> > +
> > =C2=A0/* RTC */
> > =C2=A0#define SUN6I_RTC_YMD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x0010
> > =C2=A0#define SUN6I_RTC_HMS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x0014
> > @@ -126,7 +131,6 @@
> > =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 registers (R40, H6)
> > =C2=A0 *=C2=A0=C2=A0 - SYS power domain controls (R40)
> > =C2=A0 *=C2=A0=C2=A0 - DCXO controls (H6)
> > - *=C2=A0=C2=A0 - RC oscillator calibration (H6)
> > =C2=A0 *
> > =C2=A0 * These functions are not covered by this driver.
> > =C2=A0 */
> > @@ -137,6 +141,7 @@ struct sun6i_rtc_clk_data {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int has_out_cl=
k : 1;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int has_losc_e=
n : 1;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int has_auto_s=
wt : 1;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int has_auto_cal : =
1;
> > =C2=A0};
> > =C2=A0
> > =C2=A0#define RTC_LINEAR_DAY=C2=A0BIT(0)
> > @@ -267,6 +272,14 @@ static void __init sun6i_rtc_clk_init(struct
> > device_node *node,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(reg, rtc->base +=
 SUN6I_LOSC_CTRL);
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (rtc->data->has_auto_cal)=
 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0/* Enable internal OSC clock auto calibration */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0reg =3D SUN6I_LOSC_CLK_AUTO_CAL_16MS |
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SUN6I_=
LOSC_CLK_AUTO_CAL_ENABLE |
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SUN6I_=
LOSC_CLK_AUTO_CAL_SEL_CAL;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0writel(reg, rtc->base + SUN6I_LOSC_CLK_AUTO_CAL);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Yes, I know, this is=
 ugly. */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sun6i_rtc =3D rtc;
> > =C2=A0
> > @@ -374,6 +387,7 @@ static const struct sun6i_rtc_clk_data
> > sun50i_h6_rtc_data =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.has_out_clk =3D 1,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.has_losc_en =3D 1,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.has_auto_swt =3D 1,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.has_auto_cal =3D 1,
> > =C2=A0};
> > =C2=A0
> > =C2=A0static void __init sun50i_h6_rtc_clk_init(struct device_node
> > *node)
>=20


