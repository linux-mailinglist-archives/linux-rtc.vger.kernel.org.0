Return-Path: <linux-rtc+bounces-1922-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB75974340
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 21:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D1F61F262B0
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 19:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C771A4F2F;
	Tue, 10 Sep 2024 19:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="UI0wDOhk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449AD208A5
	for <linux-rtc@vger.kernel.org>; Tue, 10 Sep 2024 19:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725995602; cv=none; b=PdWtC6rzpBtV37PPhyDcFA7N5sH7EHffsLpG9SQ6CGh8CBPxiLHmoZOIBzuDyxjaVoxhoOyLq6AOnnH2vcdm2zM34g/EjSTfGXkibFz7dFUTPnvDhKrJIIuRZOrejvdDUlGQWTFmT5Rll86YqImHIu6RePB36y2FSE5DunEp6gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725995602; c=relaxed/simple;
	bh=dVm/MtM4DeGN9D0ksD/oaZ//nM7Mb+G2fXaU4w6nSl0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=El1B5u/hgHNZFDskJV81hPqc3Sp4qkNdjpm2Qg4ZnY0EBUFx80xUNvViyDe42RPuZ5kdggd//hbpPisuLQP5DZQ9lxwM+NzCIFTd3j6ot1p/XR2tw2CdCrd/cy0/hA9VOovsohB4bSbKFJCElPJti0XB4M7eKKUNWzBa6m72y9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=UI0wDOhk; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8d51a7d6f5so328651066b.2
        for <linux-rtc@vger.kernel.org>; Tue, 10 Sep 2024 12:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1725995597; x=1726600397; darn=vger.kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5N5clxnPVZLfbfPFv0q9nXZKj3xRXB2rcmbPWMFm5pw=;
        b=UI0wDOhk6RIBfOWd+nbqXMK3Xdz98kTVlNtZYQ+e3HeP6KRRjOAMos8vJST+56LxHR
         tNII1gWY2M7bVry1/XqN33DO64SEEJRxYZziyRGx2hZhPUO+ADD65Kj0zjd+arc03+A5
         T8WDxmc9czmw9iHkuMWhwUazGixY0lo6KltLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725995597; x=1726600397;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5N5clxnPVZLfbfPFv0q9nXZKj3xRXB2rcmbPWMFm5pw=;
        b=GU0s6rtjLiZW/nG1EUkpStKh0OhsqhxLFm9luetCMDbFKIB8s5skecx8uDHDbqRL6D
         +kw0h6gPARccX1ai/9MDseGD7DZepeNgDjp21jYkKNgfn1nJ6kuv7l4F829Xjiv22eth
         7QVmB1IRmMw1GSnYWCTFbLCCnrT/d1OfsSePekh57QJQf3W6jtPBugZcM5h0C1rMxEmG
         ljvQSWhGFMJ/xbEXoGUzdv/ptsbJ+IzZDRaz7U/+r5l9UznXsZAE6PXldr3ARrLE3YAS
         zE/nbJPXhEPC0jtu9/vL6+lxUv51m9Yieva6X3iAsLhLVqarIIEfOBmIDMG6itbOvx4E
         N5HA==
X-Forwarded-Encrypted: i=1; AJvYcCVwUbyZINLthauULUo8ha8lvtnnlhpkC+u30O6KqPoJnnunoJbkKFtetDfUhBTpD+phGukRPUq3m4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDO8G/JX4Aggy2SPHDnXhqWvYZmJXPs/sn8Shi6w4AWEnnp293
	Eh9J3Tq7z0pAqobBIBzFMxVtoQtA4k7mRiv/5qZPsspyVQCwMpRP+XLe5xB4Uk0=
X-Google-Smtp-Source: AGHT+IH1WxpjKC0S+1H9SLotkqHenKyT//XTgx64iwcNKOBhwtNuMr3VWrLFPBrH7xyjE8/mvW5YAA==
X-Received: by 2002:a17:907:7294:b0:a86:96d1:d1f with SMTP id a640c23a62f3a-a8ffaadafdbmr167712266b.26.1725995596499;
        Tue, 10 Sep 2024 12:13:16 -0700 (PDT)
