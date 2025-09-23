Return-Path: <linux-rtc+bounces-5015-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B47DB96A0B
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Sep 2025 17:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4766D19C40F2
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Sep 2025 15:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D806221D3F3;
	Tue, 23 Sep 2025 15:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D6j4Z0+K"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5501B423C
	for <linux-rtc@vger.kernel.org>; Tue, 23 Sep 2025 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758642058; cv=none; b=WLNU/RUQ+ZBmW+bPDQvnKpXfsK5rJ1VFxh14R4ZeBOcWIgaLe9Cwv+r20ORX4UN4E7EfelCyCNjWxad0ytKdhoNhjMf5EHdnjnoLyuV/VEKF7mfGwjV3Pib9rhcRHc71rsbemT8MZNo5dxFY0N0rIqF9vK7mpLWgyEIaAt57t+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758642058; c=relaxed/simple;
	bh=cACrfqWg25l/iYQSJFhtVnbCEWxiQEtu5DRwgu44ukU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2OVm0D/iTtiJ0DKjxlPb5ZfV++A87AViwST0gOixqMKGH8LarNFPm/LqHna4u9oGnLLQLwD1c3kzn0Pwt2lTjl2oEOlimvYLsW6GFhi4hSlBse+R9hOHRn1mw3NzVyyfHGWooWxshCqMhWsWg3NqnC3ADeVk9rOylAu7vaZtLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=D6j4Z0+K; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1684A1A0EBF;
	Tue, 23 Sep 2025 15:40:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D839960690;
	Tue, 23 Sep 2025 15:40:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91187102F1960;
	Tue, 23 Sep 2025 17:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758642052; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=B8fRR2aJ/eyeHiuDlU1x25moOhg9RitGZKqikYnDMdI=;
	b=D6j4Z0+KoQ4HRpZjE+nkK2FQivQ1dSRfumFHnpIrO/qWLcALZFBydRIpwqAO2H8bNj+Nvn
	OZR65wzg7C+RDl9p/BUslV10CHpcuD8F5Wl8hO0T44Npvs5z23qK5vct4S7HAcgQcZpi28
	1kHuRlj8FA34KXgwNUrRJfbfSdQIGg5J3BVme6lTsbKZafGA4R8Bu9KOo0LV7Mq0q/W2UF
	9POSnDH2NqAu3kTCnvVtCZs4CScWUZJLOPu196fYHaz8Ya6003pwj5S+P2X8AiWsj8mrCo
	8+Kw90Pf4Yt+hXuOyzzW9sdkO9MV7l6VhBlATJ+mTOJ+t/lrjDcRySAlrTbddA==
Date: Tue, 23 Sep 2025 17:40:48 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Shubhi Garg <shgarg@nvidia.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v6 3/4] rtc: nvvrs: add NVIDIA VRS RTC device driver
Message-ID: <202509231540480daf8b56@mail.local>
References: <20250919140229.10546-1-shgarg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919140229.10546-1-shgarg@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3

On 19/09/2025 14:02:29+0000, Shubhi Garg wrote:
> +static int nvvrs_rtc_enable_alarm(struct nvvrs_rtc_info *info)
> +{
> +	int ret;
> +
> +	/* Set RTC_WAKE bit for autonomous wake from sleep */
> +	ret = nvvrs_update_bits(info, NVVRS_REG_CTL_2, NVVRS_REG_CTL_2_RTC_WAKE,
> +				NVVRS_REG_CTL_2_RTC_WAKE);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to set RTC_WAKE bit (%d)\n", ret);

This should be either a dev_dbg or removed

> +		return ret;
> +	}
> +
> +	/* Set RTC_PU bit for autonomous wake from shutdown */
> +	ret = nvvrs_update_bits(info, NVVRS_REG_CTL_2, NVVRS_REG_CTL_2_RTC_PU,
> +				NVVRS_REG_CTL_2_RTC_PU);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to set RTC_PU bit (%d)\n", ret);

