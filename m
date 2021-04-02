Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D40903529B9
	for <lists+linux-rtc@lfdr.de>; Fri,  2 Apr 2021 12:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbhDBK1s (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 2 Apr 2021 06:27:48 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35390 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhDBK1r (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 2 Apr 2021 06:27:47 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210402102745euoutp01d995110419290a9198362fa0b3d54707~yA67UIHk72607326073euoutp01G;
        Fri,  2 Apr 2021 10:27:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210402102745euoutp01d995110419290a9198362fa0b3d54707~yA67UIHk72607326073euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617359265;
        bh=hrg9Zjh6wkEEq/WpL8UP5fUQYy13RF9DsNWtImnSqRA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T7j3Yz3Y63KC8tOiBTsRCHnb4kwvrTO3g/A/iy9mo1cqJq5E9DSTOTIvVQoUXU/Ir
         gnwcPHpFzkaG4plh3hYjAU1Si1gFMd9riHiLlT8BaFV+aeTxkH/g/nw80707IFJUDO
         hYI7TXSdXADwY4dAjWpcz3YEtMTiIbxLsa1ujwU0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210402102744eucas1p2d25bb06736a291b1958ebadf342f1b15~yA66tOazs2540125401eucas1p2q;
        Fri,  2 Apr 2021 10:27:44 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 71.D8.09439.0A1F6606; Fri,  2
        Apr 2021 11:27:44 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210402102743eucas1p23690e0df642a10fa0326a84fac6c0ed3~yA65WZYHO1494714947eucas1p2-;
        Fri,  2 Apr 2021 10:27:43 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210402102743eusmtrp2f76589fe3676f2f9284d5114dbcdc14f~yA65VySOB2900629006eusmtrp2G;
        Fri,  2 Apr 2021 10:27:43 +0000 (GMT)
X-AuditID: cbfec7f5-c1bff700000024df-cb-6066f1a022a7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id A0.B9.08696.F91F6606; Fri,  2
        Apr 2021 11:27:43 +0100 (BST)
Received: from localhost (unknown [106.120.51.46]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210402102743eusmtip1ef9cf1545f84519c1da193d21ebc4dc3~yA65Kvh1F0203102031eusmtip1Y;
        Fri,  2 Apr 2021 10:27:43 +0000 (GMT)
From:   =?utf-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiew?= =?utf-8?Q?icz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rtc: ds1307: remove flags
Date:   Fri, 02 Apr 2021 12:27:42 +0200
In-Reply-To: <20210330000343.801566-2-alexandre.belloni@bootlin.com>
        (Alexandre Belloni's message of "Tue, 30 Mar 2021 02:03:42 +0200")
Message-ID: <dleftjr1jtdlr5.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRmVeSWpSXmKPExsWy7djP87oLPqYlGOydZWrR/m4Zu8XGGetZ
        LS7vmsNmcWz1FTaLtUfusjuwesxbU+3Rt2UVo8fnTXIBzFFcNimpOZllqUX6dglcGbNuvmEu
        WMlTseCXTgPjFa4uRk4OCQETiamX+5m7GLk4hARWMEqc/z+bESQhJPCFUWLeHG8I+zOjxMce
        VpiG7y23WCAaljNK3O86xwbhPAdyvv5mB6liE7CX6D+yjwXEFhEwlWht3AVWxCxwglHife80
        sBXCAkYSxzqXATVwcLAIqEocmw92BqdAJ6PElNW/wdbxCphLfHy0DmyoqIClxJYX99kh4oIS
        J2c+AVvALJArMfP8G0aI825wSMyYawxhu0gsfLqCBcIWlnh1fAs7hC0j8X/nfCaQvRIC9RKT
        J5mB7JUQ6GGU2DbnB1S9tcSdc7/YIGxHiTv3mtgh6vkkbrwVhFjLJzFp23RmiDCvREebEES1
        isS6/j1QU6Qkel+tgLrMQ2JFzyFWSIBOZ5T4uUBoAqPCLCTPzELyzCygqcwCmhLrd+lDhLUl
        li18zQxh20qsW/eeZQEj6ypG8dTS4tz01GLjvNRyveLE3OLSvHS95PzcTYzAZHP63/GvOxhX
        vPqod4iRiYPxEKMKUPOjDasvMEqx5OXnpSqJ8N7YkpogxJuSWFmVWpQfX1Sak1p8iFGag0VJ
        nHfX1jXxQgLpiSWp2ampBalFMFkmDk6pBqbNr9VnX12l4CaxzuD68kNbDB7sCE9c7blUeyrD
        YfXKinRd5Wlb5XmO372hHDltsl3tux3uRvEVmXuv/n6okFS2LG8fA9N/jqLlsqp/Ju2eLsQ/
        teAl06arwvsX+NsVPlz+PSxyR52A4LaTUScX3pX1DGSVcbsXfnXbziumpRcsOV1uNWzwq/67
        9UVX3vTfiq98XHQTVLruvP2S2FYsF8p/1rr56Oat5/9/3a6u/up2UUuQk8L3tY4pEzLZVBz1
        fs0N7oi012JreLPpuvWGJoNXnYI/BUKWW+p7N16fYnJ349qoAxw1TRcmrOGQZgz8uq9w35Lc
        yVz5R+cvach/8Z7pY9YCr/CHrRYzjk5ym/ZJiaU4I9FQi7moOBEAFmYn2LEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsVy+t/xu7rzP6YlGHxZIGnR/m4Zu8XGGetZ
        LS7vmsNmcWz1FTaLtUfusjuwesxbU+3Rt2UVo8fnTXIBzFF6NkX5pSWpChn5xSW2StGGFkZ6
        hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GbNuvmEuWMlTseCXTgPjFa4uRk4OCQET
        ie8tt1i6GLk4hASWMkpM7l/P2MXIAZSQklg5Nx2iRljiz7UuNoiap4wSJ6asYgRJsAnYS/Qf
        2ccCYosImEq0Nu4CK2IWOMEo8fPmfDaQhLCAkcSxzmXsILaQgLPE9Y8rwBawCKhKHJvPDFLP
        KdDJKDFl9W9WkBpeAXOJj4/WgdWLClhKbHlxnx0iLihxcuYTsGXMAtkSX1c/Z57AKDALSWoW
        ktQsoBXMApoS63fpQ4S1JZYtfM0MYdtKrFv3nmUBI+sqRpHU0uLc9NxiI73ixNzi0rx0veT8
        3E2MwHjZduznlh2MK1991DvEyMTBeIhRBajz0YbVFxilWPLy81KVRHhvbElNEOJNSaysSi3K
        jy8qzUktPsRoCvTaRGYp0eR8YCTnlcQbmhmYGpqYWRqYWpoZK4nzmhxZEy8kkJ5YkpqdmlqQ
        WgTTx8TBKdXAVMS/dKpM4PWatCCxG/cVpr3ie6B3uqBv5/nw6UesO4NTvW3668ScPhqkaors
        jwowX6owdcK3wDP8D6Yw3bosFORv+b7mxoIpS/VMeHcZbVg4+xt3W+0mJ/mkWFV5psOqzItu
        vfjB6Mtkd7C4Q+Scps3UwDoT3+t3HviuZ5l4v2atK98OHsvNkpMvRJxp/l//Y+/0HTcvT2Hi
        OzHTrSTLNvFr/HehvXdDf0vqlm1ylA1h0/mxUiIq+XAKU3LLjvmvzhgXRLlyHjfTrFz6K8nB
        8frhf8E2nX6GETsb9s97vfDO9t0PVqx+3r7ZxyFnymfHahuh7aulGn7mR27vPGzHOeeV+dFJ
        v6XKFxd9OXZspRJLcUaioRZzUXEiABHGno4sAwAA
X-CMS-MailID: 20210402102743eucas1p23690e0df642a10fa0326a84fac6c0ed3
X-Msg-Generator: CA
X-RootMTR: 20210402102743eucas1p23690e0df642a10fa0326a84fac6c0ed3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210402102743eucas1p23690e0df642a10fa0326a84fac6c0ed3
References: <20210330000343.801566-2-alexandre.belloni@bootlin.com>
        <CGME20210402102743eucas1p23690e0df642a10fa0326a84fac6c0ed3@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2021-03-30 wto 02:03>, when Alexandre Belloni wrote:
> flags is now unused, drop it.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-ds1307.c | 2 --
>  1 file changed, 2 deletions(-)
>

Tested-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
Reviewed-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>

> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index 76d67c419f7d..089509d0a3a0 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -169,8 +169,6 @@ enum ds_type {
>=20=20
>  struct ds1307 {
>  	enum ds_type		type;
> -	unsigned long		flags;
> -#define HAS_NVRAM	0		/* bit 0 =3D=3D sysfs file active */
>  	struct device		*dev;
>  	struct regmap		*regmap;
>  	const char		*name;

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmBm8Z4ACgkQsK4enJil
gBDcmAf/bVClaqSUnXfrEE0vihyjzXryYII9Aqn3eOgLZiEginIJUp9nZrfHAtBM
+YYH4FDEdIzbSgeLol0cPTBYt7KK5P8cGW2LDsTyWmzZZEz+VJMn7pHb9E3oeS4J
FJOwFoqHbi6AENUVN1qf668xHjKliZf3pPX9gkGMc4qHh8183km1P9OBGxzo17Wf
7vV9PVrE/vGUE9kQa09nlZ0/HgB8YRLqis/CLjj6By5Ja8so87ojf91piYLAW/WS
xGvZcUQFIc2aLrvxgrXwfl47ErQJQFJu6Q3t7qC9ddgGIFirF6/znl+aMdpRptLg
uJ5x62QFb6mR4w28P9K3Bk8dX3rVmQ==
=P0X9
-----END PGP SIGNATURE-----
--=-=-=--
