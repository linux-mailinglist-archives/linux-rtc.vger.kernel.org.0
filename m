Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91FC746306
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2019 17:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbfFNPhS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Jun 2019 11:37:18 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45405 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbfFNPhR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Jun 2019 11:37:17 -0400
Received: by mail-wr1-f68.google.com with SMTP id f9so2968508wre.12;
        Fri, 14 Jun 2019 08:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1U4GYAAthoUz/sAn8+rWPAHTfxm0y9IWEEq9tkBN6pI=;
        b=CeOCuV8qKNOgZQgYnzD3QaYa2cXXz/30gvF8r4zGUuRrheuY9UIAfKKcR95/Tu1ZiX
         BQv0G/5C6tUl1agpT6hmqH3inaxFkUKGSYP+O/vp1Cd4CKOoV/to6rU3H1DD++iyMZ4j
         xw0bNgC3KFBCd+AYohq+dihtnxh80zVQIv0r/VR++0UfSRaUiiliIz10hbYxYD1HZE6e
         QzgO9OHYQRBAn6/8k1K4tWuqGLQB0+nQOZd6Ufm+Ph07XlMcL4IOzMJ/WLHI4UbIj182
         PUJJ3YdzFWmlAanRAr2XnFwKRd5zuT1n5Dfttl9/XoUEyQuf9tWh2BZjUXExYkbJeuPu
         jprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1U4GYAAthoUz/sAn8+rWPAHTfxm0y9IWEEq9tkBN6pI=;
        b=YlcesSwJNat4EHtW+CIBFRzxeKif8U5tIdoK7da6+QCCD9jSKo4wEnNY8VWGp8H77u
         xrPWUu36M5thcv8I43rt9Yw6amYeKULUZqRxNY4uYVIj3M+9hZqQSGompB9+ey8LYj+F
         Bmyn56/SMNAsoUL62jr8RqQ3jkyOzaI89mrGg1vmpbuw26C6uLCFw4mYRgD8Im1/K1+Q
         NNVWTfvkklzTblpyAjA7vDxhIcvEvr990OdYE8URpK07j5dsvbq9t9Hh40kXK+nHKii6
         NN0y/uwQLJsAlF4iVYkUmt56CnJY2daoWOU/C+w1HORTZsehSmviFgOeXobYT+1mm1pl
         7vzQ==
X-Gm-Message-State: APjAAAWQRz5gMtW0gWIrpjx1AoOrLOfLI5XF+XHe+XZzBu8mQYdiMZKu
        kNvYlFhLoVwlIdFxEgk1Cms=
X-Google-Smtp-Source: APXvYqwdlxJp7/ciiHjjjwKl20VmvrgA3lyBHKhZQAnBAfMJPcF3bm1bG9dIUp71fhsZ8gJh3MMDow==
X-Received: by 2002:adf:ef8d:: with SMTP id d13mr48952721wro.60.1560526634720;
        Fri, 14 Jun 2019 08:37:14 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id s9sm2391098wmc.11.2019.06.14.08.37.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 08:37:13 -0700 (PDT)
Date:   Fri, 14 Jun 2019 17:37:12 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clocksource: tegra: Use rating when registering
 clock source
Message-ID: <20190614153712.GL15526@ulmo>
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <8ff5d2da-907e-611c-ec82-bbe50197c2f4@gmail.com>
 <20190614132253.GE15526@ulmo>
 <3c339341-e77a-38aa-702a-1aef6c229eed@gmail.com>
 <20190614135353.GH15526@ulmo>
 <286cb0b7-1c8a-1a61-517e-1a9eee08e614@gmail.com>
 <fba9791a-8e73-398b-5851-689dc1d769f0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Jl+DbTnyraiZ/loT"
Content-Disposition: inline
In-Reply-To: <fba9791a-8e73-398b-5851-689dc1d769f0@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--Jl+DbTnyraiZ/loT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 05:06:48PM +0300, Dmitry Osipenko wrote:
> 14.06.2019 17:02, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 14.06.2019 16:53, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> On Fri, Jun 14, 2019 at 04:29:17PM +0300, Dmitry Osipenko wrote:
> >>> 14.06.2019 16:22, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>> On Fri, Jun 14, 2019 at 03:24:07PM +0300, Dmitry Osipenko wrote:
> >>>>> 14.06.2019 13:47, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>>> From: Thierry Reding <treding@nvidia.com>
> >>>>>>
> >>>>>> The rating is parameterized depending on SoC generation to make su=
re it
> >>>>>> takes precedence on implementations where the architected timer ca=
n't be
> >>>>>> used. This rating is already used for the clock event device. Use =
the
> >>>>>> same rating for the clock source to be consistent.
> >>>>>>
> >>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>>>>> ---
> >>>>>>  drivers/clocksource/timer-tegra.c | 2 +-
> >>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksour=
ce/timer-tegra.c
> >>>>>> index f6a8eb0d7322..e6608141cccb 100644
> >>>>>> --- a/drivers/clocksource/timer-tegra.c
> >>>>>> +++ b/drivers/clocksource/timer-tegra.c
> >>>>>> @@ -318,7 +318,7 @@ static int __init tegra_init_timer(struct devi=
ce_node *np, bool tegra20,
> >>>>>>  	sched_clock_register(tegra_read_sched_clock, 32, TIMER_1MHz);
> >>>>>> =20
> >>>>>>  	ret =3D clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
> >>>>>> -				    "timer_us", TIMER_1MHz, 300, 32,
> >>>>>> +				    "timer_us", TIMER_1MHz, rating, 32,
> >>>>>>  				    clocksource_mmio_readl_up);
> >>>>>>  	if (ret)
> >>>>>>  		pr_err("failed to register clocksource: %d\n", ret);
> >>>>>>
> >>>>>
> >>>>> Looks good. Although, could you please clarify whether arch-timer s=
tops on T210 when CPU
> >>>>> enters deepest (powerdown) idle state? I'm starting to lose track a=
 bit already. Because
