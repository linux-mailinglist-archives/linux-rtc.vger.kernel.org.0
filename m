Return-Path: <linux-rtc+bounces-4248-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B40CAD43EC
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Jun 2025 22:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 646FC3A6485
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Jun 2025 20:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BB2267727;
	Tue, 10 Jun 2025 20:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIhznvoJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF78C24889B;
	Tue, 10 Jun 2025 20:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749587633; cv=none; b=Z20v+5yNlQsyXnGsc5uKuaHzvsouwcv9u6ywBjwT/gs21dOvdgzljOOJ+nb0ARbBSgzzPcSAmB1r3lu3dZCZCcW1Einl0vUp2UfCe7pyRNtVx2lRI7yvgia2dVOZOKBZ7Otz435kXtOrY2DmcZfs2X+UrE5BSL4hd0/g9Po+Hpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749587633; c=relaxed/simple;
	bh=f+RyRLfdKpfH/e+X1xbbG0ZpgxaWRB689Nvcb45eBKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QwGp8dOExohw/F82N7WIZX/wrsMguXG1s22BTVxB36vxdsbMHEDR4nQtErrtO5VWyfolDFGJLQBgvtitA/JHB3DaRCyD9DJn5tZB63F5kPRHIoyRieTAsh+JKOxVmj5RTflw20t/eg04FyKgFo2N0VR9ie/YLr/xrfK9Pv2YL+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIhznvoJ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad883afdf0cso1061034266b.0;
        Tue, 10 Jun 2025 13:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749587630; x=1750192430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iVWrqcb82z2neiPLRimHuElprkhpHYx82qam5ooEAWM=;
        b=PIhznvoJQ39Z7Nd+J4oz/HsJCcxjBYnxh9wwON32k32zIAtSIqWzd9Tw6OD1ndJIeR
         lUXUCARIkcOx1T5kMhZ72qlVq1H7Wi3A93u3uihmoxUK9xDS3cfJPbcjaKmi8xmKQqu4
         iH8whS/KW0JNX3kuLG4pLaLkj4jKMHcOWxN7myJJxZTAQzTWZFIrcDgR7cwA3cYZHsyE
         RLZucS/rL+ol4fzuVz05aPaFr+c2OFBGIwSYJiN4nxefa9ZMzvvvdjZA3ogWx9WIBFBA
         WZlsiXrIy2Bkkuxk7+bipZEIN2biipV2KeAcmmF18quFajyxvxDeEW1CWzN4svrgXkAp
         CGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749587630; x=1750192430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iVWrqcb82z2neiPLRimHuElprkhpHYx82qam5ooEAWM=;
        b=cDCN3kVydaDHSBKM7tW7kkLo72RnJ6mgzU8YqI8+qau0cCNjAGlvArG3TWP6txvFS/
         sArsMbYS2BrW6v9GK8Si8IvPNyhZEi3E9K2ac6SI3ggC8jCdvE2cbjPOcIAjOhhzupJ1
         mXBYEZDZilSpRR5OFk81FCXTtxnSuW0mDaToKqD6RCuh2Oj09/LnZU8t2atmZ5hma5aA
         ju8TInyAYmvzBM8um4EdkOWwiXg1tqDeOgpcVHGjJAFkNgSIMo3SwmggX11RYpb4zFJd
         Cq/Bru5JA/Caz+lKgGhjWg8WxVFiDY5689+Mv5ArJTNx3uKVUZznrOahdtsvoA1pHxD9
         kXig==
X-Forwarded-Encrypted: i=1; AJvYcCUvPQ1jdBznZvf/KxP9pFKcIVcjSEcy+Ot9Oa2BtuFeOiqc5tZ7SzhhSJBwrdNh/LJU4mTG7n9W@vger.kernel.org, AJvYcCXFIAAvJCaCqFogjR3nkF9sAHhOdPTD6910pKwKHgQdxrr7PcS4LdiLJ1A7I+vW+9vyR27J9f8RMZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLm5NmkEDjNyGMrOhVTz81ewAkiYlBRS9dhi/LuPWoGis0waio
	oDuR/jT3ht3JrujqEf/zSktNIoheqU7HA1IbdVNu1Bu/TZ6UDkdaZx/+QruMjJKUmi1nOXdWTLd
	9r2wWOVgutNqsmL7dhDkUcD980M8aj7U=