Ditto

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int nvvrs_rtc_disable_alarm(struct nvvrs_rtc_info *info)
> +{
> +	struct i2c_client *client = info->client;
> +	u8 val[4];
> +	int ret;
> +
> +	/* Clear RTC_WAKE bit */
> +	ret = nvvrs_update_bits(info, NVVRS_REG_CTL_2, NVVRS_REG_CTL_2_RTC_WAKE,
> +				0);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to clear RTC_WAKE bit (%d)\n", ret);

Ditto

> +		return ret;
> +	}
> +
> +	/* Clear RTC_PU bit */
> +	ret = nvvrs_update_bits(info, NVVRS_REG_CTL_2, NVVRS_REG_CTL_2_RTC_PU,
> +				0);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to clear RTC_PU bit (%d)\n", ret);

Ditto

> +		return ret;
> +	}
> +
> +	/* Write ALARM_RESET_VAL in RTC Alarm register to disable alarm */
> +	val[0] = 0xff;
> +	val[1] = 0xff;
> +	val[2] = 0xff;
> +	val[3] = 0xff;
> +
> +	ret = nvvrs_rtc_write_alarm(client, val);
> +	if (ret < 0)
> +		dev_err(info->dev, "Failed to disable Alarm (%d)\n", ret);

Ditto

> +
> +	return 0;

Plus it fails but then returns 0

> +}
> +
> +static int nvvrs_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
> +	time64_t secs = 0;
> +	int ret;
> +	u8 val;
> +
> +	mutex_lock(&info->lock);

This lock is unnecessary once you use rtc_lock/rtc_unlock in the IRQ
handler.

> +
> +	/*
> +	 * Multi-byte transfers are not supported with PEC enabled
> +	 * Read MSB first to avoid coherency issues
> +	 */
> +	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_T3);
> +	if (ret < 0)
> +		goto out;
> +
> +	val = (u8)ret;
> +	secs |= (time64_t)val << 24;
> +
> +	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_T2);
> +	if (ret < 0)
> +		goto out;
> +
> +	val = (u8)ret;
> +	secs |= (time64_t)val << 16;
> +
> +	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_T1);
> +	if (ret < 0)
> +		goto out;
> +
> +	val = (u8)ret;
> +	secs |= (time64_t)val << 8;
> +
> +	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_T0);
> +	if (ret < 0)
> +		goto out;
> +
> +	val = (u8)ret;
> +	secs |= val;
> +
> +	rtc_time64_to_tm(secs, tm);
> +	ret = 0;
> +out:
> +	mutex_unlock(&info->lock);
> +	return ret;
> +}
> +
> +static int nvvrs_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
> +	time64_t secs;
> +	u8 time[4];
> +	int ret;
> +
> +	mutex_lock(&info->lock);

Ditto

> +
> +	secs = rtc_tm_to_time64(tm);
> +	time[0] = secs & 0xff;
> +	time[1] = (secs >> 8) & 0xff;
> +	time[2] = (secs >> 16) & 0xff;
> +	time[3] = (secs >> 24) & 0xff;
> +
> +	ret = i2c_smbus_write_byte_data(info->client, NVVRS_REG_RTC_T3, time[3]);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = i2c_smbus_write_byte_data(info->client, NVVRS_REG_RTC_T2, time[2]);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = i2c_smbus_write_byte_data(info->client, NVVRS_REG_RTC_T1, time[1]);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = i2c_smbus_write_byte_data(info->client, NVVRS_REG_RTC_T0, time[0]);
> +out:
> +	mutex_unlock(&info->lock);
> +	return ret;
> +}
> +
> +static int nvvrs_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
> +	time64_t alarm_val = 0;
> +	int ret;
> +	u8 val;
> +
> +	mutex_lock(&info->lock);

Ditto

