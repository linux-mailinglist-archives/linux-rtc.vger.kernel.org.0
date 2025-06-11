Return-Path: <linux-rtc+bounces-4286-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF675AD5E33
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 20:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8194A17A215
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 18:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F225523C8A4;
	Wed, 11 Jun 2025 18:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZ2sHWTi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26BC2A1BF;
	Wed, 11 Jun 2025 18:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749666738; cv=none; b=m2t969mmMLR7kpUkx95ipSR2JbFWuzag7uM2PS8V/fP0/2tFMNMOcLlQQVGSSoDl0VgNTao4gY+z22PdkFdQTPDXsPkSdv+JC7Cj5YqSJ2MmxKixgsTbJ1D+DrNxSUZHlJNQvnEtlplgDqCnCDWDDgnPBYdjojVoIgJpPBF7T7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749666738; c=relaxed/simple;
	bh=1uswyV+euVkL0AB+M7lXpjVibViATfLNROU7KRjGg5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NL29nYKiOdViIg0u7rsJBhaFZwDlfaWPiKcVeepzNZ3lMea7hRIYT8X7cAoCtELx1Um7GWY4hKd+In/SAcyeb955jKcfCHhtkQdRWm1VuuUlVEl2LLnAZMxnxcSLxWhR9/WpYMVEIjgWCrwpQlhCHaIGMNmpny2rNtr/S2lelQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZ2sHWTi; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad89c32a7b5so23251666b.2;
        Wed, 11 Jun 2025 11:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749666734; x=1750271534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HSjIXkNGEgRZZ4qsmd9FzkBC8kgD7Px41RUUCeGIEKo=;
        b=IZ2sHWTiy5KXAWXeJ4KyEEWlT1Ax27fgdl1h6UhsBXBgPIVHRa8vcp3/KKYOnXyUKt
         AInCd7dZrmyu42TU1FKLnHa+Vn5vaPGW+wKmsFWsDn5BOIuFVy03BS/k2k8rQugTyMrN
         mPrEGxwRVwT0bWS1VlBVVlqV5s7RdEukTdIZKLaAdg20venpLcoaKBDKX8XUbBDO4tTZ
         wRywdhJJPxynRdEL0y3GYklg1sDNLC0eIB2DdpJ/a4yXm1lu+GE/Dt/R/jdegDV1rqSp
         y+H5R86oR0o0hUxOCSVNGSVNRhCNFAwD95REqjTT8/jZ8GQYM+WWtzo/7rxsfVPB0l73
         DR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749666734; x=1750271534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HSjIXkNGEgRZZ4qsmd9FzkBC8kgD7Px41RUUCeGIEKo=;
        b=sxTnOTH3Ih22Yxn2ddE1XDkXK3eWwxfUf8b7wylhu2mjbMmS/XOqyg8g82UK5ZkpOR
         KCrW6a5Mh/ZIUV3CBK/6MfoXgaxWY6XXbfzWDrfNDBaEZLsqMHJLteMTkBvxXN6rjEDd
         DZk4PG0njjnINm53A51qTjSBfRl/qd0LmcmzzBBM3qeJ9hRg6ybIQ5XptBR/vg/8ITDp
         JOn7fOtqKlWThzkk1uRXjhdyEkHRl3nbXKIFQ9hoqalt4t/0jrAkeorgAvDcSmLfjSny
         XlLTMfOPHUDnMv2qG4WJb0iymUc2l6SSbhwZ4SowQC/pqcntsstsUBm8qfzSn5H153WH
         g9xA==
X-Forwarded-Encrypted: i=1; AJvYcCVGfJs1KuysxiaYU+ZY5QkH0aDClUmehY2n1bVKerCHcHyxmmDBZLde9zSHCPgcNIUR35DgOEQuleg=@vger.kernel.org, AJvYcCWwwx9zy4MspAEMwTBWskW08MPCZP8dF4DPgrI0stuvRM2sLLKvESsxuBSTvmQsf0WlrOQJ87/+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbl3BuA4+XXgAQg3LgkXF/hRUXQ6w/bokNQYw6hwQfxJWaJV7T
	g47nLkuzAZiuJkqMiajcW6hOdXeSCaoHzUTwJEj731tBiId8cdbUET2/j1oYCDCRDTuufdqm8dW
	oHM1Zvz1kngqUyt2Ds6+yUj+Yli1v4/tPIsJQbwk=
X-Gm-Gg: ASbGnctUp29O/J4YXvkECs7uBSMNwNRZzGs/luSe8G5oizvyKweI8HPCqIqp28bh+jY
	NJZYoEuti/D2BG0CJQryl/ugjQ4aNJoD7hrdLx3sSZx7f9DQ9KRLQ4kdtVZmR8XEZVjEw24TPgA
	+Y8G+DQQcADyl179ZNpz4U3cnMQi/klCGDG2+Ldss=
