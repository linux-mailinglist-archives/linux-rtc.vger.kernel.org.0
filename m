Return-Path: <linux-rtc+bounces-5442-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EA0C74580
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 14:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7FD88342C2F
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 13:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB22334405B;
	Thu, 20 Nov 2025 13:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqHNktJU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4773234402A;
	Thu, 20 Nov 2025 13:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646293; cv=none; b=lwdVumou8x/G8aZT7y726Jr6s+9WEkjMg+HvsvSMxgVyu0HsdNfkZXT1t495Estoj/70zxDbSUEJsNuNl/y7FVhSrrUrD56nN0xikB0nXQGCbjDpZfZckyQGA906cr0V5pmOOzdeX1nn0o8zQLk2iZ96OInIlfRqu7Dxm8np2fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646293; c=relaxed/simple;
	bh=geE8CGqh+oZM/uYkoic6MrUOnhgB0yIjv8DKrEbMBp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaSBR7TzKx6L3GK9wNkEZQ5mNoGgIEmKm3U/7zKLhpu2ZZ/jAeGXIQEr3A+aXaPT+xZiJJaZ5VVyWn9hgy+qZcxfA+AyLKIhVTiuVZHEOcai7Lt9nYAFIkG9iFfbzs/bzrKzPoOwNqk2iVL1zfWekEmqEy/VNq+BFUqF89QpIPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqHNktJU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80FCAC4CEF1;
	Thu, 20 Nov 2025 13:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763646293;
	bh=geE8CGqh+oZM/uYkoic6MrUOnhgB0yIjv8DKrEbMBp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aqHNktJUoFFpvwMD5ypnB6ijVfrJSZRG0d5kxIdfF14wDssA+jJlLHn6oQqrb+7n2
	 LfFI+vtFdHb3f3bYoizKWazZdOz8XYJW+mtFKn/F3murhyVwfdPQRMproP7wrrz0/t
	 DAmDwyWmrb9MzCTapfML81ZvLGpTzk9Vef+qp+PMDa3iaQJLXD9dmUaitkRqwe669k
	 SStu1IVKEMASfrsHyZ5waPYaNAr13shnRbVokCg10J8MStDSQ14lrLqyBxMWTcg1tR
	 LAHJ04MNWggQjdV8bUBSHBEinOkXh5ZfIB859lZETdyj16rdLXSVaIvSlkRzjwIP61
	 bqtCBn+cjVs6A==
Date: Thu, 20 Nov 2025 13:44:45 +0000
From: Lee Jones <lee@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 05/11] mfd: macsmc: Add new __SMC_KEY macro
Message-ID: <20251120134445.GC661940@google.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
 <20251112-macsmc-subdevs-v5-5-728e4b91fe81@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251112-macsmc-subdevs-v5-5-728e4b91fe81@gmail.com>

On Wed, 12 Nov 2025, James Calligeros wrote:

> When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 errors
> out with 'case label does not reduce to an integer constant'. Introduce
> a new __SMC_KEY macro that can be used instead.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  include/linux/mfd/macsmc.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
> index 6b13f01a8592..f6f80c33b5cf 100644
> --- a/include/linux/mfd/macsmc.h
> +++ b/include/linux/mfd/macsmc.h
> @@ -41,6 +41,7 @@ typedef u32 smc_key;
>   */
>  #define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
>  #define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) | (s)[3])
> +#define __SMC_KEY(a, b, c, d) (((u32)(a) << 24) | ((u32)(b) << 16) | ((u32)(c) << 8) | ((u32)(d)))

Are we expecting users/consumers to be able to tell the difference
between SMC_KEY and __SMC_KEY (assuming that _SMC_KEY is just an
internal)?

I have not tested this and it is just off the top of my head, but does
this work:

#define _SMC_KEY(s) __SMC_KEY((s)[0], (s)[1], (s)[2], (s)[3])

-- 
Lee Jones [李琼斯]

