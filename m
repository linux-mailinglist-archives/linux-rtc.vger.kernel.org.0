Return-Path: <linux-rtc+bounces-3709-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8273DA770C3
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Apr 2025 00:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1B5A3A5F09
	for <lists+linux-rtc@lfdr.de>; Mon, 31 Mar 2025 22:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCC521A435;
	Mon, 31 Mar 2025 22:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hWybcMrN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160681C84A8;
	Mon, 31 Mar 2025 22:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743459348; cv=none; b=Endj2iWp9opwveh9ypiBLrlwFBn4FgEnbUcNov6v8pwWf/H+WfE5CKOpkj+EpnJltfyzMn7IMbI/xiC4kvX7qbgGTtYpKjr4DlZ1xe+8QCVkfmIccv3OwIX0fCVqqFv8SNGCGMnHdrE7ZcLqk6ogR1UGlXth59/zaKwzIbYs9R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743459348; c=relaxed/simple;
	bh=DXHNgC9u7F/B2rk34x1znouVFni7VyAMhA7DmKYX5qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyEQiuP5mdn4ni05yX5+E7PFwEkK0IUuXJNVVfpPXPREBkQFahUHbrmwZqSQFfbTK9x357TWptvjLHZdiuofRRfmp6+VhXSsJ3M3ttlkMC60TI0w59uAZYzLESL6OhumFWFW6S86c7XoYnnKLrFc+G0ftBcQq4Wr0h45q4k0NGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hWybcMrN; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9AD8141CFD;
	Mon, 31 Mar 2025 22:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743459343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zKtwzYZyYEOGb0aUEyAXc3Npq7YihIF9DXGldVsUnJ4=;
	b=hWybcMrNW/gnJU2OanXhsyF9UN+dr7/1654VD0hYR4BLpAl//uYF+ncJA7sjKdR1XYqlX4
	+1NkeAmsEFTQryvp1+Q7jruSWxqiJ3WxoSCw6PdtyYZL9oVns7/NI446AA15U73XASUO7n
	/0cefSHNlcmulnDXhBvYKfyIY++joGwqEe0KF+6OyrSXGVXyXyrgPIJKze89lA3S3qqFZU
	EvANNM+9jGilTOCISjkZbXBfFlHBjEEoBmpEzVZbfub3/5BssRhsxiySWbK+77Pk3rombR
	ltbMkXwRhOVqF/BeKHEfx5Ae7Tf7v2qeD7ADiF+aQCpbFFHfieeFUlb1LcVhQA==
Date: Tue, 1 Apr 2025 00:15:41 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: CL Wang <cl634@andestech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, tim609@andestech.com,
	ycliang@andestech.com
Subject: Re: [PATCH V5 1/3] rtc: atcrtc100: Add ATCRTC100 RTC driver
Message-ID: <20250331221541333bf9cf@mail.local>
References: <20250110092702.1146356-1-cl634@andestech.com>
 <20250110092702.1146356-2-cl634@andestech.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110092702.1146356-2-cl634@andestech.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtoheptghlieefgeesrghnuggvshhtvggthhdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughts
 ehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhimheitdelsegrnhguvghsthgvtghhrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

I'm sorry for the late review, I was pretty sure I reviewed v4.

On 10/01/2025 17:27:00+0800, CL Wang wrote:
> +#define RTC_SECOND(x)	((x >> SEC_OFF) & SEC_MSK)	/* RTC sec */
> +#define RTC_MINUTE(x)	((x >> MIN_OFF) & MIN_MSK)	/* RTC min */
> +#define RTC_HOUR(x)	((x >> HOUR_OFF) & HOUR_MSK)	/* RTC hour */
> +#define RTC_DAYS(x)	((x >> DAY_OFF) & DAY_MSK)	/* RTC day */

FIELD_PREP can probably replace those.