X-Google-Smtp-Source: AGHT+IEEJOoMZoaDP8TrMDo++u9j60YJaGpEQxpKWClxxCQIlsr77/YHfFQMVQjjwx+N4I0jcoGkbQimA/9Aqaq842Q=
X-Received: by 2002:a17:907:9303:b0:add:deb0:8b64 with SMTP id
 a640c23a62f3a-ade8955ec01mr409852966b.24.1749666733913; Wed, 11 Jun 2025
 11:32:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1749539184.git.u.kleine-koenig@baylibre.com>
 <955e2c8f70e95f401530404a72d5bec1dc3dd2aa.1749539184.git.u.kleine-koenig@baylibre.com>
 <CAOfgUPg0Z6e5+awuqVMa7QUPiJ7aPp-dX6QNk80Y-bhpBYcsoQ@mail.gmail.com> <20250611073350f9e928ec@mail.local>
In-Reply-To: <20250611073350f9e928ec@mail.local>
Reply-To: cassio.neri@gmail.com
From: Cassio Neri <cassio.neri@gmail.com>
Date: Wed, 11 Jun 2025 19:32:02 +0100
X-Gm-Features: AX0GCFtLANWqHaTUE9zhq3IvzxDDSTJBn4-WqlKRkQbhu1D2Je-7kswNme8eyRU
Message-ID: <CAOfgUPgw-4ZNXm7P3hP-KQfmNf2xyKyUUJLsOgW2HNF9JWjtjg@mail.gmail.com>
Subject: Re: [PATCH 5.10.y 2/3] rtc: Make rtc_time64_to_tm() support dates
 before 1970
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Mergnat <amergnat@baylibre.com>, stable@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe and Alexandre,

Thank both of you for your replies.

Sure, I understand that you couldn't miss the merge window and that
improvements can be made later. I wish I could contribute with a patch
but I don't have much bandwidth now. I've obviously done this in the
past but I have already forgotten all the processes and figuring that
out again would be a steep learning curve for me. In any case, please
do not hesitate to get in touch if you think I can help.

I'll be happy if you read my paper but here is another source which
gives a very good overview and, I dare to say, is more entertaining
:-)

https://www.youtube.com/watch?v=3DJ9KijLyP-yg

(The talk is about the algorithms and has close to nothing to do with C++.)

Thank you again and best wishes,
Cassio.


On Wed, 11 Jun 2025 at 08:33, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello Cassio,
>
> On 10/06/2025 21:31:48+0100, Cassio Neri wrote:
> > Hi all,
> >
> > Although untested, I'm pretty sure that with very small changes, the
> > previous revision (1d1bb12) can handle dates prior to 1970-01-01 with n=
o
> > need to add extra branches or arithmetic operations. Indeed, 1d1bb12
> > contains:
> >
> > <code>
> > /* time must be positive */
> > days =3D div_s64_rem(time, 86400, &secs);
> >
> > /* day of the week, 1970-01-01 was a Thursday */
> > tm->tm_wday =3D (days + 4) % 7;
> >
> > /* long comments */
> >
> > udays =3D ((u32) days) + 719468;
> > </code>
> >
> > This could have been changed to:
> >
> > <code>
> > /* time must be >=3D  -719468 * 86400 which corresponds to 0000-03-01 *=
/
> > udays =3D div_u64_rem(time + 719468 * 86400, 86400, &secs);
> >
> > /* day of the week, 0000-03-01 was a Wednesday (in the proleptic Gregor=
ian
> > calendar)  */
> > tm->tm_wday =3D (days + 3) % 7;
> >
> > /* long comments */
> > </code>
> >
> > Indeed, the addition of 719468 * 86400 to `time` makes `days` to be 719=
468
> > more than it should be. Therefore, in the calculation of `udays`, the
> > addition of 719468 becomes unnecessary and thus, `udays =3D=3D days`. M=
oreover,
> > this means that `days` can be removed altogether and replaced by `udays=
`.
> > (Not the other way around because in the remaining code `udays` must be
> > u32.)
> >
> > Now, 719468 % 7 =3D 1 and thus tm->wday is 1 day after what it should b=
e and
> > we correct that by adding 3 instead of 4.
> >
> > Therefore, I suggest these changes on top of 1d1bb12 instead of those m=
ade
> > in 7df4cfe. Since you're working on this, can I please kindly suggest t=
wo
> > other changes?
> >
> > 1) Change the reference provided in the long comment. It should say, "T=
he
> > following algorithm is, basically, Figure 12 of Neri and Schneider [1]"=
 and
