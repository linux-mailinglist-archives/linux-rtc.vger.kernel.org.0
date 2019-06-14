Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1C434604B
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2019 16:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728623AbfFNOOF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Jun 2019 10:14:05 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43949 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727698AbfFNOOF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Jun 2019 10:14:05 -0400
Received: by mail-wr1-f66.google.com with SMTP id p13so2690452wru.10;
        Fri, 14 Jun 2019 07:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=InAW5gctH34cKs7trnSabCbq/dF/FPxrIS1VVtuERRU=;
        b=NTJ86bXjEdy4RB8MHfZ4LBeNlxkZ+wtOeIooUUxEMKNGFHIyN7VrKQMii5NflNWJiS
         GdyhrP/mKmNqpENPbHEziN1QZV75z94f3kQMeInSWl9ZvZ1Dl9SAPIT89R0U7YTvmvDR
         znWS1ZXiZ29zjfqbqjfZtgke2EhiuTCA+ngfMH60jw0CcoNoGsN4ysG1cw8AVsgUyChD
         qEMBc4I981qUYBH5fhBMzdswBVBQ7m7fEw0GDC097T9FiHYLfy3Exif1Z7pTyJrEf1uj
         XdJskblLKgqfvVXf/ppxgc4qB0qGJs7BPHq0b5m9xtKLLGhKxxucWyD1b32CzjIKAeXY
         +/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=InAW5gctH34cKs7trnSabCbq/dF/FPxrIS1VVtuERRU=;
        b=UEXqI7vRyjgyFVuvM8V31h/kqossq/ZlA6SdaS4rZsmq/ewhkss0VIrnjt6fCTznHh
         ve+kjDT1sjEcuJN4xWyNz7ct1nyHHxLy2SIsyLKmwJWXZo8QwKjJWOU7s27nh7dIxMM1
         fYIjLFE5N/P2LiaGZVeuaD69rNpU74G8640SOsNgv1EtbB6j+TRenZd4h+dQZBQFNmV2
         QluAQK6D+Z8wf/RsmQhMk8bRv5QAmPRq5JZXXB9Wt3Yo2s5f9meosmz1tUxBLAbD6JIm
         La0kd8Rp589fYxe3InlrzCuFxPxNWXcknXtqRPsVtUMYrvIhOjI59Qx8z/yLL84k5Qbx
         l/Bw==
X-Gm-Message-State: APjAAAXaaaTXzTKbibtEqTR052HkNVotzA3HYFyuTO/geDZxNV8NAJmK
        nbHLroTWVS+fHhkJC7bArV4=
X-Google-Smtp-Source: APXvYqyztL+U0KE1ngLFyMRjJxUnjzv3k/BQ2V0lZ4BCAkn7wQPXZyILacam3kC36oag9cUcfk68/A==
X-Received: by 2002:adf:fe4e:: with SMTP id m14mr15544572wrs.21.1560521642327;
        Fri, 14 Jun 2019 07:14:02 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id z6sm3466351wrw.2.2019.06.14.07.14.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 07:14:01 -0700 (PDT)
Date:   Fri, 14 Jun 2019 16:14:00 +0200
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
Message-ID: <20190614141400.GI15526@ulmo>
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <20190614104747.19712-2-thierry.reding@gmail.com>
 <5a00bccf-6542-51bd-9030-99a59f14f2f9@gmail.com>
 <20190614134110.GF15526@ulmo>
 <d9b65fd9-ecad-b241-a0d6-251a648488aa@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="STPqjqpCrtky8aYs"
