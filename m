Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8268948006
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2019 12:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbfFQKxG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 17 Jun 2019 06:53:06 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44746 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726443AbfFQKxG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 17 Jun 2019 06:53:06 -0400
Received: by mail-wr1-f68.google.com with SMTP id r16so9394285wrl.11;
        Mon, 17 Jun 2019 03:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=biEt8U7KxxV/6fxZezGBTD9Up4nTFbJ5MJ7lWqrMdgU=;
        b=oqGQuT4SCmqXaII4X7yNCuELxAf7AY8q5lYL8uK7K1BHG6LQnE9xr117XGAV1jlXZj
         HCXcgwrRELKUarcTLa7hybnsZfxV4iesBPRE9DJbXVTl18TtcCnaFsUoBSw6ypDms1TH
         EgdvYnB4S7AFNks0GHIi0ddJm/cpIntfuVaT5DVDI9tiqXwRwZKC8/6Oec8r06XkMY0X
         01lLNEVzAh4N5JaIZk97TIwxo1A/RBvric436cRkMMpO5euS7iWeSJiBWtx70wt5CwPA
         YEiyFGQ1WSHVBEKYuY+rASTJN0n9ItSrVubdzshm/Y42r7Tr4VPKPpnGhL1uGBTJmg91
         F9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=biEt8U7KxxV/6fxZezGBTD9Up4nTFbJ5MJ7lWqrMdgU=;
        b=WiO+kOqgqhkNznFflakDhQ4fbp/yG6PaWXdis4hOqi5qgTDh1DbyRS2RjN9nykPDH+
         dqkP4lRn/V0Om6J/xDkA7Zq2nE3Q8XRHWOU+znlZFKHUSBLPHYtpKZV/OeyiMxc/E25d
         pZFI5QYHc+sTxKbSABOwi0sHz09x6utRV7FfFObeX8eZ/UW3TRALIYAo8AnH/EshphcB
         BtWVcBVy+PDuI2N6hFehkabvUGIcFDBrI15NCptidxOrJFm8D5zK0MJOnATXunAXR/Nh
         VyZvosaQmv2TiX5E2z6YONXRtl4GOgXgcjENu2OafPZqw/6Hk2EtCB/ms9MQ+Sw0aZQC
         Z2Jw==
X-Gm-Message-State: APjAAAVpAvETZMD/o51h6cz2R2tmseEdo/0/KZK/h8MV++7X8pqzX/U5
        suB8bxD1+TIsOaEz/P7TfEA=
X-Google-Smtp-Source: APXvYqzpiuLfvuDAAulD8KpvDnmP47BVqPmbghKWfnm+MWc17no6T5Ubh/ob+wciVc4P4em4KT//kQ==
X-Received: by 2002:adf:e2c7:: with SMTP id d7mr20286438wrj.272.1560768782583;
        Mon, 17 Jun 2019 03:53:02 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id 34sm10417826wre.32.2019.06.17.03.53.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 03:53:01 -0700 (PDT)
Date:   Mon, 17 Jun 2019 12:52:59 +0200
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
Message-ID: <20190617105259.GG508@ulmo>
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <8ff5d2da-907e-611c-ec82-bbe50197c2f4@gmail.com>
 <20190614132253.GE15526@ulmo>
 <3c339341-e77a-38aa-702a-1aef6c229eed@gmail.com>
 <20190614135353.GH15526@ulmo>
 <286cb0b7-1c8a-1a61-517e-1a9eee08e614@gmail.com>
 <fba9791a-8e73-398b-5851-689dc1d769f0@gmail.com>
 <20190614153712.GL15526@ulmo>
 <1e3bd8af-6341-f3c9-e3da-40cc4670134a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="B8ONY/mu/bqBak9m"
