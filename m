Return-Path: <linux-rtc+bounces-5549-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A52DFCBD659
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 11:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C6613010980
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 10:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FF63164D8;
	Mon, 15 Dec 2025 10:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xa269C9h"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E6B3168F1
	for <linux-rtc@vger.kernel.org>; Mon, 15 Dec 2025 10:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765795371; cv=none; b=Dn0jgX3J7P8qDSiHdwtZb4es8mNyT1IV4J5xI+uYvJ4IGU63fmp/cDkwgvhs52uQKMWSWzQt1BNeaP6eQotXmea+Vvb01V9eoC5vC1/QRF9kVAJ5oGN8C5k2ekelsu2IDhWolMlWS8eZ1/Mp2qDRBxRKHB95FFFsOoOGXdqfRJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765795371; c=relaxed/simple;
	bh=wa/5f8vGSIRIPOW6Ah9bV0BCECTZlAFT9z1h8z4piDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwzXlY7xEbMMoMOe2XxGuUKl158gsVFR2LT369vSAPjy6O6DTa2np4eItzVctSh0KHdMoFhH3o+JfBzUAPadwpctd3eiNYHnR3DpjGFrsqaaN4KEfa+8NtKuIZhMN8Z2z0om4kYAJTAnu/5IEhnLqakjG804D85Hm6o/v21k81Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xa269C9h; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 451C81A21C8;
	Mon, 15 Dec 2025 10:42:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17A1260664;
	Mon, 15 Dec 2025 10:42:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE8AC11941C71;
	Mon, 15 Dec 2025 11:42:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765795356; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iVnSkXLIZ8OVjARBRtMXQL8etwNmPUgJcIoKsh2mIdw=;
	b=xa269C9hVnH88eHieZoaBncQLiLIsHmpXh8lNZGAWaMCKo3d6WtI+lMAIWqAgkRvs/4pJJ
	mx8RF3W6E46GDmXNVR3HiTRqwVmoLbTf/gL5bt/i1EmOjB5CCiIknleHKQJtXhNjyKn6VC
	htWItCbHPH2qz8pvDFPcsQ0rSfymu0XM4FSxPsa6s8tBdFhIcjsfuEfrJ9q9czDdVou0Jz
	lAqkoUudQLi9asZS8ghQIV/ssBunwT6YYzy7VOnknR7Wr4IxazaMYhgLNJslTQXc9pv1jY
	p1XzY139FKo11KD70eeVctZDPj1I1pYE49caUqL4rQ5pbyPTXhUo2YmNXKIN/w==
Date: Mon, 15 Dec 2025 11:42:35 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 07/17] rtc: optee: Make use of tee bus methods
Message-ID: <20251215104235c0010f89@mail.local>
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
X-Last-TLS-Session-Version: TLSv1.3

On 11/12/2025 18:15:01+0100, Uwe Kleine-König wrote:
> The tee bus got dedicated callbacks for probe and remove. Make use of
> these. This fixes a runtime warning about the driver needing to be
> converted to the bus methods.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/rtc/rtc-optee.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
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

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

