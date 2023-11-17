Return-Path: <linux-rtc+bounces-315-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 703437EFB4D
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Nov 2023 23:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB106B20A30
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Nov 2023 22:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E99446435;
	Fri, 17 Nov 2023 22:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Vodl7Yic"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59494D4D;
	Fri, 17 Nov 2023 14:21:47 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0457960002;
	Fri, 17 Nov 2023 22:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700259705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z+XRMcZX0l03AC5u4LRSmNZEIVypqySKCEXV2aTX1bg=;
	b=Vodl7YicdQp6H8eKKBzX+WV5WOiJ29HWHexR5suyxhKzXzzboMec5CMbwVlUuAQGlHH+i0
	w51lGEaddRZ3lekpEtUWIS4mAhBMr1w1ChRqkC7VJ+h3PjPDa6/LdLvAd1cNFur7MRHjsG
	lweLsQcNTO/qSS3AU6US/VgJy0UOjdwslNZCO8nqjZbf/NkkBqJYP3SusgO3BGTrqSl0Mx
	Uog+HRbihWzsCIQdH3P1iIXsBrhBFzyvO823q9gMTL4oCXekEr1B7Bc8VUygeUQWUrTKf1
	OjNeikDCgkvIpkq1f5bpEM5l8WMmRtTaG5dh670mEIv+QCFeuz+RrSCqvog9eg==
Date: Fri, 17 Nov 2023 23:21:44 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Carlos Menin <menin@carlosaurelio.net>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Sergio Prado <sergio.prado@e-labworks.com>
Subject: Re: [PATCH v2 1/2] rtc: add pcf85053a
Message-ID: <2023111722214402006513@mail.local>
References: <20231103125106.78220-1-menin@carlosaurelio.net>
 <20231103142822abbca0ed@mail.local>
 <ZUf_3TAZh1bpVOVt@arch-bow>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUf_3TAZh1bpVOVt@arch-bow>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 05/11/2023 17:49:33-0300, Carlos Menin wrote:
> > > +static int pcf85053a_rtc_check_reliability(struct device *dev, u8 status_reg)
> > > +{
> > > +	int ret = 0;
> > > +
> > > +	if (status_reg & REG_STATUS_CIF) {
> > > +		dev_warn(dev, "tamper detected,"
> > > +			 " date/time is not reliable\n");
> > You should not split strings. Also, I don't think most of the messages
> > are actually useful as the end user doesn't have any specific action
> > after seeing it. You should probably drop them.
> > 
> 
> About the usefullness of the message, do this apply to this CIF related
> message or also to the other two flags?

This actually applies to all the messages of the driver, they will add
to the size of the kernel then slow the boot time so please have a
careful look at the usefulness of messages. You may consider swtching
them to dev_dbg.

> > > +	tm->tm_year = buf[REG_YEARS];
> > > +	/* adjust for 1900 base of rtc_time */
> > > +	tm->tm_year += 100;
> > > +
> > > +	tm->tm_wday = (buf[REG_WEEKDAYS] - 1) & 7; /* 1 - 7 */
> > > +	tm->tm_sec = buf[REG_SECS];
> > > +	tm->tm_min = buf[REG_MINUTES];
> > > +	tm->tm_hour = buf[REG_HOURS];
> > > +	tm->tm_mday = buf[REG_DAYS];
> > > +	tm->tm_mon = buf[REG_MONTHS] - 1; /* 1 - 12 */
> > 
> > Those comments are not useful.
> > 
> 
> I Will improve them to explain why I am offsetting the register value.

I don't think this is necessary, most of the drivers are doing it so
this is expected.

> > > +static struct attribute *pcf85053a_attrs_flags[] = {
> > > +	&dev_attr_rtc_fail.attr,
> > > +	&dev_attr_oscillator_fail.attr,
> > > +	&dev_attr_rtc_clear.attr,
> > > +	0,
> > > +};
> > 
> > Don't add undocumented sysfs files. Also, You must not allow userspace
> > to clear those flags without setting the time properly.
> > 
> 
> Should the flags be cleared only by setting the time, or is there
> another acceptable method? What would be the correct way to let
> userspace read those flags?

The RTC_VL_READ ioctl will allow reading the flags from userspace. For
the flags that monitor the validity of the time and date, they must only
be cleared when the time and date is known to be good s only when
setting the time.

> > > +}
> > > +
> > > +static void pcf85053a_set_low_jitter(struct device *dev, u8 *reg_ctrl)
> > > +{
> > > +	bool val;
> > > +	u8 regval;
> > > +
> > > +	val = of_property_read_bool(dev->of_node, "nxp,low-jitter-mode");
> > 
> > Bool properties don't work well with RTC because with this, there is now
> > way to enable the normal mode.
> > 
> 
> Wouldn't the absence of the property enable normal mode? Or I am missing
> something?

RTC have a greater lifetime than the linux system so you must have a way
to indicate that you don't want to change the configuration for example
if it has been set from the bootloader or at the factory.

Regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