Content-Disposition: inline
In-Reply-To: <1e3bd8af-6341-f3c9-e3da-40cc4670134a@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--B8ONY/mu/bqBak9m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 08:00:09PM +0300, Dmitry Osipenko wrote:
> 14.06.2019 18:37, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Jun 14, 2019 at 05:06:48PM +0300, Dmitry Osipenko wrote:
> >> 14.06.2019 17:02, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> 14.06.2019 16:53, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>> On Fri, Jun 14, 2019 at 04:29:17PM +0300, Dmitry Osipenko wrote:
> >>>>> 14.06.2019 16:22, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>>> On Fri, Jun 14, 2019 at 03:24:07PM +0300, Dmitry Osipenko wrote:
> >>>>>>> 14.06.2019 13:47, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>>>>> From: Thierry Reding <treding@nvidia.com>
> >>>>>>>>
> >>>>>>>> The rating is parameterized depending on SoC generation to make =
sure it
> >>>>>>>> takes precedence on implementations where the architected timer =
can't be
> >>>>>>>> used. This rating is already used for the clock event device. Us=
e the
> >>>>>>>> same rating for the clock source to be consistent.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>>>>>>> ---
> >>>>>>>>  drivers/clocksource/timer-tegra.c | 2 +-
> >>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clockso=
urce/timer-tegra.c
> >>>>>>>> index f6a8eb0d7322..e6608141cccb 100644
> >>>>>>>> --- a/drivers/clocksource/timer-tegra.c
> >>>>>>>> +++ b/drivers/clocksource/timer-tegra.c
> >>>>>>>> @@ -318,7 +318,7 @@ static int __init tegra_init_timer(struct de=
vice_node *np, bool tegra20,
> >>>>>>>>  	sched_clock_register(tegra_read_sched_clock, 32, TIMER_1MHz);
> >>>>>>>> =20
> >>>>>>>>  	ret =3D clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1U=
S,
> >>>>>>>> -				    "timer_us", TIMER_1MHz, 300, 32,
> >>>>>>>> +				    "timer_us", TIMER_1MHz, rating, 32,
> >>>>>>>>  				    clocksource_mmio_readl_up);
> >>>>>>>>  	if (ret)
> >>>>>>>>  		pr_err("failed to register clocksource: %d\n", ret);
> >>>>>>>>
> >>>>>>>
> >>>>>>> Looks good. Although, could you please clarify whether arch-timer=
 stops on T210 when CPU
> >>>>>>> enters deepest (powerdown) idle state? I'm starting to lose track=
 a bit already. Because
> >>>>>>> if arch-timer stops in the deepest idle state, then it's a bit od=
d that Joseph didn't add
> >>>>>>> the clocksource for T210 in the first place and v5.1 probably sho=
uldn't work well because
> >>>>>>> of that already.
> >>>>>>
> >>>>>> Yes, the architected timer doesn't work across an SC7 (which is wh=
at the
> >>>>>> deepest idle state is called on Tegra210) transition, hence why we=
 can't
> >>>>>> use it as a suspend clocksource. I actually sent out a patch to do=
 that,
> >>>>>> earlier.
> >>>>>>
> >>>>>> And yes, it's entirely possible that v5.1 doesn't work in this reg=
ard,
> >>>>>> but we're not noticing that because we don't have suspend/resume s=
upport
> >>>>>> for Tegra210 anyway. There are a couple of missing pieces that we =
need
> >>>>>> in order to make it work.
> >>>>>>
> >>>>>> This change in particular is only going to affect the CPU idle sta=
te
> >>>>>> (CC7). Since the architected timer doesn't survive that either, we=
 need
> >>>>>> the Tegra timer to be preferred over the architected timer for nor=
mal
> >>>>>> operation.
> >>>>>>
> >>>>>> All of these issues go away on Tegra186 and later, where the archi=
tected
> >>>>>> timer is in an always-on partition and has a PLL that remains on d=
uring
> >>>>>> SC7 (and CC7).
> >>>>>
> >>>>> Thank you very much for the clarification. But then what about the
> >>>>> sched_clock? I suppose sched_clock will suffer on T210 as well and =
it's
> >>>>> a bit trickier case because apparently arch-timer always wins since=
 it
