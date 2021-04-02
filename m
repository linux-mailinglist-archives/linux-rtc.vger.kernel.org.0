Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBBB3529B4
	for <lists+linux-rtc@lfdr.de>; Fri,  2 Apr 2021 12:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhDBK1A (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 2 Apr 2021 06:27:00 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35088 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbhDBK07 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 2 Apr 2021 06:26:59 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210402102656euoutp01e7bfad79706bc92c8557ff42eb3cc79c~yA6NnS0RY2418924189euoutp01N;
        Fri,  2 Apr 2021 10:26:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210402102656euoutp01e7bfad79706bc92c8557ff42eb3cc79c~yA6NnS0RY2418924189euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617359216;
        bh=o6QUUlvZu6aAHX+kPzgnWF84zPWtSkxJMhipBDfu4aw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OwkDXjeNrkq8a6K3o/klvJ0sqbYh+Dm1uG7MJIG0B+dJxaMf6fy/JR4qBqUpu7Pp+
         90ZXcikO32slhi0Ahw+LXedmDL+zBoNeLkMuY5QbwDjLWBdK9rn3O3mewFLS2t0I1m
         nZZT6MLNTeUhhN7qdfLgjZoyxICu5ZwBmFC6jcNI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210402102655eucas1p14062d919850c6d504f2002f428b2fda9~yA6M08oWc0697706977eucas1p1Z;
        Fri,  2 Apr 2021 10:26:55 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 19.B6.09444.F61F6606; Fri,  2
        Apr 2021 11:26:55 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210402102655eucas1p24ee7e879816089921bf9752c3c483122~yA6MVU42C2540125401eucas1p2G;
        Fri,  2 Apr 2021 10:26:55 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210402102655eusmtrp1d11910c062c6b5559cd3f06d0e3090d0~yA6MUqvNo0265402654eusmtrp1M;
        Fri,  2 Apr 2021 10:26:55 +0000 (GMT)
X-AuditID: cbfec7f4-dd5ff700000024e4-22-6066f16f3669
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 12.48.08705.E61F6606; Fri,  2
        Apr 2021 11:26:54 +0100 (BST)
Received: from localhost (unknown [106.120.51.46]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210402102654eusmtip1b637099a57c0868d4b676aa705fb37ed~yA6MEWayl0069900699eusmtip1w;
        Fri,  2 Apr 2021 10:26:54 +0000 (GMT)
From:   =?utf-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiew?= =?utf-8?Q?icz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] rtc: ds1307: replace HAS_ALARM by RTC_FEATURE_ALARM
Date:   Fri, 02 Apr 2021 12:26:38 +0200
In-Reply-To: <20210330000343.801566-1-alexandre.belloni@bootlin.com>
        (Alexandre Belloni's message of "Tue, 30 Mar 2021 02:03:41 +0200")
Message-ID: <dleftjv995dlsx.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaVCMYRz37HvsW9m8tuhv0ZAcG0oU60wzjh3HlMGXzKiNV6K27Fut+EBI
        Sts25Uyyu7bSRktWCNFqdGHLNZiyOYasI00ai1F2ezPj2+//O/7HMw+FCXWEiIqVJzEKuSzO
        h3TFq+79tExP6N4SNaO5Zrwk42sJX3LphJGQPK4uJCX3yp+Qkgt17fzFhLTo/G5pjsmApD2V
        3uFYhOuCzUxcbAqjCFgU5bq1vNiAJb4I2pljzyL3ol6/LORCAR0E9189JbKQKyWkzyFoyGxA
        XPEdwRu9lscVPQiy0/XYv8ij2nacE0oR3NXqeU5BSH9A0NTDOjFJh4C6rgZ3Yk86GNLTqkln
        AKMbEHSpjiGn4EGvgtdNhwYwTk+Ex7qXmNPkQmciKNTfIJyCgJ4DTZ1nB/AIei6YOq18jh8O
        jSffDUzA6Hg4afk8sDjQbRSotS0kt+sSUJV9xjnsAbZ6E5/DY6A5P9vBUw68B/LzZnPZbARV
        hfZB/3xoe/hrsE8o7Ks18Dm/Ozz/Mpyb6w55VccxjhbAoYNCzu0LFeqbg11EoLKdQ5xFCsXW
        UO7hjiOoM7fyc9G4gv+uKfjvmgJHBKPFYKwO4OipUKL9hHF4IVRUdOEaRBiQF5PMxscw7Ew5
        o/RnZfFssjzGf1NCfCVyfJ3mvvrv11CprdvfjHgUMiNfR/jNxfIWJMLlCXLGx1Pw3MRECQWb
        Zam7GEVCpCI5jmHNaDSF+3gJok3nI4V0jCyJ2c4wiYzin8qjXER7eYGxDU26/rTrvpZpafm8
        oK7+6sqXv8Uhav1u4zPvvlLLRY/AH0S5kXQvrt3/bYvoiHhDh9+jzBRNhpvviLCxfj0T6i+X
        tBa5dWNIefPYsjNRq6+k6jpylr/dRlQN22icbO4VB0Ys07ZMe79BbzmaFDxUQ3S6hTHPVoSP
        zj2lmnC7jzJF9tH2uxPXFO0JSbFOsrfdWqsZIo3+81ZXltGWbKuYvWib+IumZFRrzeF5qYbG
        O7WreOlXc3+ssyrV7IGPi383SyfN0nvvJEN7T9t2McorLUtXeudFB2TMCB8rzVsX7GmfYu6P
        GFX6oHHMKbH51sgdVn7hSqVqfdmQ22HtXv68UB+c3SoL9MMUrOwvV4PwZLUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNIsWRmVeSWpSXmKPExsVy+t/xu7p5H9MSDBYctrFof7eM3WLjjPWs
        Fpd3zWGzOLb6CpvF2iN32R1YPeatqfbo27KK0ePzJrkA5ig9m6L80pJUhYz84hJbpWhDCyM9
        Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jNVLVzEX3DSp6PvRxdbA+FWri5GTQ0LA
        ROLSwbssXYxcHEICSxkluo6vYe1i5ABKSEmsnJsOUSMs8edaFxtEzVNGiXmvL7CBJNgE7CX6
        j+xjAbFFBEwlWht3gRUxC5xglPh5cz5YkbCAj8TDUx2MILaQgLPE9Nnn2UFsFgFVicuLbjGD
        NHAKdDJKzFmymxUkwStgLnHqxWIwW1TAUmLLi/vsEHFBiZMzn4BtYxbIlvi6+jnzBEaBWUhS
        s5CkZgE9wSygKbF+lz5EWFti2cLXzBC2rcS6de9ZFjCyrmIUSS0tzk3PLTbUK07MLS7NS9dL
        zs/dxAiMmW3Hfm7ewTjv1Ue9Q4xMHIyHGFWAOh9tWH2BUYolLz8vVUmE98aW1AQh3pTEyqrU
        ovz4otKc1OJDjKZAv01klhJNzgdGc15JvKGZgamhiZmlgamlmbGSOO/WuWvihQTSE0tSs1NT
        C1KLYPqYODilGpimsyUUtVRN+thW7abDrjLH5s+PykeLfHsOcpzYyXQk697sd5Iir1hu7bAM
        UrWeqS/tVcq+NWvVrI4g18LLDXJbNhrei7BLVv3Xt3RSrN3mu195vROcove2vWorW/b4XcHe
        kGxPoQYNE92jM8PjZ13o/5Yg8sjZVSpNIc5n0hv2HbbPa+06XI8sZasrfXGy6sivh++ffdjb
        F3kz8sy51b8qRNfO+7B6WVOk4PXvi24++S08yVDR215ciY21ds/97ZecnZf/jWrt4dp+6cwt
        gZ//WPgYVX+vDiq9qRkW31Bm2Jgzy4lJSOl03omOvJT29SK330fIbNsfGPjPnfXnFrevG/bX
        y338LbQt8F3MsT1KLMUZiYZazEXFiQCN2WNqLgMAAA==
X-CMS-MailID: 20210402102655eucas1p24ee7e879816089921bf9752c3c483122
X-Msg-Generator: CA
X-RootMTR: 20210402102655eucas1p24ee7e879816089921bf9752c3c483122
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210402102655eucas1p24ee7e879816089921bf9752c3c483122
References: <20210330000343.801566-1-alexandre.belloni@bootlin.com>
        <CGME20210402102655eucas1p24ee7e879816089921bf9752c3c483122@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2021-03-30 wto 02:03>, when Alexandre Belloni wrote:
> The core now has RTC_FEATURE_ALARM for the driver to indicate whether
> alarms are available. Use that instead of HAS_ALARM to ensure the alarm
> callbacks are not even called.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-ds1307.c | 42 +++++++---------------------------------
>  1 file changed, 7 insertions(+), 35 deletions(-)
>

Tested-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
Reviewed-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>

> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index cd8e438bc9c4..76d67c419f7d 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -171,7 +171,6 @@ struct ds1307 {
>  	enum ds_type		type;
>  	unsigned long		flags;
>  #define HAS_NVRAM	0		/* bit 0 =3D=3D sysfs file active */
> -#define HAS_ALARM	1		/* bit 1 =3D=3D irq claimed */
>  	struct device		*dev;
>  	struct regmap		*regmap;
>  	const char		*name;
> @@ -411,9 +410,6 @@ static int ds1337_read_alarm(struct device *dev, stru=
ct rtc_wkalrm *t)
>  	int			ret;
>  	u8			regs[9];
>=20=20
> -	if (!test_bit(HAS_ALARM, &ds1307->flags))
> -		return -EINVAL;
> -
>  	/* read all ALARM1, ALARM2, and status registers at once */
>  	ret =3D regmap_bulk_read(ds1307->regmap, DS1339_REG_ALARM1_SECS,
>  			       regs, sizeof(regs));
> @@ -454,9 +450,6 @@ static int ds1337_set_alarm(struct device *dev, struc=
t rtc_wkalrm *t)
>  	u8			control, status;
>  	int			ret;
>=20=20
> -	if (!test_bit(HAS_ALARM, &ds1307->flags))
> -		return -EINVAL;
> -
>  	dev_dbg(dev, "%s secs=3D%d, mins=3D%d, "
>  		"hours=3D%d, mday=3D%d, enabled=3D%d, pending=3D%d\n",
>  		"alarm set", t->time.tm_sec, t->time.tm_min,
> @@ -512,9 +505,6 @@ static int ds1307_alarm_irq_enable(struct device *dev=
, unsigned int enabled)
>  {
>  	struct ds1307		*ds1307 =3D dev_get_drvdata(dev);
>=20=20
> -	if (!test_bit(HAS_ALARM, &ds1307->flags))
> -		return -ENOTTY;
> -
>  	return regmap_update_bits(ds1307->regmap, DS1337_REG_CONTROL,
>  				  DS1337_BIT_A1IE,
>  				  enabled ? DS1337_BIT_A1IE : 0);
> @@ -592,9 +582,6 @@ static int rx8130_read_alarm(struct device *dev, stru=
ct rtc_wkalrm *t)
>  	u8 ald[3], ctl[3];
>  	int ret;
>=20=20
> -	if (!test_bit(HAS_ALARM, &ds1307->flags))
> -		return -EINVAL;
> -
>  	/* Read alarm registers. */
>  	ret =3D regmap_bulk_read(ds1307->regmap, RX8130_REG_ALARM_MIN, ald,
>  			       sizeof(ald));
> @@ -634,9 +621,6 @@ static int rx8130_set_alarm(struct device *dev, struc=
t rtc_wkalrm *t)
>  	u8 ald[3], ctl[3];
>  	int ret;
>=20=20
> -	if (!test_bit(HAS_ALARM, &ds1307->flags))
> -		return -EINVAL;
> -
>  	dev_dbg(dev, "%s, sec=3D%d min=3D%d hour=3D%d wday=3D%d mday=3D%d mon=
=3D%d "
>  		"enabled=3D%d pending=3D%d\n", __func__,
>  		t->time.tm_sec, t->time.tm_min, t->time.tm_hour,
> @@ -681,9 +665,6 @@ static int rx8130_alarm_irq_enable(struct device *dev=
, unsigned int enabled)
>  	struct ds1307 *ds1307 =3D dev_get_drvdata(dev);
>  	int ret, reg;
>=20=20
> -	if (!test_bit(HAS_ALARM, &ds1307->flags))
> -		return -EINVAL;
> -
>  	ret =3D regmap_read(ds1307->regmap, RX8130_REG_CONTROL0, &reg);
>  	if (ret < 0)
>  		return ret;
> @@ -735,9 +716,6 @@ static int mcp794xx_read_alarm(struct device *dev, st=
ruct rtc_wkalrm *t)
>  	u8 regs[10];
>  	int ret;
>=20=20
> -	if (!test_bit(HAS_ALARM, &ds1307->flags))
> -		return -EINVAL;
> -
>  	/* Read control and alarm 0 registers. */
>  	ret =3D regmap_bulk_read(ds1307->regmap, MCP794XX_REG_CONTROL, regs,
>  			       sizeof(regs));
> @@ -793,9 +771,6 @@ static int mcp794xx_set_alarm(struct device *dev, str=
uct rtc_wkalrm *t)
>  	unsigned char regs[10];
>  	int wday, ret;
>=20=20
> -	if (!test_bit(HAS_ALARM, &ds1307->flags))
> -		return -EINVAL;
> -
>  	wday =3D mcp794xx_alm_weekday(dev, &t->time);
>  	if (wday < 0)
>  		return wday;
> @@ -842,9 +817,6 @@ static int mcp794xx_alarm_irq_enable(struct device *d=
ev, unsigned int enabled)
>  {
>  	struct ds1307 *ds1307 =3D dev_get_drvdata(dev);
>=20=20
> -	if (!test_bit(HAS_ALARM, &ds1307->flags))
> -		return -EINVAL;
> -
>  	return regmap_update_bits(ds1307->regmap, MCP794XX_REG_CONTROL,
>  				  MCP794XX_BIT_ALM0_EN,
>  				  enabled ? MCP794XX_BIT_ALM0_EN : 0);
> @@ -1641,7 +1613,7 @@ static int ds3231_clks_register(struct ds1307 *ds13=
07)
>  		 * Interrupt signal due to alarm conditions and square-wave
>  		 * output share same pin, so don't initialize both.
>  		 */
> -		if (i =3D=3D DS3231_CLK_SQW && test_bit(HAS_ALARM, &ds1307->flags))
> +		if (i =3D=3D DS3231_CLK_SQW && test_bit(RTC_FEATURE_ALARM, ds1307->rtc=
->features))
>  			continue;
>=20=20
>  		init.name =3D ds3231_clks_names[i];
> @@ -1964,15 +1936,15 @@ static int ds1307_probe(struct i2c_client *client,
>  			     bin2bcd(tmp));
>  	}
>=20=20
> -	if (want_irq || ds1307_can_wakeup_device) {
> -		device_set_wakeup_capable(ds1307->dev, true);
> -		set_bit(HAS_ALARM, &ds1307->flags);
> -	}
> -
>  	ds1307->rtc =3D devm_rtc_allocate_device(ds1307->dev);
>  	if (IS_ERR(ds1307->rtc))
>  		return PTR_ERR(ds1307->rtc);
>=20=20
> +	if (want_irq || ds1307_can_wakeup_device)
> +		device_set_wakeup_capable(ds1307->dev, true);
> +	else
> +		clear_bit(RTC_FEATURE_ALARM, ds1307->rtc->features);
> +
>  	if (ds1307_can_wakeup_device && !want_irq) {
>  		dev_info(ds1307->dev,
>  			 "'wakeup-source' is set, request for an IRQ is disabled!\n");
> @@ -1988,7 +1960,7 @@ static int ds1307_probe(struct i2c_client *client,
>  		if (err) {
>  			client->irq =3D 0;
>  			device_set_wakeup_capable(ds1307->dev, false);
> -			clear_bit(HAS_ALARM, &ds1307->flags);
> +			clear_bit(RTC_FEATURE_ALARM, ds1307->rtc->features);
>  			dev_err(ds1307->dev, "unable to request IRQ!\n");
>  		} else {
>  			dev_dbg(ds1307->dev, "got IRQ %d\n", client->irq);

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmBm8V4ACgkQsK4enJil
gBB8Wwf/e8msV8AcisRqv2L0td0Tfvj+L0VjMSXIlwH9u4ie+lka1fXwmePfCm1q
jRPdU2KXVqxMx9okrytV+yWue8frfgxJNOpYfHmLZsHNnyVZ/IrmuxlN+sI4iUwG
AWd/KreKX5P73/86I4HdECOA0+eM9OXesnw9OfwvrsgIbFaHID89yE8778ziN3up
Gy4rgZf/lkQiJqSM2OcQj4SrzVALhAGZcxPknBBA7rFHzoZk/wEVEEgtfQomj+km
NmG0TO0G3g5Ll8anPIs/++fOhVCoM+2USPTgm9Dj6tmFqBkf7yHil/fLo3pEDbhn
vs63o/fXKhoBmcrVj8xT83ldK1FJDw==
=cIa1
-----END PGP SIGNATURE-----
--=-=-=--