Content-Disposition: inline
In-Reply-To: <d9b65fd9-ecad-b241-a0d6-251a648488aa@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--STPqjqpCrtky8aYs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 04:49:44PM +0300, Dmitry Osipenko wrote:
> 14.06.2019 16:41, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Jun 14, 2019 at 03:01:13PM +0300, Dmitry Osipenko wrote:
> >> 14.06.2019 13:47, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> The suspend clock source for Tegra210 and earlier is currently
> >>> implemented in the Tegra timer driver. However, the suspend clock sou=
rce
> >>> code accesses registers that are part of the RTC hardware block, so b=
oth
> >>> can step on each others' toes. In practice this isn't an issue, but
> >>> there is no reason why the RTC driver can't implement the clock sourc=
e,
> >>> so move the code over to the tegra-rtc driver.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>>  drivers/clocksource/timer-tegra.c | 44 -----------------------------=
--
> >>>  drivers/rtc/rtc-tegra.c           | 42 +++++++++++++++++++++++++++++
> >>>  2 files changed, 42 insertions(+), 44 deletions(-)
> >>>
> >>> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/=
timer-tegra.c
> >>> index e6608141cccb..87eac618924d 100644
> >>> --- a/drivers/clocksource/timer-tegra.c
> >>> +++ b/drivers/clocksource/timer-tegra.c
> >>> @@ -21,10 +21,6 @@
> >>> =20
> >>>  #include "timer-of.h"
> >>> =20
> >>> -#define RTC_SECONDS		0x08
> >>> -#define RTC_SHADOW_SECONDS	0x0c
> >>> -#define RTC_MILLISECONDS	0x10
> >>> -
> >>>  #define TIMERUS_CNTR_1US	0x10
> >>>  #define TIMERUS_USEC_CFG	0x14
> >>>  #define TIMERUS_CNTR_FREEZE	0x4c
> >>> @@ -164,34 +160,6 @@ static struct delay_timer tegra_delay_timer =3D {
> >>>  };
> >>>  #endif
> >>> =20
> >>> -static struct timer_of suspend_rtc_to =3D {
> >>> -	.flags =3D TIMER_OF_BASE | TIMER_OF_CLOCK,
> >>> -};
> >>> -
> >>> -/*
> >>> - * tegra_rtc_read - Reads the Tegra RTC registers
> >>> - * Care must be taken that this function is not called while the
> >>> - * tegra_rtc driver could be executing to avoid race conditions
> >>> - * on the RTC shadow register
> >>> - */
> >>> -static u64 tegra_rtc_read_ms(struct clocksource *cs)
> >>> -{
> >>> -	void __iomem *reg_base =3D timer_of_base(&suspend_rtc_to);
> >>> -
> >>> -	u32 ms =3D readl_relaxed(reg_base + RTC_MILLISECONDS);
> >>> -	u32 s =3D readl_relaxed(reg_base + RTC_SHADOW_SECONDS);
> >>> -
> >>> -	return (u64)s * MSEC_PER_SEC + ms;
> >>> -}
> >>> -
> >>> -static struct clocksource suspend_rtc_clocksource =3D {
> >>> -	.name	=3D "tegra_suspend_timer",
> >>> -	.rating	=3D 200,
> >>> -	.read	=3D tegra_rtc_read_ms,
> >>> -	.mask	=3D CLOCKSOURCE_MASK(32),
> >>> -	.flags	=3D CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_SUSPEND_NONSTO=
P,
> >>> -};
> >>> -
> >>>  static inline unsigned int tegra_base_for_cpu(int cpu, bool tegra20)
> >>>  {
> >>>  	if (tegra20) {
> >>> @@ -385,15 +353,3 @@ static int __init tegra20_init_timer(struct devi=
ce_node *np)
> >>>  	return tegra_init_timer(np, true, rating);
> >>>  }
> >>>  TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_init=
_timer);
> >>> -
> >>> -static int __init tegra20_init_rtc(struct device_node *np)
> >>> -{
> >>> -	int ret;
> >>> -
> >>> -	ret =3D timer_of_init(np, &suspend_rtc_to);
> >>> -	if (ret)
> >>> -		return ret;
> >>> -
> >>> -	return clocksource_register_hz(&suspend_rtc_clocksource, 1000);
> >>> -}
> >>> -TIMER_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc=
);
> >>> diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
> >>> index 8fa1b3febf69..6da54264a27a 100644
> >>> --- a/drivers/rtc/rtc-tegra.c
> >>> +++ b/drivers/rtc/rtc-tegra.c
> >>> @@ -6,6 +6,7 @@
> >>>   */
> >>> =20
> >>>  #include <linux/clk.h>
> >>> +#include <linux/clocksource.h>
> >>>  #include <linux/delay.h>
> >>>  #include <linux/init.h>
> >>>  #include <linux/io.h>
> >>> @@ -52,8 +53,15 @@ struct tegra_rtc_info {
> >>>  	struct clk *clk;
> >>>  	int irq; /* alarm and periodic IRQ */
> >>>  	spinlock_t lock;
> >>> +
> >>> +	struct clocksource clksrc;
> >>>  };
> >>> =20
> >>> +static struct tegra_rtc_info *to_tegra_rtc(struct clocksource *clksr=
c)
> >>> +{
> >>> +	return container_of(clksrc, struct tegra_rtc_info, clksrc);
> >>> +}
> >>> +
> >>>  /*
> >>>   * RTC hardware is busy when it is updating its values over AHB once=
 every
> >>>   * eight 32 kHz clocks (~250 us). Outside of these updates the CPU i=
s free to
> >>> @@ -268,6 +276,17 @@ static const struct rtc_class_ops tegra_rtc_ops =
=3D {
> >>>  	.alarm_irq_enable =3D tegra_rtc_alarm_irq_enable,
> >>>  };
> >>> =20
> >>> +static u64 tegra_rtc_read_ms(struct clocksource *clksrc)
> >>> +{
> >>> +	struct tegra_rtc_info *info =3D to_tegra_rtc(clksrc);
> >>> +	u32 ms, s;
> >>> +
> >>> +	ms =3D readl_relaxed(info->base + TEGRA_RTC_REG_MILLI_SECONDS);
> >>> +	s =3D readl_relaxed(info->base + TEGRA_RTC_REG_SHADOW_SECONDS);
> >>> +
> >>> +	return (u64)s * MSEC_PER_SEC + ms;
> >>> +}
> >>> +
> >>>  static const struct of_device_id tegra_rtc_dt_match[] =3D {
> >>>  	{ .compatible =3D "nvidia,tegra20-rtc", },
> >>>  	{}
> >>> @@ -339,6 +358,28 @@ static int tegra_rtc_probe(struct platform_devic=
e *pdev)
> >>>  		goto disable_clk;
> >>>  	}
> >>> =20
> >>> +	/*
> >>> +	 * The Tegra RTC is the only reliable clock source that persists
> >>> +	 * across an SC7 transition (VDD_CPU and VDD_CORE off) on Tegra210
> >>> +	 * and earlier. Starting with Tegra186, the ARM v8 architected timer
> >>> +	 * is in an always on power partition and its reference clock keeps
> >>> +	 * running during SC7. Therefore, we technically don't need to have
> >>> +	 * the RTC register as a clock source on Tegra186 and later, but it
> >>> +	 * doesn't hurt either, so we just register it unconditionally here.
> >>> +	 */
> >>> +	info->clksrc.name =3D "tegra_rtc";
> >>> +	info->clksrc.rating =3D 200;
> >>> +	info->clksrc.read =3D tegra_rtc_read_ms;
> >>> +	info->clksrc.mask =3D CLOCKSOURCE_MASK(32);
> >>
> >> Hm.. shouldn't this be CLOCKSOURCE_MASK(52)? Given that there are 32 b=
its for seconds and
> >> 10bits for milliseconds.
> >=20
> > Did you mean to say CLOCKSOURCE_MASK(42)? Yeah, that's probably better
> > here.
>=20
> Yes, 42 :)

