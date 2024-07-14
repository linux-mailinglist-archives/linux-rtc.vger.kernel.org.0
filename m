Return-Path: <linux-rtc+bounces-1496-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 009B0930B74
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Jul 2024 22:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 246701C21013
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Jul 2024 20:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D7013CFBC;
	Sun, 14 Jul 2024 20:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DC1lDe2z"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0C27492;
	Sun, 14 Jul 2024 20:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720987326; cv=none; b=gNdxToqbw4wDjw2nqFXr3DnSb0IMKtZSkQIdO5EjhOkwFtnPgwtPkjCST5HPOrqhOJzXF0RoQgPbkFI7v5rtpjywUtXCmW35OWMjOrRJIsmuTA9rRVkGjsI2j3XWFYVCUyqxgSZL0EmZ1OuGek+kEeiDLalPLAG/IrJJZjzvEZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720987326; c=relaxed/simple;
	bh=pb/G7YQx45yiKRXmo+bGRpTt9yMM93q4yWFCoqO017c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pL3IJ+4AjtdCvFeXJXVvsgq6cpXp7pCr+hla9PY7DfxDHkvZwWnrFABn1m0rI1/vtYkM1K5ATG2PBfrves1L9QLTxm/SEpJUKTb9GoKYELyy3xlkzk4I0NCSGZxIo7DYSuUZaTTs6kBs8Ib3HR/AXzOyCet/IzIrjCr65dBibm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DC1lDe2z; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0837F240003;
	Sun, 14 Jul 2024 20:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720987314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nQrj2SaFXfumNABn8KZPjw12XQ+uAbnKdDHF+wEgrkw=;
	b=DC1lDe2z0E8xZQIR1JFiK0tKiT5v9QLjAZDz2bb+qhPBY/DQCcz3FokusW13om9oKqOwTy
	Bc8GaBqw9mrf/7tP26hO5CWJEz+ft13U+njiol1sXz5YlAbFe37qZz/PiXi2xBDmZIlTZQ
	BrmUE3QEvLozRCZ92vwrc9r4ZhhB/byo8wqh3vkNcKDovO0nd3dIzVq91oxBXbVZtLS4FT
	M3pEVyhpPQbufyr8+oC12cgTlKK2Tu8YnpHGgGDzbjJipMQY4PyVxVFf3BC43/KuKNXzQ7
	6ZXOIlcI5/dh/M2T8Xt16jA/4ZXQMIyGvRgcIh+gQavm++/cY6Q+ziTFVkuPVQ==
Date: Sun, 14 Jul 2024 22:01:52 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH v5 6/7] rtc: support i.MX95 BBM RTC
Message-ID: <20240714200152c47a4be3@mail.local>
References: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
 <20240621-imx95-bbm-misc-v2-v5-6-b85a6bf778cb@nxp.com>
 <202407112033378dbbea83@mail.local>
 <PAXPR04MB8459B4870DB4CBC47BEE511688A02@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459B4870DB4CBC47BEE511688A02@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 14/07/2024 08:22:59+0000, Peng Fan wrote:
