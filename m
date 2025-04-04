Return-Path: <linux-rtc+bounces-3780-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4DDA7B9EE
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 11:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16281178EF8
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 09:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D9B1ACEDA;
	Fri,  4 Apr 2025 09:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2mNmYL+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F100A1AA7BF;
	Fri,  4 Apr 2025 09:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743758871; cv=none; b=EKrehvC+OdtoQp1XBHciDMeHTXSKwHk3aIUa6mgcxla1hIXRcNYfzk33CJdd5TBPGTqVOngmpwuo/ze1n75dyRNChewASorAHHryZiKxixMx+6+aRTENqXN9oEefrXuH0Ym9IuaIEOCL4lqMW3b6eU7cwVZo7OAEOYfCH9Q5NLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743758871; c=relaxed/simple;
	bh=j0RVHsK+8Z70siy6KizMbeUUMr7khc2n2FyBiYwSGY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2enPROEcpLQDFT/BM1U29E630eWjNFskIAxHssr6h7oBuD/Gf8d5qerBxVOrHITQ39rYP/YddA0nb4LaaCj3LBGayG7lrA5w7QNsuyfTK6H/vy4QlzlUjdikTIHUJZ2bqgKh/7W7jasHyhafrDwXstyVRY1DzFz5JMDXoCE7ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2mNmYL+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D4DC4CEDD;
	Fri,  4 Apr 2025 09:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743758870;
	bh=j0RVHsK+8Z70siy6KizMbeUUMr7khc2n2FyBiYwSGY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k2mNmYL+Tn1jkYo6pbOKWN+sdTq6/m14DMgEi0eE9QfpMdbwetp53Q1//RfKRHqfJ
	 2a8UyNCncTI5cIVqNggzKoCvtwGmhBscLRlfO2qSRbvjhTD+0jCwLIeonWZaHheBuv
	 yXi7owlf6dD2e9L1gA5Iu28WHOv/F4mvVTGUnRwgQ44MOB4cqizdCNs1uwfBWA8yAW
	 LGdA+Q7J2ngW0r3OMnnjFVbZA7lCnxyV9NsQs7q9F9trZ5DQDm7fV1H2/FR6JVzBaV
	 yLHAMQVYISyQdLymipvLBbT7uCjf+438NTx0U0kSMJxiqOfGtwA9fNFmEzqrrkD4vz
	 9Pi8tJCQTKGwQ==
Date: Fri, 4 Apr 2025 10:27:43 +0100
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
Subject: Re: [PATCH v3 11/32] mfd: sec: fix open parenthesis alignment
 (multiple)
Message-ID: <20250404092743.GC43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
 <20250403-s2mpg10-v3-11-b542b3505e68@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403-s2mpg10-v3-11-b542b3505e68@linaro.org>

On Thu, 03 Apr 2025, André Draszik wrote:

> checkpatch complains about unexpected alignment issues in this file -

Fine, but either call it by it's name 'Checkpatch' or the command 'checkpatch.pl'.

> update the code accordingly.

This phrasing and grammar is odd.  How about?

  Subject: mfd: sec-common: Fix multiple trivial whitespace issues

  Rectify a couple of alignment problems reported by Checkpatch.

> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
> ---
> v2:
> * make new alignment more readable (Krzysztof)
> ---
>  drivers/mfd/sec-common.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
> index 782dec1956a5fd7bf0dbb2159f9d222ad3fea942..1a6f14dda825adeaeee1a677459c7399c144d553 100644
> --- a/drivers/mfd/sec-common.c
> +++ b/drivers/mfd/sec-common.c
> @@ -149,9 +149,9 @@ sec_pmic_parse_dt_pdata(struct device *dev)
>  		return ERR_PTR(-ENOMEM);
>  
>  	pd->manual_poweroff = of_property_read_bool(dev->of_node,
> -						"samsung,s2mps11-acokb-ground");
> +						    "samsung,s2mps11-acokb-ground");
>  	pd->disable_wrstbi = of_property_read_bool(dev->of_node,
> -						"samsung,s2mps11-wrstbi-ground");
> +						   "samsung,s2mps11-wrstbi-ground");
>  	return pd;
>  }
>  
> @@ -264,8 +264,8 @@ void sec_pmic_shutdown(struct device *dev)
>  		 * ignore the rest.
>  		 */
>  		dev_warn(sec_pmic->dev,
> -			"Unsupported device %lu for manual power off\n",
> -			sec_pmic->device_type);
> +			 "Unsupported device %lu for manual power off\n",
> +			 sec_pmic->device_type);
>  		return;
>  	}
>  
> 
> -- 
> 2.49.0.472.ge94155a9ec-goog
> 

-- 
Lee Jones [李琼斯]

