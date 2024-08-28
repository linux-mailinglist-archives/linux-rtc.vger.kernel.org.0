Return-Path: <linux-rtc+bounces-1755-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 016C496272D
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Aug 2024 14:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5717CB23141
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Aug 2024 12:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34EF1741F0;
	Wed, 28 Aug 2024 12:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="kTLZNdHf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E99316C865;
	Wed, 28 Aug 2024 12:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724848514; cv=none; b=d/LPNBSKUH5+lSgscz6igzsFHr/M3RIJwnqmA6EsZD57tua4vstKL3qQqYf+SuZYIXaLCHDDgYwfpp+n7+zyZpn5fhslxYCEqpLQ7EgKEThQHKqt7KyIGUrQLYbCAbegdprmerSh5lVKOzNSiLQWmBZlwzNTnwEhhAKkLUF/M1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724848514; c=relaxed/simple;
	bh=gcnlVCGhNsXbrG75gI6VAI+pGMau5ig85qscdSmIeaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPD0YZxLeMhIXtXKh1AmEqYBsBr+IVHfwL6+k8M1hhmIDwGh1ei/DKhG5gz2FLGBjQltk8WFQBZUGz1n8YwPqK3hAaaBw6qiJV1PXookUG9ewT/slCdXM6VCA06mCKXLzSd39dBthRvbSeV87gSMwOIAchNYdg9P1gYXmqMeulk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=kTLZNdHf; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D11F41483D7A;
	Wed, 28 Aug 2024 14:35:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1724848509; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ErFotDlNr6Fq9ks4AhQMhqRbI5rcx6Xs1RlVuakGQz8=;
	b=kTLZNdHfV8syWum2VtrfONLlYaucsiSDqx/EVxFA+SpM+Zqlh1bX23bGJOcrKZJDN15GXo
	bKMAv3AMpRvZOeRIpnuXpksEqVa6Te8ALtnZtQHdvuAPVtFQtlQQfKdnvSVUtaAKCYgCoO
	y584GCnKgZ/FNq3tgSbas89Si2E7zwQ+6W5Qyq0Mx0s1Iygf6eWu00lqpNcW3a2dwmrlhQ
	a+t4ekR92MD6CWcKnW3CXKp00dMOz7tuB1bT+CEt5KYeYYOwDzcgEQUfdcoLdB6noUMOdj
	GKgxFEW8Yw0o89hPJ/zivxmI30du6IqwPNGSb2IH2M1XLnf/Sp/fgTYaRXNphQ==
Date: Wed, 28 Aug 2024 14:35:06 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Yang Ruibin <11162571@vivo.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] rtc: rtc-asm9260: Switch to use dev_err_probe()
Message-ID: <20240828-tractor-dig-7bf21a1ef549@thorsis.com>
Mail-Followup-To: Yang Ruibin <11162571@vivo.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240828122507.1323928-1-11162571@vivo.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828122507.1323928-1-11162571@vivo.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello,

Am Wed, Aug 28, 2024 at 08:25:07PM +0800 schrieb Yang Ruibin:
> use dev_err_probe() instead of dev_err() to simplify the error path and
> standardize the format of the error code.
> 
> Signed-off-by: Yang Ruibin <11162571@vivo.com>
> ---
>  drivers/rtc/rtc-asm9260.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-asm9260.c b/drivers/rtc/rtc-asm9260.c
> index a83b47e0d..2b7058ebb 100644
> --- a/drivers/rtc/rtc-asm9260.c
> +++ b/drivers/rtc/rtc-asm9260.c
> @@ -268,10 +268,8 @@ static int asm9260_rtc_probe(struct platform_device *pdev)
>  		return PTR_ERR(priv->clk);
>  
>  	ret = clk_prepare_enable(priv->clk);
> -	if (ret) {
> -		dev_err(dev, "Failed to enable clk!\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to prepare clk!\n");

This changes the error message from "failed to enable" to "failed to
prepare", which is not what the commit message says.  However
technically clk_prepare_enable() does both, so maybe a different text
would match better?

Greets
Alex

>  
>  	ccr = ioread32(priv->iobase + HW_CCR);
>  	/* if dev is not enabled, reset it */
> -- 
> 2.34.1
> 
> 

