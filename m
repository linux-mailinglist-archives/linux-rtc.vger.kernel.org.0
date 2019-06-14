Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4417245FA0
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2019 15:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727954AbfFNNx5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Jun 2019 09:53:57 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53065 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbfFNNx5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Jun 2019 09:53:57 -0400
Received: by mail-wm1-f67.google.com with SMTP id s3so2473350wms.2;
        Fri, 14 Jun 2019 06:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HHXAMs1xOxthYFv7u5ej5byTLalzlpEa/ox5D6r5JHc=;
        b=eZIjYhfxkec9rMW9TfP1/sfepQZVyj0KYGtY/vRu7xFFKTtAIzBpgSn+Wwen7FmVBL
         IV0kxXyM3otiA/8q58otCdFKX8/NCoKMThIJ/SxUGdaMR19Ee2rzy4dmIFyPJ2azakXh
         Cr9TtFpa1Mv6CI2B6xPmS5dWZ/EI7TsFzZq8x1NIJK8pX+CrRapU90SqaPrYZj2wfRW2
         NMvltIg+7UGjwZXMHtcUJZPD/do5eJJGb9flQ0EPoVa5jG1bb6j+id343EJwgLNlJFA8
         G2RlHUfodlNBREt5mViYkabPDyPBolnTJa1CLAFJX6oJ5bcQ0ydArq4FMxlcn1FrlQwq
         atSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HHXAMs1xOxthYFv7u5ej5byTLalzlpEa/ox5D6r5JHc=;
        b=CklX91F0jVGz/WUpIjIFkAn2fq4tccswN9WWqbSO/1ZIgX6jJOHoxHMiSNSNqubX1J
         eAya2VOS2J62seFxPBzv8BG10KJRWR7nC4vsNvtmnxMXmSerjcaHUclvXWC9jAeq2Xah
         /CcIgC4/UcM/+GSeOJETXt7N7s1urN1OGf3HTRgN5E2MCm+G0VaigsW4QPD5ISC7DCDV
         8U8DHy5qXF+Xvga9E+fTpYsHo1wfx2lACc/bH1lklqXBoolDTben6S5HxAUSUC8BulLq
         EbtGqTxrOYbsRl7X9U1w9I6fEzwweImNEJ/ZN1I5juxinv+OXhsL2hEPhJXTyKx/i9OM
         G7Bg==
X-Gm-Message-State: APjAAAV7YvN92O+lWVhrf4vGkvAqXC5IuEX3rh3UnZ44J21bKnx9kAXR
        5X/g0bvBhAlGHeMwa9KYwPs=
X-Google-Smtp-Source: APXvYqx0mAcvlJde2deoKTQV4IlQDCYGxBMlI/5oTAk91N8tlpymbHt2Ac9AFfPH/BvjLqgOlWe4Tw==
X-Received: by 2002:a1c:3c8a:: with SMTP id j132mr8011516wma.172.1560520434921;
        Fri, 14 Jun 2019 06:53:54 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id f197sm3897067wme.39.2019.06.14.06.53.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 06:53:54 -0700 (PDT)
Date:   Fri, 14 Jun 2019 15:53:53 +0200
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
Message-ID: <20190614135353.GH15526@ulmo>
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <8ff5d2da-907e-611c-ec82-bbe50197c2f4@gmail.com>
 <20190614132253.GE15526@ulmo>
 <3c339341-e77a-38aa-702a-1aef6c229eed@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IbVRjBtIbJdbeK1C"
Content-Disposition: inline
In-Reply-To: <3c339341-e77a-38aa-702a-1aef6c229eed@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--IbVRjBtIbJdbeK1C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 04:29:17PM +0300, Dmitry Osipenko wrote:
> 14.06.2019 16:22, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Jun 14, 2019 at 03:24:07PM +0300, Dmitry Osipenko wrote:
> >> 14.06.2019 13:47, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> The rating is parameterized depending on SoC generation to make sure =
it
> >>> takes precedence on implementations where the architected timer can't=
 be
