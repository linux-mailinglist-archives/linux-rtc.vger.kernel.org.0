Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6180745E06
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2019 15:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727823AbfFNNW6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Jun 2019 09:22:58 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38005 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727737AbfFNNW6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Jun 2019 09:22:58 -0400
Received: by mail-wm1-f66.google.com with SMTP id s15so2323088wmj.3;
        Fri, 14 Jun 2019 06:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ySmWvTMy24JYMEY2fm0WrThoqAo/IopZvxmjJBqJZKs=;
        b=U/ZYFKjryZbd5Pvj2EN9qdY2Q/DJOV9rgtn/doU6na1X5BrtZ2+CQ4JGoPnvcNJthN
         eAVTvwzM0t+a6d+rz3SKoHyQwnQqbPBPjoG19lcpgxtGuBkf5s2JGByIOdRahZCiynfr
         nrsiRSwKGVmDKO8gCVh7lOVqTfkffwBnfM6qYVaqffiyyEcZxNRR27O9MBvypbhU93LK
         GBNXArMzs413uRIPwy3bQJ9ks7BN9kzjkK9mE44s56Ro3SCRGEX2LlBF+lqcJlld44s5
         LvXPX8HUxYeAOP65mb0EyLT2X0d87aTWAWmJhMY7XZcq11YorGwYfcfJMp+ITzVdHAfz
         jGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ySmWvTMy24JYMEY2fm0WrThoqAo/IopZvxmjJBqJZKs=;
        b=WvBe7TiiEh6vRzlWULKvsgTlv19sascK/s/slNe4FxScofWSuepH8R+tUELJZpgF3l
         WCInDXU1L6Mw8VdHNxUOIMPam+7wyTDKwaAgCgA7d0mUKhBcW8ogGGc7il+t68ypeNCN
         YmxfnTxbr8vc1cTq/RPsl9nRaIioc3oHUM49HHgL+evM/vH2ZM0psr57w/vOOEyGq91P
         gBvQYSNawDKVDixUlRpGu8+D6TRIWddKA2YXGwROJmHz8RQsqiW2fLASsCkyQy64wQAX
         1kSepxDiUwT+JAyPL8JQSyymutkcmuJR3HfVwbkv81sK9mmE8IeE+sbiHgyC06vnjGGM
         vMyA==
X-Gm-Message-State: APjAAAU2llACIDHyfsDKYMP8xVvP5KmA5c3qwmztfMJ5L1UDp0y0S0Pv
        wwQamIy1nuEH/Ff6DEBmSpi6VCgj
X-Google-Smtp-Source: APXvYqzxbMKSDsq5jqg0ihigtY5gH+Ed50D7d0BUG542gKPZJB7z8t4zcB1xzmvSqbdISBkp4vyW3w==
X-Received: by 2002:a1c:c305:: with SMTP id t5mr7812376wmf.163.1560518574909;
        Fri, 14 Jun 2019 06:22:54 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id z5sm2735022wrh.16.2019.06.14.06.22.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 06:22:54 -0700 (PDT)
Date:   Fri, 14 Jun 2019 15:22:53 +0200
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
Message-ID: <20190614132253.GE15526@ulmo>
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <8ff5d2da-907e-611c-ec82-bbe50197c2f4@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="idY8LE8SD6/8DnRI"
Content-Disposition: inline
In-Reply-To: <8ff5d2da-907e-611c-ec82-bbe50197c2f4@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--idY8LE8SD6/8DnRI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 03:24:07PM +0300, Dmitry Osipenko wrote:
> 14.06.2019 13:47, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The rating is parameterized depending on SoC generation to make sure it
> > takes precedence on implementations where the architected timer can't be
> > used. This rating is already used for the clock event device. Use the
> > same rating for the clock source to be consistent.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/clocksource/timer-tegra.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/ti=
mer-tegra.c
> > index f6a8eb0d7322..e6608141cccb 100644
> > --- a/drivers/clocksource/timer-tegra.c
> > +++ b/drivers/clocksource/timer-tegra.c
> > @@ -318,7 +318,7 @@ static int __init tegra_init_timer(struct device_no=
de *np, bool tegra20,
> >  	sched_clock_register(tegra_read_sched_clock, 32, TIMER_1MHz);
> > =20
> >  	ret =3D clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
> > -				    "timer_us", TIMER_1MHz, 300, 32,
> > +				    "timer_us", TIMER_1MHz, rating, 32,
> >  				    clocksource_mmio_readl_up);
> >  	if (ret)
> >  		pr_err("failed to register clocksource: %d\n", ret);
> >=20
>=20
> Looks good. Although, could you please clarify whether arch-timer stops o=
n T210 when CPU
> enters deepest (powerdown) idle state? I'm starting to lose track a bit a=
lready. Because
> if arch-timer stops in the deepest idle state, then it's a bit odd that J=
oseph didn't add
> the clocksource for T210 in the first place and v5.1 probably shouldn't w=
ork well because
> of that already.

Yes, the architected timer doesn't work across an SC7 (which is what the
deepest idle state is called on Tegra210) transition, hence why we can't
use it as a suspend clocksource. I actually sent out a patch to do that,
earlier.

And yes, it's entirely possible that v5.1 doesn't work in this regard,
but we're not noticing that because we don't have suspend/resume support
for Tegra210 anyway. There are a couple of missing pieces that we need
in order to make it work.

This change in particular is only going to affect the CPU idle state
(CC7). Since the architected timer doesn't survive that either, we need
the Tegra timer to be preferred over the architected timer for normal
operation.

All of these issues go away on Tegra186 and later, where the architected
timer is in an always-on partition and has a PLL that remains on during
SC7 (and CC7).

Thierry

--idY8LE8SD6/8DnRI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Dn6kACgkQ3SOs138+
s6GWiBAAkYEeolDw2tllrVQFDf/ZmeLxHHy6pAh9DsxdalcYjpX8Twg1q3rUnVut
beWoisjLjgGnPeEDpATd8Gth0SK4dF65dVsNlhzJR/o+VhZ60XWrCQTvGWtnK0p+
IPfLDwHebxymb/d7iYfNde8mWXSvT4kFjcgx0g3H3c3lVRlWgTqqCmzMuV2EbbUT
fspE5pSsn5dce8E81ncb98medX7BNEHPZId0QsCnebZG6d2O5VWNkvn2fJSPMvor
SckKEY4E4zmth55mSxmJoIW3oZlwRpU34DvhyxocyfvLxEu7dz4co4w59oFPInpc
QUXifr71D0IcwUqvT9I8Q+AAsXMuhG01zBv7s/VmHrN5t6t02QBE0OScHHkoaiWI
jxcpKOJsfMbVt7z4ot7jcq7TbXPANsisZjBlYPbDtVzx4qfRd0qhrkuvI0ha3Abs
+0x9aLCwhMmS5JqHPCnkcD2+1tviLwqL5D6oRMWFUBDQbRsYD312sdSQx0cNlImU
tPYrSusbKmoh9gJKeRIMgHkA2kITLeM7VqwQOWNsow9fF2BJ6yjU99+ynfZN+qKs
1rJgZkkV2XE7yCMemQeZaNSHguL+7hdk2vAWdxWEwXjCLruv5iN4k6U+UOMPStJS
C1Nbqt6h9/NjkT/6iSKsZhW3lx/nMqnYEJg6Nt+2G/hmJnsL+F0=
=DrMZ
-----END PGP SIGNATURE-----

--idY8LE8SD6/8DnRI--