> > [1] should refer to the published article:
> >
> >    Neri C, Schneider L. Euclidean affine functions and their applicatio=
n to
> > calendar algorithms. Softw Pract Exper. 2023;53(4):937-970. doi:
> > 10.1002/spe.3172
> >    https://doi.org/10.1002/spe.3172
> >
> > The article is much better written and clearer than the pre-print curre=
ntly
> > referred to.
> >
>
> Thanks for your input, I wanted to look again at your paper and make thos=
e
> optimizations which is why I took so long to review the original patch.
> Unfortunately, I didn't have the time before the merge window.
>
> I would also gladly take patches for this if you are up for the task.
>
> > 2) Function rtc_time64_to_tm_test_date_range in drivers/rtc/lib_test.c,=
 is
> > a kunit test that checks the result for everyday in a 160000 years rang=
e
> > starting at 1970-01-01. It'd be nice if this test is adapted to the new
> > code and starts at 1900-01-01 (technically, it could start at 0000-03-0=
1
> > but since tm->year counts from 1900, it would be weird to see tm->year =
=3D=3D
> > -1900 to mean that the calendar year is 0.) Also 160000 is definitely a=
n
> > overkill (my bad!) and a couple of thousands of years, say 3000, should=
 be
> > more than safe for anyone. :-)
>
> This is also something on my radar as some have been complaining about th=
e time
> it takes to run those tests.
>
> >
> > Many thanks,
> > Cassio.
> >
> >
> >
> > On Tue, 10 Jun 2025 at 08:35, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@ba=
ylibre.com>
> > wrote:
> >
> > > From: Alexandre Mergnat <amergnat@baylibre.com>
> > >
> > > commit 7df4cfef8b351fec3156160bedfc7d6d29de4cce upstream.
> > >
> > > Conversion of dates before 1970 is still relevant today because these
> > > dates are reused on some hardwares to store dates bigger than the
> > > maximal date that is representable in the device's native format.
> > > This prominently and very soon affects the hardware covered by the
> > > rtc-mt6397 driver that can only natively store dates in the interval
> > > 1900-01-01 up to 2027-12-31. So to store the date 2028-01-01 00:00:00
> > > to such a device, rtc_time64_to_tm() must do the right thing for
> > > time=3D-2208988800.
> > >
> > > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > > Reviewed-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> > > Link:
> > > https://lore.kernel.org/r/20250428-enable-rtc-v4-1-2b2f7e3f9349@bayli=
bre.com
> > > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> > > ---
> > >  drivers/rtc/lib.c | 24 +++++++++++++++++++-----
> > >  1 file changed, 19 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/rtc/lib.c b/drivers/rtc/lib.c
> > > index fe361652727a..13b5b1f20465 100644
> > > --- a/drivers/rtc/lib.c
> > > +++ b/drivers/rtc/lib.c
> > > @@ -46,24 +46,38 @@ EXPORT_SYMBOL(rtc_year_days);
> > >   * rtc_time64_to_tm - converts time64_t to rtc_time.
> > >   *
> > >   * @time:      The number of seconds since 01-01-1970 00:00:00.
> > > - *             (Must be positive.)
> > > + *             Works for values since at least 1900
> > >   * @tm:                Pointer to the struct rtc_time.
> > >   */
> > >  void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
> > >  {
> > > -       unsigned int secs;
> > > -       int days;
> > > +       int days, secs;
> > >
> > >         u64 u64tmp;
> > >         u32 u32tmp, udays, century, day_of_century, year_of_century, =
year,
> > >                 day_of_year, month, day;
> > >         bool is_Jan_or_Feb, is_leap_year;
> > >
> > > -       /* time must be positive */
> > > +       /*
> > > +        * Get days and seconds while preserving the sign to
> > > +        * handle negative time values (dates before 1970-01-01)
> > > +        */
> > >         days =3D div_s64_rem(time, 86400, &secs);
> > >
> > > +       /*
> > > +        * We need 0 <=3D secs < 86400 which isn't given for negative
> > > +        * values of time. Fixup accordingly.
> > > +        */
> > > +       if (secs < 0) {
> > > +               days -=3D 1;
> > > +               secs +=3D 86400;
> > > +       }
> > > +
> > >         /* day of the week, 1970-01-01 was a Thursday */
> > >         tm->tm_wday =3D (days + 4) % 7;
> > > +       /* Ensure tm_wday is always positive */
> > > +       if (tm->tm_wday < 0)
> > > +               tm->tm_wday +=3D 7;
> > >
> > >         /*
> > >          * The following algorithm is, basically, Proposition 6.3 of =
Neri
> > > @@ -93,7 +107,7 @@ void rtc_time64_to_tm(time64_t time, struct rtc_ti=
me
> > > *tm)
> > >          * thus, is slightly different from [1].
> > >          */
> > >
> > > -       udays           =3D ((u32) days) + 719468;
> > > +       udays           =3D days + 719468;
> > >
> > >         u32tmp          =3D 4 * udays + 3;
> > >         century         =3D u32tmp / 146097;
> > > --
> > > 2.49.0
> > >
> > >

