Return-Path: <linux-rtc+bounces-4308-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18348ADEFF9
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Jun 2025 16:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B09C91893FC9
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Jun 2025 14:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06302EBB96;
	Wed, 18 Jun 2025 14:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="offtK985"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72BE2857C4;
	Wed, 18 Jun 2025 14:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257783; cv=none; b=nUrNGzHDAmZ2TLF1mn1XsHfbHNQPHUjo8DHA/q93/7la0A4Yrya6E1VS4N1O7eB9AYwaDmIuAoicqY64tSBapyRimbiYhKKN+6UUSkE511vFd1JfFwCExfu5U+4A19G0h4CpnxJqq4szfUbnGnTFXsKEdRcgLzQyW2gydmiIV68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257783; c=relaxed/simple;
	bh=PrZaNm6qDKMMPOosHmNnwgemktPduDUpv1k8byWJZYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qh2+thFxhdbMhQfXDRyYBdkt4/0XzrPT0KhkXclfq83GgWuAwfy7a7QqDykcDAD/VL931QdJJaa7KrxUsoM8zvsOYCOrhhBZzybWc9s8I2XJ47jav7s3mHEP7qyQDgHkbk+OjlLzz7Fex3gc5zz4Py6iR6Q0VVGN7YtmrwEc/mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=offtK985; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EAEB541C7D;
	Wed, 18 Jun 2025 14:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750257773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JzWFlr2A7u8I/cmOU56J1GxJWMKdjSuVd6OZq31pqlI=;
	b=offtK985QWC9Y9SMQyoGUK+ubgYHYwtp3Ry75PZSTdduYP/uPYN17wMcT6zdoxRPIadwMc
	UA2CBZy3lQnjmmdj/B7KtgolgLPGINTxEQN2R5KmeuqUKLhfdkvpJeSWUpme3kw9G/+1vO
	eIsmF5EJmv03f8CVuPAqQ1edARUdjvY3B8sghPI69X+C1mywTXq/+jNwnNIlf+CT9haFIr
	iPunvSnJ1ij29Rst3NJkEGdSXArzyYgnjcV3KkYfZz1fXNyPaPPUFKOvWd9hdBuczCgpoh
	ENIJCTX6+LY3iDEcOGZLxJYpIpZxqTKxK0co4wPBgegu1Fvd9zz/camjiD5NjA==
Date: Wed, 18 Jun 2025 16:42:52 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf8563: fix wrong alarm register
Message-ID: <202506181442521b980f06@mail.local>
References: <20250419-pcf8563-fix-alarm-v1-1-b893a5de55b8@gmail.com>
 <20250524213645d5543d64@mail.local>
 <3fca9368-9f2e-4f4f-a02a-2ccb9f23deb4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fca9368-9f2e-4f4f-a02a-2ccb9f23deb4@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedviefghedvvefhheevjefghedujeekfeeuvdfhgeduffduveehgfdvgeejheejvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemvgdtfhgvmeegfhdvfhemvdelvgegmeehudejtgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemvgdtfhgvmeegfhdvfhemvdelvgegmeehudejtgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehtrhhohihmihhttghhvghllhelkeeksehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello Troy,

On 25/05/2025 10:36:55+0800, Troy Mitchell wrote:
> On 2025/5/25 05:36, Alexandre Belloni wrote:
> > On 19/04/2025 22:37:10+0800, Troy Mitchell wrote:
> >> Fix wrong register and align `pcf8563_get_alarm_mode`
> >> with the naming convention used in ops.
> >>
> >> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
> >> ---
> >> Since this patch[1], the set_alarm function has been setting
> >> an wrong register.
> >>
> >> Link:
> >> https://lore.kernel.org/all/20241010084949.3351182-3-iwamatsu@nigauri.org/ [1]
> >> ---
> >>  drivers/rtc/rtc-pcf8563.c | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
> >> index 5a084d426e58d09cfedf0809695a96a27627c420..61e2f9757de9f24407f9262657da0d1586ce124e 100644
> >> --- a/drivers/rtc/rtc-pcf8563.c
> >> +++ b/drivers/rtc/rtc-pcf8563.c
> >> @@ -103,7 +103,7 @@ static int pcf8563_set_alarm_mode(struct pcf8563 *pcf8563, bool on)
> >>  	return regmap_write(pcf8563->regmap, PCF8563_REG_ST2, buf);
> >>  }
> >>  
> >> -static int pcf8563_get_alarm_mode(struct pcf8563 *pcf8563, unsigned char *en,
> >> +static int pcf8563_read_alarm_mode(struct pcf8563 *pcf8563, unsigned char *en,
> > 
> > I was going to apply the patch but this is an unrelated change, please submit
> > just the fix so it can be backported.
> Hi, Could you please clarify if this renaming change would be acceptable？
> If it is acceptable, I will split the original patch into two.
> If not, I will remove the renaming change.

Thanks for v2, I don't think the renaming is actually worth it, unless there is
more rework on the driver.

> 
> 			- Troy
> > 
> >>  				  unsigned char *pen)
> >>  {
> >>  	u32 buf;
> >> @@ -127,7 +127,7 @@ static irqreturn_t pcf8563_irq(int irq, void *dev_id)
> >>  	char pending;
> >>  	int err;
> >>  
> >> -	err = pcf8563_get_alarm_mode(pcf8563, NULL, &pending);
> >> +	err = pcf8563_read_alarm_mode(pcf8563, NULL, &pending);
> >>  	if (err)
> >>  		return IRQ_NONE;
> >>  
> >> @@ -262,7 +262,7 @@ static int pcf8563_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
> >>  	tm->time.tm_mday = bcd2bin(buf[2] & 0x3F);
> >>  	tm->time.tm_wday = bcd2bin(buf[3] & 0x7);
> >>  
> >> -	err = pcf8563_get_alarm_mode(pcf8563, &tm->enabled, &tm->pending);
> >> +	err = pcf8563_read_alarm_mode(pcf8563, &tm->enabled, &tm->pending);
> >>  	if (err < 0)
> >>  		return err;
> >>  
> >> @@ -285,7 +285,7 @@ static int pcf8563_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
> >>  	buf[2] = bin2bcd(tm->time.tm_mday);
> >>  	buf[3] = tm->time.tm_wday & 0x07;
> >>  
> >> -	err = regmap_bulk_write(pcf8563->regmap, PCF8563_REG_SC, buf,
> >> +	err = regmap_bulk_write(pcf8563->regmap, PCF8563_REG_AMN, buf,
> >>  				sizeof(buf));
> >>  	if (err)
> >>  		return err;
> >>
> >> ---
> >> base-commit: 8560697b23dc2f405cb463af2b17256a9888129d
> >> change-id: 20250419-pcf8563-fix-alarm-5e787f095861
> >>
> >> Best regards,
> >> -- 
> >> Troy Mitchell <troymitchell988@gmail.com>
> >>
> > 
> 
> -- 
> Troy Mitchell
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

