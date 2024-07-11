Return-Path: <linux-rtc+bounces-1490-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E88A92F05D
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 22:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69DA41C21E7A
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 20:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E7819F464;
	Thu, 11 Jul 2024 20:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pCY61RYf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3669C13D626;
	Thu, 11 Jul 2024 20:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720730023; cv=none; b=eeZ63rVtvDGEhFygEe+EGkGfOLjBlIXnbyyKWCkwyd0QkhZV9bCzaLH61hWZnh5K8XYu8fwkPHmbpFStQsj3qEA54OZUMccTEbFVN8uomyyoyxjoFuQODOIQSDvlurVo6NT/KrwKFvbOb0aubAkTLzp9i/4q1SBrM6H4IqggfQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720730023; c=relaxed/simple;
	bh=u9OIK/7LLd4/30SCi4eE3ANtbzLqHBtUVdKoP1X3Lu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7RoT7Ku42YS2f5nEClL8nog14ARw8G2QSj1h2EOVNjA5IBpVaPrRRw0vEZGgP2HfKX54HKL9K2TL7Tz/ntDcd417j/9DpQ41GJtuqNhBZM23CfecwTHMNS6XID6bLSN+bUPRfnQGsC6mHTkQaL8MOEA3LwYPoPsiReiqalGFmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pCY61RYf; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADB9E1BF204;
	Thu, 11 Jul 2024 20:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720730018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IouwIgo+kP+HswbewtSJ8i0mZUqTEtq++kfOp3rA2cc=;
	b=pCY61RYf9XpU6OIywfEq/tnfP//rltf0nVP6mHpAIyZ9HRqzcuYkkUUEqws8i+jLDHWAdi
	Cx9TMIeayt/qDOsq0yfzsOzfmrWnvSQ/+80UE/7t+gGK3f+aBhk4tDwyJUUgLYdN9+1ow3
	AzGh0WM37wucGQbgYBl9QNSK6VUjNONo4XrAhRDJrI6I49NquqUDu8KoWWmg1HX0nDkvbw
	51umsal5Q9HuB3QqBZzWHYgTQsRU8HdfCug1Ys06Q0ZKwKoCUBL8wCuJK6N/qpHL3u8BV4
	Y3WmyHRxSp2MzP1KS5tLPLXWUdoa1kkSVMPzVeNWyOxMSQoI6gi/az8Js3LLDQ==
Date: Thu, 11 Jul 2024 22:33:37 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v5 6/7] rtc: support i.MX95 BBM RTC
Message-ID: <202407112033378dbbea83@mail.local>
References: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
 <20240621-imx95-bbm-misc-v2-v5-6-b85a6bf778cb@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621-imx95-bbm-misc-v2-v5-6-b85a6bf778cb@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

On 21/06/2024 15:04:41+0800, Peng Fan (OSS) wrote:
> +	ret = bbnsm->ops->rtc_time_get(ph, 0, &val);
> +	if (ret) {
> +		dev_err(dev, "%s: %d\n", __func__, ret);

This is not super useful, you should drop the various dev_err or pr_err
as there is no action the user can take to solve the erro apart from
retrying.

> +		return ret;
> +	}
> +
> +	rtc_time64_to_tm(val, tm);
> +
> +	return 0;
> +}
> +
> +static int scmi_imx_bbm_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
> +	struct scmi_protocol_handle *ph = bbnsm->ph;
> +	u64 val;
> +	int ret;
> +
> +	val = rtc_tm_to_time64(tm);
> +
> +	ret = bbnsm->ops->rtc_time_set(ph, 0, val);
> +	if (ret)
> +		dev_err(dev, "%s: %d\n", __func__, ret);
> +
> +	return ret;
> +}
> +
> +static int scmi_imx_bbm_alarm_irq_enable(struct device *dev, unsigned int enable)
> +{

How can userspace disable the alarm?

> +	return 0;
> +}
> +
> +static int scmi_imx_bbm_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
> +	struct scmi_protocol_handle *ph = bbnsm->ph;
> +	struct rtc_time *alrm_tm = &alrm->time;
> +	u64 val;
> +	int ret;
> +
> +	val = rtc_tm_to_time64(alrm_tm);
> +
> +	ret = bbnsm->ops->rtc_alarm_set(ph, 0, val);
> +	if (ret)
> +		dev_err(dev, "%s: %d\n", __func__, ret);
> +
> +	return ret;
> +}
> +
> +static const struct rtc_class_ops smci_imx_bbm_rtc_ops = {
> +	.read_time = scmi_imx_bbm_read_time,
> +	.set_time = scmi_imx_bbm_set_time,
> +	.set_alarm = scmi_imx_bbm_set_alarm,
> +	.alarm_irq_enable = scmi_imx_bbm_alarm_irq_enable,
> +};
> +
> +static int scmi_imx_bbm_rtc_notifier(struct notifier_block *nb, unsigned long event, void *data)
> +{
> +	struct scmi_imx_bbm *bbnsm = container_of(nb, struct scmi_imx_bbm, nb);
> +	struct scmi_imx_bbm_notif_report *r = data;
> +
> +	if (r->is_rtc)
> +		rtc_update_irq(bbnsm->rtc_dev, 1, RTC_AF | RTC_IRQF);
> +	else
> +		pr_err("Unexpected bbm event: %s\n", __func__);
> +
> +	return 0;
> +}
> +
> +static int scmi_imx_bbm_rtc_init(struct scmi_device *sdev)
> +{
> +	const struct scmi_handle *handle = sdev->handle;
> +	struct device *dev = &sdev->dev;
> +	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
> +	int ret;
> +
> +	bbnsm->rtc_dev = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(bbnsm->rtc_dev))
> +		return PTR_ERR(bbnsm->rtc_dev);
> +
> +	bbnsm->rtc_dev->ops = &smci_imx_bbm_rtc_ops;
> +	bbnsm->rtc_dev->range_min = 0;

range_min is set to 0 by default, this is not necessary

> +	bbnsm->rtc_dev->range_max = U32_MAX;
> +
> +	ret = devm_rtc_register_device(bbnsm->rtc_dev);
> +	if (ret)
> +		return ret;
> +
> +	bbnsm->nb.notifier_call = &scmi_imx_bbm_rtc_notifier;
> +	return handle->notify_ops->devm_event_notifier_register(sdev, SCMI_PROTOCOL_IMX_BBM,
> +								SCMI_EVENT_IMX_BBM_RTC,
> +								NULL, &bbnsm->nb);

Note that failing after devm_rtc_register_device opens the driver to a
race condition as the character device will exist at that time.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