> +
> +	/* Multi-byte transfers are not supported with PEC enabled */
> +	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_A3);
> +	if (ret < 0)
> +		goto out;
> +
> +	val = (u8)ret;
> +	alarm_val |= (time64_t)val << 24;
> +
> +	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_A2);
> +	if (ret < 0)
> +		goto out;
> +
> +	val = (u8)ret;
> +	alarm_val |= (time64_t)val << 16;
> +
> +	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_A1);
> +	if (ret < 0)
> +		goto out;
> +
> +	val = (u8)ret;
> +	alarm_val |= (time64_t)val << 8;
> +
> +	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_A0);
> +	if (ret < 0)
> +		goto out;
> +
> +	val = (u8)ret;
> +	alarm_val |= val;
> +
> +	if (alarm_val == ALARM_RESET_VAL)
> +		alrm->enabled = 0;
> +	else
> +		alrm->enabled = 1;
> +
> +	rtc_time64_to_tm(alarm_val, &alrm->time);
> +	ret = 0;
> +out:
> +	mutex_unlock(&info->lock);
> +	return ret;
> +}
> +
> +static int nvvrs_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
> +	time64_t secs;
> +	u8 time[4];
> +	int ret;
> +
> +	mutex_lock(&info->lock);
> +

Ditto

> +	if (!alrm->enabled) {
> +		ret = nvvrs_rtc_disable_alarm(info);
> +		if (ret < 0)
> +			goto out;
> +	}
> +
> +	ret = nvvrs_rtc_enable_alarm(info);
> +	if (ret < 0)
> +		goto out;
> +
> +	secs = rtc_tm_to_time64(&alrm->time);
> +	time[0] = secs & 0xff;
> +	time[1] = (secs >> 8) & 0xff;
> +	time[2] = (secs >> 16) & 0xff;
> +	time[3] = (secs >> 24) & 0xff;
> +
> +	ret = nvvrs_rtc_write_alarm(info->client, time);
> +
> +out:
> +	mutex_unlock(&info->lock);
> +	return ret;
> +}
> +
> +static int nvvrs_pseq_irq_clear(struct nvvrs_rtc_info *info)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < NVVRS_IRQ_REG_COUNT; i++) {
> +		ret = i2c_smbus_read_byte_data(info->client,
> +					       NVVRS_REG_INT_SRC1 + i);
> +		if (ret < 0) {
> +			dev_err(info->dev, "Failed to read INT_SRC%d : %d\n",
> +				i + 1, ret);
> +			return ret;
> +		}
> +
> +		ret = i2c_smbus_write_byte_data(info->client,
> +						NVVRS_REG_INT_SRC1 + i,
> +						(u8)ret);
> +		if (ret < 0) {
> +			dev_err(info->dev, "Failed to clear INT_SRC%d : %d\n",
> +				i + 1, ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static irqreturn_t nvvrs_rtc_irq_handler(int irq, void *data)
> +{
> +	struct nvvrs_rtc_info *info = data;
> +	int ret;
> +
> +	/* Check for RTC alarm interrupt */
> +	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_INT_SRC1);
> +	if (ret < 0) {
> +		dev_err(info->dev, "Failed to read INT_SRC1: %d\n", ret);

dev_dbg or remove

> +		return IRQ_NONE;
> +	}
> +
> +	if (ret & NVVRS_INT_SRC1_RTC_MASK) {
> +		rtc_lock(info->rtc);
> +		rtc_update_irq(info->rtc, 1, RTC_IRQF | RTC_AF);
> +		rtc_unlock(info->rtc);
> +	}
> +
> +	/* Clear all interrupts */
> +	if (nvvrs_pseq_irq_clear(info) < 0)
> +		return IRQ_NONE;
> +
> +	return IRQ_HANDLED;
> +}
> +


> diff --git a/include/linux/rtc/rtc-nvidia-vrs10.h b/include/linux/rtc/rtc-nvidia-vrs10.h
> new file mode 100644
> index 000000000000..3c9c46abf555
> --- /dev/null
> +++ b/include/linux/rtc/rtc-nvidia-vrs10.h

Just to be sure, do you expect to use this include in another driver?
Else you should merge it back in the c file.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