> +
> +#define RTC_CR		0x18	/* Control */
> +#define RTC_EN		(0x1UL << 0)
> +#define ALARM_WAKEUP	(0x1UL << 1)
> +#define ALARM_INT	(0x1UL << 2)
> +#define DAY_INT		(0x1UL << 3)
> +#define HOUR_INT	(0x1UL << 4)
> +#define MIN_INT		(0x1UL << 5)
> +#define SEC_INT		(0x1UL << 6)
> +#define HSEC_INT	(0x1UL << 7)
> +#define RTC_STA		0x1C	/* Status */
> +#define WRITE_DONE	(0x1UL << 16)
> +#define RTC_TRIM	0x20	/* Digital Trimming */
> +
> +#define ATCRTC_TIME_TO_SEC(D, H, M, S)	(D * 86400LL + H * 3600 + M * 60 + S)
> +
> +#define ATCRTC_TIMEOUT_US		1000000
> +#define ATCRTC_TIMEOUT_USLEEP_MIN	20
> +#define ATCRTC_TIMEOUT_USLEEP_MAX	30
> +
> +struct atcrtc_dev {
> +	struct rtc_device	*rtc_dev;
> +	struct regmap		*regmap;
> +	struct delayed_work	rtc_work;
> +	struct mutex		lock;

This mutex is not necessary, simply use rtc_lock() in you interrupt
handler, the rtc core is already locking before calling the rtc_ops.

> +	unsigned int		alarm_irq;
> +	unsigned int		time_irq;
> +	unsigned char		alarm_en;
> +};
> +
> +/**
> + * atcrtc_check_write_done - Check whether the ATCRTC100 is ready or not.
> + * @rtc: Pointer of atcrtc_dev.
> + *
> + * The WriteDone bit in the status register indicates the synchronization
> + * progress of RTC register updates. This bit is cleared to zero whenever
> + * any RTC control register such as the Counter, Alarm, Control, or Digital
> + * Trimming registers is updated. It returns to one only after all previous
> + * updates to these registers have been fully synchronized to the RTC clock
> + * domain. If a register update is in the process of being synchronized, a
> + * second update to the same register may be ignored.
> + */
> +static int atcrtc_check_write_done(struct atcrtc_dev *rtc)
> +{
> +	int loop;
> +	int timeout;
> +
> +	might_sleep();
> +	timeout = ATCRTC_TIMEOUT_US / ATCRTC_TIMEOUT_USLEEP_MIN;
> +
> +	for (loop = 0; loop < timeout; loop++) {
> +		if (regmap_test_bits(rtc->regmap, RTC_STA, WRITE_DONE))
> +			return 0;
> +
> +		usleep_range(ATCRTC_TIMEOUT_USLEEP_MIN,
> +			     ATCRTC_TIMEOUT_USLEEP_MAX);
> +	}
> +	dev_err(&rtc->rtc_dev->dev, "Device is busy too long\n");

Is this error message useful, what would be the user action after seeing
this?

> +	return -EBUSY;
> +}
> +


 +
> +static time64_t atcrtc_read_rtc_time(struct atcrtc_dev *rtc)

Does this have to be in a separate function?

