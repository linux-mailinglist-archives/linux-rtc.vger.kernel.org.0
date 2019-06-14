Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 744C445E8C
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2019 15:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbfFNNlP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Jun 2019 09:41:15 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50722 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727918AbfFNNlP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Jun 2019 09:41:15 -0400
Received: by mail-wm1-f66.google.com with SMTP id c66so2437011wmf.0;
        Fri, 14 Jun 2019 06:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=urqaKiKcLrJEblLE8+XdAboXEjaR6M1gRRSSmR7FScw=;
        b=f6G7BoDBciBLYV9QMXXNv/zkT7BGMPhTiKhbXA8aWM+X1d/DcbZu/JOnFl4SvylxHo
         38snO8SLUJD7O4Msz5GmhRYms2tsfXpFTO2+7IupBrcnmEa8m2V6LLTo+gXruLmaCR1I
         o8fxToZFPi3rIMcKTHTcSTr4OQWI7sNfg3vRMhQxVKNGKDIYuM4I9a/1c1D2zGCcfNT9
         1bZZAINW/opHIeM1boEaLBjPk7BiWZz6g8TSiT3DR0qQzXdEepsqW/+1CrXH4HoqPAQK
         To6H7Xlbi5sXOkWCFMH+JEjalXmYb7w2436dLipJd8opKdjoi1OUEYhuGsz3nNfUoowJ
         8e9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=urqaKiKcLrJEblLE8+XdAboXEjaR6M1gRRSSmR7FScw=;
        b=MASd4FC2+lUM7NJPdGbC0+gIVFVtGYfmtobd0Lat9xFy9KTESCsEtkGKS9aBKHubKj
         eAbhh0aXokI5Qv5WQl/TTivV5GvMNAhryR0RRz4EisXtaErwxlUE/dHFDm862BecQiXi
         FDLSp3PlEwbgJ5l5yK9WwUjLBSUcB4VakjBLEuEJ+sKMe0jHeML3Qd1QNBAeR9lbbcUe
         brJIzKe8s5X1UQwU7QmTB3m2U88uhDcm2FopnQ2TSRFiewKtwuAVFrIwSU+01xKBeKyk
         475xzUlIYjZFJi35jwm3ljdWzLimA4fCOVY51dSWjnIt9gAywgQ/XtOU5dYgxnafFRE8
         UAHQ==
X-Gm-Message-State: APjAAAWXc03rgA9p5Z8KNd36d5gGl/oAMj0F1z6CiwRnhXNBORy65p0i
        +rSnOBNPHts8CIG48fiBTL0=
X-Google-Smtp-Source: APXvYqxswwUWs8sABZyoTXQPjxIQn7vtGYSsVLr0m8JTWoKM9NUet9+L51oP1hOk/CXu9hbpF7VlBw==
X-Received: by 2002:a7b:c5d1:: with SMTP id n17mr8220842wmk.84.1560519672520;
        Fri, 14 Jun 2019 06:41:12 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id k5sm1947558wmj.30.2019.06.14.06.41.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 06:41:11 -0700 (PDT)
Date:   Fri, 14 Jun 2019 15:41:10 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: tegra: Implement suspend clock source
Message-ID: <20190614134110.GF15526@ulmo>
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <20190614104747.19712-2-thierry.reding@gmail.com>
 <5a00bccf-6542-51bd-9030-99a59f14f2f9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GV0iVqYguTV4Q9ER"
