Return-Path: <linux-rtc+bounces-1388-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AC4914445
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Jun 2024 10:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7CE71F22D9C
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Jun 2024 08:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E43D4962B;
	Mon, 24 Jun 2024 08:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="H5+VYylD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305ED4D584;
	Mon, 24 Jun 2024 08:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719216591; cv=none; b=ow9AazyALNYBGiTEXSv2loH1RiDHxRoHkzxZqRPynTpGsCrS1XgdlYBYVjwlEkFhC+ZfZ3Ur5SD18leworjcgoW9iM8LMXfAn/eL+3jTeYzHj1nCjIjAmjKXnO5K/h6cnRbsivL9VG0brIFoyAATgE2hKW/eOT8Bq9z/tCd59n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719216591; c=relaxed/simple;
	bh=cLneobmR9mPQFGmHCF1wBlcgnI30OLmyymFnRX615y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oDgvpyp/C2m0/fRNJ2f5HnMjtp56nqttAl+Qoy49wujKftJPFhWGFo8nOqe3a/U7T3B8+J8XXMM8/XTl9OZdC6qO10DzXvLxm1Jus/WPtdYBkspWguHNq67WD6ZfkevO/CixJBM9XJUR7VVD53lvX9m8EqotwqCN0EoZaAl6NII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=H5+VYylD; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 35F34A0771;
	Mon, 24 Jun 2024 10:09:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=bsU3v5i9Yv4jZ0HjqioR
	uViF9du/mK6SZHpke3lYZug=; b=H5+VYylDTO7FQ97ndrOyuJUa+viUl535br2J
	mmQcgUCny3fGhmOxm51a6QfFY0hO/48Xnsy6JyT+rvsiiAvpF4cps98iRy2yCfeS
	Q4sW3vgUtOHDl+6pYAYz2Sa2e/eKFS0UK/Ykrg1sZleec7cBqVbdGendM7d7dZxb
	SY1KYDNphwI660wDf7FQl9bf/9glPX6cTfq28oL7ijrkKut/bFHWhCm3vQzF82rL
	wziNsssKFZuAhNcS1yGWpxq2Ir3YoCoPYAdgNVG4+TorwtZq+BBqPc52XKGpHRiM
	6XQZ785I7cbs0p6JpRF2bRs14ybEKjW8iJQxYoPLNsnr4fRLyUyH3a4gbPVVhNj8
	zVBwNXXKPlc1sOtOF7ECeof/I8D2iZleRisUOQUnoiqvFg9PsuH6Src80er7Lctj
	/XVLEN9uSkuuJYh6R0i0DcHNInxqx7u9tQzX0dFThFuE88d2SMu7dxEoM7rl+y27
	QDlpR5FxZIdFGxlvD+CaTgB+3GmbojHyKE1sLZmgNm4sIPDMpFQyfu0C3omaxy8H
	7AStYIHLJaSb30/D6TFA/UYMdrpsKqZzfEK/AqxOb4WCHDWmUtW18pCQzaf2LrKx
	oRYIgVEd2bFabFGD2ESLHGJz9ss/Lw3AkXJFa5mu2qq1Ca8ah0ZK74qMzQKa3IJV
	YhO4Fdc=
Message-ID: <21ca87a0-6062-411d-88e4-c644c054e497@prolan.hu>
Date: Mon, 24 Jun 2024 10:09:46 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drivers: rtc: Add driver for SD2405AL.
To: <gomba007@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
References: <20240620-rtc-sd2405al-v3-1-65d5bb01af50@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20240620-rtc-sd2405al-v3-1-65d5bb01af50@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2945A129576C7661

Hi!

> +static int sd2405al_setup(struct sd2405al *sd2405al)
> +{
> +	unsigned int val;
> +	int ret;

I would still remove `val` and inline everything.

> +static int sd2405al_check_state(struct sd2405al *sd2405al)
> +{
> +	u8 data[2] = { 0 };
> +	int state;
> +	int ret;
> +
> +	ret = regmap_bulk_read(sd2405al->regmap, SD2405AL_REG_CTR1, data, 2);
> +	if (ret < 0) {
> +		dev_err(sd2405al->dev, "read failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* CRT1 */
> +	state = (data[0] & (SD2405AL_BIT_WRTC2 | SD2405AL_BIT_WRTC3)) != 0;
> +
> +	/* CTR2 */
> +	state &= (data[1] & SD2405AL_BIT_WRTC1) != 0;
> +
> +	return state;

Same here.

> +static int sd2405al_read_time(struct device *dev, struct rtc_time *time)
> +{
> +	u8 hour;

This variable could also be inlined.

Other than that, LGTM. Though I don't have this chip, I can only go by 
the linked datasheet.

On 6/20/24 11:55, Tóth János via B4 Relay wrote:
 > From: Tóth János <gomba007@gmail.com>
 >
 > Add support for the DFRobot SD2405AL I2C RTC Module.
 >
 > Datasheet:
 > 
https://image.dfrobot.com/image/data/TOY0021/SD2405AL%20datasheet%20(Angelo%20v0.1).pdf
 >
 > Product:
 > 	https://www.dfrobot.com/product-1600.html
 >
 > To instantiate (assuming device is connected to I2C-1)
 > as root:
 > 	echo sd2405al 0x32 > /sys/bus/i2c/devices/i2c-1/new_device
 > as user:
 > 	echo 'sd2405al 0x32' | sudo tee /sys/class/i2c-adapter/i2c-1/new_device
 >
 > The driver is tested with:
 > 	+ hwclock
 > 	+ tools/testing/selftests/rtc/setdate
 > 	+ tools/testing/selftests/rtc/rtctest
 >
 > Signed-off-by: Tóth János <gomba007@gmail.com>

Reviewed-by: Csókás, Bence <csokas.bence@prolan.hu>


