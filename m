Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D843733D391
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Mar 2021 13:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbhCPMM5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Mar 2021 08:12:57 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39743 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhCPMMY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Mar 2021 08:12:24 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210316121220euoutp01efade31ca33c5bb97e9ab71d87d0847d~s0YYWIjXu2498224982euoutp01G;
        Tue, 16 Mar 2021 12:12:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210316121220euoutp01efade31ca33c5bb97e9ab71d87d0847d~s0YYWIjXu2498224982euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1615896740;
        bh=EKLZMJpZUDFUGt+KgmrSaCgYBKF2In0VViE9xA/khLI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eTEl8J/7mtZ1H+FuP/uCvQti7BxBs4fkEERfIhwOfpuQVcjg2+oh4x33Z4+q3b6hF
         5WP4aYHOSghlcjNvPcxSxbl6L9Q7f8tmvPE9p4pJ+iyxmuzgihXf3yQD2WiwycFncC
         HWTV24ozYbCatWy7W0JQXtMRu3k975bDq1E/33h4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210316121219eucas1p2498f05b1a32b3648518a5319d2ba7356~s0YXuDEwz0705107051eucas1p2A;
        Tue, 16 Mar 2021 12:12:19 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id D6.79.09444.3A0A0506; Tue, 16
        Mar 2021 12:12:19 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210316121218eucas1p1f74d6e6cec7fc897051902a7da478fd0~s0YXFIT_O2423624236eucas1p1i;
        Tue, 16 Mar 2021 12:12:18 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210316121218eusmtrp271df07341d70ec3213152651a8c86420~s0YXEagHI2950929509eusmtrp2H;
        Tue, 16 Mar 2021 12:12:18 +0000 (GMT)
X-AuditID: cbfec7f4-dd5ff700000024e4-01-6050a0a39822
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 61.4A.08705.2A0A0506; Tue, 16
        Mar 2021 12:12:18 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210316121218eusmtip2fb6f60efb598a44eca3937dffdce32e9~s0YW2xqWh2290822908eusmtip2e;
        Tue, 16 Mar 2021 12:12:18 +0000 (GMT)
From:   Lukasz Stelmach <l.stelmach@samsung.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: ds1307: set uie_unsupported if no interrupt is
 available
Date:   Tue, 16 Mar 2021 13:12:08 +0100
In-Reply-To: <YE/ZLtdK0ZlVFOhp@piout.net> (Alexandre Belloni's message of
        "Mon, 15 Mar 2021 23:01:18 +0100")
