Return-Path: <linux-rtc+bounces-3779-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18256A7B9C1
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 11:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35360189A72A
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 09:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDE51A3AB8;
	Fri,  4 Apr 2025 09:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZUU+43R"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980821A3142;
	Fri,  4 Apr 2025 09:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743758499; cv=none; b=Ds4Hlsf3lP9MVKZtBNx7QZ4pTyf6QBIb6RoFFguO8SLeyBCMhwMUuz9nntxV6aSldpk7/ZiCnNAG1yXfc27/Qy3cAHOM/eRy27qyyXuQxVlgHzNl0r8zcUFizl37v5aJHQ6y5TSQzI1Whd8dlh8qLehNkBqFkciq6ndOAOMMRcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743758499; c=relaxed/simple;
	bh=8YXmkh4y0yK+27UdeCSafZhd00VNPUKtI2R/MeGHZw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orRVXabdhasUcnws5F0vzTCoEkzDorFYrdVVcyFEMSqr4AABi++Utd8D+FWNvGEz0qOikdnOSHilHbyGwTjcpKXrQ9qvHj0gFoT9xhd74c+sW9sUVzBws+eWVYxVKnAnC5LVwVrOK9if3sRCT852Lw8JupR/GEhJ1hmo0PQDtZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZUU+43R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9CBC4CEDD;
	Fri,  4 Apr 2025 09:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743758499;
	bh=8YXmkh4y0yK+27UdeCSafZhd00VNPUKtI2R/MeGHZw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BZUU+43R7jq6omveJw4jer75uPzA+ZLjJxaCvwnqHt7KNUQ0CAzRRaiKLlriM4YQT
	 whjDY52WTH01XTrdPwZ0V+6yugelmu2i7PzrWWfwkwDWP4fmwMeUTOQdgHXL6KCjmW
	 Xq2fO8j4XGNIx+lxVqm+bLv9mak3pODaMiU3zHKSFXPz82j/B+PctBqePCv6wJY4ej
	 2eH9Nu3vJhVqePfECRAgseYVRzthGuN5imTSejU/X4H2JQg7Jl4U7Z+dF59KbkEGg2
	 u6dIdk/jXcqPwsodzPpDjMXHyNNHvQdW3FgRxwtu/+BLsaNxD2C93IBbGfwBArpu6n
	 4u10uBMVLPDUw==
Date: Fri, 4 Apr 2025 10:21:31 +0100
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
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 10/32] mfd: sec: merge separate core and irq modules
Message-ID: <20250404092131.GB43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
 <20250403-s2mpg10-v3-10-b542b3505e68@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403-s2mpg10-v3-10-b542b3505e68@linaro.org>

On Thu, 03 Apr 2025, André Draszik wrote:

> There is no reason to have these two kernel modules separate. Having
> them merged into one kernel module also slightly reduces memory
> consumption and module load times a little.
> 
> mapped size (lsmod):
>          before:             after:
>     sec_core   20480    sec_core   24576
>     sec_irq    16384
>     ----------------
>     total      36864
> 
> Section sizes (size -A):
>          before:             after:
>     sec_core    6780    sec_core   13239
>     sec_irq     8046
>     ----------------
>     Total      14826
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
> Checkpatch suggests to update MAINTAINERS, but the new file is covered
> already due to using a wildcard.
> ---
>  drivers/mfd/Makefile                     | 3 ++-
>  drivers/mfd/{sec-core.c => sec-common.c} | 2 ++

Okay, but why the name change?

>  drivers/mfd/sec-irq.c                    | 9 ---------
>  3 files changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index b617782eca436e34084a9cd24c309801c5680390..8f315298b32a2a9ee114ed5e49e760bd8f930aee 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -228,7 +228,8 @@ obj-$(CONFIG_MFD_RK8XX)		+= rk8xx-core.o
>  obj-$(CONFIG_MFD_RK8XX_I2C)	+= rk8xx-i2c.o
>  obj-$(CONFIG_MFD_RK8XX_SPI)	+= rk8xx-spi.o
>  obj-$(CONFIG_MFD_RN5T618)	+= rn5t618.o
> -obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o sec-irq.o
> +sec-core-objs			:= sec-common.o sec-irq.o
> +obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o
>  obj-$(CONFIG_MFD_SEC_ACPM)	+= sec-acpm.o
>  obj-$(CONFIG_MFD_SEC_I2C)	+= sec-i2c.o
>  obj-$(CONFIG_MFD_SYSCON)	+= syscon.o
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-common.c
> similarity index 98%
> rename from drivers/mfd/sec-core.c
> rename to drivers/mfd/sec-common.c
> index c4b7abe511090d8f5ff2eb501f325cc8173b9bf5..782dec1956a5fd7bf0dbb2159f9d222ad3fea942 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-common.c
> @@ -307,6 +307,8 @@ static int sec_pmic_resume(struct device *dev)
>  DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
>  EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
>  
> +MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
> +MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
>  MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
>  MODULE_DESCRIPTION("Core driver for the Samsung S5M");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> index bf86281401ac6ff05c90c2d71c84744709ed79cb..aa467e488fb5ef79d5bc7110e1ba7c26fcfa9892 100644
> --- a/drivers/mfd/sec-irq.c
> +++ b/drivers/mfd/sec-irq.c
> @@ -6,7 +6,6 @@
>  #include <linux/array_size.h>
>  #include <linux/build_bug.h>
>  #include <linux/dev_printk.h>
> -#include <linux/export.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
>  #include <linux/mfd/samsung/core.h>
> @@ -17,7 +16,6 @@
>  #include <linux/mfd/samsung/s2mpu02.h>
>  #include <linux/mfd/samsung/s2mpu05.h>
>  #include <linux/mfd/samsung/s5m8767.h>
> -#include <linux/module.h>
>  #include <linux/regmap.h>
>  #include "sec-core.h"
>  
> @@ -510,10 +508,3 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(sec_irq_init);
> -
> -MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
> -MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
> -MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
> -MODULE_DESCRIPTION("Interrupt support for the S5M MFD");
> -MODULE_LICENSE("GPL");
> 
> -- 
> 2.49.0.472.ge94155a9ec-goog
> 

-- 
Lee Jones [李琼斯]

