Return-Path: <linux-rtc+bounces-2567-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4B49D00B6
	for <lists+linux-rtc@lfdr.de>; Sat, 16 Nov 2024 20:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8D9F1F21F8D
	for <lists+linux-rtc@lfdr.de>; Sat, 16 Nov 2024 19:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461A91991BA;
	Sat, 16 Nov 2024 19:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Z19skp1S"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F3319308C;
	Sat, 16 Nov 2024 19:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731785825; cv=none; b=PVh/5lDhK1ePTK+w/7iUSex5OgibFNYlLaCqWuTVc8wsMdTMsg5TMe+0/6BTn+aCIDFiuggSogGdA/dKUbUQAJTarrNLx1On4lpil4yWFH/ObRFn9mjvr2UoJntLlAuX31Swhq/pECh4FbqdM4mxg4j4JJ+AXL6W+fRhzs8XAEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731785825; c=relaxed/simple;
	bh=ELlNSiKS+DrwlChWXi2ylpoZK4FqLfd2aifSISBqemQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEibw/rNzfZe3FKyFKyzZihCrP1Ho3W7OpAiQV6H8hKHotfIIdmhkXHcufdHTTV21l5/x94f9ot/SCMuJ5xeFvYfaKi0afyfCyex+bgQpU7O5Fh2F0y1UEoVVnrLElfYDVp3Y5WlEetVLSraqT2PbdMOxnC5m//YoshtmzuDQ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Z19skp1S; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98A9C60002;
	Sat, 16 Nov 2024 19:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731785814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fz9hLc2YmSBpYXp/MdXJqnvHA+ad6QdDvN4TBAUYxjQ=;
	b=Z19skp1SaKh+mEGWDUQh6eY2O/8ZedG637T9RB/uRFodDTX9qvoP0kZme8fkxVZlr1zg0/
	7HMtSYa8npUzBWfg5aIFRN8HvVfbpyqvYLnOr8DdLli2x0RiTUmkv4cqiSQ0uIfnaOdi6z
	1pIl6j4DynSoKrA9bDInIjT9K0dn8iNKRC6TVg95p2sOT+BxxLQVjIBTrKgcZo0RcNfmRM
	Fzgmxt49xpxNcuiZkS2oCNWhLWMKj853522oTP8wivl2n9jjexP75tKzp0gTadVj6oGayb
	boK5lpl8XfRjGvc93TirgXS6f4S8vEwFxGx5aFZsGc7tsBG2Dgzh/rXIGcBXNQ==
Date: Sat, 16 Nov 2024 20:36:52 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] rtc: bbnsm: Enable RTC by default to fix time read
 failure
Message-ID: <20241116193652a13b3081@mail.local>
References: <20241115194858.3837298-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115194858.3837298-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 15/11/2024 14:48:58-0500, Frank Li wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> Enable the RTC by default even when no valid time is set to ensure the
> RTC's time read and alarm functions work properly. Without this, running
> hwclock results in the following error:
> 
> hwclock: ioctl(RTC_RD_TIME) to /dev/rtc0 to read the time failed: Invalid argument
> 


What is providing your hwclock and which version does it have?


> Fixes: eb7b85853c38 ("rtc: bbnsm: Add the bbnsm rtc support")
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/rtc/rtc-nxp-bbnsm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-nxp-bbnsm.c b/drivers/rtc/rtc-nxp-bbnsm.c
> index fa3b0328c7a25..6610db2f75125 100644
> --- a/drivers/rtc/rtc-nxp-bbnsm.c
> +++ b/drivers/rtc/rtc-nxp-bbnsm.c
> @@ -189,6 +189,9 @@ static int bbnsm_rtc_probe(struct platform_device *pdev)
>  	/* clear all the pending events */
>  	regmap_write(bbnsm->regmap, BBNSM_EVENTS, 0x7A);
>  
> +	/* Enable the Real-Time counter */
> +	regmap_update_bits(bbnsm->regmap, BBNSM_CTRL, RTC_EN_MSK, RTC_EN);
> +
>  	device_init_wakeup(&pdev->dev, true);
>  	dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
>  
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

