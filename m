Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8F7633DC18
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Mar 2021 19:06:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239695AbhCPSG2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Mar 2021 14:06:28 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:20122 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235837AbhCPSEg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Mar 2021 14:04:36 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210316180431euoutp022ad4b0944d901cded8b13508161947c7~s5L4jbQ9S2575925759euoutp02T;
        Tue, 16 Mar 2021 18:04:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210316180431euoutp022ad4b0944d901cded8b13508161947c7~s5L4jbQ9S2575925759euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1615917871;
        bh=dWp8y1Lo+qwBuOWL5hzR5i/GhX6/g8XicmX5BZUvP5g=;
        h=From:To:Cc:Subject:In-Reply-To:Date:References:From;
        b=FUtCZRTeH0FbdxxLdr5V8b3pQKojv/iugwwipYr5KnfD7nQTW3y8KkJVJRy6xwqqP
         NdEiN+NanRuAm4eea5z5mXDruKY2GWVEdH3u9eKBQPLWwbZMbbakaO6BGy/i2nr1Mi
         OaK/KXccjoUb8lYCrYKMmKFqEYFZChqk3AolDeH8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210316180430eucas1p1411cd761594fecd16aa01f82bec0b80e~s5L3rmcql0362103621eucas1p1n;
        Tue, 16 Mar 2021 18:04:30 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 94.31.09444.E23F0506; Tue, 16
        Mar 2021 18:04:30 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210316180430eucas1p1a3cb26f40772b0af75782ff84908d731~s5L3JcZZL0317203172eucas1p1m;
        Tue, 16 Mar 2021 18:04:30 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210316180430eusmtrp104753c1723ae0e014c2e82472527dfa2~s5L3IwYuS3092130921eusmtrp14;
        Tue, 16 Mar 2021 18:04:30 +0000 (GMT)
X-AuditID: cbfec7f4-dbdff700000024e4-8f-6050f32ef87f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 94.CC.08705.D23F0506; Tue, 16
        Mar 2021 18:04:29 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210316180429eusmtip2065aa7e84e8e0b0980af584bc2082cbb~s5L26aKuE1485914859eusmtip2e;
        Tue, 16 Mar 2021 18:04:29 +0000 (GMT)
From:   Lukasz Stelmach <l.stelmach@samsung.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: ds1307: set uie_unsupported if no interrupt is
 available
