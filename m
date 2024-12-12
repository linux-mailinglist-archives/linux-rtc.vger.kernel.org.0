Return-Path: <linux-rtc+bounces-2730-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 064679EFA23
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 18:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5478A17294F
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 17:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABEB6216E0B;
	Thu, 12 Dec 2024 17:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OGMEiRFe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEF021421C
	for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 17:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734025956; cv=none; b=nl+dM0h71YPmkMCzfeu/pdlis0E530yzM93ztix15JJsg06lJdrD923BBubTUxAxAUKV1L8xVuar1WAlV+2OoGZCE/AfnIMZ6Gnq8vV7eRIXo1X0bazDXir/RZkDRjT20a6BWs/dGca/6NwcsQQI0xqUZcGthKOVEULa6+Z3VIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734025956; c=relaxed/simple;
	bh=VcFqqMHLJes8RbRX0aMHx+6YKF5lffARQe3WsI+l8xA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4jhBJxmhwWLwOmVAYMNOVU0OcEHeyXhVtxRK/Pa9Yw7GZqbYw9mszKdJbbDYi+wcXZcyzZQ83gXvdueE4d7kHTucuUuPa4bgXa9AlRQC7XqSPK4eHgMB6NxtaJqne2T6BE4qbkQ08kjjXyPGvf/R1F92XpgayPZc7JCmXyfhwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OGMEiRFe; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A963EC0003;
	Thu, 12 Dec 2024 17:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734025945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ku6GXq/SKfsciOWlvtAwEDDBBxyJB+kQa7d4HLdBdxw=;
	b=OGMEiRFe9ZBxKjkgZRBfotMz6FttderDToftOXt/jKQopj4ShPMNJg+W15GwP6DkKeziQU
	gsH3tXfpxFdgh5ZC/b2o+1LLTw8SvaXOch2WfLxfSdlb0JbFWEoM/3BoDTjltQ4I6tsn/v
	7rbAa9UAlKyJ5/RheCbdqpgW1UKYppPBqRH+YOA2ryms49GylpMW3oNehYFUVWsG/13/eq
	pqOm96fwnRRpZUrtF5dY6vtwa25M+VTtC3gIvEYRQKrgPyD5rJaOiKlO3Zwa/0YiMgQhHK
	iiQuVSlZ8xIrwLvNAJCGLJq8uguJ2LWruK1MnKFfnG4uZJAuSL1ARq1IdqRPxA==
Date: Thu, 12 Dec 2024 18:52:24 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: mazziesaccount@gmail.com, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3] rtc: bd70528: enable the device's wakeup in the last
 step of .probe()
Message-ID: <20241212175224644ee3a4@mail.local>
References: <20241212100403.3799667-1-joe@pf.is.s.u-tokyo.ac.jp>
 <20241212103459276170c1@mail.local>
 <4048aa2a-8499-413c-a3d1-fe3e96e843ba@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4048aa2a-8499-413c-a3d1-fe3e96e843ba@pf.is.s.u-tokyo.ac.jp>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 12/12/2024 21:04:34+0900, Joe Hattori wrote:
> Hi Alexandre,
> 
> Thank you for your review.
> 
> On 12/12/24 19:34, Alexandre Belloni wrote:
> > On 12/12/2024 19:04:03+0900, Joe Hattori wrote:
> > > Current code leaves the device's wakeup enabled in the error path of
> > > .probe(), which results in a memory leak. Call device_init_wakeup() as
> > > the last step in the .probe() to avoid this leak.
> > 
> > Do you have more info on where the memory is allocated?
> 
> device_wakeup_enable() calls wakeup_source_register(), which allocates
> struct wakeup_source. Also, when the device is already registered,
> wakeup_source_sysfs_add() is called to allocate and register a child device
> through wakeup_source_device_create(). If this information needs to be in
> the commit message, please let me know and I will include it in the V4
> patch.
> 
> > 
> > Coudln't we have a devm_ version of device_init_wakeup instead?
> 
> Yes, I think it is possible. However, for this patch, calling
> device_init_wakeup() at the end of the .probe() would suffice, and I think
> implementing the devm_ function should be in a different patch. Please let
> me know if you think otherwise.

Well, if I'm going to receive 30 or so patches to fix this, I would
prefer moving to a better API at once.

> 
> > 
> > > 
> > > This bug was found by an experimental static analysis tool that I am
> > > developing.
> > > 
> > > Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 RTC")
> > > Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> > > ---
> > > Changes in V2:
> > > - Move the device_init_wakeup() to the last step of the .probe() to make
> > >    the cleanup simpler.
> > > ---
> > >   drivers/rtc/rtc-bd70528.c | 10 ++++++----
> > >   1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
> > > index 954ac4ef53e8..d5cc4993f918 100644
> > > --- a/drivers/rtc/rtc-bd70528.c
> > > +++ b/drivers/rtc/rtc-bd70528.c
> > > @@ -312,9 +312,6 @@ static int bd70528_probe(struct platform_device *pdev)
> > >   		}
> > >   	}
> > > -	device_set_wakeup_capable(&pdev->dev, true);
> > > -	device_wakeup_enable(&pdev->dev);
> > > -
> > >   	rtc = devm_rtc_allocate_device(&pdev->dev);
> > >   	if (IS_ERR(rtc)) {
> > >   		dev_err(&pdev->dev, "RTC device creation failed\n");
> > > @@ -331,7 +328,12 @@ static int bd70528_probe(struct platform_device *pdev)
> > >   	if (ret)
> > >   		return ret;
> > > -	return devm_rtc_register_device(rtc);
> > > +	ret = devm_rtc_register_device(rtc);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	device_init_wakeup(&pdev->dev, true);
> > > +	return 0;
> > >   }
> > >   static const struct platform_device_id bd718x7_rtc_id[] = {
> > > -- 
> > > 2.34.1
> > > 
> > 
> 
> Best,
> Joe

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

