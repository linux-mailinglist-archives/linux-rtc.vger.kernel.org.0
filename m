Return-Path: <linux-rtc+bounces-4337-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7060AE4D38
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Jun 2025 21:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4D883A552C
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Jun 2025 19:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C481D9346;
	Mon, 23 Jun 2025 19:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b="EVSnBIP/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E154FF4F1
	for <linux-rtc@vger.kernel.org>; Mon, 23 Jun 2025 19:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750705288; cv=none; b=cJBSs27MZHOGunru4wN9htOarCrP8gCobfTrGvgskfgMaqrQuYgSnRhQlLGYmQqC69kkLbd7NHpJya8rTnHrC1p4xwNPC25Oz09gFkJZLYf1vVPdfifT5EIDeSdj/QFUoai+OHe/fJAU65WbEXkh6gj68XBUOmtnjwCu1ny2q0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750705288; c=relaxed/simple;
	bh=N2zbhzGML9mW7ANH5aTTPrIxrgBTYuz63hjBnrZ9A0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mc+6fMU+5mcGbGCn5orTSzfvFWAKpVwcGD0BZc+65HK+TKfnI4J1PJ4I3k1W5dGfLP4zy7tH7ROM9eS8xVAnKSAWST5rb+Q90YpctxaX6vqXEp725i2VFHZIgOXESQIwsEINzIFGaOfOQjlGbNdlIB0OycrSOClYv5eKqkfVf+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b=EVSnBIP/; arc=none smtp.client-ip=193.222.135.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 4453 invoked from network); 23 Jun 2025 20:54:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=20241105;
          t=1750704878; bh=Nz/MLAtc2Q0OF2vCJ2qL2BfXnH2qMBB6O1rcR/uerOo=;
          h=Subject:To:Cc:From;
          b=EVSnBIP/yqYSauTNAm3iKv1XB4wKe+Y0LOwmxgi6daIhtHsEqShlac/mIQd/oTab0
           BFKu42f5dzCleanEHICAtmecj6/KjJBZmop/AhaX3pKsLKGi8A0xk5RlyuDgJoi1AY
           80dtzBvcURtla+X7VtAgQRiNqd/nPpEkjw69yuIzsE0cVd8MzplGphAuoIAHYTJy55
           GX/cdyD8p9229vzHQS1A/KymHly7mW6cikZBNsP9rUxEeekse5FgC2U4clcDVYwV1n
           1HPTOpWjr4oSOw+WlqFakuL1wLXnTYqyAAAmYViidjk/0rxZ1S5rY/l/zRtlQmi2if
           UHaJ8TPQGP1WA==
Received: from apn-31-0-3-138.dynamic.gprs.plus.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[31.0.3.138])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <elder@riscstar.com>; 23 Jun 2025 20:54:38 +0200
Message-ID: <d35922c4-fbd0-4d13-9bcd-2688b48c0045@o2.pl>
Date: Mon, 23 Jun 2025 20:54:34 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] rtc: spacemit: support the SpacemiT P1 RTC
To: Alex Elder <elder@riscstar.com>, lee@kernel.org,
 alexandre.belloni@bootlin.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, wangruikang@iscas.ac.cn, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 troymitchell988@gmail.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-rtc@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250622032941.3768912-1-elder@riscstar.com>
 <20250622032941.3768912-5-elder@riscstar.com>
Content-Language: en-GB, pl
From: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Autocrypt: addr=mat.jonczyk@o2.pl; keydata=
 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
 TANkZ3QqXNX2
In-Reply-To: <20250622032941.3768912-5-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: 2af6533f687966590cf5e4cd8b367565
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [UUNh]                               

W dniu 22.06.2025 o 05:29, Alex Elder pisze:
> Add support for the RTC found in the SpacemiT P1 PMIC.  Initially
> only setting and reading the time are supported.
>
> The PMIC is implemented as a multi-function device.  This RTC is
> probed based on this driver being named in a MFD cell in the simple
> MFD I2C driver.
>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v3: - Added this driver to the series, in response to Lee Jones saying
>        more than one MFD sub-device was required to be acceptable
[snip]
> +static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
> +{
> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
> +	u8 time[tu_count];
> +	int ret;
> +
> +	ret = regmap_bulk_read(p1->regmap, RTC_COUNT_BASE, &time, sizeof(time));
> +	if (ret)
> +		return ret;

Hello,

Are you sure that you read the time parts consistently here? I mean:
is there a risk that the clock is updating below you - so that for
example during the transition

12:59:59 -> 13:00:00

you are going to read 12:00:00 or 12:59:00?

If so, you could for example read the time in a loop until you get
two same readouts.

> +
> +	t->tm_sec = time[tu_second] & GENMASK(5, 0);
> +	t->tm_min = time[tu_minute] & GENMASK(5, 0);
> +	t->tm_hour = time[tu_hour] & GENMASK(4, 0);
> +	t->tm_mday = (time[tu_day] & GENMASK(4, 0)) + 1;
> +	t->tm_mon = time[tu_month] & GENMASK(3, 0);
> +	t->tm_year = (time[tu_year] & GENMASK(5, 0)) + 100;

Is it necessary to use the bitmasks here? Are the higher bits undefined
in hardware? If so, is it necessary to mask them while writing the time
in p1_rtc_set_time()?

> +	/* tm_wday, tm_yday, and tm_isdst aren't used */
> +
> +	return 0;
> +}
> +
> +static int p1_rtc_set_time(struct device *dev, struct rtc_time *t)
> +{
> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
> +	u8 time[tu_count];
> +	int ret;
> +
> +	time[tu_second] = t->tm_sec;
> +	time[tu_minute] = t->tm_min;
> +	time[tu_hour] = t->tm_hour;
> +	time[tu_day] = t->tm_mday - 1;
> +	time[tu_month] = t->tm_mon;
> +	time[tu_year] = t->tm_year - 100;
> +
> +	/* Disable the RTC to update; re-enable again when done */
> +	ret = regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_bulk_write(p1->regmap, RTC_COUNT_BASE, time, sizeof(time));
> +
> +	(void)regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, RTC_EN);
Perhaps you shouldn't ignore any errors here - failing to restart
the clock should make p1_rtc_set_time() return an error code.
> +
> +	return ret;
> +}
> +

Greetings,

Mateusz