Content-Disposition: inline
In-Reply-To: <5a00bccf-6542-51bd-9030-99a59f14f2f9@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--GV0iVqYguTV4Q9ER
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 03:01:13PM +0300, Dmitry Osipenko wrote:
> 14.06.2019 13:47, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The suspend clock source for Tegra210 and earlier is currently
> > implemented in the Tegra timer driver. However, the suspend clock source
> > code accesses registers that are part of the RTC hardware block, so both
> > can step on each others' toes. In practice this isn't an issue, but
> > there is no reason why the RTC driver can't implement the clock source,
> > so move the code over to the tegra-rtc driver.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/clocksource/timer-tegra.c | 44 -------------------------------
> >  drivers/rtc/rtc-tegra.c           | 42 +++++++++++++++++++++++++++++
> >  2 files changed, 42 insertions(+), 44 deletions(-)
> >=20
> > diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/ti=
mer-tegra.c
> > index e6608141cccb..87eac618924d 100644
> > --- a/drivers/clocksource/timer-tegra.c
> > +++ b/drivers/clocksource/timer-tegra.c
> > @@ -21,10 +21,6 @@
> > =20
> >  #include "timer-of.h"
> > =20
> > -#define RTC_SECONDS		0x08
> > -#define RTC_SHADOW_SECONDS	0x0c
> > -#define RTC_MILLISECONDS	0x10
> > -
> >  #define TIMERUS_CNTR_1US	0x10
> >  #define TIMERUS_USEC_CFG	0x14
> >  #define TIMERUS_CNTR_FREEZE	0x4c
> > @@ -164,34 +160,6 @@ static struct delay_timer tegra_delay_timer =3D {
> >  };
> >  #endif
> > =20
> > -static struct timer_of suspend_rtc_to =3D {
> > -	.flags =3D TIMER_OF_BASE | TIMER_OF_CLOCK,
> > -};
> > -
> > -/*
> > - * tegra_rtc_read - Reads the Tegra RTC registers
> > - * Care must be taken that this function is not called while the
> > - * tegra_rtc driver could be executing to avoid race conditions
> > - * on the RTC shadow register
> > - */
> > -static u64 tegra_rtc_read_ms(struct clocksource *cs)
> > -{
> > -	void __iomem *reg_base =3D timer_of_base(&suspend_rtc_to);
> > -
> > -	u32 ms =3D readl_relaxed(reg_base + RTC_MILLISECONDS);
> > -	u32 s =3D readl_relaxed(reg_base + RTC_SHADOW_SECONDS);
> > -
> > -	return (u64)s * MSEC_PER_SEC + ms;
> > -}
> > -
> > -static struct clocksource suspend_rtc_clocksource =3D {
> > -	.name	=3D "tegra_suspend_timer",
> > -	.rating	=3D 200,
> > -	.read	=3D tegra_rtc_read_ms,
> > -	.mask	=3D CLOCKSOURCE_MASK(32),
> > -	.flags	=3D CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_SUSPEND_NONSTOP,
> > -};
> > -
> >  static inline unsigned int tegra_base_for_cpu(int cpu, bool tegra20)
> >  {
> >  	if (tegra20) {
> > @@ -385,15 +353,3 @@ static int __init tegra20_init_timer(struct device=
_node *np)
> >  	return tegra_init_timer(np, true, rating);
> >  }
> >  TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_init_t=
imer);
> > -
> > -static int __init tegra20_init_rtc(struct device_node *np)
> > -{
> > -	int ret;
> > -
> > -	ret =3D timer_of_init(np, &suspend_rtc_to);
> > -	if (ret)
> > -		return ret;
> > -
> > -	return clocksource_register_hz(&suspend_rtc_clocksource, 1000);
> > -}
> > -TIMER_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
> > diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
> > index 8fa1b3febf69..6da54264a27a 100644
> > --- a/drivers/rtc/rtc-tegra.c
> > +++ b/drivers/rtc/rtc-tegra.c
> > @@ -6,6 +6,7 @@
> >   */
> > =20
> >  #include <linux/clk.h>
> > +#include <linux/clocksource.h>
> >  #include <linux/delay.h>
> >  #include <linux/init.h>
> >  #include <linux/io.h>
> > @@ -52,8 +53,15 @@ struct tegra_rtc_info {
> >  	struct clk *clk;
> >  	int irq; /* alarm and periodic IRQ */
> >  	spinlock_t lock;
> > +
> > +	struct clocksource clksrc;
> >  };
> > =20
> > +static struct tegra_rtc_info *to_tegra_rtc(struct clocksource *clksrc)
> > +{
> > +	return container_of(clksrc, struct tegra_rtc_info, clksrc);
> > +}
> > +
> >  /*
> >   * RTC hardware is busy when it is updating its values over AHB once e=
very
> >   * eight 32 kHz clocks (~250 us). Outside of these updates the CPU is =
free to
> > @@ -268,6 +276,17 @@ static const struct rtc_class_ops tegra_rtc_ops =
=3D {
> >  	.alarm_irq_enable =3D tegra_rtc_alarm_irq_enable,
> >  };
> > =20
> > +static u64 tegra_rtc_read_ms(struct clocksource *clksrc)
> > +{
> > +	struct tegra_rtc_info *info =3D to_tegra_rtc(clksrc);
> > +	u32 ms, s;
> > +
> > +	ms =3D readl_relaxed(info->base + TEGRA_RTC_REG_MILLI_SECONDS);
> > +	s =3D readl_relaxed(info->base + TEGRA_RTC_REG_SHADOW_SECONDS);
> > +
> > +	return (u64)s * MSEC_PER_SEC + ms;
> > +}
> > +
> >  static const struct of_device_id tegra_rtc_dt_match[] =3D {
> >  	{ .compatible =3D "nvidia,tegra20-rtc", },
> >  	{}
> > @@ -339,6 +358,28 @@ static int tegra_rtc_probe(struct platform_device =
*pdev)
> >  		goto disable_clk;
> >  	}
> > =20
> > +	/*
> > +	 * The Tegra RTC is the only reliable clock source that persists
> > +	 * across an SC7 transition (VDD_CPU and VDD_CORE off) on Tegra210
> > +	 * and earlier. Starting with Tegra186, the ARM v8 architected timer
> > +	 * is in an always on power partition and its reference clock keeps
> > +	 * running during SC7. Therefore, we technically don't need to have
> > +	 * the RTC register as a clock source on Tegra186 and later, but it
> > +	 * doesn't hurt either, so we just register it unconditionally here.
> > +	 */
> > +	info->clksrc.name =3D "tegra_rtc";
> > +	info->clksrc.rating =3D 200;
> > +	info->clksrc.read =3D tegra_rtc_read_ms;
> > +	info->clksrc.mask =3D CLOCKSOURCE_MASK(32);
>=20
> Hm.. shouldn't this be CLOCKSOURCE_MASK(52)? Given that there are 32 bits=
 for seconds and