Received: from localhost (77.33.185.121.dhcp.fibianet.dk. [77.33.185.121])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ce9277sm525790666b.149.2024.09.10.12.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 12:13:15 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Esben Haabendal <esben@geanix.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,  Rasmus Villemoes
 <linux@rasmusvillemoes.dk>,  linux-rtc@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: isl12022: Add alarm support
In-Reply-To: <20240910-rtc-isl12022-alarm-irq-v1-2-d875cedc997f@geanix.com>
	(Esben Haabendal's message of "Tue, 10 Sep 2024 12:27:11 +0200")
References: <20240910-rtc-isl12022-alarm-irq-v1-0-d875cedc997f@geanix.com>
	<20240910-rtc-isl12022-alarm-irq-v1-2-d875cedc997f@geanix.com>
Date: Tue, 10 Sep 2024 21:13:17 +0200
Message-ID: <875xr3iape.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Esben Haabendal <esben@geanix.com> writes:

> The ISL12022 RTC has a combined INT/fOUT pin, which can be used for alarm
> interrupt when frequency output is not enabled.
>
> The device-tree bindings should ensure that interrupt and clock output is
> not enabled at the same time.
>
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/rtc/rtc-isl12022.c | 244 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 241 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
> index d82278fdc29b..682b1bf10160 100644
> --- a/drivers/rtc/rtc-isl12022.c
> +++ b/drivers/rtc/rtc-isl12022.c
> @@ -21,7 +21,7 @@
>  
>  #include <asm/byteorder.h>
>  
> -/* ISL register offsets */
> +/* RTC - Real time clock registers */
>  #define ISL12022_REG_SC		0x00
>  #define ISL12022_REG_MN		0x01
>  #define ISL12022_REG_HR		0x02
> @@ -30,21 +30,36 @@
>  #define ISL12022_REG_YR		0x05
>  #define ISL12022_REG_DW		0x06
>  
> +/* CSR - Control and status registers */
>  #define ISL12022_REG_SR		0x07
>  #define ISL12022_REG_INT	0x08
> -
>  #define ISL12022_REG_PWR_VBAT	0x0a
> -
>  #define ISL12022_REG_BETA	0x0d
> +
> +/* ALARM - Alarm registers */
> +#define ISL12022_REG_SCA0	0x10
> +#define ISL12022_REG_MNA0	0x11
> +#define ISL12022_REG_HRA0	0x12
> +#define ISL12022_REG_DTA0	0x13
> +#define ISL12022_REG_MOA0	0x14
> +#define ISL12022_REG_DWA0	0x15
> +#define ISL12022_ALARM_SECTION		ISL12022_REG_SCA0
> +#define ISL12022_ALARM_SECTION_LEN	(ISL12022_REG_DWA0 - ISL12022_REG_SCA0 + 1)
> +
> +/* TEMP - Temperature sensor registers */
>  #define ISL12022_REG_TEMP_L	0x28
>  
>  /* ISL register bits */
>  #define ISL12022_HR_MIL		(1 << 7)	/* military or 24 hour time */
>  
> +#define ISL12022_SR_ALM		(1 << 4)
>  #define ISL12022_SR_LBAT85	(1 << 2)
>  #define ISL12022_SR_LBAT75	(1 << 1)
>  
> +#define ISL12022_INT_ARST	(1 << 7)
>  #define ISL12022_INT_WRTC	(1 << 6)
> +#define ISL12022_INT_IM		(1 << 5)
> +#define ISL12022_INT_FOBATB	(1 << 4)
>  #define ISL12022_INT_FO_MASK	GENMASK(3, 0)
>  #define ISL12022_INT_FO_OFF	0x0
>  #define ISL12022_INT_FO_32K	0x1
> @@ -52,10 +67,18 @@
>  #define ISL12022_REG_VB85_MASK	GENMASK(5, 3)
>  #define ISL12022_REG_VB75_MASK	GENMASK(2, 0)
>  
> +#define ISL12022_ALARM_ENABLE	(1 << 7)	/* for all ALARM registers  */
> +
>  #define ISL12022_BETA_TSE	(1 << 7)
>  
> +static struct i2c_driver isl12022_driver;
> +
>  struct isl12022 {
> +	struct i2c_client *i2c;
> +	struct rtc_device *rtc;
>  	struct regmap *regmap;
> +	int irq;
> +	bool irq_enabled;
>  };
>  
>  static umode_t isl12022_hwmon_is_visible(const void *data,
> @@ -215,6 +238,208 @@ static int isl12022_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	return regmap_bulk_write(regmap, ISL12022_REG_SC, buf, sizeof(buf));
>  }
>  
> +static int isl12022_rtc_read_alarm(struct device *dev,
> +				   struct rtc_wkalrm *alarm)
> +{

Style nit, but I think it's easier to read and grep for if the prototype
is on one line, and it wouldn't go significantly over 80 chars. The file
already has a few lines > 80 chars, and the 80 char limit doesn't really
exist anymore.

> 
> +	struct rtc_time *const tm = &alarm->time;

Hm, declaring auto variables const is quite unusual. I see that a few
other rtc drivers have done this, but I don't it's an example to copy.

> +	struct isl12022 *isl12022 = dev_get_drvdata(dev);
> +	struct regmap *regmap = isl12022->regmap;
> +	uint8_t buf[ISL12022_ALARM_SECTION_LEN];

The kernel normally says u8 (and you do as well in _set_alarm()).

> +	int ret, yr, i;
> +
> +	ret = regmap_bulk_read(regmap, ISL12022_ALARM_SECTION,
> +			       buf, sizeof(buf));
> +	if (ret) {
> +		dev_err(dev, "%s: reading ALARM registers failed\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	dev_dbg(dev,
> +		"%s: sc=%02x, mn=%02x, hr=%02x, dt=%02x, mo=%02x, dw=%02x\n",
> +		__func__, buf[0], buf[1], buf[2], buf[3], buf[4], buf[5]);
> +
> +	tm->tm_sec = bcd2bin(buf[ISL12022_REG_SCA0 - ISL12022_ALARM_SECTION]
> +			     & 0x7F);
> +	tm->tm_min = bcd2bin(buf[ISL12022_REG_MNA0 - ISL12022_ALARM_SECTION]
> +			     & 0x7F);
> +	tm->tm_hour = bcd2bin(buf[ISL12022_REG_HRA0 - ISL12022_ALARM_SECTION]
> +			      & 0x3F);
> +	tm->tm_mday = bcd2bin(buf[ISL12022_REG_DTA0 - ISL12022_ALARM_SECTION]
> +			      & 0x3F);
> +	tm->tm_mon = bcd2bin(buf[ISL12022_REG_MOA0 - ISL12022_ALARM_SECTION]
> +			     & 0x1F) - 1;
> +	tm->tm_wday = buf[ISL12022_REG_DWA0 - ISL12022_ALARM_SECTION] & 0x07;
> +

Here I'd also suggest keeping each assignment on one line, it's rather
hard to read this way.

> 
> +	/* The alarm doesn't store the year so get it from the rtc section */
> +	ret = regmap_read(regmap, ISL12022_REG_YR, &yr);
> +	if (ret) {
> +		dev_err(dev, "%s: reading YR register failed\n", __func__);
> +		return yr;

return ret, presumably.

regmap_read() takes an 'unsigned int *', but yr is int. If the compiler
doesn't warn I suppose it doesn't matter.

I suggest moving the reading of the yr register up to right after the
other regmap_read, then you could also include it in the dev_dbg output,
and all the bcd2bin() conversions are done next to each other.

> +	}
> +	tm->tm_year = bcd2bin(yr) + 100;
> +
> +	for (i = 0 ; i < ISL12022_ALARM_SECTION_LEN ; i++) {

Nit: no spaces before the semicolons.

> +		if (buf[i] & ISL12022_ALARM_ENABLE) {
> +			alarm->enabled = 1;
> +			break;
> +		}
> +	}
> +
> +	dev_dbg(dev, "%s: %ptR\n", __func__, tm);
> +
> +	return 0;
> +}
> +
> +static int isl12022_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
> +{
> +	struct rtc_time *alarm_tm = &alarm->time;
> +	struct isl12022 *isl12022 = dev_get_drvdata(dev);
> +	struct regmap *regmap = isl12022->regmap;
> +	u8 regs[ISL12022_ALARM_SECTION_LEN] = { 0, };
> +	struct rtc_time rtc_tm;
> +	int ret = 0, enable, dw;
> +

Nit: No need to initialize ret when the very first thing you do is
assigning to it.

> +	ret = isl12022_rtc_read_time(dev, &rtc_tm);
> +	if (ret)
> +		return ret;
> +
> +	/* If the alarm time is before the current time disable the alarm */
> +	if (!alarm->enabled || rtc_tm_sub(alarm_tm, &rtc_tm) <= 0)
> +		enable = 0;
> +	else
> +		enable = ISL12022_ALARM_ENABLE;
> +
> +	/* Set non-matching tm_wday to safeguard against early false matching
> +	 * while setting all the alarm registers (this rtc lacks a general
> +	 * alarm/irq enable/disable bit).
> +	 */

Nit: Don't use network comment style.

> +	if (enable) {
> +		ret = regmap_read(regmap, ISL12022_REG_DW, &dw);
> +		if (ret) {
> +			dev_err(dev, "%s: reading DW failed\n", __func__);
> +			return ret;
> +		}
> +		/* ~4 days into the future should be enough to avoid match */
> +		dw = ((dw + 4) % 7) | ISL12022_ALARM_ENABLE;
> +		ret = regmap_write(regmap, ISL12022_REG_DWA0, dw);
> +		if (ret) {
> +			dev_err(dev, "%s: writing DWA0 failed\n", __func__);
> +			return ret;
> +		}
> +	}
> +
> +	/* Program the alarm and enable it for each setting */
> +	regs[ISL12022_REG_SCA0 - ISL12022_ALARM_SECTION] =
> +		bin2bcd(alarm_tm->tm_sec) | enable;
> +	regs[ISL12022_REG_MNA0 - ISL12022_ALARM_SECTION] =
> +		bin2bcd(alarm_tm->tm_min) | enable;
> +	regs[ISL12022_REG_HRA0 - ISL12022_ALARM_SECTION] =
> +		bin2bcd(alarm_tm->tm_hour) | enable;
> +	regs[ISL12022_REG_DTA0 - ISL12022_ALARM_SECTION] =
> +		bin2bcd(alarm_tm->tm_mday) | enable;
> +	regs[ISL12022_REG_MOA0 - ISL12022_ALARM_SECTION] =
> +		bin2bcd(alarm_tm->tm_mon + 1) | enable;
> +	regs[ISL12022_REG_DWA0 - ISL12022_ALARM_SECTION] =
> +		bin2bcd(alarm_tm->tm_wday & 7) | enable;
> +

The dwa0 handling is a nice trick for avoiding triggering a false
alarm. But I do wonder if you might need to do it also for the !enable
case. That is, suppose we've had the alarm set for 01:02:15. The alarm
fires, we do stuff, and then we want to turn it off. So this gets called
with some 00:00:00 value in alarm_tm and enable==0. Then when we start
writing the new register values, as soon as REG_SCA0 has been written
to, the alarm condition for 01:02:xx is automatically satisfied.

If you unconditionally write a "four days in the future, with alarm bit
set" value to DWA0, that should prevent this and the DWA0 does get its
!enable value set via the bulk_write.


> +	/* write ALARM registers */
> +	ret = regmap_bulk_write(regmap, ISL12022_REG_SCA0,
> +				&regs, sizeof(regs));

Nit: Fits in one line (I think), and you probably want to use the
ISL12022_ALARM_SECTION name here, even if they're of course the same.

> +	if (ret) {
> +		dev_err(dev, "%s: writing ALARM registers failed\n", __func__);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static irqreturn_t isl12022_rtc_interrupt(int irq, void *data)
> +{
> +	struct isl12022 *isl12022 = data;
> +	struct rtc_device *rtc = isl12022->rtc;
> +	struct device *dev = &rtc->dev;
> +	struct regmap *regmap = isl12022->regmap;
> +	u32 val = 0;
> +	unsigned long events = 0;
> +	int ret;
> +
> +	ret = regmap_read(regmap, ISL12022_REG_SR, &val);
> +	if (ret) {
> +		dev_err(dev, "%s: reading SR failed\n", __func__);
> +		return IRQ_HANDLED;
> +	}
> +
> +	if (val & ISL12022_SR_ALM)
> +		events |= RTC_IRQF | RTC_AF;
> +
> +	if (events & RTC_AF)
> +		dev_dbg(dev, "alarm!\n");
> +
> +	if (!events)
> +		return IRQ_NONE;
> +
> +	rtc_update_irq(rtc, 1, events);
> +	return IRQ_HANDLED;
> +}
> +
> +static int isl12022_rtc_alarm_irq_enable(struct device *dev,
> +					 unsigned int enabled)
> +{
> +	struct isl12022 *isl12022 = dev_get_drvdata(dev);
> +
> +	if (!isl12022->irq_enabled == !enabled)
> +		return 0;
> +
> +	if (enabled)
> +		enable_irq(isl12022->irq);
> +	else
> +		disable_irq(isl12022->irq);
> +
> +	isl12022->irq_enabled = !!enabled;
> +

I see why you do the ! and !! dances to canonicalize boolean values for
comparison, but it's not very pretty. But ->alarm_irq_enable has the
signature it has (that should probably get changed), so to be safe I
guess you do need them. That said, I don't think it's unreasonable to
assume that ->alarm_irq_enable is only ever invoked with the values 0
and 1 for the enabled argument, and e.g. rtc-cpcap.c gets away with that
assumption.


> +	return 0;
> +}
> +
> +static int isl12022_setup_irq(struct isl12022 *isl12022, int irq)
> +{
> +	struct device *dev = &isl12022->i2c->dev;

I was wondering why you needed to stash the i2c_client, but I see it
here. The other initialization helpers (_set_trip_levels and
_hwmon_register) are passed &client->dev so they have this dev directly,
and they then get the regmap (or, with patch 1, the struct isl12022)
from that with dev_get_drvdata(). For consistency I think you should do
the same, and then you can drop the i2c field in struct isl12022.

> +	struct regmap *regmap = isl12022->regmap;
> +	unsigned int reg_mask, reg_val;
> +	u8 buf[ISL12022_ALARM_SECTION_LEN] = { 0, };
> +	int ret;
> +
> +	/* Clear and disable all alarm registers */
> +	ret = regmap_bulk_write(regmap, ISL12022_ALARM_SECTION,
> +				buf, sizeof(buf));
> +	if (ret)
> +		return ret;
> +
> +	/* Enable automatic reset of ALM bit, enable single event interrupt
> +	 * mode, and disable IRQ/fOUT pin during battery-backup mode.
> +	 */

Network-style.

> +	reg_mask = ISL12022_INT_ARST | ISL12022_INT_IM
> +		| ISL12022_INT_FOBATB | ISL12022_INT_FO_MASK;
> +	reg_val = ISL12022_INT_ARST | ISL12022_INT_FOBATB | ISL12022_INT_FO_OFF;
> +	ret = regmap_write_bits(regmap, ISL12022_REG_INT,
> +				reg_mask, reg_val);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_request_threaded_irq(dev, irq, NULL,
> +					isl12022_rtc_interrupt,
> +					IRQF_SHARED | IRQF_ONESHOT,
> +					isl12022_driver.driver.name,
> +					isl12022);
> +	if (ret) {
> +		dev_err(dev, "Unable to request irq %d\n", irq);
> +		return ret;

This should probably be "return dev_err_probe(...);" - the irq could in
theory be routed to some gpio expander which is not yet probed, so we
could get -EPROBE_DEFER. And regardless, dev_err_probe has the advantage
of printing what the err code actually is.

Rasmus