> >>>>> has a higher precision. I guess the best solution will be to just b=
ail
> >>>>> out from arch-timer's driver probe in a case of T210.
> >>>>>
> >>>>> if (of_machine_is_compatible("nvidia,tegra210"))
> >>>>> 	return 0.
> >>>>
> >>>> I don't think there's any issue with the scheduler clock on Tegra210.
> >>>> Before the CPU can be turned off, all tasks scheduled on that CPU ha=
ve
> >>>> to be migrated to another CPU, right? Conversely, before any tasks c=
an
> >>>> be scheduled on a CPU that CPU needs to be brought online, at which
> >>>> point the architected timer should work fine again.
> >>>
> >>> Is SC7 a CPU-idle state that cpuidle driver may enter or it's a
> >>> system-wide suspend state? It's still not clear to me.
> >>>
> >>
> >> Ah, looks like I see now. So CC7 (CPU idle state) also affects the
> >> arch-timer (like SC7) and hence scheduler clock will be stopped while =
it
> >> shouldn't, which doesn't sound good.
> >=20
> > We enable CC7 on Jetson TX1 and I've just verified on Jetson Nano that
> > there are no issues if CC7 is enabled. From the boot log I can see that
> > the architected timer is still used as scheduler clock.
> >=20
> > So that either means that the scheduler doesn't mind if the clock is
> > disabled when a CPU is asleep or it means that CC7 does not impact the
> > architected timer. I thought we had already confirmed that the latter
> > isn't true, i.e. that the architected timer is disabled during CC7, so
> > that would mean that indeed the scheduler continues to work fine if the
> > clock is off during sleep. I also don't understand why it would break,
> > given that it's only put to sleep when there are no longer any tasks
> > running on it.
>=20
> CPU may enter idling state while task is sleeping, i.e. waiting for some =
event. To be
> honest, I don't know much about how scheduling actually works in the kern=
el and what
> are the actual purposes of scheduler clock. Maybe Daniel could clarify it=
 all for us?

My understanding is that a task that goes to sleep can be migrated to
another CPU, so there's got to be code in place already to account for
that. Migrating from one CPU to another is not very different from
resuming a task on the same CPU.

But yeah, I'm not very firm on the fundamentals here either, so a bit of
clarification from Daniel or Thomas would help.

Thierry

--B8ONY/mu/bqBak9m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0HcQgACgkQ3SOs138+
s6HWOhAAlLnfyWrR/yFPN5f1UMYC1RPhGumOg86ay2/X8CzYwLJZNZQEnZABP1DK
E8FrDPvLuLeLA4pI4vV+65YwzfrDiqyF/nCICsu6oWXC4vSxcKJneBa23BYqo2BY
6jgEFSnsvfFYkB2NQFg0FKfQbbKsyizXWHgg/gGF+0SN1u3qhqu7j0VDsulotk4+
9sSXKa5AscCi52n8l8SUtNOJRf9UiVXfXCim6ArPd/miyTIRwZP72jkQKWcSPi8J
LJq7H8Ojjl9ZYMy+0VAy94TC53e3r4iy1fD7lk5TeV67GvkvHkaB4zMfAKOCdJf4
pObsO5GpkKOd5cUWLxjHXyCpk7zH8USkHLr6KgCxcQwxp+kjpNR/L/8AlYcmk12Q
UdVML9qnwZ3wU9nBUhoxONaqpAYsNdJ64x3/+j1ioUuWTtx7KdwrIeieVHEe4g/n
M+D1plWIzu/y70ZzXuYQwx+eyiw5vehcTT55xQdhutnqVBex8EVLvrN25Be+YLIU
pVkt9DQo07Sj1YrYzeRRRnxyoAuH5R4oNrFlZ75E+cD/aPbNHKEubc/Eqn6OH1zL
JFOYmpm6w/Ges2yA+3ZkdbCdCGxHYKkpyULpDCl1c/wnscK5B+ryLucrSzUyQ4aw
FU2Mw2BgpEgCcYjVMfrGCzkxL5utcR6xiCuLZeep+ypYAjUrQUc=
=vfch
-----END PGP SIGNATURE-----

--B8ONY/mu/bqBak9m--
