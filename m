Return-Path: <linux-rtc+bounces-4833-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E22B43B56
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Sep 2025 14:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 078855862B9
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Sep 2025 12:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B9C27B32B;
	Thu,  4 Sep 2025 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="siqJtgiG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620AC80B;
	Thu,  4 Sep 2025 12:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756988277; cv=none; b=FV18/KMyMQ8e18swUwd/MQaCJBQNEaGGWoHeQrLivl0jC+PeTohBhGJ7AGVGfwOkKTG/D/b+iERXTPGnih3vGgkeUfg+8a/bApCzaMztC5Q1RNBd9UU2GRf//p3IO2+rvHy6t59mxeNVWRTleUTxtiShXDQgbKLmY6WfTze/a30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756988277; c=relaxed/simple;
	bh=TcOrLFLpypXvUgjowvIOnT2/Dmenmavzvy+eyQgltYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVGimN/20A81DSwh/RWQuIEmrFZnr3lCDRquLbE+TRapuvYHhDU+lDP7BiKP82gE3fGVnDZQhBg6rIACSIPnUIVu8SQZosDYF6+PGhS19jumwqv0jV4B4Ub60+DfUM9puQqGIwkUWCVcyap447uTOPwUV3la4hyiziUwQWfLSKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=siqJtgiG; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9E56F4E40C78;
	Thu,  4 Sep 2025 12:17:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E067606BB;
	Thu,  4 Sep 2025 12:17:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B81991C22DD67;
	Thu,  4 Sep 2025 14:17:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756988271; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t/n8mgu1NcsMenEqleBAZW4KHVuETZmKFRKweMFl7Qg=;
	b=siqJtgiGVy5Dw9CFR3sIroCRgf/251lGKM88dhDkeoFDcHhT1UkPUnnlfmseegquDhB8bX
	LtvM3QW40NRJOdXznJ8HiRRCqDF9BW0ePQ1QMJZF/MbCfTBVflorm2eYZDIo1pt3kZZFBk
	wT8W5ZgyBAlXYjghw3gNRITskxCQTQ07H1yxVfg+bNTDDV5+YDvnay34pymaLMo8Yhecy1
	91Qo5Si5NosTsueK4K4bC+Jbz/MCsZqMpGFDtaiRUaryfWG+ZpAtBZvJfHFA6GB75W4b7e
	hhVyfL8FGWinVA8/qQgTMCI348224Tgor35Og+oSNFGUCnffTcxqQ52QhpC6bw==
Date: Thu, 4 Sep 2025 14:17:37 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lee Jones <lee@kernel.org>
Cc: Alexander Kurz <akurz@blala.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-input@vger.kernel.or, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH] Drivers: mc13783: remove deprecated mc13xxx_irq_ack()
Message-ID: <20250904121737ed8f8114@mail.local>
References: <20250811064358.1659-1-akurz@blala.de>
 <20250902102036.GE2163762@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902102036.GE2163762@google.com>
X-Last-TLS-Session-Version: TLSv1.3

On 02/09/2025 11:20:36+0100, Lee Jones wrote:
> On Mon, 11 Aug 2025, Alexander Kurz wrote:
> 
> > mc13xxx_irq_ack() got deprecated and became dead code with commit
> > 10f9edaeaa30 ("mfd: mc13xxx: Use regmap irq framework for interrupts").
> > It should be safe to remove it now.
> > 
> > Signed-off-by: Alexander Kurz <akurz@blala.de>
> > ---
> >  drivers/input/misc/mc13783-pwrbutton.c |  1 -
> >  drivers/input/touchscreen/mc13783_ts.c |  4 ----
> 
> >  drivers/rtc/rtc-mc13xxx.c              | 13 -------------
> 
> RTC review / Ack please.

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>


