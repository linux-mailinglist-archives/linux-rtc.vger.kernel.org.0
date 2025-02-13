Return-Path: <linux-rtc+bounces-3192-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DACA35003
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 21:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 031C9188B692
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 20:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106C1266B59;
	Thu, 13 Feb 2025 20:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b67JlGuC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348F128A2C0;
	Thu, 13 Feb 2025 20:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739480306; cv=none; b=MI8DaH3HfIVEfDTCwRjpIJUY90uppBryBt8dpwrqRskm05Nx3Z7as/xXk3qQGbwXCL675KObPraYCRE7AAcZ55J33xqyaCU/hFv11xnYsQCf+rrQMGdR69mPtXGyLkAUdXQ9Lw/qkMxq6dwTva61TbBmLTxm0AjjePi/m78eW48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739480306; c=relaxed/simple;
	bh=DMvs0zGdbiCX/sjLoR9VNsU3LUegWEBDqfY9b6mUYj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tO5nxjrPLxN+nSvuyiMnACqc5e4xnMezVhfnPj+THfKPQzdSYXnV0Q5k2+MKQobhXAcHFPeX/FWjF67mYChjcYpF9mXKICfLKI0LijI2BCUxgMt2yN5wms8ChkZz3nKnyyys/Pi0wsBvUrRtbTeM9Kw7a8uef+LVbClKmMD2Ufc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b67JlGuC; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26DE544300;
	Thu, 13 Feb 2025 20:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739480301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LWJiM1NFkSJ0D7UA78bKmM5hHyORgZQGH37a4foanvg=;
	b=b67JlGuCv3yJdSsndGs/nZkpiGYuhphZ7pGjGTTiU7QbULpqySbNoRzg6g/b9mZ1plFOF9
	iiSZCrQdbFnpB39cmPO+F25DJft8U343DgI8Rp5buSMRtiJDyv+2Cxd/XgYqn2cWjJPgFJ
	cbbmdxOCqfxm5uFQGc0r3of/Jxg+b7/k7I4Ow5NUa+dwlGGHRRsAyC22uq4bYsXrPeoPk7
	GLv4a9o2UjkuisxIFWbePEjQt90HCmYnc3Ov9dMhxNc7QrgjvzUcIJx5DdO4N4xq6ixznu
	mMacCfwcvgU1jVo/6m5aRFthKxWbyrTIFO4XJxPXHv6rOrPYV65LnXxpLlMbzQ==
Date: Thu, 13 Feb 2025 21:58:18 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	unicorn_wang@outlook.com, inochiama@outlook.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	dlan@gentoo.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/2] rtc: sophgo: add rtc support for Sophgo CV1800
 SoC
Message-ID: <20250213205818f14edd30@mail.local>
References: <20250213184622.2099324-1-alexander.sverdlin@gmail.com>
 <20250213184622.2099324-3-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213184622.2099324-3-alexander.sverdlin@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegjeejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopegrlhgvgigrnhguvghrrdhsvhgvrhgulhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhor
 hhgpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehqihhujhhinhhgsggrohdrughlmhhusehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhnohgthhhirghmrgesghhmrghilhdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriiihshiithhofhdrkhhoiihlohifshhkihdoughtsehlihhnrghrohdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On 13/02/2025 19:46:15+0100, Alexander Sverdlin wrote:
> +static int cv1800_rtc_probe(struct platform_device *pdev)
> +{
> +	struct cv1800_rtc_priv *rtc;
> +	u32 ctrl_val;
> +	void __iomem *base;
> +	int ret;
> +
> +	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> +	if (!rtc)
> +		return -ENOMEM;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	rtc->rtc_map = devm_regmap_init_mmio(&pdev->dev, base,
> +					     &cv1800_rtc_regmap_config);
> +	if (IS_ERR(rtc->rtc_map))
> +		return PTR_ERR(rtc->rtc_map);
> +
> +	rtc->irq = platform_get_irq(pdev, 0);
> +	if (rtc->irq < 0)
> +		return rtc->irq;
> +
> +	rtc->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(rtc->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk),
> +				     "clk not found\n");
> +
> +	platform_set_drvdata(pdev, rtc);
> +
> +	device_init_wakeup(&pdev->dev, 1);
> +
> +	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(rtc->rtc_dev))
> +		return PTR_ERR(rtc->rtc_dev);
> +
> +	rtc->rtc_dev->ops = &cv1800_rtc_ops;
> +	rtc->rtc_dev->range_max = U32_MAX;
> +
> +	ret = devm_request_irq(&pdev->dev, rtc->irq, cv1800_rtc_irq_handler,
> +			       IRQF_TRIGGER_HIGH, "rtc alarm", rtc);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "cannot register interrupt handler\n");
> +
> +	rtc_enable_sec_counter(rtc);

Really, this must be avoided, this loses precious information and
changing it later will break users. What must be done is to check
whether the RTC is started in .read_time if this is not the case, return
-EINVAL instead of an invalid date/time.
The RTC must be started once the time is set for the first time. This
ensures we can detect when the time is invalid.


> +
> +	return devm_rtc_register_device(rtc->rtc_dev);
> +}
> +
> +static const struct of_device_id cv1800_dt_ids[] = {
> +	{ .compatible = "sophgo,cv1800-rtc" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, cv1800_dt_ids);
> +
> +static struct platform_driver cv1800_rtc_driver = {
> +	.driver = {
> +		.name = "sophgo-cv1800-rtc",
> +		.of_match_table = cv1800_dt_ids,
> +	},
> +	.probe = cv1800_rtc_probe,
> +};
> +
> +module_platform_driver(cv1800_rtc_driver);
> +MODULE_AUTHOR("Jingbao Qiu");
> +MODULE_DESCRIPTION("Sophgo cv1800 RTC Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.48.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

