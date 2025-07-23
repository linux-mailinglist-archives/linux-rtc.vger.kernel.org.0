Return-Path: <linux-rtc+bounces-4562-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04112B0FDB6
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 01:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A95A3A5278
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 23:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D1524EF8C;
	Wed, 23 Jul 2025 23:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1zxd9p2c"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44ED2E36FB
	for <linux-rtc@vger.kernel.org>; Wed, 23 Jul 2025 23:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753313825; cv=none; b=kaHtvwuyugYDF7vyXq6JFBWocq6wXWilZOFmowmL6xSuJbBJutTNfu7gU23JKU3T+0SsOYebM7NvCwCUnm/HsoY3u5rgN7cXP7g2JHllQPqfBL7eJwKRk9HzXucfITSHftoXHShUjSMtkODKBBYad9hT3aHZauHur0057tRRSkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753313825; c=relaxed/simple;
	bh=Ib/tM9Srsm8I5Qx6cFETwr67/e6J2GqVl6kcrW0x4Ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUT1ChJpj6KVgLnzgg813/fr0p4w9+TCh5l6c1TcWuUYOtfpPF02hLWrmdm2lcG85KrwFt3kn4SWG9HsH4Z/X3s8WL6pFx86PgS4c5hHowqj9JciRA1V88fueoDPQh6PL8HFsjIHKyBufQiUJfB0tnrDIvCswi/JqoIvh6DT5UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1zxd9p2c; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-879c737bc03so13072939f.0
        for <linux-rtc@vger.kernel.org>; Wed, 23 Jul 2025 16:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753313823; x=1753918623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DbymwJT8wdKqXZ17BAMdeDqv5d1KXToHThDYCoTXr1s=;
        b=1zxd9p2czQsSEb4p2Uiro41odAGw7PGmjafAKO0pNmZGjP7sqEjP4wRO9lm0S5suLJ
         KIhyboUUbI7iAvRzMl1zJtAgVASX3HKwkrlRA9gXfd1jpg3wDVuxVFJ3va6gt9r62KKx
         IPQCDyWG2OdiXgZyILHHGTY0OD3C68WbKHwupxKY6avaFAQmEiRZrkGVeb853nUK0bUn
         CAA2UhLa4nBm9UvV7n7fBh89CNPRShBDQ2YhRkNdj1TyUobLp0S3+RmnKs3keFub2Iln
         B0QUOA+Pyfehd1Lu6gzHd8zeX14K8eeq7UOEvsFrijEJbP79KZXCl9K2tM61zVMfQMM/
         IjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753313823; x=1753918623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DbymwJT8wdKqXZ17BAMdeDqv5d1KXToHThDYCoTXr1s=;
        b=iE9REvAjLYXavRl5mqU+T+Ru+T/WkfFteHKXcnrDWfS0PXnhdD94Q9umG6BCI9NQwL
         MII07PWSa/KjhllzDaM99ITiEubMw+EMlpQoNmN2SWBDeVq0TrdH8w4ok97rbw2RBRkT
         kdV6xKqR8j8qVVLkmBZxBZ+DZN673CH2qV3ARiieuoNndhqj4IGjvSXauwFCPjRaiyn+
         vmS/xmQSGHuekEZE0OVkjqYISnUdQzjERHgUAbn501CYKu3kNHsikyhop92rtAp/5aNc
         qAwGJi3GArN0veDGReagdmBHCECG1hQupziROE8106WOSjywbke68++b3eA+xv4/g3xU
         iD+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW2DsM8Z6XVf0ExLb4Aewa6Tv5WRp4PDstEpTEQeVBgAZoQ8If4OZa5XG0qUpj/8175HrBtFSH4D6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZk0YduUnYi/iELZY00FMjR652uxlN/L0vfv3HlTA/iskdWzr8
	LxAhXaLSjNuz38HSdkQeu/MIgLIIOxukjS9GWZqcnDkRp2WEfGYYuDm3iOix3T5m830=
X-Gm-Gg: ASbGncsevWw9tSCFVPLTJWus7vNz3BFpvoz6K18HwzIvoDiMH0knoQZPLCx6GTEsMiJ
	4FnNIkDytjPSfqiih5oNoGovSjaWI1w/+pDxVvEZlxJVPH6SPWwq9UAQqQm1AlpEljj5eBJUR9m
	K8Ohi3OO/50Qg3MNUTUwJfyf6vdt54Hri0H2f/7bMPsTd2FaFpKGHQZur9KYtX0jK2Yxz86LGHK
	mDjS4Ej/jPe6MX49hFIEsKHz8VYqzxdgt06WTGjNJL3x2FJkCsqg8N0eQB2yzWz4fq+/phhku1n
	9jQQQFyjFqfezxLH2WeIKMtgzUKpHljip2Evq8vP8xWZ4Cs0sme7yLEmkneVWqfaXLLCFXvbJPb
	rqrrthep4b2kphi1I+QHbyttqfYn30+YZwg==
X-Google-Smtp-Source: AGHT+IHNF5SD1Use82nEBRXm82QeoUFWLLGUU4rIloi5Cn7oMv86TpUYK3QDrbLvOOiD/JUxKOqJog==
X-Received: by 2002:a05:6602:6403:b0:873:1a0e:a496 with SMTP id ca18e2360f4ac-87c6505de5dmr798601539f.10.1753313822955;
        Wed, 23 Jul 2025 16:37:02 -0700 (PDT)