In-Reply-To: <YFClVBShBuy9/VPY@piout.net> (Alexandre Belloni's message of
        "Tue, 16 Mar 2021 13:32:20 +0100")
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date:   Tue, 16 Mar 2021 19:04:14 +0100
Message-ID: <dleftjblbjc6w1.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se1BMcRSe3967u7fY3DbGsZqGnYzZ0q73Lr0waGWMNWN6GD1WXS21d9kr
        8hjCqOx4pJitnR4YPWZ76SkNIb1MyBZ5jISKRGE2piKj7WbGf993zvm+852ZQ2BCM1dE7KL3
        UXpaHSPm2eNVjSOtHlKrKnzh7QSx4prlGV+ROJjLV5SmlXAV7TUZPEVjwVOeoqi+k7+Kp8wq
        PKw8V2FGSmPWCEdpLXNR4dvsvSKpmF37Kb3MJ9xe8+bcJ2zPmDyu2ZiPx6NHUgOyI4BcCg0n
        qjEDsieEZD6C3q7HXJYMISjIPsljiRXBWEs9/k/S0XuJzzbyELSX354kHxF0l2WNE4LgkVIo
        KgqyCaaTy+DU8ZoJJ4zsRvC6KR/ZGk7kVjj77T7XNm9H0jBqdLGVZ5AroKKvi2/DODkPUq22
        SHaEgJRDQ6aBw2JHeJDeMxEII7WQ3voF2fyB7CHAkHcBY5OuhS7jNcRiJ+hvquCz2BlaUs/g
        tr1AHoPUlOWs9gyCqozhySs94fXjUR6LV8On2ngOO+8ALwYc2b0OkFJlxNiyAJIShOy0KxSf
        vzXpIoKz/fmTCZTQM1owgYXkEWi+ZcWT0RzTf9eY/rvGNO6KkRIoqZGxZXfIvfIZY7E3FBd/
        xS8jrhnNpGIZbRTFLKapA1JGrWVi6ShphE5bhsZfqOVP01A1yuv/Lq1DHALVIddx8fvrBU+Q
        CKd1NCWeLlhGq8KFgkj1wUOUXhemj42hmDo0m8DFMwU7KgrDhGSUeh8VTVF7KP2/LoewE8Vz
        rgT6zn83tTc+IMei7Iv1jy7ybFhPWAY3/GlU+Fmcg2ZlaNI2XTX7WFH1SP333bofKQdzNIlC
        SW40nA52kvv+3DIXDri/GzMb7lx8aGrFHU88eVv13JI8bcwYCuk0JpIJooaCXrq98l0xGnGT
        cfuY5ZBEpy0/mtnQ9Hve0pTNSS8X3h3236qRuHq+kUms7wM7Ej1k2e21N0KmMHRIZedQaShD
        Pc3ZmEnLw8SnncsLvVTizg/Nbc7rJKldMC3Ce061rtPbFLlAq1rbLXx+eXZxyde+4xkhK7f7
        J3jUnk++V+gSRxs4SxjlmtqHlYkdA8Ft8jafwYDP2Xd/7c3xq9kpxhmNepEbpmfUfwFIAlC/
        vQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsVy+t/xe7q6nwMSDM6st7ZYcvEqu0X7u2Xs
        FhtnrGe1uLxrDpvFsdVX2CzWHrnL7sDmMW9NtUffllWMHtPn/WTy+LxJLoAlSs+mKL+0JFUh
        I7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/jXt9L5oK/5hUnpq9g
        aWA8q9fFyMkhIWAice3pVPYuRi4OIYGljBK/u18zdzFyACWkJFbOTYeoEZb4c62LDaLmKaPE
        j/M/WUFq2AT0JNaujQCpEREwlWht3AVWwyzwnFHi7bt+VpCEsECQxNb3S8BmcgrkSfyaLgcS
        FhLQkOi/dIgdxBYVsJTY8uI+mM0ioCox+fM5sFZeAXOJo3O7mCBsQYmTM5+wgNjMAtkSX1c/
        Z57AKDALSWoWktQsoG3MApoS63fpQ4S1JZYtfM0MYdtKrFv3nmUBI+sqRpHU0uLc9NxiQ73i
        xNzi0rx0veT83E2MwAjaduzn5h2M81591DvEyMTBeIhRBajz0YbVFxilWPLy81KVRHhN8wIS
        hHhTEiurUovy44tKc1KLDzGaAr0wkVlKNDkfGNt5JfGGZgamhiZmlgamlmbGSuK8W+euiRcS
        SE8sSc1OTS1ILYLpY+LglGpgqnBny07YI17ryXOhUjbEfO9NPo3ijmVPdofPLrx05NsbpZcp
        PU7t9klzW0Vl3i16k5DOdPf4+/sC1Y3CH5vEOfziKvUjNDfv4RWRzEitS1slPqN9WlSw1Pea
        gpWeh5Yc296zp2DlOqfvUSYMv8JP2i6YvlB9asDGKX/qprydI/bh3YO1c3/9+Dblzq7zB95I
        TDdgqZQ0Ov9YdUtjzbLdSqdWR2mveJJ6lG9no9nsJPE885fdKyaf3LJ6TY5uyO/ML5uvuLJX
        5X//oV20YcukFweeNHmYsXcW5fPc7dHKWRbXuqdVQDJn7/emn8IZb2Ntzzv23Xh7e85fnWdB
        Lry/hX83JM9b1zaFu2THEjvDZ0osxRmJhlrMRcWJAOHOlJ41AwAA
X-CMS-MailID: 20210316180430eucas1p1a3cb26f40772b0af75782ff84908d731
X-Msg-Generator: CA
X-RootMTR: 20210316180430eucas1p1a3cb26f40772b0af75782ff84908d731
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210316180430eucas1p1a3cb26f40772b0af75782ff84908d731
References: <YFClVBShBuy9/VPY@piout.net>
        <CGME20210316180430eucas1p1a3cb26f40772b0af75782ff84908d731@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2021-03-16 wto 13:32>, when Alexandre Belloni wrote:
> On 16/03/2021 13:12:08+0100, Lukasz Stelmach wrote:
>> It was <2021-03-15 pon 23:01>, when Alexandre Belloni wrote:
>> > Hello,
>> >
>> > On 05/03/2021 18:44:11+0100, =C5=81ukasz Stelmach wrote:
>> >> For an RTC without an IRQ assigned rtc_update_irq_enable() should
>> >> return -EINVAL.  It will, when uie_unsupported is set.
>> >>=20
>> >
>> > I'm surprised this is an issue because the current code seems to cover
>> > all cases:
>> >
>> >  - no irq and not wakeup-source =3D> set_alarm should fail
>> >  - no irq and wakeup-source =3D> uie_unsupported is set
>> >  - irq =3D> UIE should work
>> >
>> > Can you elaborate on your failing use case?
>>=20
>> I've got ds3231 which supports alarms[1] but is not connected to any
>> interrupt line. Hence, client->irq is 0 as well as want_irq[2]. There
>> is also no other indirect connection, so I don't set wakeup-source
>> property and ds1307_can_wakeup_device remains[3] false. Under these
>> conditions
>>=20
>>     want_irq =3D 0
>>     ds1307_can_wakeup_device =3D false
>>=20
>> uie_unsupported remains[4] false. And this is the problem.
>>=20
>> hwclock(8) when setting system clock from rtc (--hctosys) calls
>> synchronize_to_clock_tick_rtc()[5]. There goes
>>=20
>>     ioctl(rtc_fd, RTC_UIE_ON, 0);
>>=20
>> which leads us to
>>=20
>>     rtc_update_irq_enable(rtc, 1);
>>=20
>> and finally here [6]
>>=20
>>     if (rtc->uie_unsupported) {
>>         err =3D -EINVAL;
>>         goto out;
>>     }
>>=20
>> and we keep going (uie_unsupported =3D 0). All the following operations
>> succeed because chip supports alarms.
>>=20
>
> But then, HAS_ALARM is not set and ds1337_set_alarm should fail which
> makes rtc_timer_enqueue return an error. I admit this whole part is a
> mess, I'm just trying to understand how you can hit that.

OK, you are right. The problem seems to be elsewhere.

