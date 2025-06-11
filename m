Return-Path: <linux-rtc+bounces-4270-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C29DAD4CC9
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 09:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 790A43A2C58
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 07:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D192622F749;
	Wed, 11 Jun 2025 07:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YRH2rkqM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73A81B042C;
	Wed, 11 Jun 2025 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749627241; cv=none; b=UovBHnyvTrNHxcPAQ59hJObmnIphOMylBQ0sy/jlSm3Zd9EZg0t2IeFfnaYxmvt2eK4wXllO+1Vyn18xYQjG5tDxf33FqnRiAl3TXz1y3NTn7oYPPydaSGiYab88YVE7BZ9UuICs7muEHt4QhWA+1IlXqaY2lt/lHyYdceFeeVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749627241; c=relaxed/simple;
	bh=fsr0J3GbmP7hL06I6PKMguXN5HK25KKsiISCDTWRwPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sdw5px64BeWgHeTJ2WvdH/eEJ53Nrg1yzfb+2Dn+kq50ap6FoYbe+BZNGtKLr4EdOJTbjpB7k4iPPQ6fxQCAZoZUknq83ldok7cjkTXPVQcqis41tG1M8pBogjY1eecKGLoCxnqk4I8eyCVlzdSHGXns+EdG7bQweYL9vkkB+78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YRH2rkqM; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02D004396B;
	Wed, 11 Jun 2025 07:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749627231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4CWdOoq1qidV9/1An9FZ04o3Pv9jPdXHf4LO9wWtVBg=;
	b=YRH2rkqMRTm3J8lXH/ZQshT1fUXaBJAN2LjTbbcR58eOgd0Yqm1EzvySJShlqBAJIM/fmR
	yIOG+Xp2oWU3zxkYTW2/Y8G8VOiVSn7WMo5kkW5MebfrmVH6NmUpJ7FnkuKmuYqqAYRYao
	F+CNNxpuEkjYcVAYXuRSzVtsbWoy/q3QvxAW3YGOJdNTQejIw5RWbnN7UjlThaF88v6Guy
	rTv7TPxliIZo+3aJRCxrJBu6K8HKHqagBdk6T4TumXdJsNHGiF9eW7sTp2vWRl7OBvAQAP
	nIFLVBW6cMQiPkXFYHVAyKmvPyGp2PTIqmFjNLjbZeZbU5bi1E35t1e3o2Lmhg==
Date: Wed, 11 Jun 2025 09:33:50 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Cassio Neri <cassio.neri@gmail.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Mergnat <amergnat@baylibre.com>, stable@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 5.10.y 2/3] rtc: Make rtc_time64_to_tm() support dates
 before 1970
Message-ID: <20250611073350f9e928ec@mail.local>
References: <cover.1749539184.git.u.kleine-koenig@baylibre.com>
 <955e2c8f70e95f401530404a72d5bec1dc3dd2aa.1749539184.git.u.kleine-koenig@baylibre.com>
 <CAOfgUPg0Z6e5+awuqVMa7QUPiJ7aPp-dX6QNk80Y-bhpBYcsoQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOfgUPg0Z6e5+awuqVMa7QUPiJ7aPp-dX6QNk80Y-bhpBYcsoQ@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduudekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeggfdtlefhudduheevtefftdevgfeiueejvedtjefhueejvddvleetledukeelnecuffhomhgrihhnpeguohhirdhorhhgpdhkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedvugdutdemkeejugehmedvsgguieemvdehjeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedvugdutdemkeejugehmedvsgguieemvdehjeejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheptggrshhsihhordhnvghrihesghhmrghilhdrtghomhdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrt
 ghomhdprhgtphhtthhopegrrdiiuhhmmhhosehtohifvghrthgvtghhrdhithdprhgtphhtthhopegrmhgvrhhgnhgrthessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello Cassio,

On 10/06/2025 21:31:48+0100, Cassio Neri wrote:
> Hi all,
> 
> Although untested, I'm pretty sure that with very small changes, the
> previous revision (1d1bb12) can handle dates prior to 1970-01-01 with no
> need to add extra branches or arithmetic operations. Indeed, 1d1bb12
> contains:
> 
> <code>
> /* time must be positive */
> days = div_s64_rem(time, 86400, &secs);
> 
> /* day of the week, 1970-01-01 was a Thursday */
> tm->tm_wday = (days + 4) % 7;
> 
> /* long comments */
> 
> udays = ((u32) days) + 719468;
> </code>
> 
> This could have been changed to:
> 
> <code>
> /* time must be >=  -719468 * 86400 which corresponds to 0000-03-01 */
> udays = div_u64_rem(time + 719468 * 86400, 86400, &secs);
> 
> /* day of the week, 0000-03-01 was a Wednesday (in the proleptic Gregorian
> calendar)  */
> tm->tm_wday = (days + 3) % 7;
> 
> /* long comments */
> </code>
> 
> Indeed, the addition of 719468 * 86400 to `time` makes `days` to be 719468
> more than it should be. Therefore, in the calculation of `udays`, the
> addition of 719468 becomes unnecessary and thus, `udays == days`. Moreover,
> this means that `days` can be removed altogether and replaced by `udays`.
> (Not the other way around because in the remaining code `udays` must be
> u32.)
> 
> Now, 719468 % 7 = 1 and thus tm->wday is 1 day after what it should be and
> we correct that by adding 3 instead of 4.
> 
> Therefore, I suggest these changes on top of 1d1bb12 instead of those made
> in 7df4cfe. Since you're working on this, can I please kindly suggest two
> other changes?
> 
> 1) Change the reference provided in the long comment. It should say, "The
> following algorithm is, basically, Figure 12 of Neri and Schneider [1]" and
> [1] should refer to the published article:
> 
>    Neri C, Schneider L. Euclidean affine functions and their application to
> calendar algorithms. Softw Pract Exper. 2023;53(4):937-970. doi:
> 10.1002/spe.3172
>    https://doi.org/10.1002/spe.3172
> 
> The article is much better written and clearer than the pre-print currently
> referred to.
> 