> +{
> +	time64_t time;
> +	unsigned int rtc_cnt;
> +
> +	regmap_read(rtc->regmap, RTC_CNT, &rtc_cnt);
> +	time = ATCRTC_TIME_TO_SEC(RTC_DAYS(rtc_cnt),
> +				  RTC_HOUR(rtc_cnt),
> +				  RTC_MINUTE(rtc_cnt),
> +				  RTC_SECOND(rtc_cnt));
> +	return time;
> +}
> +
> +static int atcrtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct atcrtc_dev *rtc = dev_get_drvdata(dev);
> +	time64_t time;
> +
> +	mutex_lock(&rtc->lock);
> +	time = atcrtc_read_rtc_time(rtc);
> +	mutex_unlock(&rtc->lock);
> +
> +	rtc_time64_to_tm(time, tm);
> +	if (rtc_valid_tm(tm) < 0) {

This is not necessary, the core always checks whether the tm is valid.

> +		dev_err(dev, "Invalid date: %lld\n", time);
> +		rtc_time64_to_tm(0, tm);
> +	}
> +	return 0;
> +}
> +
> +static void atcrtc_set_rtc_time(struct atcrtc_dev *rtc, time64_t time)
> +{
> +	int rem;
> +	unsigned int counter;
> +	unsigned int day;
> +	unsigned int hour;
> +	unsigned int min;
> +	unsigned int sec;
> +
> +	day = div_s64_rem(time, 86400, &rem);
> +	hour = rem / 3600;
> +	rem -= hour * 3600;
> +	min = rem / 60;
> +	sec = rem - min * 60;

You already had the broken down hour, min and sec, it is not necessary
to compute that again here, just fold this function in atcrtc_set_time

> +	counter = ((day & DAY_MSK) << DAY_OFF)
> +		  | ((hour & HOUR_MSK) << HOUR_OFF)
> +		  | ((min & MIN_MSK) << MIN_OFF)
> +		  | ((sec & SEC_MSK) << SEC_OFF);
> +
> +	regmap_write(rtc->regmap, RTC_CNT, counter);
> +}
> +
> +static int atcrtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct atcrtc_dev *rtc = dev_get_drvdata(dev);
> +	time64_t sys_time;
> +	int ret;
> +
> +	sys_time = rtc_tm_to_time64(tm);
> +
> +	mutex_lock(&rtc->lock);
> +
> +	ret = atcrtc_check_write_done(rtc);
> +	if (ret) {
> +		mutex_unlock(&rtc->lock);
> +		return ret;
> +	}
> +	atcrtc_set_rtc_time(rtc, sys_time);
> +
> +	mutex_unlock(&rtc->lock);
> +
> +	return 0;
> +}
> +
> +static int atcrtc_read_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
> +{
> +	struct atcrtc_dev *rtc = dev_get_drvdata(dev);
> +	struct rtc_time *tm = &wkalrm->time;
> +	unsigned int rtc_alarm;
> +
> +	mutex_lock(&rtc->lock);
> +
> +	regmap_read(rtc->regmap, RTC_ALM, &rtc_alarm);
> +	wkalrm->enabled = regmap_test_bits(rtc->regmap, RTC_CR, ALARM_INT);
> +
> +	mutex_unlock(&rtc->lock);
> +
> +	tm->tm_hour = (rtc_alarm >> HOUR_OFF) & HOUR_MSK;
> +	tm->tm_min  = (rtc_alarm >> MIN_OFF) & MIN_MSK;
> +	tm->tm_sec  = (rtc_alarm >> SEC_OFF) & SEC_MSK;
> +
> +	return 0;
> +}
> +
> +static int atcrtc_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
> +{
> +	struct atcrtc_dev *rtc = dev_get_drvdata(dev);
> +	struct rtc_time *tm = &wkalrm->time;
> +	unsigned int alm = 0;
> +	int ret = rtc_valid_tm(tm);
> +
> +	if (ret < 0) {
> +		dev_err(dev, "Invalid alarm value: %d\n", ret);
> +		return ret;
> +	}
> +
> +	mutex_lock(&rtc->lock);
> +
> +	ret = atcrtc_check_write_done(rtc);
> +	if (ret) {
> +		mutex_unlock(&rtc->lock);
> +		return ret;
> +	}
> +
> +	/* Disable alarm interrupt and clear the alarm flag */
> +	regmap_update_bits(rtc->regmap, RTC_CR, ALARM_INT, 0);
> +	rtc->alarm_en = 0;
> +
> +	/* Set alarm time */
> +	alm |= ((tm->tm_sec & SEC_MSK) << SEC_OFF);
> +	alm |= ((tm->tm_min & MIN_MSK) << MIN_OFF);
> +	alm |= ((tm->tm_hour & HOUR_MSK) << HOUR_OFF);
> +	regmap_write(rtc->regmap, RTC_ALM, alm);
> +
> +	if (wkalrm->enabled) {
> +		rtc->alarm_en = 1;
> +		ret = atcrtc_check_write_done(rtc);
> +		if (ret) {
> +			mutex_unlock(&rtc->lock);
> +			return ret;
> +		}
> +
> +		regmap_update_bits(rtc->regmap, RTC_CR, ALARM_INT, ALARM_INT);
> +	}
> +
> +	mutex_unlock(&rtc->lock);
> +	return 0;
> +}
> +
> +static int atcrtc_hw_init(struct atcrtc_dev *rtc)
> +{
> +	unsigned int rtc_id;
> +	int ret;
> +
> +	regmap_read(rtc->regmap, RTC_ID, &rtc_id);
> +	if ((rtc_id & ID_MSK) != ATCRTC100ID)
> +		return -ENOENT;
> +
> +	ret = atcrtc_check_write_done(rtc);
> +	if (ret)
> +		return ret;
> +	regmap_update_bits(rtc->regmap, RTC_CR, RTC_EN, RTC_EN);

This is losing some important information, the RTC must only be enabled
once the time has been correctly set, then you can check RTC_EN in
atcrtc_read_time() to know whether the time is actually valid or not.

> +
> +	return 0;
> +}
> +
> +static const struct rtc_class_ops rtc_ops = {
> +	.read_time = atcrtc_read_time,
> +	.set_time = atcrtc_set_time,
> +	.read_alarm = atcrtc_read_alarm,
> +	.set_alarm = atcrtc_set_alarm,
> +	.alarm_irq_enable = atcrtc_alarm_irq_enable,
> +};
> +
> +static int atcrtc_probe(struct platform_device *pdev)
> +{
> +	struct atcrtc_dev *atcrtc_dev;
> +	void __iomem *reg_base;
> +	int ret = 0;
> +
> +	atcrtc_dev = devm_kzalloc(&pdev->dev, sizeof(*atcrtc_dev), GFP_KERNEL);
> +	if (!atcrtc_dev)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, atcrtc_dev);
> +	mutex_init(&atcrtc_dev->lock);
> +
> +	reg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(reg_base)) {
> +		dev_err(&pdev->dev,
> +			"Failed to map I/O space: %ld\n",
> +			PTR_ERR(reg_base));
> +		return PTR_ERR(atcrtc_dev->regmap);
> +	}
> +
> +	atcrtc_dev->regmap = devm_regmap_init_mmio(&pdev->dev,
> +						   reg_base,
> +						   &atcrtc_regmap_config);
> +	if (IS_ERR(atcrtc_dev->regmap)) {
> +		dev_err(&pdev->dev,
> +			"Failed to initialize regmap: %ld\n",
> +			PTR_ERR(atcrtc_dev->regmap));
> +		return PTR_ERR(atcrtc_dev->regmap);
> +	}
> +
> +	ret = atcrtc_hw_init(atcrtc_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to initialize driver: %d\n", ret);
> +		return ret;
> +	}
> +
> +	atcrtc_dev->alarm_irq = platform_get_irq(pdev, 1);
> +	if (atcrtc_dev->alarm_irq < 0) {
> +		dev_err(&pdev->dev,
> +			"Failed to get IRQ for alarm: %d\n",
> +			atcrtc_dev->alarm_irq);
> +		return atcrtc_dev->alarm_irq;
> +	}
> +	atcrtc_dev->time_irq = platform_get_irq(pdev, 0);
> +	if (atcrtc_dev->time_irq < 0) {
> +		dev_err(&pdev->dev,
> +			"Failed to get IRQ for periodic interrupt: %d\n",
> +			atcrtc_dev->time_irq);
> +		return atcrtc_dev->time_irq;
> +	}
> +
> +	ret = devm_request_irq(&pdev->dev,
> +			       atcrtc_dev->alarm_irq,
> +			       atcrtc_alarm_isr,
> +			       0,
> +			       "atcrtc alarm",
> +			       atcrtc_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +			"Failed to request IRQ %d for alarm: %d\n",
> +			atcrtc_dev->alarm_irq,
> +			ret);
> +		return ret;
> +	}
> +
> +	ret = devm_request_irq(&pdev->dev,
> +			       atcrtc_dev->time_irq,
> +			       atcrtc_periodic_isr,
> +			       0,
> +			       "atcrtc time",
> +			       atcrtc_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +			"Failed to request IRQ %d for periodic interrupt: %d\n",
> +			atcrtc_dev->time_irq,
> +			ret);
> +		return ret;
> +	}
> +
> +	atcrtc_dev->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(atcrtc_dev->rtc_dev)) {
> +		dev_err(&pdev->dev,
> +			"Failed to allocate RTC device: %ld\n",
> +			PTR_ERR(atcrtc_dev->rtc_dev));
> +		return PTR_ERR(atcrtc_dev->rtc_dev);
> +	}
> +
> +	ret = atcrtc_alarm_enable(&pdev->dev, true);