X-Gm-Gg: ASbGncunYUUrqu+DqORUkP4z0F9qIdiVy6dvWRvN+Cz96Q1XHfSfF7kEV6Q5EHcIzFs
	lwKwPvaoXbJioaKvSiwCa96OIkrfziTVtW4zeLM21ettdUMPwrVp1Eu1/DK5eSTx43Ep7zVHmwM
	ny7QE7oyj8g8JZjg44e9w+JCytsY36cuMUHam0ahWmhreXHd5tww==
X-Google-Smtp-Source: AGHT+IHJSfB+qOyzurEu7iPJ0tG0PRkwy2/z4q+WXaX9upCErijUZx/DTdPpWq+INkalTIH+t44cn6FL7674RGblzdc=
X-Received: by 2002:a17:907:7b86:b0:add:f4ac:171f with SMTP id
 a640c23a62f3a-ade8c584f1emr25780766b.5.1749587629785; Tue, 10 Jun 2025
 13:33:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1749539184.git.u.kleine-koenig@baylibre.com> <955e2c8f70e95f401530404a72d5bec1dc3dd2aa.1749539184.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <955e2c8f70e95f401530404a72d5bec1dc3dd2aa.1749539184.git.u.kleine-koenig@baylibre.com>
Reply-To: cassio.neri@gmail.com
From: Cassio Neri <cassio.neri@gmail.com>
Date: Tue, 10 Jun 2025 21:33:37 +0100
X-Gm-Features: AX0GCFtHsJQ1mExuZoA8ak1AEsXh2conA8PSTf6sgiyP6de-Lt4XuOVLkG-MbQ8
Message-ID: <CAOfgUPjKmRj1om+6exq_mzGvRFQ=4Q1Czmz4cG4NYURgz=omtQ@mail.gmail.com>
Subject: Re: [PATCH 5.10.y 2/3] rtc: Make rtc_time64_to_tm() support dates
 before 1970
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, stable@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Although untested, I'm pretty sure that with very small changes, the
previous revision (1d1bb12) can handle dates prior to 1970-01-01 with
no need to add extra branches or arithmetic operations. Indeed,
1d1bb12 contains:

<code>
/* time must be positive */
days =3D div_s64_rem(time, 86400, &secs);

/* day of the week, 1970-01-01 was a Thursday */
tm->tm_wday =3D (days + 4) % 7;

/* long comments */

udays =3D ((u32) days) + 719468;
</code>

This could have been changed to:

<code>
/* time must be >=3D  -719468 * 86400 which corresponds to 0000-03-01 */
udays =3D div_u64_rem(time + 719468 * 86400, 86400, &secs);

/* day of the week, 0000-03-01 was a Wednesday (in the proleptic
Gregorian calendar)  */
tm->tm_wday =3D (days + 3) % 7;

/* long comments */
</code>

Indeed, the addition of 719468 * 86400 to `time` makes `days` to be
719468 more than it should be. Therefore, in the calculation of
`udays`, the addition of 719468 becomes unnecessary and thus, `udays
=3D=3D days`. Moreover, this means that `days` can be removed altogether
and replaced by `udays`. (Not the other way around because in the
remaining code `udays` must be u32.)

Now, 719468 % 7 =3D 1 and thus tm->wday is 1 day after what it should be
and we correct that by adding 3 instead of 4.

Therefore, I suggest these changes on top of 1d1bb12 instead of those
made in 7df4cfe. Since you're working on this, can I please kindly
suggest two other changes?

1) Change the reference provided in the long comment. It should say,
"The following algorithm is, basically, Figure 12 of Neri and
Schneider [1]" and [1] should refer to the published article:

   Neri C, Schneider L. Euclidean affine functions and their
