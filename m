Return-Path: <linux-rtc+bounces-1118-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5028BC08D
	for <lists+linux-rtc@lfdr.de>; Sun,  5 May 2024 15:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A35A5B20E66
	for <lists+linux-rtc@lfdr.de>; Sun,  5 May 2024 13:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E401BC5C;
	Sun,  5 May 2024 13:37:28 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957D01CF8F;
	Sun,  5 May 2024 13:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.25.134.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714916248; cv=none; b=CAp4qaqDTNzrKo2B6fFFydfDTMa9fjtwvsqEtNF7K0XQA/P9fmI94C1yEqb36AC0iy3V4OSNonfvLUrqw/LIlrPSnyeLhWYb7UkcpqTld48aJ2FJkEYs/JUpuww44kWIxRy89gRfyj1pCDeBgmuzBCPpDSFtRKC9wD9aK5uqGZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714916248; c=relaxed/simple;
	bh=8MWH3jY9drwF3ETc0Bgb/plxlh0m2NIwn+SbPNG0UiQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l3//HZARJtEhJ52F2O3USGJiy+7xiubGzyl9lUP6F/pHVCikAP87NhKfgf0LfnFSkCUCiOqWl7nXmwBMmRd5ss4/etDTOvNZWL54QiSWYQ0B9+OC9v4cJMJscyUpSqG2xGx8mS6U7RwngGPHK3Dfq5kkgZqCDq8TTX4quxN0bzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de; spf=pass smtp.mailfrom=t-online.de; arc=none smtp.client-ip=194.25.134.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-online.de
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout01.t-online.de (Postfix) with SMTP id 4613A10240;
	Sun,  5 May 2024 15:27:15 +0200 (CEST)
Received: from dino2.dhome ([77.47.123.226]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s3bta-06MK8H0; Sun, 5 May 2024 15:27:14 +0200
Message-ID: <6d872479ea873d25bd1f0d893439c6ceafd11327.camel@t-online.de>
Subject: Re: [PATCH v3 1/1] drivers/rtc: rtc-sun6i: AutoCal Internal OSC
 Clock
From: Alois Fertl <A.Fertl@t-online.de>
Reply-To: 20240503121304.5fc6add5@donnerap.manchester.arm.com
To: Andre Przywara <andre.przywara@arm.com>
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com, wens@csie.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, linux-rtc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Ryan Walklin
	 <ryan@testtoast.com>
Date: Sun, 05 May 2024 15:27:05 +0200
In-Reply-To: <20240503121304.5fc6add5@donnerap.manchester.arm.com>
References: <20240502180736.7330-1-a.fertl@t-online.de>
	 <20240503121304.5fc6add5@donnerap.manchester.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1714915634-3F9E2C7B-0934CFAC/0/0 CLEAN NORMAL
X-TOI-MSGID: 75600d42-4875-4f16-b473-b116d7b38c45

On Fri, 2024-05-03 at 12:13 +0100, Andre Przywara wrote:

Hi Andre and Ryan, thanks for responding, and sorry.
Andre's reply was somehow lost and I just found it on the
archive mirror. So hopefully my reply is correct.

And it is my first journey to do a patch.

> On Thu,=C2=A0 2 May 2024 20:07:36 +0200
> Alois Fertl <a.fertl@t-online.de> wrote:
>=20
> Hi Alois,
>=20
> many thanks for taking care and sending a patch! I think this problem
> is
> plaguing some people.
>=20
> > I have a M98-8K PLUS Magcubic TV-Box based on the Allwinner H618
> > SOC.
> > On board is a Sp6330 wifi/bt module that requires a 32kHz clock to
> > operate correctly. Without this change the clock from the SOC is
> > ~29kHz and BT module does not start up. The patch enables the
> > Internal
> > OSC Clock Auto Calibration of the H616/H618 which than provides the
> > necessary 32kHz and the BT module initializes successfully.
> > Add a flag and set it for H6 AND H616. The H618 is the same as H616
> > regarding rtc.
>=20
> (many thanks to Ryan for the head up on this)
>=20
> So what tree is this patch based on? It certainly is not mainline, is
> it?
I'm running armbian based on linux-kernel-worktree/6.7__sunxi64__arm64=20
which has one other rtc/rtc-sun6i.c patch applied before.
 "[PATCH] drv:rtc:sun6i: support RTCs without external LOSCs"

> Mainline never supported the H616 RTC clocks via the RTC driver, this
> was
> only through the new driver in the clk
> directory, in drivers/clk/sunxi-ng/ccu-sun6i-rtc.c:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D8a93720329d4d2
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dd91612d7f01aca
I have found some code in for calibration in the sunxi-ng directory
that was never called and I doubt that it gives working calibration.
Should a kernel then use exclusively use the one or the other driver?

>=20
> Please note that the H6 RTC clocks were intended to be handled via
> the new
> driver as well, but this part was reverted:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D60d9f050da63b
>=20
> Please only send patches based on the mainline tree.
>=20
> I doesn't look that hard to adjust the patch to mainline, though to
> cover
> the H6 is well this would require this code in both drivers. So when
> we
> want to address the H6 as well, it might make sense to solve the
> problem
> that triggered the revert first, to only have that change only in one
> file.=20
Yes, the code would be useful for H6 when no external crystal is
present.

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
> > I was hoping to get some feedback regarding the situation on H6,
> > where an external 32k crystal can be present.
> > From what I understand from the H6 manual there should be no
> > conflict as one can select which souce will drive the output.
> > Should certainly be tested but I don`t have H6 hardware.
>=20
> I think I should have H6 boards both with and without an external
> crystal
> oscillator, so can check the situation there, but only next week.
>=20
> > =C2=A0drivers/rtc/rtc-sun6i.c | 17 ++++++++++++++++-
> >=20
> > =C2=A01 file changed, 16 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> > index e0b85a0d5645..20e81ccdef29 100644
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
> > @@ -138,6 +142,7 @@ struct sun6i_rtc_clk_data {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int has_losc_e=
n : 1;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int has_auto_s=
wt : 1;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int no_ext_los=
c : 1;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int has_auto_cal : =
1;
> > =C2=A0};
> > =C2=A0
> > =C2=A0#define RTC_LINEAR_DAY=C2=A0BIT(0)
> > @@ -268,6 +273,14 @@ static void __init sun6i_rtc_clk_init(struct
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
> > @@ -380,6 +393,7 @@ static const struct sun6i_rtc_clk_data
> > sun50i_h6_rtc_data =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.has_out_clk =3D 1,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.has_losc_en =3D 1,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.has_auto_swt =3D 1,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.has_auto_cal =3D 1,
> > =C2=A0};
> > =C2=A0
> > =C2=A0static void __init sun50i_h6_rtc_clk_init(struct device_node
> > *node)
> > @@ -395,6 +409,7 @@ static const struct sun6i_rtc_clk_data
> > sun50i_h616_rtc_data =3D {
>=20
> For the records: this whole struct does not exist in mainline.
>=20
> Cheers,
> Andre
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.has_prescaler =3D 1,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.has_out_clk =3D 1,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.no_ext_losc =3D 1,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.has_auto_cal =3D 1,
> > =C2=A0};
> > =C2=A0
> > =C2=A0static void __init sun50i_h616_rtc_clk_init(struct device_node
> > *node)
>=20
Cheers,
Alois