> > Subject: Re: [PATCH v5 6/7] rtc: support i.MX95 BBM RTC
> > 
> > Hello,
> > 
> > On 21/06/2024 15:04:41+0800, Peng Fan (OSS) wrote:
> > > +	ret = bbnsm->ops->rtc_time_get(ph, 0, &val);
> > > +	if (ret) {
> > > +		dev_err(dev, "%s: %d\n", __func__, ret);
> > 
> > This is not super useful, you should drop the various dev_err or pr_err
> > as there is no action the user can take to solve the erro apart from
> > retrying.
> 
> Sure. I will remove the various dev_err or pr_err in v6.
> 
> > 
> > > +		return ret;
> > > +	}
> > > +
> > > +	rtc_time64_to_tm(val, tm);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int scmi_imx_bbm_set_time(struct device *dev, struct
> > rtc_time
> > > +*tm) {
> > > +	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
> > > +	struct scmi_protocol_handle *ph = bbnsm->ph;
> > > +	u64 val;
> > > +	int ret;
> > > +
> > > +	val = rtc_tm_to_time64(tm);
> > > +
> > > +	ret = bbnsm->ops->rtc_time_set(ph, 0, val);
> > > +	if (ret)
> > > +		dev_err(dev, "%s: %d\n", __func__, ret);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int scmi_imx_bbm_alarm_irq_enable(struct device *dev,
> > unsigned
> > > +int enable) {
> > 
> > How can userspace disable the alarm?
> 
> The SCMI notify has kernel level enable/disable
> drivers/firmware/arm_scmi/notify.c
> 
> But indeed, userspace not able to disable the alarm.
> 
> I need use 
> if (!enable) return -EOPNOTSUPP;
> 
> > 
> > > +	return 0;
> > > +}
> > > +
> > > +static int scmi_imx_bbm_set_alarm(struct device *dev, struct
> > > +rtc_wkalrm *alrm) {
> > > +	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
> > > +	struct scmi_protocol_handle *ph = bbnsm->ph;
> > > +	struct rtc_time *alrm_tm = &alrm->time;
> > > +	u64 val;
> > > +	int ret;
> > > +
> > > +	val = rtc_tm_to_time64(alrm_tm);
> > > +
> > > +	ret = bbnsm->ops->rtc_alarm_set(ph, 0, val);
> > > +	if (ret)
> > > +		dev_err(dev, "%s: %d\n", __func__, ret);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static const struct rtc_class_ops smci_imx_bbm_rtc_ops = {
> > > +	.read_time = scmi_imx_bbm_read_time,
> > > +	.set_time = scmi_imx_bbm_set_time,
> > > +	.set_alarm = scmi_imx_bbm_set_alarm,
> > > +	.alarm_irq_enable = scmi_imx_bbm_alarm_irq_enable, };
> > > +
> > > +static int scmi_imx_bbm_rtc_notifier(struct notifier_block *nb,
> > > +unsigned long event, void *data) {
> > > +	struct scmi_imx_bbm *bbnsm = container_of(nb, struct
> > scmi_imx_bbm, nb);
> > > +	struct scmi_imx_bbm_notif_report *r = data;
> > > +
> > > +	if (r->is_rtc)
> > > +		rtc_update_irq(bbnsm->rtc_dev, 1, RTC_AF |
> > RTC_IRQF);
> > > +	else
> > > +		pr_err("Unexpected bbm event: %s\n", __func__);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int scmi_imx_bbm_rtc_init(struct scmi_device *sdev) {
> > > +	const struct scmi_handle *handle = sdev->handle;
> > > +	struct device *dev = &sdev->dev;
> > > +	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
> > > +	int ret;
> > > +
> > > +	bbnsm->rtc_dev = devm_rtc_allocate_device(dev);
> > > +	if (IS_ERR(bbnsm->rtc_dev))
> > > +		return PTR_ERR(bbnsm->rtc_dev);
> > > +
> > > +	bbnsm->rtc_dev->ops = &smci_imx_bbm_rtc_ops;
> > > +	bbnsm->rtc_dev->range_min = 0;
> > 
> > range_min is set to 0 by default, this is not necessary
> > 
> > > +	bbnsm->rtc_dev->range_max = U32_MAX;
> > > +
> > > +	ret = devm_rtc_register_device(bbnsm->rtc_dev);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	bbnsm->nb.notifier_call = &scmi_imx_bbm_rtc_notifier;
> > > +	return handle->notify_ops->devm_event_notifier_register(sdev,
> > SCMI_PROTOCOL_IMX_BBM,
> > > +
> > 	SCMI_EVENT_IMX_BBM_RTC,
> > > +
> > 	NULL, &bbnsm->nb);
> > 
> > Note that failing after devm_rtc_register_device opens the driver to a
> > race condition as the character device will exist at that time.
> 
> Could you please share more info on this?
> 
> Won't the devm_rtc_register_device could automatically remove
> the rtc is notifier register fails?

Yes but once devm_rtc_register_device is called, the character device is
available for userspace so it may be opened before probe finishes so
while probe fails, the device is kept opened until userspace closes the
file.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

