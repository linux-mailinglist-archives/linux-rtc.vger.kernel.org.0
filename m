Return-Path: <linux-rtc+bounces-4583-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF40B114F5
	for <lists+linux-rtc@lfdr.de>; Fri, 25 Jul 2025 01:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22FDA1CE4F59
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 23:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E26246BC5;
	Thu, 24 Jul 2025 23:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TKTLx0vM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFABA155C97;
	Thu, 24 Jul 2025 23:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753401339; cv=none; b=eCxKI1R1Mb0FW6pZSOHhyC9naM1G8Lq20cmML4+HUyz4XokKaH7/rqQMi1FzudkNRpsnqKgp9TPU5gg2odoTCE6i7GmPkUrAe376L2cuNd9DoNuQGlAonv7cytYRkRoBgB2vM5iXf7/kNipiS7nrXqWVXpKsndIcesj5DVuvohI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753401339; c=relaxed/simple;
	bh=ZjptyIksVFLTo8u9FVIx2HruCBSBg0ymIQO0X7ZkFjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAwVafjXkZMo57+eL3G66Vq6KTePzgO3ZtmIG997/6uj0TT4OEWLYuBmgcRBcysbzLCiMTbW5FqUTf1PPSyr4DdO4m4BHwhrwKxsASKfdnh9WK8kSklEPOtmeXiNYtZ0MubH0Lms6KES7ACgzll9/ti+VEnxuey65eIIiY91/VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TKTLx0vM; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B196C4320E;
	Thu, 24 Jul 2025 23:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753401328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=objrwpFDBlS7gEaH818Sz3OvSK4JziosCw8nboGO1xM=;
	b=TKTLx0vM3T62Yjqi3gzLldn8hViEIx37DEcJhH4DQkWX+AASVyDDoKGKMdVjkoIppwtnTK
	NA0kW672efHNTEdxrYLAMQQAvyKVjcufz7EZdpzFWBTeTnEV+eeAnR7nyXegdi7CF5OO5w
	53o3ZC0tX/kIMZ8gY11Fej7pX1vq3QYsnDMSskvVEhVqIlgqBRDrsBwcVTa/C39PcTW8lE
	lLTL/I3A/AtxraiS7DqNe8UESHH0XpBbhFH5MOjbWJA/pY+8D7+/bVGBCxfGlJzzXx/XP5
	BXuO5Jhkdbfpa3fByh5vkRDsX7BD8Un3flPpUQRmpELa7l4estnu7mEH2v69YQ==
Date: Fri, 25 Jul 2025 01:55:27 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Harini T <harini.t@amd.com>
Cc: michal.simek@amd.com, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	git@amd.com
Subject: Re: [PATCH] rtc: zynqmp: Add shutdown callback for kexec support
Message-ID: <2025072423552753300d57@mail.local>
References: <20250724170517.974356-1-harini.t@amd.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724170517.974356-1-harini.t@amd.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekvddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohephhgrrhhinhhirdhtsegrmhgurdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgv
 ghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehgihhtsegrmhgurdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com

On 24/07/2025 22:35:17+0530, Harini T wrote:
> During kexec, the hardware is not reset and any enabled interrupts can
> interfere with the new kernel's RTC initialization.

Please elaborate on the issue because alarm are supposed to stay enabled across
reboots, this is the whole point of the RTC.

> 
> The shutdown callback reuses the existing remove function to disable
> alarm interrupts and wakeup capability, putting the device in a
> quiescent state rather than completely removing it.
> 
> Signed-off-by: Harini T <harini.t@amd.com>
> ---
>  drivers/rtc/rtc-zynqmp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> index f39102b66eac..26893367f0f5 100644
> --- a/drivers/rtc/rtc-zynqmp.c
> +++ b/drivers/rtc/rtc-zynqmp.c
> @@ -383,6 +383,7 @@ MODULE_DEVICE_TABLE(of, xlnx_rtc_of_match);
>  static struct platform_driver xlnx_rtc_driver = {
>  	.probe		= xlnx_rtc_probe,
>  	.remove		= xlnx_rtc_remove,
> +	.shutdown	= xlnx_rtc_remove,
>  	.driver		= {
>  		.name	= KBUILD_MODNAME,
>  		.pm	= &xlnx_rtc_pm_ops,
> -- 
> 2.43.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

