Return-Path: <linux-rtc+bounces-2216-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA7A9A099A
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 14:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88B731F2566A
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 12:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1B2209F4B;
	Wed, 16 Oct 2024 12:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L7NmLwMo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA689208D86;
	Wed, 16 Oct 2024 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729081579; cv=none; b=LHGMvHCr3dfuibVoU4BhZdmEZv0jom1Iw4o8M41sVZV9rWZrPNbUMvYOQm2jCM+knh87rXJ8h6owrlnt3q3lH1Z16L0vJK9LqDU0a9dPDpU1CCNt4HcOlDHnMBLdsByrVFqV/wzyk1AjnTrecMN4nmjuzejdaW0JJlVdP+gaeIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729081579; c=relaxed/simple;
	bh=TpQqZ31NFbWQvsUyhg4OTQUBsWzc/Jkukn8+G3bjmcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9UeI5F5WMH/RmBx6K8gn5fyi85nmyhstbb3nTWUAVlYN24B0Xo75BIli9C0c+hjL0iF6IOQ0CQ99md79kIGWwrPGnwS6j3xTdZkap+ExeYpMTvHQZ0EyxlDJK9GW6Y0leHuEcoN5UDZtvlc15bFThOU09iqh5ZQG1w/TwCst4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L7NmLwMo; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26C8D40003;
	Wed, 16 Oct 2024 12:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729081574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CfMLbv1h2yZT1NCmxa2WCjab7I6UZUgpEliYH/fpfkc=;
	b=L7NmLwMobJYv1rCtSlkFOvpOKT6/5/dJbR62C5VlBQSQUMC9Edd86/iOqp9lLJZEQRi/sa
	id/71yKs6mPvZUjI6gaOkYnaAG6nfxBMs2uswTnqzN8/DXW4y1nBvc9iFnbJvGBFibFD/t
	MZYvsajW2JSdWQwjfTX2vWjqsTftTm644zsrJz68vPique2gHJxJ6/skerO37AmNjUtg1J
	2JgLCyxWkkYKINjfHpkqKnh3MKopaGJFTZEnWPhUkw0ZJKdwxrtGJX5tqT25Vof4V1j5L6
	V1WBWk2SzWi15STwxnN/TXIN2TL3uPlwNvJAxBeQ50GNArpIqIwVq5ZnUh4yOg==
Date: Wed, 16 Oct 2024 14:26:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Johan Hovold <johan@kernel.org>
Cc: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/5] rtc: pm8xxx: implement qcom,no-alarm flag for
 non-HLOS owned alarm
Message-ID: <20241016122613e1ba2e2a@mail.local>
References: <20241015004945.3676-1-jonathan@marek.ca>
 <20241015004945.3676-2-jonathan@marek.ca>
 <Zw9gZkLPMB9ZBQlh@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw9gZkLPMB9ZBQlh@hovoldconsulting.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 16/10/2024 08:42:46+0200, Johan Hovold wrote:
> On Mon, Oct 14, 2024 at 08:47:26PM -0400, Jonathan Marek wrote:
> > Qualcomm x1e80100 firmware sets the ownership of the RTC alarm to ADSP.
> > Thus writing to RTC alarm registers and receiving alarm interrupts is not
> > possible.
> > 
> > Add a qcom,no-alarm flag to support RTC on this platform.
> 
> An alternative may be to drop the alarm interrupt from DT and use that
> as an indicator.
> 
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > ---
> >  drivers/rtc/rtc-pm8xxx.c | 44 +++++++++++++++++++++++++++-------------
> >  1 file changed, 30 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
> > index c32fba550c8e0..1e78939625622 100644
> > --- a/drivers/rtc/rtc-pm8xxx.c
> > +++ b/drivers/rtc/rtc-pm8xxx.c
> > @@ -61,6 +61,7 @@ struct pm8xxx_rtc {
> >  	struct rtc_device *rtc;
> >  	struct regmap *regmap;
> >  	bool allow_set_time;
> > +	bool no_alarm;
> 
> How about inverting this one and naming it has_alarm or similar to avoid
> the double negation in your conditionals (!no_alarm)?
> 
> >  	int alarm_irq;
> >  	const struct pm8xxx_rtc_regs *regs;
> >  	struct device *dev;
> > @@ -473,9 +474,14 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
> >  	if (!rtc_dd->regmap)
> >  		return -ENXIO;
> >  
> > -	rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
> > -	if (rtc_dd->alarm_irq < 0)
> > -		return -ENXIO;
> > +	rtc_dd->no_alarm = of_property_read_bool(pdev->dev.of_node,
> > +						 "qcom,no-alarm");
> > +
> 
> Stray newline.
> 
> > +	if (!rtc_dd->no_alarm) {
> > +		rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
> > +		if (rtc_dd->alarm_irq < 0)
> > +			return -ENXIO;
> > +	}
> >  
> >  	rtc_dd->allow_set_time = of_property_read_bool(pdev->dev.of_node,
> >  						      "allow-set-time");
> > @@ -503,7 +509,8 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
> >  
> >  	platform_set_drvdata(pdev, rtc_dd);
> >  
> > -	device_init_wakeup(&pdev->dev, 1);
> > +	if (!rtc_dd->no_alarm)
> > +		device_init_wakeup(&pdev->dev, 1);
> >  
> >  	rtc_dd->rtc = devm_rtc_allocate_device(&pdev->dev);
> >  	if (IS_ERR(rtc_dd->rtc))
> > @@ -512,27 +519,36 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
> >  	rtc_dd->rtc->ops = &pm8xxx_rtc_ops;
> >  	rtc_dd->rtc->range_max = U32_MAX;
> >  
> > -	rc = devm_request_any_context_irq(&pdev->dev, rtc_dd->alarm_irq,
> > -					  pm8xxx_alarm_trigger,
> > -					  IRQF_TRIGGER_RISING,
> > -					  "pm8xxx_rtc_alarm", rtc_dd);
> > -	if (rc < 0)
> > -		return rc;
> > +	if (!rtc_dd->no_alarm) {
> > +		rc = devm_request_any_context_irq(&pdev->dev, rtc_dd->alarm_irq,
> > +						  pm8xxx_alarm_trigger,
> > +						  IRQF_TRIGGER_RISING,
> > +						  "pm8xxx_rtc_alarm", rtc_dd);
> > +		if (rc < 0)
> > +			return rc;
> > +	}
> >  
> >  	rc = devm_rtc_register_device(rtc_dd->rtc);
> >  	if (rc)
> >  		return rc;
> >  
> > -	rc = dev_pm_set_wake_irq(&pdev->dev, rtc_dd->alarm_irq);
> > -	if (rc)
> > -		return rc;
> > +	if (!rtc_dd->no_alarm) {
> > +		rc = dev_pm_set_wake_irq(&pdev->dev, rtc_dd->alarm_irq);
> > +		if (rc)
> > +			return rc;

Also, probe must not fail after devm_rtc_allocate_device has been
called.so you could fix this with this patch.

> > +	} else {
> > +		clear_bit(RTC_FEATURE_ALARM, rtc_dd->rtc->features);
> 
> I assume that you should be clearing the feature bit before registering
> the RTC.
> 
> > +	}
> >  
> >  	return 0;
> >  }
> 
> Johan

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

