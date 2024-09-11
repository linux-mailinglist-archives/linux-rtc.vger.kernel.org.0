Return-Path: <linux-rtc+bounces-1933-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3477974C77
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 10:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1940FB25C8A
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 08:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014BC146A6F;
	Wed, 11 Sep 2024 08:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="bsQ9z0S+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3A81465B8;
	Wed, 11 Sep 2024 08:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726042812; cv=none; b=ezOU72Lc0TRm320V+u/m7Ilkcbcrubp3QZRu5xH2Ieeaz6QkMzKT2bxRDSDcX0/OBCWAnx6rkkiI5f3rs7keaCXyNxwBP2aTBJM/tS4dHE7pDCMqqhBJ8t+O7xLKYhBeIoUV301RnJDdH55T5/Z33DCmhZYa03PE3CLL6Ks83n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726042812; c=relaxed/simple;
	bh=GdYBPsKDHeufKmodYCKe7FXkkVMFNJ7DeZ/JN+gbZMY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DJbMmgsA5qiuzK+LXNlia9gFitqtzj4Wbphy5t7BI7OggOLbzjH/B1UWol4eLkq+ld9v4lurlOMiHM35lzYJ9bi8dwFld3tJ+C6pREphl/KXP+II+AwM4IGWP534ZtAZOk1RxOu4Z3WkOxSg2cPsh0CtZbWlOblAdvzEzVOQqfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=bsQ9z0S+; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=F7yJ655Km2+rNMGGl0IszJ/m1hy6CjgJoVZwzGAbMHg=; b=bsQ9z0S+sH97Kc839K0iUN661j
	B8EepZNc/vUSIigG6gRwm3ZlMYXMPaVOwcJz/M5I7J6y6xBblXPUAamcdsNkQUOvslfRNIVAX6Gm3
	e1Ut/OrhQAg8c/1VmhwOCqC0ak4V5RF3qFHJgDUqlH/1hQpt8jPqQkBeibwrfgtT76+/oJbB4pTuJ
	dAy/69lQ8fTk6+cpLU6CpedHp2ljrF9aRbZZM9ryQhmwT6VpKbNzLlMeKN20AjGoxWqS5bii+u0Nq
	YW7Vh8u62jg1RaVex91DD6XbX0Ndz8nsAoIBF2U8AU1++GJpo7UjaUCYAlt1rIadfE7TDNkTxn6pT
	SoX48Jyw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1soIa8-000Er2-Bs; Wed, 11 Sep 2024 10:20:08 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1soIa7-000DUx-23;
	Wed, 11 Sep 2024 10:20:08 +0200
From: Esben Haabendal <esben@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,  linux-rtc@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: isl12022: Add alarm support
In-Reply-To: <202409101939448128973d@mail.local> (Alexandre Belloni's message
	of "Tue, 10 Sep 2024 21:39:44 +0200")
References: <20240910-rtc-isl12022-alarm-irq-v1-0-d875cedc997f@geanix.com>
	<20240910-rtc-isl12022-alarm-irq-v1-2-d875cedc997f@geanix.com>
	<202409101939448128973d@mail.local>
Date: Wed, 11 Sep 2024 10:20:07 +0200
Message-ID: <87mske7gaw.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27394/Tue Sep 10 10:30:36 2024)

Alexandre Belloni <alexandre.belloni@bootlin.com> writes:

> Hello Esben,
>
> On 10/09/2024 12:27:11+0200, Esben Haabendal wrote:
>> The ISL12022 RTC has a combined INT/fOUT pin, which can be used for alarm
>> interrupt when frequency output is not enabled.
>> 
>> The device-tree bindings should ensure that interrupt and clock output is
>> not enabled at the same time.
>
> Ideally, we would get a pinmuxing part in the driver to ensure this ;)

I hope we can leave this as future work :)

>> +static int isl12022_rtc_read_alarm(struct device *dev,
>> +				   struct rtc_wkalrm *alarm)
>> +{
>> +	struct rtc_time *const tm = &alarm->time;
>> +	struct isl12022 *isl12022 = dev_get_drvdata(dev);
>> +	struct regmap *regmap = isl12022->regmap;
>> +	uint8_t buf[ISL12022_ALARM_SECTION_LEN];
>> +	int ret, yr, i;
>> +
>> +	ret = regmap_bulk_read(regmap, ISL12022_ALARM_SECTION,
>> +			       buf, sizeof(buf));
>> +	if (ret) {
>> +		dev_err(dev, "%s: reading ALARM registers failed\n",
>> +			__func__);
>
> I don't really like those error messages because there is nothing the
> user can actually do apart from trying again and this bloats the
> kernel.

Ok. Maybe keep it as dev_dbg() then?
>
>> +	/* The alarm doesn't store the year so get it from the rtc section */
>> +	ret = regmap_read(regmap, ISL12022_REG_YR, &yr);
>> +	if (ret) {
>> +		dev_err(dev, "%s: reading YR register failed\n", __func__);
>
> Ditto

Ditto.

>> +	isl12022->rtc = rtc;
>>  
>>  	rtc->ops = &isl12022_rtc_ops;
>>  	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>>  	rtc->range_max = RTC_TIMESTAMP_END_2099;
>>  
>> +	if (client->irq > 0) {
>> +		ret = isl12022_setup_irq(isl12022, client->irq);
>
> You can't do this in probe, the RTC lifecycle is longer than the linux
> system. Or said differently: "oh no, my linux has rebooted and now I
> lost my future alarm" ;)

Oh.

We do need to setup the irq here, so I assume you mean I need to drop
the part of _setup_irq() that clears alarm registers.

And I guess we need to enable irq in probe as well. At least if/when an
alarm is set. I think it should be safe to enable irq unconditionally in
_probe()...

>> +		if (ret)
>> +			return ret;
>> +	} else {
>> +		clear_bit(RTC_FEATURE_ALARM, rtc->features);
>> +	}
>> +
>>  	return devm_rtc_register_device(rtc);
>>  }

/Esben