> 
> >  include/linux/mfd/mc13xxx.h            |  6 ------
> >  4 files changed, 24 deletions(-)
> > 
> > diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
> > index 1c7faa9b7afe..b83d762ae2e9 100644
> > --- a/drivers/input/misc/mc13783-pwrbutton.c
> > +++ b/drivers/input/misc/mc13783-pwrbutton.c
> > @@ -57,7 +57,6 @@ static irqreturn_t button_irq(int irq, void *_priv)
> >  	struct mc13783_pwrb *priv = _priv;
> >  	int val;
> >  
> > -	mc13xxx_irq_ack(priv->mc13783, irq);
> >  	mc13xxx_reg_read(priv->mc13783, MC13783_REG_INTERRUPT_SENSE_1, &val);
> >  
> >  	switch (irq) {
> > diff --git a/drivers/input/touchscreen/mc13783_ts.c b/drivers/input/touchscreen/mc13783_ts.c
> > index 33635da85079..47b8da00027f 100644
> > --- a/drivers/input/touchscreen/mc13783_ts.c
> > +++ b/drivers/input/touchscreen/mc13783_ts.c
> > @@ -42,8 +42,6 @@ static irqreturn_t mc13783_ts_handler(int irq, void *data)
> >  {
> >  	struct mc13783_ts_priv *priv = data;
> >  
> > -	mc13xxx_irq_ack(priv->mc13xxx, irq);
> > -
> >  	/*
> >  	 * Kick off reading coordinates. Note that if work happens already
> >  	 * be queued for future execution (it rearms itself) it will not
> > @@ -137,8 +135,6 @@ static int mc13783_ts_open(struct input_dev *dev)
> >  
> >  	mc13xxx_lock(priv->mc13xxx);
> >  
> > -	mc13xxx_irq_ack(priv->mc13xxx, MC13XXX_IRQ_TS);
> > -
> >  	ret = mc13xxx_irq_request(priv->mc13xxx, MC13XXX_IRQ_TS,
> >  		mc13783_ts_handler, MC13783_TS_NAME, priv);
> >  	if (ret)
> > diff --git a/drivers/rtc/rtc-mc13xxx.c b/drivers/rtc/rtc-mc13xxx.c
> > index e7b87130e624..2494d13fd767 100644
> > --- a/drivers/rtc/rtc-mc13xxx.c
> > +++ b/drivers/rtc/rtc-mc13xxx.c
> > @@ -137,10 +137,6 @@ static int mc13xxx_rtc_set_time(struct device *dev, struct rtc_time *tm)
> >  	}
> >  
> >  	if (!priv->valid) {
> > -		ret = mc13xxx_irq_ack(priv->mc13xxx, MC13XXX_IRQ_RTCRST);
> > -		if (unlikely(ret))
> > -			goto out;
> > -
> >  		ret = mc13xxx_irq_unmask(priv->mc13xxx, MC13XXX_IRQ_RTCRST);
> >  	}
> >  
> > @@ -208,10 +204,6 @@ static int mc13xxx_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
> >  	if (unlikely(ret))
> >  		goto out;
> >  
> > -	ret = mc13xxx_irq_ack(priv->mc13xxx, MC13XXX_IRQ_TODA);
> > -	if (unlikely(ret))
> > -		goto out;
> > -
> >  	s1970 = rtc_tm_to_time64(&alarm->time);
> >  
> >  	dev_dbg(dev, "%s: %s %lld\n", __func__, alarm->enabled ? "on" : "off",
> > @@ -239,12 +231,9 @@ static int mc13xxx_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
> >  static irqreturn_t mc13xxx_rtc_alarm_handler(int irq, void *dev)
> >  {
> >  	struct mc13xxx_rtc *priv = dev;
> > -	struct mc13xxx *mc13xxx = priv->mc13xxx;
> >  
> >  	rtc_update_irq(priv->rtc, 1, RTC_IRQF | RTC_AF);
> >  
> > -	mc13xxx_irq_ack(mc13xxx, irq);
> > -
> >  	return IRQ_HANDLED;
> >  }
> >  
> > @@ -293,8 +282,6 @@ static int __init mc13xxx_rtc_probe(struct platform_device *pdev)
> >  
> >  	mc13xxx_lock(mc13xxx);
> >  
> > -	mc13xxx_irq_ack(mc13xxx, MC13XXX_IRQ_RTCRST);
> > -
> >  	ret = mc13xxx_irq_request(mc13xxx, MC13XXX_IRQ_RTCRST,
> >  			mc13xxx_rtc_reset_handler, DRIVER_NAME, priv);
> >  	if (ret)
> > diff --git a/include/linux/mfd/mc13xxx.h b/include/linux/mfd/mc13xxx.h
> > index f372926d5894..dd46fe424a80 100644
> > --- a/include/linux/mfd/mc13xxx.h
> > +++ b/include/linux/mfd/mc13xxx.h
> > @@ -31,12 +31,6 @@ int mc13xxx_adc_do_conversion(struct mc13xxx *mc13xxx,
> >  		unsigned int mode, unsigned int channel,
> >  		u8 ato, bool atox, unsigned int *sample);
> >  
> > -/* Deprecated calls */
> > -static inline int mc13xxx_irq_ack(struct mc13xxx *mc13xxx, int irq)
> > -{
> > -	return 0;
> > -}
> > -
> >  static inline int mc13xxx_irq_request_nounmask(struct mc13xxx *mc13xxx, int irq,
> >  					       irq_handler_t handler,
> >  					       const char *name, void *dev)
> > -- 
> > 2.39.5
> > 
> 
> -- 
> Lee Jones [李琼斯]

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