Thanks for your input, I wanted to look again at your paper and make those
optimizations which is why I took so long to review the original patch.
Unfortunately, I didn't have the time before the merge window.

I would also gladly take patches for this if you are up for the task.

> 2) Function rtc_time64_to_tm_test_date_range in drivers/rtc/lib_test.c, is
> a kunit test that checks the result for everyday in a 160000 years range
> starting at 1970-01-01. It'd be nice if this test is adapted to the new
> code and starts at 1900-01-01 (technically, it could start at 0000-03-01
> but since tm->year counts from 1900, it would be weird to see tm->year ==
> -1900 to mean that the calendar year is 0.) Also 160000 is definitely an
> overkill (my bad!) and a couple of thousands of years, say 3000, should be
> more than safe for anyone. :-)

This is also something on my radar as some have been complaining about the time
it takes to run those tests.

> 
> Many thanks,
> Cassio.
> 
> 
> 
> On Tue, 10 Jun 2025 at 08:35, Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> wrote:
> 
> > From: Alexandre Mergnat <amergnat@baylibre.com>
> >
> > commit 7df4cfef8b351fec3156160bedfc7d6d29de4cce upstream.
> >
> > Conversion of dates before 1970 is still relevant today because these
> > dates are reused on some hardwares to store dates bigger than the
> > maximal date that is representable in the device's native format.
> > This prominently and very soon affects the hardware covered by the
> > rtc-mt6397 driver that can only natively store dates in the interval
> > 1900-01-01 up to 2027-12-31. So to store the date 2028-01-01 00:00:00
> > to such a device, rtc_time64_to_tm() must do the right thing for
> > time=-2208988800.
> >
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > Reviewed-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> > Link:
> > https://lore.kernel.org/r/20250428-enable-rtc-v4-1-2b2f7e3f9349@baylibre.com
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> > ---
> >  drivers/rtc/lib.c | 24 +++++++++++++++++++-----
> >  1 file changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/rtc/lib.c b/drivers/rtc/lib.c
> > index fe361652727a..13b5b1f20465 100644
> > --- a/drivers/rtc/lib.c
> > +++ b/drivers/rtc/lib.c
> > @@ -46,24 +46,38 @@ EXPORT_SYMBOL(rtc_year_days);
> >   * rtc_time64_to_tm - converts time64_t to rtc_time.
> >   *
> >   * @time:      The number of seconds since 01-01-1970 00:00:00.
> > - *             (Must be positive.)
> > + *             Works for values since at least 1900
> >   * @tm:                Pointer to the struct rtc_time.
> >   */
> >  void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
> >  {
> > -       unsigned int secs;
> > -       int days;
> > +       int days, secs;
> >
> >         u64 u64tmp;
> >         u32 u32tmp, udays, century, day_of_century, year_of_century, year,
> >                 day_of_year, month, day;
> >         bool is_Jan_or_Feb, is_leap_year;
> >
> > -       /* time must be positive */
> > +       /*
> > +        * Get days and seconds while preserving the sign to
> > +        * handle negative time values (dates before 1970-01-01)
> > +        */
> >         days = div_s64_rem(time, 86400, &secs);
> >
> > +       /*
> > +        * We need 0 <= secs < 86400 which isn't given for negative
> > +        * values of time. Fixup accordingly.
> > +        */
> > +       if (secs < 0) {
> > +               days -= 1;
> > +               secs += 86400;
> > +       }
> > +
> >         /* day of the week, 1970-01-01 was a Thursday */
> >         tm->tm_wday = (days + 4) % 7;
> > +       /* Ensure tm_wday is always positive */
> > +       if (tm->tm_wday < 0)
> > +               tm->tm_wday += 7;
> >
> >         /*
> >          * The following algorithm is, basically, Proposition 6.3 of Neri
> > @@ -93,7 +107,7 @@ void rtc_time64_to_tm(time64_t time, struct rtc_time
> > *tm)
> >          * thus, is slightly different from [1].
> >          */
> >
> > -       udays           = ((u32) days) + 719468;
> > +       udays           = days + 719468;
> >
> >         u32tmp          = 4 * udays + 3;
> >         century         = u32tmp / 146097;
> > --
> > 2.49.0
> >
> >

