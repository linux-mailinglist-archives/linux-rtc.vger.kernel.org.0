Return-Path: <linux-rtc+bounces-4642-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B179BB1AA5B
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Aug 2025 23:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BEF81894A36
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Aug 2025 21:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED2E1F416B;
	Mon,  4 Aug 2025 21:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kTdn889l"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5888C1C1F02;
	Mon,  4 Aug 2025 21:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754343145; cv=none; b=riQbhONs6UMqpygOUqLvZ2K4gevkszJAR+YdEMgj7oSWLcVY+BZhgICsXonTPkknVWGTJsDSKn00Y+pnweeGthhj2ESPkNCrEdnTNW8KgwhPcP6JAtf8M4m2SFGvTK5fBZk03TGfTdnxLgZokBZs8TCw5TfBVZ+hYDgKrNc38aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754343145; c=relaxed/simple;
	bh=0ETSRs55SurE5UWHARraQIhT34q7Y2HgZ+yHb6c9PDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tE4WFnivIvFJxVO1008uCyYyo0mytT0xTHrHm7d9JLi61ykkSnqJUjK855/nvNPjxGdqEZZQwo/u78gi9usfymoU9h/e59Cwk1FqyR+X5vPGb8x8s9iYi3r+HZF0I3itsWO51ORgPH3qaG2BOypmdSCRu1QFJX/R2RflxWmUvYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kTdn889l; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E862344487;
	Mon,  4 Aug 2025 21:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754343134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vF2OkHBOjK8vjJ3vlRzHmsm/3qQXun/URonDEmawmZU=;
	b=kTdn889lz4zxChAjFptOF4R7nE1TTpJ7wNCh0MIvUBYP0cFuAdEnP7zH8iBbL/+CsaD0Av
	QVCZYmxQvN38IVUGseAxzz9mmXd18jFRnXeKhIZ163S28K33E+t2XADnwTblkix98jFv1X
	AGjezf9mZBGYQK568/JmdNGKrjKZjBvYee93zAzx1rxUCGr8XPIAPk4IgUlDFGD3tw0BnD
	eeglKwDpxC1QsjIrIPZs5zWJnIyocmtQrsFQc9x8zojYvNH8kmlEIUv7HicpeiCUEbREEV
	/pzBGZ2hhXOyhlVgDM0QGKZMXjE3tsV/Tz/CHBEsC4l9aeb+2NF6D23Y7E3hkw==
Date: Mon, 4 Aug 2025 23:32:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: michal.simek@amd.com, srinivas.neeli@xilinx.com,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ivan Vera <ivan.vera@enclustra.com>
Subject: Re: [PATCH v1 1/1] rtc: zynqmp: ensure correct RTC calibration
Message-ID: <20250804213213d4844d4e@mail.local>
References: <20250804154750.28249-1-l.rubusch@gmail.com>
 <20250804154750.28249-2-l.rubusch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804154750.28249-2-l.rubusch@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudeffeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgefgjeffhfdukeefheeugffgfeetjefgvdfhgedttedttedtffdtiefgvdeiffdunecuffhomhgrihhnpegrmhgurdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppeeghedruddurdeikedrvddvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeghedruddurdeikedrvddviedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehlrdhruhgsuhhstghhsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtohepshhrihhnihhvrghsrdhnvggvlhhiseigihhlihhngidrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvr
 hhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhvrghnrdhvvghrrgesvghntghluhhsthhrrgdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com

On 04/08/2025 15:47:50+0000, Lothar Rubusch wrote:
> From: Ivan Vera <ivan.vera@enclustra.com>
> 
> In the event of an uninitialized calibration register, ensure the register
> is reset and properly programmed during the probe sequence.
> 
> At present, only the calibration register is evaluated. If it holds invalid
> values after a power cycle, there's no longer a way to reset it, for
> instance, via a devicetree entry to 0x7FFF. This issue is documented here:
> https://adaptivesupport.amd.com/s/article/000036886?language=en_US 
> 
> The fix prioritizes an optional calibration value provided via the
> devicetree over the value in the register.
> 
> Fixes: 07dcc6f9c76275d6679f28a69e042a2f9dc8f128 ("rtc: zynqmp: Add calibration set and get support")
> Signed-off-by: Ivan Vera <ivan.vera@enclustra.com>
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> ---
>  drivers/rtc/rtc-zynqmp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> index f39102b66eac..0c063c3fae52 100644
> --- a/drivers/rtc/rtc-zynqmp.c
> +++ b/drivers/rtc/rtc-zynqmp.c
> @@ -331,9 +331,9 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
>  		if (ret)
>  			xrtcdev->freq = RTC_CALIB_DEF;
>  	}
> -	ret = readl(xrtcdev->reg_base + RTC_CALIB_RD);
> -	if (!ret)
> -		writel(xrtcdev->freq, (xrtcdev->reg_base + RTC_CALIB_WR));
> +
> +	/* Enable unconditional re-calibration to RTC_CALIB_DEF or DTB entry. */
> +	writel(xrtcdev->freq, xrtcdev->reg_base + RTC_CALIB_WR);

Doesn't this forcefully overwrite the proper value that has been set
from userspace and so trashes the time at each reboot?

Isn't the proper way to reset it to simply set the offset from userspace
again?

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