> 10bits for milliseconds.

Did you mean to say CLOCKSOURCE_MASK(42)? Yeah, that's probably better
here.

Thierry

--GV0iVqYguTV4Q9ER
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Do/QACgkQ3SOs138+
s6HR9RAAsJyzd0Esu9QvsUoB6AafwWFSFPYw6wwtOpUYUKXqhjnGhCnrokJmny2I
DNS8nD0AEcdS2J1xcz0g1Ani1ZfK6go7eKRR70cxvoqR+ykYybGodqoXYrDNFAy6
aqazQXOZLHL76jWTgBbLpxCj0PXPqzDJVca01x6VgCqCaQlyY00gxm99FaOe+RFQ
ldzN3zEXysNXcW4k0NvDdDEfBcnT5HcxtNd7+HMovWB9XlO6RefD1Fp+sXpiLtw1
OGVvIqQVVu7pwrQvaQN8LD96GFE9IygI98h3QiIAkXeOKQaL83KENg5+O1setGqM
Gc/1QqIEnHFNNPcUiJWQJ+czlxVN+4hfAUPq+s27f+f+7Brz2jjVB2xbAeV3QJT8
OR+rC0rs56lI85wuqUNQDGeGO2VrVrXQXNMPlB5YYBAcegzTg7p+yXFNMxP+8jsO
aSMi7hlVKT7aulOh0mGiyDOhw5iSo2oDfwa1LS8ssFyFqGokCpnsNDX4Hbp3ty9B
rwB77aKiMCYlfi+tLufWqbPA7aKUKg76eRHIyAfAG3KA/OaYWELxDeghO0IXi5JF
XIr0KGim7+xoxAj9BN7GbOplb38jSSmYMYFmdJvG2GJx9Qtvpz++e7sUch+t0Uat
01UaISSIEOC49LsJ5OKlpWfKeJ+PaHm+LLe9Mn3q8pN7alBK4is=
=/nfa
-----END PGP SIGNATURE-----

--GV0iVqYguTV4Q9ER--