Can't atcrtc_alarm_enable be part of atcrtc_hw_init so you don't have to
wait twice?

> +	if (ret)
> +		return ret;
> +	set_bit(RTC_FEATURE_ALARM, atcrtc_dev->rtc_dev->features);
> +
> +	ret = device_init_wakeup(&pdev->dev, true);
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +			"Failed to initialize wake device: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	ret = dev_pm_set_wake_irq(&pdev->dev, atcrtc_dev->alarm_irq);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to set wake IRQ: %d\n", ret);
> +		device_init_wakeup(&pdev->dev, false);
> +		return ret;
> +	}
> +
> +	atcrtc_dev->rtc_dev->ops = &rtc_ops;
> +	/*
> +	 * There are 15 bits in the Day field of the Counter register.
> +	 * It can count up to 32,767 days, about 89.8 years.
> +	 */
> +	atcrtc_dev->rtc_dev->range_max = mktime64(2089, 12, 31, 23, 59, 59);
> +	atcrtc_dev->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_2000;
> +
> +	INIT_DELAYED_WORK(&atcrtc_dev->rtc_work, atcrtc_alarm_clear);
> +	return devm_rtc_register_device(atcrtc_dev->rtc_dev);
> +}
> +
> +static int atcrtc_resume(struct device *dev)
> +{
> +	struct atcrtc_dev *rtc = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		disable_irq_wake(rtc->alarm_irq);
> +
> +	return 0;
> +}
> +
> +static int atcrtc_suspend(struct device *dev)
> +{
> +	struct atcrtc_dev *rtc = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(rtc->alarm_irq);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(atcrtc_pm_ops, atcrtc_suspend, atcrtc_resume);
> +
> +static const struct of_device_id atcrtc_dt_match[] = {
> +	{ .compatible = "andestech,atcrtc100" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, atcrtc_dt_match);
> +
> +static struct platform_driver atcrtc_platform_driver = {
> +	.driver = {
> +		.name = "atcrtc100",
> +		.of_match_table = atcrtc_dt_match,
> +		.pm = pm_sleep_ptr(&atcrtc_pm_ops),
> +	},
> +	.probe = atcrtc_probe,
> +};
> +
> +module_platform_driver(atcrtc_platform_driver);
> +
> +MODULE_AUTHOR("CL Wang <cl634@andestech.com>");
> +MODULE_DESCRIPTION("Andes ATCRTC100 driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