application to calendar algorithms. Softw Pract Exper.
2023;53(4):937-970. doi: 10.1002/spe.3172
   https://doi.org/10.1002/spe.3172

The article is much better written and clearer than the pre-print
currently referred to.

2) Function rtc_time64_to_tm_test_date_range in
drivers/rtc/lib_test.c, is a kunit test that checks the result for
everyday in a 160000 years range starting at 1970-01-01. It'd be nice
if this test is adapted to the new code and starts at 1900-01-01
(technically, it could start at 0000-03-01 but since tm->year counts
from 1900, it would be weird to see tm->year =3D=3D -1900 to mean that the
calendar year is 0.) Also 160000 is definitely an overkill (my bad!)
and a couple of thousands of years, say 3000, should be more than safe
for anyone. :-)

Many thanks,
Cassio.


On Tue, 10 Jun 2025 at 08:35, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> From: Alexandre Mergnat <amergnat@baylibre.com>
>
> commit 7df4cfef8b351fec3156160bedfc7d6d29de4cce upstream.
>
> Conversion of dates before 1970 is still relevant today because these
> dates are reused on some hardwares to store dates bigger than the
> maximal date that is representable in the device's native format.
> This prominently and very soon affects the hardware covered by the
> rtc-mt6397 driver that can only natively store dates in the interval
> 1900-01-01 up to 2027-12-31. So to store the date 2028-01-01 00:00:00
> to such a device, rtc_time64_to_tm() must do the right thing for
> time=3D-2208988800.
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> Reviewed-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> Link: https://lore.kernel.org/r/20250428-enable-rtc-v4-1-2b2f7e3f9349@bay=
libre.com
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
>  drivers/rtc/lib.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/rtc/lib.c b/drivers/rtc/lib.c
> index fe361652727a..13b5b1f20465 100644
> --- a/drivers/rtc/lib.c
> +++ b/drivers/rtc/lib.c
> @@ -46,24 +46,38 @@ EXPORT_SYMBOL(rtc_year_days);
>   * rtc_time64_to_tm - converts time64_t to rtc_time.
>   *
>   * @time:      The number of seconds since 01-01-1970 00:00:00.
> - *             (Must be positive.)
> + *             Works for values since at least 1900
>   * @tm:                Pointer to the struct rtc_time.
>   */
>  void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
>  {
> -       unsigned int secs;
> -       int days;
> +       int days, secs;
>
>         u64 u64tmp;
>         u32 u32tmp, udays, century, day_of_century, year_of_century, year=
,
>                 day_of_year, month, day;
>         bool is_Jan_or_Feb, is_leap_year;
>
> -       /* time must be positive */
> +       /*
> +        * Get days and seconds while preserving the sign to
> +        * handle negative time values (dates before 1970-01-01)
> +        */
>         days =3D div_s64_rem(time, 86400, &secs);
>
> +       /*
> +        * We need 0 <=3D secs < 86400 which isn't given for negative
> +        * values of time. Fixup accordingly.
> +        */
> +       if (secs < 0) {
> +               days -=3D 1;
> +               secs +=3D 86400;
> +       }
> +
>         /* day of the week, 1970-01-01 was a Thursday */
>         tm->tm_wday =3D (days + 4) % 7;
> +       /* Ensure tm_wday is always positive */
> +       if (tm->tm_wday < 0)
> +               tm->tm_wday +=3D 7;
>
>         /*
>          * The following algorithm is, basically, Proposition 6.3 of Neri
> @@ -93,7 +107,7 @@ void rtc_time64_to_tm(time64_t time, struct rtc_time *=
tm)
>          * thus, is slightly different from [1].
>          */
>
> -       udays           =3D ((u32) days) + 719468;
> +       udays           =3D days + 719468;
>
>         u32tmp          =3D 4 * udays + 3;
>         century         =3D u32tmp / 146097;
> --
> 2.49.0
>

