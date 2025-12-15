Return-Path: <linux-rtc+bounces-5536-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84816CBCC7C
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 08:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3B0F300C52A
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 07:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B71322B83;
	Mon, 15 Dec 2025 07:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7c7rQKC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06453148D6;
	Mon, 15 Dec 2025 07:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783822; cv=none; b=tUUDQpMXVaNwtJTXg0yo+ilyTyFxkCIDQXVo4j/YZEQE+B4Dxd9byuPW/4eZG3Gsvc74sP7dD3qtO3IndGi6Dgg+83ADEJ+01Z6GgQH0iV47Z0ximMj7KIArwt9awe81zJ02bulPAax8pR1A2sLyJE9v8eSAssJv8/tVONC3jZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783822; c=relaxed/simple;
	bh=pXIJDfb/CsLXA8wtAEz4FUjy0cEBwnmQr7yMw4TD76s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHDFDtdsMGnb68buERL0EXJojN6fFk0/nu+5MBr3lxU1xiyN5tFFIYMXudRl/toChjdTLn7kZA2Hh5qmuueChPcz1zgXV5sz3zyZv0JRZfqPbKj1sz3Jj8QHYFKVPdNi2BSMvj6rOUP2Qa6ho33wg7fBGiPOA4ULyPA/KYHC6Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7c7rQKC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5071BC19422;
	Mon, 15 Dec 2025 07:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765783821;
	bh=pXIJDfb/CsLXA8wtAEz4FUjy0cEBwnmQr7yMw4TD76s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E7c7rQKCKBFkzxqMgC9va5F3dOj8PJgLiLriaPipnDZCbfaHrCrsT4Ks8F6S21dlA
	 4VlUZLWb9b2r+p3TLEapqCMi67CIrBwY6GBfHJxQH/wZNP13RPb3yPmymc6Dy+OHpr
	 s/RZHSQUhjBuUq8F1YWiPTKi1OaLxYBiJsO2PjP1laTwW6IciTE5unlq6UX5MEDEZN
	 V9gGoMn3kNiiZGZKWSz2S6YvIVyQbxfIetu3R5A7KOm7GJFBkzVyb/ynXWw5GLBcPC
	 G/GTE//kBQwV5Pb1Xs1sAgz73siwmUg5M4EK4qRNxiqNpTiKR594bdouYghtVnAlB6
	 eRcMjktyVx4IQ==
Date: Mon, 15 Dec 2025 16:30:16 +0900
From: Sumit Garg <sumit.garg@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	op-tee@lists.trustedfirmware.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 07/17] rtc: optee: Make use of tee bus methods
Message-ID: <aT-5CCZBzZdn937E@sumit-X1>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <a9c8da1b7b2832044129ec9e2616c40e0023ad57.1765472125.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9c8da1b7b2832044129ec9e2616c40e0023ad57.1765472125.git.u.kleine-koenig@baylibre.com>

On Thu, Dec 11, 2025 at 06:15:01PM +0100, Uwe Kleine-König wrote:
> The tee bus got dedicated callbacks for probe and remove. Make use of
> these. This fixes a runtime warning about the driver needing to be
> converted to the bus methods.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>  drivers/rtc/rtc-optee.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/rtc/rtc-optee.c b/drivers/rtc/rtc-optee.c
> index f924a729ead0..eefde789d194 100644
> --- a/drivers/rtc/rtc-optee.c
> +++ b/drivers/rtc/rtc-optee.c
> @@ -547,9 +547,9 @@ static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
>  		return 0;
>  }
>  
> -static int optee_rtc_probe(struct device *dev)
> +static int optee_rtc_probe(struct tee_client_device *rtc_device)
>  {
> -	struct tee_client_device *rtc_device = to_tee_client_device(dev);
> +	struct device *dev = &rtc_device->dev;
>  	struct tee_ioctl_open_session_arg sess2_arg = {0};
>  	struct tee_ioctl_open_session_arg sess_arg = {0};
>  	struct optee_rtc *priv;
> @@ -682,8 +682,9 @@ static int optee_rtc_probe(struct device *dev)
>  	return err;
>  }
>  
> -static int optee_rtc_remove(struct device *dev)
> +static void optee_rtc_remove(struct tee_client_device *rtc_device)
>  {
> +	struct device *dev = &rtc_device->dev;
>  	struct optee_rtc *priv = dev_get_drvdata(dev);
>  
>  	if (priv->features & TA_RTC_FEATURE_ALARM) {
> @@ -696,8 +697,6 @@ static int optee_rtc_remove(struct device *dev)
>  	tee_shm_free(priv->shm);
>  	tee_client_close_session(priv->ctx, priv->session_id);
>  	tee_client_close_context(priv->ctx);
> -
> -	return 0;
>  }
>  
>  static int optee_rtc_suspend(struct device *dev)
> @@ -724,10 +723,10 @@ MODULE_DEVICE_TABLE(tee, optee_rtc_id_table);
>  
>  static struct tee_client_driver optee_rtc_driver = {
>  	.id_table	= optee_rtc_id_table,
> +	.probe		= optee_rtc_probe,
> +	.remove		= optee_rtc_remove,
>  	.driver		= {
>  		.name		= "optee_rtc",
> -		.probe		= optee_rtc_probe,
> -		.remove		= optee_rtc_remove,
>  		.pm		= pm_sleep_ptr(&optee_rtc_pm_ops),
>  	},
>  };
> -- 
> 2.47.3
> 

