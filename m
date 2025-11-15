Return-Path: <linux-rtc+bounces-5388-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5264AC603CA
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Nov 2025 12:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C6B3C4E1118
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Nov 2025 11:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2A2296BCF;
	Sat, 15 Nov 2025 11:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X58+ep/2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939A2215F42
	for <linux-rtc@vger.kernel.org>; Sat, 15 Nov 2025 11:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763205879; cv=none; b=egHC50EfoN8oXjL0pDZjvCSIvGevRs28Z5/ZNXYaq0nZ6Y4GPG6YoCXaERWahmCDwRDRw/N9pTMQRxsHbETtlw7EVpx6lCmb26pwR9a4HXChiJwHuqQeE5CyO2SYrHZlUzV/ONpHzsNg0igIteBnNxDKoRRlB3gOqyMUC1kViCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763205879; c=relaxed/simple;
	bh=v5UlNPC/lakSFDvys/q/nnHJBSwI0Dw5gWDyd9Mrd1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kv78ieETOa1vGhgeHS3wKIUo3EjEjLEGQwzBYuH0u0OLEmD7H6u2mTul5fEqqEl4+DOf9wAVpNEgyzTe1XuXD3ujG9slOIy0PZMh4UFCfqwzRcB3FfUtuybrDzDVqPOyb+0FCCGZyRiDtduFDvjVfSYrvsPBCpcIPSKaEjQdXJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=X58+ep/2; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F027D4E416D8;
	Sat, 15 Nov 2025 11:24:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B23D0606F6;
	Sat, 15 Nov 2025 11:24:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90B5D102F292F;
	Sat, 15 Nov 2025 12:24:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763205865; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=HpNz9Cu3q9p2wMmkZUvv4j7gSeSBVZhvbdcbSuROpOs=;
	b=X58+ep/21AL5v2yT09qvxFwy9u33VPDq724RxE74mn/VfUQpVaB3NReWhLwwHW8iDaMvUz
	VetH4nazf0NxkCnhRcRxgUviII15U5B/xr5alRlXzchz14Ed5xHhQrYI8jXGY7XcdSIsII
	D0S66rz/hUvXxI1WvaRwgMk1c7nSZztk64dgmb/Bj7l+lb2VuqQB9I5lar0/UZAa3cS6+N
	iNm/yEC+cvTh3Z94mOZ6obTV6ySegLnX7anhiICGtyuJHBeGwpUJBK31PtMhW1PfYK2IkV
	l8W9qmnhKtvJuWrjGfJ1Pz0K3rkBygWth3ZhQIVW3AQOwDynoF1tsDungviE/w==
Date: Sat, 15 Nov 2025 12:24:21 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: andriy.shevchenko@intel.com, david.daney@cavium.com,
	ddaney@caviumnetworks.com, david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com
Subject: Re: [PATCH] rtc: isl12026: Implement callbacks for alarm feature
Message-ID: <20251115112421bdd368f5@mail.local>
References: <20251115-1156-3147571@bhairav-test.ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251115-1156-3147571@bhairav-test.ee.iitb.ac.in>
X-Last-TLS-Session-Version: TLSv1.3