Message-ID: <dleftj1rcfe1rb.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7djP87qLFwQkGLzvFbdYcvEqu0X7u2Xs
        FhtnrGe1uLxrDpvFsdVX2CzWHrnL7sDmMW9NtUffllWMHtPn/WTy+LxJLoAlissmJTUnsyy1
        SN8ugSvj0vwz7AWv1CoufJ7B1MD4XqGLkZNDQsBE4siUPtYuRi4OIYEVjBIXD0+Hcr4wSvw6
        f4odwvnMKNH+u5MFpuXq161MEInlQC2T+qGqnjNKfJy8jq2LkYODTUBPYu3aCJAGEQFTidbG
        XWwgNcwCjxgltr+7BjZJWCBEovfDYVYQm0VAVeLBzG2MIDanQJ7E25PbwWp4BcwlmtevAouL
        ClhKbHlxnx0iLihxcuYTsBpmgVyJmeffMIIskBB4wSHxZMsDVohTXSQuNcyAOltY4tXxLewQ
        tozE/53zmUAOlRCol5g8yQyit4dRYtucH1D11hJ3zv1ig7AdJbb0X2KBqOeTuPFWEGIvn8Sk
        bdOZIcK8Eh1tQhDVKhLr+vdATZGS6H21ghGixENiw5cASFCtZZR49e0r0wRGhVlIvpmF5JtZ
        QC3MApoS63fpQ4S1JZYtfM0MYdtKrFv3nmUBI+sqRvHU0uLc9NRio7zUcr3ixNzi0rx0veT8
        3E2MwDR0+t/xLzsYl7/6qHeIkYmD8RCjCigKNqy+wCjFkpefl6okwmuaF5AgxJuSWFmVWpQf
        X1Sak1p8iFGag0VJnDdpy5p4IYH0xJLU7NTUgtQimCwTB6dUA9OCgxkBnFtOlBUYRgWunyJ3
        7JzynnOv2Mrce3xtgndsC+tm0jlyWuHNp8llk5ojZv6vVbRye9MuoPxy0ZKrLowvPu/9nL6K
        fdfWOe/Y1gfuFX0tncVlGsm8fQfHN/XZctNN33y2Dtg9PfBWSF5xlOynDQdOmKWbld5cY9X6
        y65137U/H3X0o5d3361dyO4478xBw8mrmj/EftCy5WZ4umSDTf7Oew7hk02fp0Rb/nYzmBg0
        X/Hflu3/LxcruDQePGI+2/Clkp716/It/4T61kvX81l0JTfLXF6/N2DpvgV9fG5bJQpfGc/v
        r5xy0idTc/W+qZsull8zMm3qKgjt3jd58Rs9+5I1nt4J4Qq+88uUWIozEg21mIuKEwEiStlg
        vgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsVy+t/xe7qLFgQkGPzv0bZYcvEqu0X7u2Xs
        FhtnrGe1uLxrDpvFsdVX2CzWHrnL7sDmMW9NtUffllWMHtPn/WTy+LxJLoAlSs+mKL+0JFUh
        I7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j0vwz7AWv1CoufJ7B
        1MD4XqGLkZNDQsBE4urXrUxdjFwcQgJLGSVWv21l7GLkAEpISaycmw5RIyzx51oXG0TNU0aJ
        Z/PnsYDUsAnoSaxdGwFSIyJgKtHauAushlngGaPE8fnNrCAJYYEgia3vlzCD1AsJhEvsPxEE
        EmYRUJV4MHMbI4jNKZAn8fbkdhYQm1fAXKJ5/SqwuKiApcSWF/fZIeKCEidnPgGrYRbIlvi6
        +jnzBEaBWUhSs5CkZgFtYxbQlFi/Sx8irC2xbOFrZgjbVmLduvcsCxhZVzGKpJYW56bnFhvq
        FSfmFpfmpesl5+duYgRG0LZjPzfvYJz36qPeIUYmDsZDjCpAnY82rL7AKMWSl5+XqiTCa5oX
        kCDEm5JYWZValB9fVJqTWnyI0RTotYnMUqLJ+cDYziuJNzQzMDU0MbM0MLU0M1YS5906d028
        kEB6YklqdmpqQWoRTB8TB6dUA1M539uXRnlvFAtvyN68n7VIWyTCa4513o4Vx4w3OdqHft92
        4Me1I2Znl379d8KfaduJ152Mn4+LRpYtWH1ec0aC8eKVF/NzSh5Ezd31fd1cA2bXyFzn83Im
        56Y1WOxrupto+Sih4fuBLTM2bJ4+a7rMvNj4485pLfUrjhsfmnd9ypd2+X1sCZrXgyKOF8ys
        u7ldb8U6nlz3CV7JZzOK7n+7+vH9nUMTC09/SPn9l8Gy1CqZM0/o6IL/nz/V3dl+pk8sPbv4
        nPmsZsujx/aEbWd/eOzlrsCH1yY6senPD9Q2rEg0qfHYzCVeXdq/7GHutX28uuf7rI/cM/82
        Xaqn8tpCNuHsjycOi+6tT115qkNppRJLcUaioRZzUXEiAENHmag1AwAA
X-CMS-MailID: 20210316121218eucas1p1f74d6e6cec7fc897051902a7da478fd0
X-Msg-Generator: CA
X-RootMTR: 20210316121218eucas1p1f74d6e6cec7fc897051902a7da478fd0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210316121218eucas1p1f74d6e6cec7fc897051902a7da478fd0
References: <YE/ZLtdK0ZlVFOhp@piout.net>
        <20210305174411.9657-1-l.stelmach@samsung.com>
        <CGME20210316121218eucas1p1f74d6e6cec7fc897051902a7da478fd0@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2021-03-15 pon 23:01>, when Alexandre Belloni wrote:
> Hello,
>
> On 05/03/2021 18:44:11+0100, =C5=81ukasz Stelmach wrote:
>> For an RTC without an IRQ assigned rtc_update_irq_enable() should
>> return -EINVAL.  It will, when uie_unsupported is set.
>>=20
>
> I'm surprised this is an issue because the current code seems to cover
> all cases:
>
>  - no irq and not wakeup-source =3D> set_alarm should fail
>  - no irq and wakeup-source =3D> uie_unsupported is set
>  - irq =3D> UIE should work
>
> Can you elaborate on your failing use case?

I've got ds3231 which supports alarms[1] but is not connected to any
interrupt line. Hence, client->irq is 0 as well as want_irq[2]. There
is also no other indirect connection, so I don't set wakeup-source
property and ds1307_can_wakeup_device remains[3] false. Under these
conditions

    want_irq =3D 0
    ds1307_can_wakeup_device =3D false