> >>> used. This rating is already used for the clock event device. Use the
> >>> same rating for the clock source to be consistent.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>>  drivers/clocksource/timer-tegra.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/=
timer-tegra.c
> >>> index f6a8eb0d7322..e6608141cccb 100644
> >>> --- a/drivers/clocksource/timer-tegra.c
> >>> +++ b/drivers/clocksource/timer-tegra.c
> >>> @@ -318,7 +318,7 @@ static int __init tegra_init_timer(struct device_=
node *np, bool tegra20,
> >>>  	sched_clock_register(tegra_read_sched_clock, 32, TIMER_1MHz);
> >>> =20
> >>>  	ret =3D clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
> >>> -				    "timer_us", TIMER_1MHz, 300, 32,
> >>> +				    "timer_us", TIMER_1MHz, rating, 32,
> >>>  				    clocksource_mmio_readl_up);
> >>>  	if (ret)
> >>>  		pr_err("failed to register clocksource: %d\n", ret);
> >>>
> >>
> >> Looks good. Although, could you please clarify whether arch-timer stop=
s on T210 when CPU
> >> enters deepest (powerdown) idle state? I'm starting to lose track a bi=
t already. Because
> >> if arch-timer stops in the deepest idle state, then it's a bit odd tha=
t Joseph didn't add
> >> the clocksource for T210 in the first place and v5.1 probably shouldn'=
t work well because
> >> of that already.
> >=20
> > Yes, the architected timer doesn't work across an SC7 (which is what the
> > deepest idle state is called on Tegra210) transition, hence why we can't
> > use it as a suspend clocksource. I actually sent out a patch to do that,
> > earlier.
> >=20
> > And yes, it's entirely possible that v5.1 doesn't work in this regard,
> > but we're not noticing that because we don't have suspend/resume support
> > for Tegra210 anyway. There are a couple of missing pieces that we need
> > in order to make it work.
> >=20
> > This change in particular is only going to affect the CPU idle state
> > (CC7). Since the architected timer doesn't survive that either, we need
> > the Tegra timer to be preferred over the architected timer for normal
> > operation.
> >=20
> > All of these issues go away on Tegra186 and later, where the architected
> > timer is in an always-on partition and has a PLL that remains on during
> > SC7 (and CC7).
>=20
> Thank you very much for the clarification. But then what about the
> sched_clock? I suppose sched_clock will suffer on T210 as well and it's
> a bit trickier case because apparently arch-timer always wins since it
> has a higher precision. I guess the best solution will be to just bail
> out from arch-timer's driver probe in a case of T210.
>=20
> if (of_machine_is_compatible("nvidia,tegra210"))
> 	return 0.

I don't think there's any issue with the scheduler clock on Tegra210.
Before the CPU can be turned off, all tasks scheduled on that CPU have
to be migrated to another CPU, right? Conversely, before any tasks can
be scheduled on a CPU that CPU needs to be brought online, at which
point the architected timer should work fine again.

Thierry

--IbVRjBtIbJdbeK1C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Dpu4ACgkQ3SOs138+
s6Gm3hAAsQ17FKRMhkoY7jdMvBWKzbHBQ6eK7yWiniVpZNlbTv2ur5hvMb8EoiAZ
3EIsXggcoxsvxGrJqs8asUWeprNBB0UaJ/mGEbwY7aMsA+J++mTZ4bASeudt/ieS
Ow69g+KNN9z3WMYPZ5YpF+R+N/fUMvVwsGP+QsduC+GMM4qYk/mh8NScMFmcqnSI
s5WT1/R3fcTMRUkw1z1Rofa7WMa05/o8AHUgLdSh2QneaE4VBSLChpOvc7FpGfuO
cfrZ14xzdYLt11h33Yxb0X0XXocObzr0n0cyyVQKMEdKrzgXBXTbL4OS2La048bu
MtpNxvlkev+OB7/pOut+Nb0lE3EUuxDJOXVPzXo8ndlN0YX16GEsQ9kUBCfy1xJv
s+OnC5rPWHU/qb7KU+zJ9jhrt24dJIlCqvXUvVFgSFA2IpT8FnBfmZfCoX+ytdEp
GVv5NUr7jxLBBh7oDkFxkmmyzdmAVq3DyWrDPU5RVBShTK9FUvoZHdVUaVSma37g
2djL12rwrFvXEolyi3nvWgIHRe0jf+/BIXjPGEocrjSkUg6uRJwif/6QrAB6d9cA
2M2xyhrwJzSfrbrq8jaf9L5ArfXyCfBdMauQK7BWInUebAurF5Evq0rc6qObNRxT
vKOd6O5TEQ+RTevYlUumdUkuLCiOgbzY64jqIixrtR6MRBFiqN4=
=yriP
-----END PGP SIGNATURE-----

--IbVRjBtIbJdbeK1C--