Received: from [10.211.55.5] ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-508aea8da22sm65011173.38.2025.07.23.16.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 16:37:02 -0700 (PDT)
Message-ID: <6df61594-9a0c-4c18-8754-43fdff8474ca@riscstar.com>
Date: Wed, 23 Jul 2025 18:37:00 -0500
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/8] rtc: spacemit: support the SpacemiT P1 RTC
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mat.jonczyk@o2.pl, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250710175107.1280221-1-elder@riscstar.com>
 <20250710175107.1280221-6-elder@riscstar.com>
 <20250723213956570da462@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250723213956570da462@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/25 4:39 PM, Alexandre Belloni wrote:
> On 10/07/2025 12:51:03-0500, Alex Elder wrote:
>> +static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
>> +{
>> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
>> +	struct regmap *regmap = p1->regmap;
>> +	u32 count = RTC_READ_TRIES;
>> +	u8 seconds;
>> +	u8 time[6];
>> +	int ret;
>> +
>> +	if (!regmap_test_bits(regmap, RTC_CTRL, RTC_EN))
>> +		return -ENODEV;		/* RTC is disabled */
> 
> That should be -EINVAL, as all the other drivers have standardized this.
> 
> With this fixed,
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

OK thank you.  I'll plan to send v9 with this change included.

					-Alex

> 
> 
>> +
>> +	ret = regmap_bulk_read(regmap, RTC_TIME, time, sizeof(time));
>> +	if (ret)
>> +		return ret;
>> +
>> +	do {
>> +		seconds = time[0];
>> +		ret = regmap_bulk_read(regmap, RTC_TIME, time, sizeof(time));
>> +		if (ret)
>> +			return ret;
>> +	} while (time[0] != seconds && --count);
>> +
>> +	if (!count)
>> +		return -EIO;		/* Unable to get a consistent result */
>> +
>> +	t->tm_sec = time[0] & GENMASK(5, 0);
>> +	t->tm_min = time[1] & GENMASK(5, 0);
>> +	t->tm_hour = time[2] & GENMASK(4, 0);
>> +	t->tm_mday = (time[3] & GENMASK(4, 0)) + 1;
>> +	t->tm_mon = time[4] & GENMASK(3, 0);
>> +	t->tm_year = (time[5] & GENMASK(5, 0)) + 100;
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * The P1 hardware documentation states that values in the registers are
>> + * latched so when written they represent a consistent time snapshot.
>> + * Nevertheless, this is not guaranteed by the implementation, so we must
>> + * disable the RTC while updating it.
>> + */
>> +static int p1_rtc_set_time(struct device *dev, struct rtc_time *t)
>> +{
>> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
>> +	struct regmap *regmap = p1->regmap;
>> +	u8 time[6];
>> +	int ret;
>> +
>> +	time[0] = t->tm_sec;
>> +	time[1] = t->tm_min;
>> +	time[2] = t->tm_hour;
>> +	time[3] = t->tm_mday - 1;
>> +	time[4] = t->tm_mon;
>> +	time[5] = t->tm_year - 100;
>> +
>> +	/* Disable the RTC to update; re-enable again when done */
>> +	ret = regmap_clear_bits(regmap, RTC_CTRL, RTC_EN);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* If something goes wrong, leave the RTC disabled */
>> +	ret = regmap_bulk_write(regmap, RTC_TIME, time, sizeof(time));
>> +	if (ret)
>> +		return ret;
>> +
>> +	return regmap_set_bits(regmap, RTC_CTRL, RTC_EN);
>> +}
>> +
>> +static const struct rtc_class_ops p1_rtc_class_ops = {
>> +	.read_time = p1_rtc_read_time,
>> +	.set_time = p1_rtc_set_time,
>> +};
>> +
>> +static int p1_rtc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct rtc_device *rtc;
>> +	struct p1_rtc *p1;
>> +
>> +	p1 = devm_kzalloc(dev, sizeof(*p1), GFP_KERNEL);
>> +	if (!p1)
>> +		return -ENOMEM;
>> +	dev_set_drvdata(dev, p1);
>> +
>> +	p1->regmap = dev_get_regmap(dev->parent, NULL);
>> +	if (!p1->regmap)
>> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
>> +
>> +	rtc = devm_rtc_allocate_device(dev);
>> +	if (IS_ERR(rtc))
>> +		return dev_err_probe(dev, PTR_ERR(rtc),
>> +				     "error allocating device\n");
>> +	p1->rtc = rtc;
>> +
>> +	rtc->ops = &p1_rtc_class_ops;
>> +	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>> +	rtc->range_max = RTC_TIMESTAMP_END_2063;
>> +
>> +	clear_bit(RTC_FEATURE_ALARM, rtc->features);
>> +	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
>> +
>> +	return devm_rtc_register_device(rtc);
>> +}
>> +
>> +static struct platform_driver p1_rtc_driver = {
>> +	.probe = p1_rtc_probe,
>> +	.driver = {
>> +		.name = MOD_NAME,
>> +	},
>> +};
>> +
>> +module_platform_driver(p1_rtc_driver);
>> +
>> +MODULE_DESCRIPTION("SpacemiT P1 RTC driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:" MOD_NAME);
>> -- 
>> 2.45.2
>>
> 


