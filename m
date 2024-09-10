Return-Path: <linux-rtc+bounces-1923-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF632974398
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 21:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABFD628CC7D
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 19:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AFD1A0AE6;
	Tue, 10 Sep 2024 19:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kfBau5Vj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2339A17C7B1;
	Tue, 10 Sep 2024 19:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725997190; cv=none; b=YBLUaRYtOOyhr4UEiMgre9wHe9PE6CvzXKRxyJVUIcZ1V9PXQiA/lLQpOXSEAOMhAJMOGif0B+MUUn50Gz9klUodqykxnjVpUnhLs88BnFP7xHPmh8roxbThoYMFitFH2i6TJxZj0fIauzEd0uPD61yY6k4VmaNxqYz6GJAStkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725997190; c=relaxed/simple;
	bh=5TqNBcmp+Soe4nTjyFxypqVNkbC4Zkx9BXwIEPnnbBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzzvmSu6APY0pqKc+SB/QymaPx1j+qq2ydgnvO7X8ajBpKX2ZMYpgL6FeJ2DR7unTBA1kb6dyGYOiL2ZwYjKRLNYNVqXxK4c64LsbUqgTvny4yQCem807FpH6NswmLVFpv3PUKyvI14xzR0Snq24I2d2QbGWD4aY27ccmpoZIJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kfBau5Vj; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2AB2BC0003;
	Tue, 10 Sep 2024 19:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725997185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tv0Y5s/hQ6Mnt04wo1p2p60cvaKhF/HLy/Jdnv+k8Pw=;
	b=kfBau5VjheFEZz8PN7AvfsWyHM9kWuPY2wBj5G8BWN6RSPvzF50maixIP+CAMXFyK+cJUq
	gvqjzjDiFrD80osvY122PP5RUTwfLY9IgS6y30d30UV89Xr9aDn/x2a1yw4XayNzceb2X3
	Ot02V8ESnj82egBj5CCCrApX9z6dg1Zj7DXjClmpi78G0t2C2YhsvkEDjwG3iQMGC5gQ0S
	7DcQmMQs0eFfdGx/7pn/VYzUl9MOiyKhW5Aau5ozpRhv58PW4jHy/9qj8ndwShU/1hVlhV
	qcOAKj7jajdA2+DaPoF7OFgXTELU0W23AZrxNyNTGng9lizytA+fmsJdLkt3XQ==
Date: Tue, 10 Sep 2024 21:39:44 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: isl12022: Add alarm support
Message-ID: <202409101939448128973d@mail.local>
References: <20240910-rtc-isl12022-alarm-irq-v1-0-d875cedc997f@geanix.com>
 <20240910-rtc-isl12022-alarm-irq-v1-2-d875cedc997f@geanix.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910-rtc-isl12022-alarm-irq-v1-2-d875cedc997f@geanix.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello Esben,

On 10/09/2024 12:27:11+0200, Esben Haabendal wrote:
> The ISL12022 RTC has a combined INT/fOUT pin, which can be used for alarm
> interrupt when frequency output is not enabled.
> 
> The device-tree bindings should ensure that interrupt and clock output is
> not enabled at the same time.

Ideally, we would get a pinmuxing part in the driver to ensure this ;)

> +static int isl12022_rtc_read_alarm(struct device *dev,
> +				   struct rtc_wkalrm *alarm)
> +{
> +	struct rtc_time *const tm = &alarm->time;
> +	struct isl12022 *isl12022 = dev_get_drvdata(dev);
> +	struct regmap *regmap = isl12022->regmap;
> +	uint8_t buf[ISL12022_ALARM_SECTION_LEN];
> +	int ret, yr, i;
> +
> +	ret = regmap_bulk_read(regmap, ISL12022_ALARM_SECTION,
> +			       buf, sizeof(buf));
> +	if (ret) {
> +		dev_err(dev, "%s: reading ALARM registers failed\n",
> +			__func__);

I don't really like those error messages because there is nothing the
user can actually do apart from trying again and this bloats the kernel.

> +	/* The alarm doesn't store the year so get it from the rtc section */
> +	ret = regmap_read(regmap, ISL12022_REG_YR, &yr);
> +	if (ret) {
> +		dev_err(dev, "%s: reading YR register failed\n", __func__);

Ditto

> +	isl12022->rtc = rtc;
>  
>  	rtc->ops = &isl12022_rtc_ops;
>  	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	rtc->range_max = RTC_TIMESTAMP_END_2099;
>  
> +	if (client->irq > 0) {
> +		ret = isl12022_setup_irq(isl12022, client->irq);

You can't do this in probe, the RTC lifecycle is longer than the linux
system. Or said differently: "oh no, my linux has rebooted and now I
lost my future alarm" ;)


> +		if (ret)
> +			return ret;
> +	} else {
> +		clear_bit(RTC_FEATURE_ALARM, rtc->features);
> +	}
> +
>  	return devm_rtc_register_device(rtc);
>  }
>  

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