> >>>>> if arch-timer stops in the deepest idle state, then it's a bit odd =
that Joseph didn't add
> >>>>> the clocksource for T210 in the first place and v5.1 probably shoul=
dn't work well because
> >>>>> of that already.
> >>>>
> >>>> Yes, the architected timer doesn't work across an SC7 (which is what=
 the
> >>>> deepest idle state is called on Tegra210) transition, hence why we c=
an't
> >>>> use it as a suspend clocksource. I actually sent out a patch to do t=
hat,
> >>>> earlier.
> >>>>
> >>>> And yes, it's entirely possible that v5.1 doesn't work in this regar=
d,
> >>>> but we're not noticing that because we don't have suspend/resume sup=
port
> >>>> for Tegra210 anyway. There are a couple of missing pieces that we ne=
ed
> >>>> in order to make it work.
> >>>>
> >>>> This change in particular is only going to affect the CPU idle state
> >>>> (CC7). Since the architected timer doesn't survive that either, we n=
eed
> >>>> the Tegra timer to be preferred over the architected timer for normal
> >>>> operation.
> >>>>
> >>>> All of these issues go away on Tegra186 and later, where the archite=
cted
> >>>> timer is in an always-on partition and has a PLL that remains on dur=
ing
> >>>> SC7 (and CC7).
> >>>
> >>> Thank you very much for the clarification. But then what about the
> >>> sched_clock? I suppose sched_clock will suffer on T210 as well and it=
's
> >>> a bit trickier case because apparently arch-timer always wins since it
> >>> has a higher precision. I guess the best solution will be to just bail
> >>> out from arch-timer's driver probe in a case of T210.
> >>>
> >>> if (of_machine_is_compatible("nvidia,tegra210"))
> >>> 	return 0.
> >>
> >> I don't think there's any issue with the scheduler clock on Tegra210.
> >> Before the CPU can be turned off, all tasks scheduled on that CPU have
> >> to be migrated to another CPU, right? Conversely, before any tasks can
> >> be scheduled on a CPU that CPU needs to be brought online, at which
> >> point the architected timer should work fine again.
> >=20
> > Is SC7 a CPU-idle state that cpuidle driver may enter or it's a
> > system-wide suspend state? It's still not clear to me.
> >=20
>=20
> Ah, looks like I see now. So CC7 (CPU idle state) also affects the
> arch-timer (like SC7) and hence scheduler clock will be stopped while it
> shouldn't, which doesn't sound good.

We enable CC7 on Jetson TX1 and I've just verified on Jetson Nano that
there are no issues if CC7 is enabled. From the boot log I can see that
the architected timer is still used as scheduler clock.

So that either means that the scheduler doesn't mind if the clock is
disabled when a CPU is asleep or it means that CC7 does not impact the
architected timer. I thought we had already confirmed that the latter
isn't true, i.e. that the architected timer is disabled during CC7, so
that would mean that indeed the scheduler continues to work fine if the
clock is off during sleep. I also don't understand why it would break,
given that it's only put to sleep when there are no longer any tasks
running on it.

Thierry

--Jl+DbTnyraiZ/loT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0DvyUACgkQ3SOs138+
s6GcVg//V9dQUju0boZkRXo1R4ZTBxWH3Mnt6fqP0gTP0hELP44sQty3k4HCZETH
fgRGmz5flUSbC8iqbZNH9ChPvaF6qQlT+pPRJY7kH/mGe3xxhAW1HzrrrGmu8mj9
C1S+vmmCSP/+6JjUGMfJfffzQ2Ly1ZewNJWZwQ+QmdGqtTK9h5bfPI9pmVo4YqPu
LPu9UaD15k/CxgrckQtKu/m7ciNc8ZF74iApgaX3H0Tlyg4ZQI17pujfx6vK2o3W
lCv7ZD4e785mnn4SCnHXxU/w0VchnI87fhCfAtdDuCyGphDEamf1DpHVnAi7OwxK
5Yk1lo9Be3bRvPFonxsXv1DmT08syGxv5aDLYDTXMeXowyK5H3k/02Bwtm3Watm1
SbxIGwKa0Wm4UVxX46KAA6MiwPqtLmRDCikP+uvMGWmcrUbCpWaAFm2YiaX2sWCr
V/JOpl72aqH2SMiyauH2eVMovVuPYrs/SGxIyRilv9VVhnzUEQCB1uzqaAWzNDNU
aAhyNrY8uXKvrRsjNcNEvPEwnzYlxj1wpoeIXcZSLgY093pRlsOgMaiLr2JH4ro6
bDF0IKd7mpY7uOSq6WdfdpGJXw2XLL4XLhdymn/3JQgV2exqrgeKwod226Y0i+Fz
+J5h0HGD+plh2ja0hU7jA7ug1CJLr7NAMzNHJ5GsRWr8ixMQP7U=
=M5go
-----END PGP SIGNATURE-----

--Jl+DbTnyraiZ/loT--