On 15/11/2025 16:35:06+0530, Akhilesh Patil wrote:
> Add alarm support for isl12026 RTC. Implement alarm function rtc
> class callbacks - set_alarm, read_alarm and alarm_irq_enable.
> isl12026 rtc has 2 alarms, this patch adds support to configure alarm0.
> Note: isl12026 rtc chip share same pin(4) for alarm interrupt and square
> wave frequency generator, hence forcefully disable SQW functionality
> while writing to device registers in alarm functions.
> 
> Tested on TI am62x sk board on i2c-2 port using selftests/rtc/rtctest
> 
> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> ---
> Datasheet of RTC chip.
> https://www.renesas.com/en/document/dst/isl12026-isl12026a-datasheet?srsltid=AfmBOopgN4vtn8XoN-8sOCfTW6yiLH-T7eeH_IWakqZ2VmENmWFqqh7w
> 
>  drivers/rtc/rtc-isl12026.c | 127 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 127 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-isl12026.c b/drivers/rtc/rtc-isl12026.c
> index 2aabb9151d4c..7fa9ec7e4929 100644
> --- a/drivers/rtc/rtc-isl12026.c
> +++ b/drivers/rtc/rtc-isl12026.c
> @@ -34,6 +34,11 @@
>  #define ISL12026_PAGESIZE 16
>  #define ISL12026_NVMEM_WRITE_TIME 20
>  
> +#define ISL12026_AL0_REG_SC	0x0
> +#define ISL12026_REG_INT	0x11
> +#define ISL12026_AL0E		BIT(5)
> +#define ISL12026_SR_AL0         BIT(5)
> +
>  struct isl12026 {
>  	struct rtc_device *rtc;
>  	struct i2c_client *nvm_client;
> @@ -269,9 +274,131 @@ static int isl12026_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  	return ret;
>  }
>  
> +static int isl12026_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	int ret;
> +	u8 buf_alrm_vals[7];
> +	struct i2c_msg msg;
> +	int ir;
> +
> +	msg.addr = client->addr;
> +	msg.flags = 0x0; /* Write operation */
> +	msg.buf = buf_alrm_vals;
> +	msg.len = sizeof(buf_alrm_vals);
> +
> +	if (!alrm->enabled) {
> +		/* Disable alarm and return */

You still need to set the alarm time and date properly, the application
is allowed to first set the alarm and then enable it.

> +		ir = isl12026_read_reg(client, ISL12026_REG_INT);
> +		if (ir < 0)
> +			return ir;
> +		ir &= ~ISL12026_AL0E;
> +		ret = isl12026_write_reg(client, ISL12026_REG_INT, ir);
> +
> +		return ret;
> +	}
> +
> +	/* Prepare 5 bytes alarm data SC, MN, HR, DT, MO */
> +	buf_alrm_vals[0] = 0x0;
> +	buf_alrm_vals[1] = ISL12026_AL0_REG_SC;
> +	buf_alrm_vals[2] = (bin2bcd(alrm->time.tm_sec) & 0x7f) | 0x80;
> +	buf_alrm_vals[3] = (bin2bcd(alrm->time.tm_min) & 0x7f) | 0x80;
> +	buf_alrm_vals[4] = (bin2bcd(alrm->time.tm_hour) & 0x3f) | 0x80;
> +	buf_alrm_vals[5] = (bin2bcd(alrm->time.tm_mday) & 0x3f) | 0x80;
> +	buf_alrm_vals[6] = (bin2bcd(alrm->time.tm_mon + 1) & 0x1f) | 0x80;
> +
> +	/* Non-volatile Page write to AL0 registers and enable INT */
> +	ret = isl12026_arm_write(client);
> +	if (ret < 0)
> +		return ret;
> +	ret = i2c_transfer(client->adapter, &msg, 1);
> +	msleep(ISL12026_NVMEM_WRITE_TIME);
> +	if (ret != 1) {
> +		dev_err(&client->dev, "Error writing to alarm registers\n");

No need for an error message.

> +		return ret < 0 ? ret : -EIO;
> +	}
> +
> +	/* Enable AL0 interrupt */
> +	ret = isl12026_write_reg(client, ISL12026_REG_INT, ISL12026_AL0E);
> +
> +	return ret;
> +}
> +
> +static int isl12026_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	int ret;
> +	int sr, ir;
> +	u8 buf_alrm_vals[5];
> +	u8 addr[2] = {0x0, ISL12026_AL0_REG_SC};
> +	struct i2c_msg msgs[2] = { };
> +
> +	msgs[0].addr = client->addr;
> +	msgs[0].flags = 0x0; /* Write register address */
> +	msgs[0].buf = addr;
> +	msgs[0].len = sizeof(addr);
> +
> +	msgs[1].addr = client->addr;
> +	msgs[1].flags = I2C_M_RD; /* Alarm read operation */
> +	msgs[1].buf = buf_alrm_vals;
> +	msgs[1].len = sizeof(buf_alrm_vals);
> +
> +	/* Read alarm enable status */
> +	ir = isl12026_read_reg(client, ISL12026_REG_INT);
> +	if (ir < 0)
> +		return ir;
> +	alrm->enabled =  !!(ir & ISL12026_AL0E);
> +
> +	/* Read alarm pending status */
> +	sr = isl12026_read_reg(client, ISL12026_REG_SR);
> +	if (sr < 0)
> +		return sr;
> +	alrm->pending =  !!(sr & ISL12026_SR_AL0) && alrm->enabled;
> +
> +	/* Page read for alarm registers */
> +	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> +	if (ret != ARRAY_SIZE(msgs)) {
> +		dev_err(&client->dev, "Error reading alarm registers\n");

Ditto

> +		return ret < 0 ? ret : -EIO;
> +	}
> +
> +	/* Populate values read */
> +	alrm->time.tm_sec =  bcd2bin(buf_alrm_vals[0] & 0x7f);
> +	alrm->time.tm_min =  bcd2bin(buf_alrm_vals[1] & 0x7f);
> +	alrm->time.tm_hour = bcd2bin(buf_alrm_vals[2] & 0x3f);
> +	alrm->time.tm_mday = bcd2bin(buf_alrm_vals[3] & 0x3f);
> +	alrm->time.tm_mon =  bcd2bin(buf_alrm_vals[4] & 0x1f) - 1;
> +
> +	return 0;
> +}
> +
> +static int isl12026_rtc_alarm_irq_en(struct device *dev, unsigned int enabled)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	int ret;
> +	int ir;
> +
> +	if (enabled) {
> +		ret = isl12026_write_reg(client, ISL12026_REG_INT, ISL12026_AL0E);
> +		return ret;
> +	}
> +
> +	/* Disable alarm */
> +	ir = isl12026_read_reg(client, ISL12026_REG_INT);
> +	if (ir < 0)
> +		return ir;
> +	ir &= ~ISL12026_AL0E;
> +	ret = isl12026_write_reg(client, ISL12026_REG_INT, ir);
> +
> +	return ret;
> +}
> +
>  static const struct rtc_class_ops isl12026_rtc_ops = {
>  	.read_time	= isl12026_rtc_read_time,
>  	.set_time	= isl12026_rtc_set_time,
> +	.set_alarm	= isl12026_rtc_set_alarm,
> +	.read_alarm	= isl12026_rtc_read_alarm,
> +	.alarm_irq_enable = isl12026_rtc_alarm_irq_en,
>  };
>  

This is missing an interrupt handler and proper handling in probe for
the wakeup-source property as this seems to be how you use it.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

