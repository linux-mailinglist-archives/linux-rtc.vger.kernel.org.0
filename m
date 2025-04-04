Return-Path: <linux-rtc+bounces-3783-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA18AA7BA1E
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 11:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32ACA7A7AEA
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 09:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4122F1AE876;
	Fri,  4 Apr 2025 09:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rlAoTx6C"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DB119D8BC;
	Fri,  4 Apr 2025 09:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743759757; cv=none; b=nksKqkvGwdxwY+BpjRILnmsMzygDE2Hf2513PKbFiY2q9Tajudne0kCnfbEvsESFGJ4XSuxF//6UxWzGsoR8ssAiI11wAzoV4Pn/PQm70by/li0ekez8P1YcM9MjwzRVL24YbmTWO3tYlK3DbApF/LnXgmcyR7XuHHDYRVG0jho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743759757; c=relaxed/simple;
	bh=PmYxl4sZbJkOboYnme1Rf3xp9X7MenH8Ul4Sk4iBhGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3Cum7Xo+FuGXfo/wmJngFnKDYiA+6f1hQT/UEZM/unCnYhO7SfrrQbcw199Uy6zA5Oceuv0OB0HGEU/CSBhF7x2abbhe0wIb2oSaS8c6AjqtmkUHPmQYTmhhdWIdnaGEsMBbUa/3myF2Xocnd/42O7wCiywKzx89dlJjVGAjOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rlAoTx6C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB05C4CEDD;
	Fri,  4 Apr 2025 09:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743759756;
	bh=PmYxl4sZbJkOboYnme1Rf3xp9X7MenH8Ul4Sk4iBhGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rlAoTx6Cxsk1VPlbNn1UFdsyAy9P0Rj8nyH5vajp1LzdLxXJBq8sWEwCF1k05aC4u
	 BzFAW6W4ahDULGMh6rE9WaFc2FdaUcJlhgafxtq8lfcX5p/hUkP+v5t1EcmCTvM0qS
	 Jf1BysEkl4+ipPZlua2TjHHNs1lGhYOEGhwoUq3vy+lEMWH4vqHImPq0aZhfMIM7PB
	 ulpvFqI6b3TyCpNU+K3HYaKbFFn5d839iavi0odpOZMGIm+xGPFGTnNvBn5u/vbbVW
	 4QN4xwUvhmxHn+Hv7z1O4D+b/ZFF5IXwbWnqQH4y+hpOK4Lc3yQkdNHjYDnK2P/lZ1
	 XztKg3HpTR2Mg==
Date: Fri, 4 Apr 2025 10:42:29 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 23/32] mfd: sec: add myself as module author
Message-ID: <20250404094229.GF43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
 <20250403-s2mpg10-v3-23-b542b3505e68@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403-s2mpg10-v3-23-b542b3505e68@linaro.org>

On Thu, 03 Apr 2025, André Draszik wrote:

> Add myself as module author, so people know whom to complain to about
> after the recent updates :-)

Full-stop.

Smiley faces might be okay on the list, but not sure we want them in
commit messages.

> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  drivers/mfd/sec-common.c | 1 +
>  drivers/mfd/sec-i2c.c    | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
> index 448300ab547c10d81f9f2b2798d54c8a03c714d8..05658f05cb857a784c7d01b1cf25de4870e1a95e 100644
> --- a/drivers/mfd/sec-common.c
> +++ b/drivers/mfd/sec-common.c
> @@ -293,6 +293,7 @@ static int sec_pmic_resume(struct device *dev)
>  DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
>  EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
>  
> +MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");

Might be more polite to put yourself at the bottom.

Not sure these are ordered alphabetically on purpose.

>  MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
>  MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
>  MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
> diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
> index 2ccb494c8c024361c78e92be71ce9c215757dd89..74fd28a6bc9a42879fc1eb05546777f60e0062e9 100644
> --- a/drivers/mfd/sec-i2c.c
> +++ b/drivers/mfd/sec-i2c.c
> @@ -233,6 +233,7 @@ static struct i2c_driver sec_pmic_i2c_driver = {
>  };
>  module_i2c_driver(sec_pmic_i2c_driver);
>  
> +MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
>  MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
>  MODULE_DESCRIPTION("I2C driver for the Samsung S5M");
>  MODULE_LICENSE("GPL");
> 
> -- 
> 2.49.0.472.ge94155a9ec-goog
> 

-- 
Lee Jones [李琼斯]