How about this scnario? We call rtc_update_irq_enable(). We read rtc
with __rtc_read_time() and calculate the alarm time. We get through
rtc_timer_enqueue() and down to __rtc_set_alarm(). We loose the race
condition (I can do it, I've got really slow connection to DS3231) and
we return -ETIME from __rtc_set_alarm()

    if (scheduled <=3D now)
        return -ETIME;

and 0 from rtc_timer_enqueue() and the very same zero from
rtc_update_irq_enable(). The caller of ioctl() thinks they can expect
interrupts when, in fact, they won't receive any.

The really weird stuff happens in rtc_timer_do_work(). For the timer to
be dequeued __rtc_set_alarm() needs to return EINVAL three times in a
row. In my setup this doesn't happen and the code keeps running loops
around "reporogram" and "again" labels.

With my patch we never risk the above race condition between
__rtc_read_time() in rtc_update_irq_enable() and the one in
__rtc_set_alarm(), because we know rtc doesn't support alarms before we
start the race. In fact there is another race between __rtc_read_time()
and actually setting the alarm in the chip.

IMHO the solution is to introduce RTC_HAS_ALARM flag for struct
rtc_device and check it at the very beginning of __rtc_set_alarm() the
same way it is being done in ds1337_set_alarm(). What are your thoughts?

>> We go back to hwclock(8) and we start waiting[7] for the update from
>> interrupt which never arrives instead of calling
>> busywiat_for_rtc_clock_tick()[8] (mind the invalid indentation) because
>> of EINVAL returned from ioctl() (conf. [6])
>>=20
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/drivers/rtc/rtc-ds1307.c?h=3Dv5.11#n1032
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/drivers/rtc/rtc-ds1307.c?h=3Dv5.11#n1779
>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/drivers/rtc/rtc-ds1307.c?h=3Dv5.11#n1802
>> [4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/drivers/rtc/rtc-ds1307.c?h=3Dv5.11#n1977
>> [5] https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/tree/=
sys-utils/hwclock-rtc.c?h=3Dv2.36.2#n252
>> [6] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/drivers/rtc/interface.c?h=3Dv5.11#n564
>> [7] https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/tree/=
sys-utils/hwclock-rtc.c?h=3Dv2.36.2#n283
>> [8] https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/tree/=
sys-utils/hwclock-rtc.c?h=3Dv2.36.2#n297
>>=20
>> >> Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
>> >> ---
>> >>  drivers/rtc/rtc-ds1307.c | 14 +++++++-------
>> >>  1 file changed, 7 insertions(+), 7 deletions(-)
>> >>=20
>> >> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
>> >> index cd8e438bc9c4..b08a9736fa77 100644
>> >> --- a/drivers/rtc/rtc-ds1307.c
>> >> +++ b/drivers/rtc/rtc-ds1307.c
>> >> @@ -1973,13 +1973,6 @@ static int ds1307_probe(struct i2c_client *cli=
ent,
>> >>  	if (IS_ERR(ds1307->rtc))
>> >>  		return PTR_ERR(ds1307->rtc);
>> >>=20=20
>> >> -	if (ds1307_can_wakeup_device && !want_irq) {
>> >> -		dev_info(ds1307->dev,
>> >> -			 "'wakeup-source' is set, request for an IRQ is disabled!\n");
>> >> -		/* We cannot support UIE mode if we do not have an IRQ line */
>> >> -		ds1307->rtc->uie_unsupported =3D 1;
>> >> -	}
>> >> -
>> >>  	if (want_irq) {
>> >>  		err =3D devm_request_threaded_irq(ds1307->dev, client->irq, NULL,
>> >>  						chip->irq_handler ?: ds1307_irq,
>> >> @@ -1993,6 +1986,13 @@ static int ds1307_probe(struct i2c_client *cli=
ent,
>> >>  		} else {
>> >>  			dev_dbg(ds1307->dev, "got IRQ %d\n", client->irq);
>> >>  		}
>> >> +	} else {
>> >> +		if (ds1307_can_wakeup_device)
>> >> +			dev_info(ds1307->dev,
>> >> +				 "'wakeup-source' is set, request for an IRQ is disabled!\n");
>> >> +
>> >
>> > Honestly, just drop this message, it should have been removed by 82e2d=
43f6315
>> >
>> >
>>=20
>> Done.
>>=20
>> >> +		/* We cannot support UIE mode if we do not have an IRQ line */
>> >> +		ds1307->rtc->uie_unsupported =3D 1;
>> >>  	}
>> >>=20=20
>> >>  	ds1307->rtc->ops =3D chip->rtc_ops ?: &ds13xx_rtc_ops;
>> >> --=20
>> >> 2.26.2
>> >>=20
>>=20
>> --=20
>> =C5=81ukasz Stelmach
>> Samsung R&D Institute Poland
>> Samsung Electronics

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmBQ8x4ACgkQsK4enJil
gBBFIAgArjbHvHF9KbZdxXnfsTvd4NmsJmsLJSNlRv6IXEsB7pONKcbjuRiy/EVj
sozBhBrDkrWGjijFrGN10L+EZ1GElza9bGYMVrKNVBip2qt5ye1g3eNyg+V6b8kZ
cw4NH2Mi5RhNkO4RvbLsbcHDp2XKcnPbDi5fUQnUol5kWfKttrQidjVe+7AKP/uo
aus6SodvFUNjOE82mGj507/y4pb1KEv14Z5YV3C8ck3mP11GpYwZN/ff4NNPtsBv
begwjmBeMEjmCUfMG7nigrsRHnAP2ix9Q4vpgv9E2qHjU6+WJX4BMU070rbxLKZ9
DKlO4Xtk/8jkj//joUTyGzJwl73MnA==
=x9vy
-----END PGP SIGNATURE-----
--=-=-=--
