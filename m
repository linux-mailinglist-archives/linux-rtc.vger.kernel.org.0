Return-Path: <linux-rtc+bounces-5208-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEBCC19DB7
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Oct 2025 11:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A61C1C85663
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Oct 2025 10:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2594F3346A9;
	Wed, 29 Oct 2025 10:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cCXLWuOm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A92832BF25
	for <linux-rtc@vger.kernel.org>; Wed, 29 Oct 2025 10:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761734387; cv=none; b=SFIGSO7dF14/GFlfMaM1q9v0/OkfWhot2OlVj+gr4otS/m2dj7VAB/MJxnmzETLbj3gHzCbKceArf3wJLwU/b5KVdy5nEKYHAWtMs/SCWHCgh0hHlYxWSYnqZN7cfeny8viy/Znj6NdiB2XaQ2mg627Soq8Dfrh+TBLxt3LauuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761734387; c=relaxed/simple;
	bh=fQ1ZZOwoZHcyHhHjmvXHNheScD5+PKiSXtlfj+ifs1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4gE5Oqa5yuGsy+wmMILhgKgGpFnn2eDsO45cJXjNoz4rTGMUcoIh3Ud/lYZ8eLryoXHOnS2okLCFXYP9B2K1N91MRxgc0F/Ln3NxZjsrvB/bmZ12ptFyC6F3oK7+tZMdiOM5BCWhaxD+N0Ri2oe1ibYqIl8kBUCxRr3QDCVMQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cCXLWuOm; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 27AA7C0BEBB;
	Wed, 29 Oct 2025 10:39:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71CBB606E8;
	Wed, 29 Oct 2025 10:39:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09BDF117F2875;
	Wed, 29 Oct 2025 11:39:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761734380; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=kZUu6u0wS/jzGzdskNddkgJJVZ/zUOBXcp7YDEWrGzU=;
	b=cCXLWuOmhtnXCME378SD2JQmZ9xc/7GArt0Ev2MulE9BiAetQ/bWt8OiSIJ/dP2joCxafq
	89QX752TatfoKXx1MAhJW0iDyT+24HvM09VK8OEXdell//K7pNrTIWAwuC3UXRBBe8KpVk
	lW1fVwyOm0w2wMNqpRhfeAdmqKBZh4A7cMWyVJll59MmzTGpxrQ2j/9RgAFHnn/ceslGhW
	eq91FHU0eO265JvjO+phla676d+wiYJ2w6TOQ3HYQTmEKd2MSVEiYqhzJMIMKFWHDBVydH
	2BclGKojql2K0e0UVKHoDTz6quFI/UL3VLtaV36g0Vvxe87dpaf411rPignZWw==
Date: Wed, 29 Oct 2025 11:39:38 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Esben Haabendal <esben@geanix.com>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] rtc: tps6586x: Fix initial enable_irq/disable_irq
 balance
Message-ID: <2025102910393819d18ad0@mail.local>
References: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
 <20250516-rtc-uie-irq-fixes-v2-4-3de8e530a39e@geanix.com>
 <0aae5643-9276-4280-8b1e-27b8fe73fe99@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0aae5643-9276-4280-8b1e-27b8fe73fe99@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3

On 29/10/2025 09:20:17+0000, Jon Hunter wrote:
> Hi Esben,
> 
> On 16/05/2025 08:23, Esben Haabendal wrote:
> > Interrupts are automatically enabled when requested, so we need to
> > initialize irq_en accordingly to avoid causing an unbalanced enable
> > warning.
> > 
> > Signed-off-by: Esben Haabendal <esben@geanix.com>
> > ---
> >   drivers/rtc/rtc-tps6586x.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
> > index 54c8429b16bfcc692b1f4d5404f0c42f720e93b4..76ecf7b798f0de22aa89a552a263b473ab3065ef 100644
> > --- a/drivers/rtc/rtc-tps6586x.c
> > +++ b/drivers/rtc/rtc-tps6586x.c
> > @@ -258,6 +258,7 @@ static int tps6586x_rtc_probe(struct platform_device *pdev)
> >   	irq_set_status_flags(rtc->irq, IRQ_NOAUTOEN);
> > +	rtc->irq_en = true;
> >   	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
> >   				tps6586x_rtc_irq,
> >   				IRQF_ONESHOT,
> > 
> 
> I have bisected a suspend regression on one of our Tegra20 boards (that uses
> this driver) and bisect is pointing to this commit. Reverting this commit
> fixes the problem.
> 
> Looking at the above I see that the flag IRQ_NOAUTOEN is being set and so
> now with your change we never enable the interrupt. Hence, the wake-ups are
> now broken and suspend testing fails. So it would seem best to revert this.
> 
> BTW, I looked at the change to the CPCAP driver and that driver actively
> disables the IRQ after requesting it and so I am wondering if that will also
> have alarm issues? I don't have a board with CPCAP to test.
> 

That's right, I guess you can send reverts.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