uie_unsupported remains[4] false. And this is the problem.

hwclock(8) when setting system clock from rtc (--hctosys) calls
synchronize_to_clock_tick_rtc()[5]. There goes

    ioctl(rtc_fd, RTC_UIE_ON, 0);

which leads us to

    rtc_update_irq_enable(rtc, 1);

and finally here [6]

    if (rtc->uie_unsupported) {
        err =3D -EINVAL;
        goto out;
    }

and we keep going (uie_unsupported =3D 0). All the following operations
succeed because chip supports alarms.

We go back to hwclock(8) and we start waiting[7] for the update from
interrupt which never arrives instead of calling
busywiat_for_rtc_clock_tick()[8] (mind the invalid indentation) because
of EINVAL returned from ioctl() (conf. [6])

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/rtc/rtc-ds1307.c?h=3Dv5.11#n1032
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/rtc/rtc-ds1307.c?h=3Dv5.11#n1779
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/rtc/rtc-ds1307.c?h=3Dv5.11#n1802
[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/rtc/rtc-ds1307.c?h=3Dv5.11#n1977
[5] https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/tree/sys=
-utils/hwclock-rtc.c?h=3Dv2.36.2#n252
[6] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/rtc/interface.c?h=3Dv5.11#n564
[7] https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/tree/sys=
-utils/hwclock-rtc.c?h=3Dv2.36.2#n283
[8] https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/tree/sys=
-utils/hwclock-rtc.c?h=3Dv2.36.2#n297

>> Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
>> ---
>>  drivers/rtc/rtc-ds1307.c | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
>> index cd8e438bc9c4..b08a9736fa77 100644
>> --- a/drivers/rtc/rtc-ds1307.c
>> +++ b/drivers/rtc/rtc-ds1307.c
>> @@ -1973,13 +1973,6 @@ static int ds1307_probe(struct i2c_client *client,
>>  	if (IS_ERR(ds1307->rtc))
>>  		return PTR_ERR(ds1307->rtc);
>>=20=20
>> -	if (ds1307_can_wakeup_device && !want_irq) {
>> -		dev_info(ds1307->dev,
>> -			 "'wakeup-source' is set, request for an IRQ is disabled!\n");
>> -		/* We cannot support UIE mode if we do not have an IRQ line */
>> -		ds1307->rtc->uie_unsupported =3D 1;
>> -	}
>> -
>>  	if (want_irq) {
>>  		err =3D devm_request_threaded_irq(ds1307->dev, client->irq, NULL,
>>  						chip->irq_handler ?: ds1307_irq,
>> @@ -1993,6 +1986,13 @@ static int ds1307_probe(struct i2c_client *client,
>>  		} else {
>>  			dev_dbg(ds1307->dev, "got IRQ %d\n", client->irq);
>>  		}
>> +	} else {
>> +		if (ds1307_can_wakeup_device)
>> +			dev_info(ds1307->dev,
>> +				 "'wakeup-source' is set, request for an IRQ is disabled!\n");
>> +
>
> Honestly, just drop this message, it should have been removed by 82e2d43f=
6315
>
>

Done.

>> +		/* We cannot support UIE mode if we do not have an IRQ line */
>> +		ds1307->rtc->uie_unsupported =3D 1;
>>  	}
>>=20=20
>>  	ds1307->rtc->ops =3D chip->rtc_ops ?: &ds13xx_rtc_ops;
>> --=20
>> 2.26.2
>>=20

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmBQoJkACgkQsK4enJil
gBDK3wf/RAOEvk8xZy90QMhxfRYU8XSE8UvPBaXXPOsJLFIcjbvUX5Q9s1rUrXT7
LPbKuG3lJDNFthL/wqDj9RNx+bmDK5bf2LWZ0YgfUMuJJc/Ruc2wvr2l6DTXiKp9
TmeTyC1e5j/VuiEsyJxQ7jss+l4Lp4QevUoVbLB+r6LAsxfbzfx4q77Ivispf+GX
B45XoUEPzr7FE3UinHY0Zs+L0sOg9ePYd8uHYYFWMiCUTfKzc4TQNrH7WohbNOwB
/8ocqA094cx0zTWJKnFjzwpIrFWtB/MYKAyvbMmrVlKic3tiHddB7alQWL7mOqn9
fCm79ml5dWTFwXrkK9GP7zpJHcYxZw==
=mr4q
-----END PGP SIGNATURE-----
--=-=-=--
