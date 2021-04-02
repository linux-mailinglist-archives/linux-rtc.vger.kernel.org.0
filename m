Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D34D63529BB
	for <lists+linux-rtc@lfdr.de>; Fri,  2 Apr 2021 12:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhDBK2T (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 2 Apr 2021 06:28:19 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:31192 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhDBK2Q (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 2 Apr 2021 06:28:16 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210402102814euoutp02061d45b5d50d75fd6671a5de4f6d690b~yA7V0frI21182511825euoutp02V;
        Fri,  2 Apr 2021 10:28:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210402102814euoutp02061d45b5d50d75fd6671a5de4f6d690b~yA7V0frI21182511825euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617359294;
        bh=MgE9vhgJDxNX/7OSTmWVb2DPktc/puyZSxUEVub/ni4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=omcDR/AUjsiQWf8PqjHH3ZZ0QoR9eupWGh8oDgfrItwQZxxrH6Qw54XBKfe37oZ3f
         yGs2WtaeA1eE7qXGfaSCh0VaU76dRErwa2unJoER4KLMoAdD+v5WH1zN871jH2rWUN
         rnzKHoJFLxFaS4X2TUSSGVNOHEn064rkj09V6YTQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210402102813eucas1p1cf3098a4ecfe51c51986e4e4b6eb715e~yA7VjaW1V1504015040eucas1p10;
        Fri,  2 Apr 2021 10:28:13 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 32.D6.09444.DB1F6606; Fri,  2
        Apr 2021 11:28:13 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210402102813eucas1p1bae7ec57559fa8df622118275bf6fae0~yA7VI2HMj0542305423eucas1p1-;
        Fri,  2 Apr 2021 10:28:13 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210402102813eusmtrp248c1cf8a1f7be57cc25e75867c96a941~yA7VIQFMG2853628536eusmtrp2E;
        Fri,  2 Apr 2021 10:28:13 +0000 (GMT)
X-AuditID: cbfec7f4-dbdff700000024e4-b3-6066f1bdcff9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 99.B9.08696.DB1F6606; Fri,  2
        Apr 2021 11:28:13 +0100 (BST)
Received: from localhost (unknown [106.120.51.46]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210402102813eusmtip1af6019f143c7711d58f54d33b2f455f8~yA7U4SlyQ0203102031eusmtip1b;
        Fri,  2 Apr 2021 10:28:13 +0000 (GMT)
From:   =?utf-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiew?= =?utf-8?Q?icz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] rtc: rtc_update_irq_enable: rework UIE emulation
Date:   Fri, 02 Apr 2021 12:28:12 +0200
In-Reply-To: <20210330000343.801566-3-alexandre.belloni@bootlin.com>
        (Alexandre Belloni's message of "Tue, 30 Mar 2021 02:03:43 +0200")
Message-ID: <dleftjmtuhdlqb.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfSzUcRzH973f73f3c9vp16X5dFq1S21pXXp0SnpQo6ep9TCrFRe/juG0
        +zmFFio9KA49XLh0aWHnCLsOh4wMdRutVKJSEnXCdNajHpyftv57f9+f1/vzsH1JTJhHiMgw
        RTStVMgixFw+bmr63rqoduRwkPtojpv07FA+T1p27Q4hfWLWcqVNRe1caXHjK946wi/XEO+X
        ZtQjP1v5rB3YPr5XCB0RFkMrF3sH8UN7np0hjnTOOFZe9ZWbiPKmpyAHEqjlYDF1YCmITwqp
        QgTVqfU89jGKoD/ZQLAPG4J2/SD3X6Ty+hucLRQgeFimmaT6EWiHbhF2ikutBXXjPdyunagV
        kJxk5tohjGpBMJx6FaUgkpxGbYYP9W52BqfmwcuKdI6dcaDOI+js0iJ7QUB5QOflHxNNp1Oe
        YPzQzWP9qfAgq3diAEZFQlbbJ2QPA9VBgvbhCx6760ZosyVjrJ4G1mbjpD8T/lTd4NiXACoB
        LmWuZLMXEZi033CWWQ0vW39M3rweSm29BMs7QsfgVHauI2SaNBhrC+DcGSFLu0KJumayiwhS
        rYWI1X5gGb4/oYWUBsFprVc6mpP93zXZ/12TPd4VoxbAHfNi1l4I+TcHMFavgZKSYVyHCD1y
        plVMpJxmlirooxJGFsmoFHJJcFRkORr/OpbfzaOVqMA6ImlAHBI1INfxcE9p0SMkwhVRClrs
        JOgw0kFCQYgsNo5WRgUqVRE004BcSFzsLDhkNAQKKbksmg6n6SO08l+VQzqIEjmnfPfU9LkE
        5y91L6mtaBELE8ID694l7lRvu/f8bNuKsYHs4uM9vvXWohOVPklxVZrX+hSPK2XN3oqKodhZ
        R/m5u334B2p45o/y1r3GKaTe877zslCft1hfgFG16zH61X/souHg/O0Lths37f/ZnmiTn7+b
        wXdgGsIdrxXw4iw9slTtwPux3iZu2Jf2+qjWukJ/POPk3IIY3dD6C14bPr9WLc/bejMtpM6p
        SuftH+xZeDvW5WpOuirtkiTkdvEtj6SgT6YAUbXl8fAy9+67koON6n0JAV2llZbZhyviA+Kd
        t/B2H8rS5T7lL1TrzGmx4ViLprar20BYe025MWNF/auqGTHOhMqWuGFKRvYXJh88t7UDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsVy+t/xu7p7P6YlGHTO57Jof7eM3WLjjPWs
        Fpd3zWGzOLb6CpvF2iN32R1YPeatqfbo27KK0ePzJrkA5ig9m6L80pJUhYz84hJbpWhDCyM9
        Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jEfX2lgLbklWbNr5na2BcZFoFyMnh4SA
        icSOuQ9YQGwhgaWMEuffSHUxcgDFpSRWzk2HKBGW+HOtiw2i5CmjxLKJISA2m4C9RP+RfWCt
        IgKmEq2Nu4BquDiYBU4wSvy8OZ8NZI6wgKfEi4NaEL3OEs9OX2EFsVkEVCXubJ/ABFLPKdDJ
        KHHr9hxGkASvgLnErSm/wIpEBSwltry4zw4RF5Q4OfMJ2DJmgWyJr6ufM09gFJiFJDULSWoW
        0GpmAU2J9bv0IcLaEssWvmaGsG0l1q17z7KAkXUVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZG
        YLRsO/Zzyw7Gla8+6h1iZOJgPMSoAtT5aMPqC4xSLHn5ealKIrw3tqQmCPGmJFZWpRblxxeV
        5qQWH2I0BfptIrOUaHI+MI7zSuINzQxMDU3MLA1MLc2MlcR5TY6siRcSSE8sSc1OTS1ILYLp
        Y+LglGpgmvZ5aj3DsfqOg3/1ZRx++csvZqmaoiKS+p614D3nRpGFB9+s01+htPBj47Q9yo+q
        Pa6w/z/PaBXgMfV4S/CV51lHJfydipbsnFLtPi23KfTBO/dvzi94/JyPrC995/fGYAfXtImn
        DEyYPrO/jrZaVFmzgq3X33PmvGKXB8Zbb7SlvlYqVAq4ulw54oGFLuOLlxpv88sE/SX8DZ5P
        /2B+MtBOUXcCdw+DwCUDlaXz3/7alm2x8sCfZRE3frUuOF5vZrBv35djcR9XznySqrbQs27z
        RQaWRayrRB03sq3MS7+usqlxX/R9vv7/coskM88embCQ+5bTnIiHEyr9LjxIefHwhsPzDLtb
        W6+t95NYLqPEUpyRaKjFXFScCAC2qjCgKwMAAA==
X-CMS-MailID: 20210402102813eucas1p1bae7ec57559fa8df622118275bf6fae0
X-Msg-Generator: CA
X-RootMTR: 20210402102813eucas1p1bae7ec57559fa8df622118275bf6fae0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210402102813eucas1p1bae7ec57559fa8df622118275bf6fae0
References: <20210330000343.801566-3-alexandre.belloni@bootlin.com>
        <CGME20210402102813eucas1p1bae7ec57559fa8df622118275bf6fae0@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2021-03-30 wto 02:03>, when Alexandre Belloni wrote:
> Now that the core is aware of whether alarms are available, it is possible
> to decide whether UIE emulation is required before actually trying to set
> the alarm.
>
> This greatly simplifies rtc_update_irq_enable because there is now only o=
ne
> error value to track and is not relying on the return value of
> __rtc_set_alarm anymore.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/interface.c | 28 +++++++---------------------
>  1 file changed, 7 insertions(+), 21 deletions(-)
>

Tested-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>

> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> index dcb34c73319e..b162964d2b39 100644
> --- a/drivers/rtc/interface.c
> +++ b/drivers/rtc/interface.c
> @@ -561,8 +561,12 @@ int rtc_update_irq_enable(struct rtc_device *rtc, un=
signed int enabled)
>  	if (rtc->uie_rtctimer.enabled =3D=3D enabled)
>  		goto out;
>=20=20
> -	if (rtc->uie_unsupported) {
> +	if (rtc->uie_unsupported || !test_bit(RTC_FEATURE_ALARM, rtc->features)=
) {
> +#ifdef CONFIG_RTC_INTF_DEV_UIE_EMUL
> +		err =3D rtc_dev_update_irq_enable_emul(rtc, enabled);
> +#else
>  		err =3D -EINVAL;
> +#endif
>  		goto out;
>  	}
>=20=20
> @@ -570,8 +574,8 @@ int rtc_update_irq_enable(struct rtc_device *rtc, uns=
igned int enabled)
>  		struct rtc_time tm;
>  		ktime_t now, onesec;
>=20=20
> -		rc =3D __rtc_read_time(rtc, &tm);
> -		if (rc)
> +		err =3D __rtc_read_time(rtc, &tm);
> +		if (err)
>  			goto out;
>  		onesec =3D ktime_set(1, 0);
>  		now =3D rtc_tm_to_ktime(tm);
> @@ -585,24 +589,6 @@ int rtc_update_irq_enable(struct rtc_device *rtc, un=
signed int enabled)
>  out:
>  	mutex_unlock(&rtc->ops_lock);
>=20=20
> -	/*
> -	 * __rtc_read_time() failed, this probably means that the RTC time has
> -	 * never been set or less probably there is a transient error on the
> -	 * bus. In any case, avoid enabling emulation has this will fail when
> -	 * reading the time too.
> -	 */
> -	if (rc)
> -		return rc;
> -
> -#ifdef CONFIG_RTC_INTF_DEV_UIE_EMUL
> -	/*
> -	 * Enable emulation if the driver returned -EINVAL to signal that it has
> -	 * been configured without interrupts or they are not available at the
> -	 * moment.
> -	 */
> -	if (err =3D=3D -EINVAL)
> -		err =3D rtc_dev_update_irq_enable_emul(rtc, enabled);
> -#endif
>  	return err;
>  }
>  EXPORT_SYMBOL_GPL(rtc_update_irq_enable);

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmBm8bwACgkQsK4enJil
gBD42wf/UcrU2D9DLxVyCc1wtFCR+nbGigi/3pfka0FGhspMGjPhXlmbthkob3Eo
hTPvfZCUjAZ1G6SV3ZgCrLqKzqiKmtYQLdfZKnH7i+p8t5Uc5CfbV/mhfupZbrS+
PphJCO+sW/yiz0eeDLptDPhUhr7modWBsDS4+WK4o9AwBOXMZfKoJErn9UutTNIV
EEevVHzXc00nlRt7MU5D6s8E1OIn8HXhEcBDJJ2DssqtOj2Xw7RncNfxUNyHg+Ke
QpdAxH31lYRHnvQEpLEkcbqY3JkJpsOjpI2ID1+V69iIVeEQymw18C/Sbf9BYlSW
Ns7y1JVtzTA/b//7RAOvJRDOD89pcQ==
=sLOG
-----END PGP SIGNATURE-----
--=-=-=--