I'm wondering if that could perhaps be a little problematic because
we're not actually using all of the 10 bits for the milliseconds. So the
maximum value that we can return is:

	4294967296 * 1000 + 999 =3D 4294967296999

However, the maximum value for a 42 bit mask is:

	2^42 - 1 =3D 4398046511103

That mask is only used in order to wrap around in delta computations. So
I can imagine a situation where we'd end up with a wrong value in the
delta. I suppose this can only really happen if the two samples are very
far apart in time, so maybe this isn't worth worrying about.

Thierry

--STPqjqpCrtky8aYs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Dq6UACgkQ3SOs138+
s6F2oA//fpp1Y3qRBJ5italtlN4pwpQW8vwmsZ3jYfSpheuiBD/GjwebCGtoKjCy
gZCDBFEjBD+smaPPrMBzEL71hEAp65lZL8IcEyxM2c7HaE1BwGXwEyKyMxNjkZN6
IK19g0xfsqI6z+UJuPa6nYp4BBPjn/ndGxDcT7IriLTTe2cCkifgyr0Tig0RPOTZ
CX12IxYqdSGNyfLuUV0RM9sgDP9ukF0zTBj6sE3HU7DfCkJNCOoboax5i2hFYY5/
hA7K0hImYXTk9llwierL1CEk4071yipVcxnti8PdEhOD+yZQ/vjrF+DA9J/XO+8Y
Rn+c28sY7IcVCwhSdtBzvzQXKW9Z1o0BbkeH7ouxi97CSO4KNjOdwPyBGCEkcEh7
AiSg9s4hfoDQuG574xwwI+PuPNoXlvMqCfKuEpWAPajsdZOGyf0DRwMrmlQgyoog
gKJT1PlrERZos0KgEnCEE2DMu4QwilM+fMLd23tQvAlYYtLW4/6NGZL3I2Oecklz
gohySpcz5cr24DFcs0Lg38ShaCWnUy8DK1f6l8XrIr/3mTsUmKlWbZFoQyptvNWC
weajR/n4ioyFV9lD78t/UmCyaUBPiQCfOgklPA7q4eHbZLkBwpY1guNatZxOaCDp
E4+mpT2k+2mq8b/DkIC6wA4wWon84aplkvNIcV60jZxY7hcig18=
=sJkU
-----END PGP SIGNATURE-----

--STPqjqpCrtky8aYs--
