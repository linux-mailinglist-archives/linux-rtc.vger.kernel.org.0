Return-Path: <linux-rtc+bounces-4436-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E65D3AFAF99
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Jul 2025 11:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F41563BC4E2
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Jul 2025 09:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9D128FFE2;
	Mon,  7 Jul 2025 09:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CC2u+/63"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2E928FAB7;
	Mon,  7 Jul 2025 09:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880238; cv=none; b=Ojm5Ovs8HudumuenjVnnJ57ekfNRXzAwPDRYjuTZ9Y7ZMPuX0pTe6QmzoUGfwUQWvSde2advel6/cjRY0eZonqWiDVXw2YV468aEElFBFEy8rZd4nwz+e7NV+GnuJ2T9EyeQddyWBAn+mogOqNUut7/C6WZR5rfD1LtvrdQU4fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880238; c=relaxed/simple;
	bh=dUD/W+kkqMmrTrDP9/CpUATKT8y8QfS9afWEsSm07Eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QQ7J32VIrnxlX5ocJ1NTlPV5GCK5yu1s2LjoyqkUGULXp+7xoWg2+798mLVIZySIrIo8MnGWhHvLzJLU0hwolQPtrXJit7yXPLwN3OWeYdjoiylGSfUHx9d8q4CL9mAmNeKOdeuAEKRjNBvSVZ15LYL8o+jaAVVl1nyPngVRLtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CC2u+/63; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44606C4CEF5;
	Mon,  7 Jul 2025 09:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751880237;
	bh=dUD/W+kkqMmrTrDP9/CpUATKT8y8QfS9afWEsSm07Eo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=CC2u+/630TZUNgJkmv/ez9oTw6tZnzF7Q2p0NbXcUzgE5MLASAmnfp1aKECDNjEUr
	 aHevfbQMx2c7gqPBGrNs61XB8QsGJfRsg/ApyhmU6THSu4Sl5eU4h7VMuvL5edBc+N
	 eE8LclM3FNFK03N5PQ8BnkHrU4WHAHRpFO94Q2FTMuVHlZtqfHunDJBCyShitzwV3Q
	 LqSyQqEGwEhfmxE5W/FbJq3s4hJPU5ST7CRV0y3tC3HQsCpV6ZtOfP07GvW46yWaZm
	 MGDPDbm+xG7IIOcmVCYtznSt/oYoeCiKpr8aIQjqjqSwvVOlC5u5onCH0G8wjLAyGm
	 cKc++BdPtMx1Q==
Message-ID: <3c794a74-30d6-4a16-8bdb-4345b3b5e453@kernel.org>
Date: Mon, 7 Jul 2025 11:23:53 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rtc: s3c: support for exynosautov9 on-chip RTC
To: Devang Tailor <dev.tailor@samsung.com>, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 inux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 faraz.ata@samsung.com
References: <20250702052426.2404256-1-dev.tailor@samsung.com>
 <CGME20250702051532epcas5p381e97531e4df64f556e8aba86c5532d9@epcas5p3.samsung.com>
 <20250702052426.2404256-3-dev.tailor@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250702052426.2404256-3-dev.tailor@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/07/2025 07:24, Devang Tailor wrote:
> The on-chip RTC of this SoC is almost similar to the previous
> versions of SoC. Hence re-use the existing driver with platform specific
> change to enable RTC.
> 
> This has been tested with 'hwclock' & 'date' utilities
> 
> Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
> ---
>  drivers/rtc/rtc-s3c.c | 26 ++++++++++++++++++++++++++
>  drivers/rtc/rtc-s3c.h |  4 ++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 5dd575865adf..00686aa805f2 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -384,6 +384,23 @@ static void s3c6410_rtc_disable(struct s3c_rtc *info)
>  	writew(con, info->base + S3C2410_RTCCON);
>  }
>  
> +static void exynosautov9_rtc_disable(struct s3c_rtc *info)
> +{
> +	unsigned int con;
> +
> +	con = readb(info->base + S3C2410_RTCCON);
> +	con &= ~S3C2410_RTCCON_RTCEN;
> +	writeb(con, info->base + S3C2410_RTCCON);
> +
> +	con = readb(info->base + EXYNOSAUTOV9_TICCON0);
> +	con &= ~EXYNOSAUTOV9_TICCON_TICEN;
> +	writeb(con, info->base + EXYNOSAUTOV9_TICCON0);
> +
> +	con = readb(info->base + EXYNOSAUTOV9_TICCON1);
> +	con &= ~EXYNOSAUTOV9_TICCON_TICEN;
> +	writeb(con, info->base + EXYNOSAUTOV9_TICCON1);

You clear these bits during disable, but why aren't they set during
enable? Why is this asymmetric? This should be clearly explained, but
both commit msg and code is completely silent.

> +}
> +
>  static void s3c_rtc_remove(struct platform_device *pdev)
>  {
>  	struct s3c_rtc *info = platform_get_drvdata(pdev);
> @@ -574,6 +591,12 @@ static struct s3c_rtc_data const s3c6410_rtc_data = {
>  	.disable		= s3c6410_rtc_disable,
>  };
>  
> +static struct s3c_rtc_data const exynosautov9_rtc_data = {

Please put const after static.



Best regards,
Krzysztof

