Return-Path: <linux-rtc+bounces-1361-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BA790EF79
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Jun 2024 15:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C898281562
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Jun 2024 13:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE7314F13E;
	Wed, 19 Jun 2024 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="UX9CqLh/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43BB13DDAF;
	Wed, 19 Jun 2024 13:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718805281; cv=none; b=K36lAcImUUKLmIB/8HGxHEMqavwDWiwkR/lmYmUJYFZDUxjaUbquX8X++L60uetrBjZVhrax6lD8Cy1olPyN+rCd+CAv+VUeMvdvRwMg4lGiiKT1L7yS2j1yS5SKn32aEcvtqZnBhLCuq8DXGYXrpXeTSA6DwABc8CnAgsIQSMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718805281; c=relaxed/simple;
	bh=8tp1QSFBMsXZUbXqCUgU3l8SNPJguQQ7YIftu2+43Ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tZ7JuhSPxPd7b4G3SFjJy/1clYRMT7G0vjAPT7oQgbZE7fBQrUZgYZ2bQHVhBcs17i9zhwTbhS8LnUG492hXu5OKMWsy0oc9RmHPk43EMjz9GmTM00DEyXZ6sNObw7lpt/igd/+6Y9xxg7RuQr9J0mUUx3jrD53TMdWWoGdc9fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=UX9CqLh/; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 5C441A0FF8;
	Wed, 19 Jun 2024 15:54:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=CO4WJxHdc4bkWVTqpv79
	7ASJULZ8I3A6J8/1LBONMNI=; b=UX9CqLh/m+VTg514QIlm2Bh75Mjh7E+xLYpr
	i1bs6LKksVc0a5m9Gruj6piLhSkDgpjuJxL7SAA2EuwbvRKLhXCytZrGuvKEnxRw
	jgP6u7tRD/Jid9TWbYYgVXpB2B/fTNatjjHyZWykqwmLMXPqN3adGzl6XZF9YmxR
	n4HlJrlpWvBGWuiYA+DAjRnMFgiHJy2RbxptxnA/fD0cPEkSKUwf4a75XZQaQlsu
	5zFUJs9G4w291pp34BUoFGuMEfThF5Ku+kO+i79aUTJDPNAhhUZPyfuDpNGpWk+y
	fvME3i/3MBg91MXIktiZbRRJen5F4J4oihWxEgMfueUkQjR8EG2aD7yYEqmHdEWt
	ZZiP4QtsynkDp9+JV6iRDKkIMeEnM6FATECAN8zeywnlSOG4lYJWgajGi+oF8Jts
	MF2fnZjbRwh3dW0YPhtOhuWbfF2NBSanhg1uNIPvQpcTpsTE1tFUQWdoBkyhPxlL
	mXucfY7Go66tplAmHjl2AvjvMjIN47y1FMjc+OzHtHt8z9QMX79cMYwT5qNbz0GH
	R4LfYFMOLOALg7r0Qd0CmnzQcti7BAsyHBMkvkGVDSCsIUpdCz2lK3w9UikbGphO
	orgxOlSBuQM/DSTHU+Lc+Z0CzVFqjHMOgqDr6W21GLl8xjMEz2/hRQjCE1DV5mvw
	WuppH2Q=
Message-ID: <cb7bbf45-033e-41dd-88cb-9937e19989e6@prolan.hu>
Date: Wed, 19 Jun 2024 15:54:32 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers: rtc: Add driver for SD2405AL.
To: <gomba007@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
References: <20240619-rtc-sd2405al-v2-1-39bea29bd2a5@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20240619-rtc-sd2405al-v2-1-39bea29bd2a5@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2945A129576D7D67

Hi!

On 6/19/24 13:48, Tóth János via B4 Relay wrote:
> Changes in v2:
> - Refactored based on reviewer's suggestions.
> - I couldn't get the I2C IRQ to work on Raspberry Pi 4, so alarm is
>    skipped.

That's sad to see, but I guess better not to include untested code into 
the kernel.

> +/* Control registers */
> +#define	SD2405AL_REG_CTR_BASE	0x0F
> +#define SD2405AL_REG_CTR1	0x00

> +	/* enable write, order is important */
> +	reg = SD2405AL_REG_CTR_BASE + SD2405AL_REG_CTR2;
> +	val = SD2405AL_BIT_WRTC1;

Here I wouldn't do CTR_BASE + REG_CTRx, just leave it as in v1. I only 
suggested the base+offset for the alarm registers, because their layout 
is the same as the time registers, i.e. REG_ALARM_SEC = ALARM_BASE + 
REG_SEC.

> +	/*
> +	 * CTR2.IM = 0, single event alarm
> +	 * CTR2.S{1,0} = 0, disable INT pin
> +	 * CTR2.FOBAT = 0, interrupt enabled during battery backup mode
> +	 * CTR2.INTDE = 0, countdown interrupt disabled
> +	 * CTR2.INTAE = 0, alarm interrupt disabled
> +	 * CTR2.INTFE = 0, frequency interrupt disabled
> +	 */
> +	ret = regmap_write(sd2405al->regmap, reg, val);

Maybe you could #define all these? Just a suggestion though. And even 
`reg` and `val` are not really needed, you could just as easily use:

+ regmap_write(sd2405al->regmap, SD2405AL_REG_CTR2,
+ 	SD2405AL_BIT_WRTC1);

> +	w32 = data[SD2405AL_REG_CTR1];
> +	w32 &= (SD2405AL_BIT_WRTC2 | SD2405AL_BIT_WRTC3);
> +
> +	w1 = data[SD2405AL_REG_CTR2];
> +	w1 &= SD2405AL_BIT_WRTC1;
> +
> +	return (w32 != 0) && (w1 != 0);

Here you could also do away with `w1` and `w32`.

 > +static int sd2405al_read_time(struct device *dev, struct rtc_time *time)
 > +{
 > +	u8 hour;
 > +	u8 data[SD2405AL_NUM_T_REGS] = { 0 };
 > +	struct sd2405al *sd2405al = dev_get_drvdata(dev);
 > +	int ret;
 > +
 > +	/* check if the device is powered on/working */
 > +	ret = sd2405al_check_writable(sd2405al);
 > +	if (ret == 0) {
 > +		dev_err(sd2405al->dev, "invalid device status\n");

Do you really need the RTC to be writable for read_time()?

 > +static int sd2405al_set_time(struct device *dev, struct rtc_time *time)
 > +{
 > +	u8 data[SD2405AL_NUM_T_REGS];
 > +	struct sd2405al *sd2405al = dev_get_drvdata(dev);
 > +	int ret;
 > +
 > +	ret = sd2405al_check_writable(sd2405al);
 > +	if (ret == 0) {
 > +		dev_err(sd2405al->dev, "device is not writable\n");

Couldn't you set it writable here? Instead of doing it in probe()?
Also, you could rename sd2405al_setup() to sd2405al_set_writable() so it 
is clear that that's what it does.

Bence


