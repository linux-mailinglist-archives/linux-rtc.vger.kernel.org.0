Return-Path: <linux-rtc+bounces-4486-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF69FB0146E
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Jul 2025 09:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E96D763113
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Jul 2025 07:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872481EEA28;
	Fri, 11 Jul 2025 07:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdZSsCXN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C381E5205;
	Fri, 11 Jul 2025 07:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752218441; cv=none; b=qgh5HGsHfTxvolC0nrKm/02SCqQAMrrL4m9r5lNPKBxS5i2otFsXqSvZq0J7jrW6/IoM1OexiYGGDZ8kdMiCmU56q8Xr9F6fkbQtySaExIuH7eOUaO2WXxyWmkeNg/75f/NfDj3VzOT8Pp7pK9zVst0Vkhxoc7wx/AnvuMQbJGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752218441; c=relaxed/simple;
	bh=qjaqR0kSbPDYshLZiiQBS6nGZWK+K9c7EmR0Co1wVUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1ktunMHpbzTx5JH8mjAOgdPG7UvasoNwimOoUJjiWq9aqFZpEcAEGRrcHshlj8dk7QReAD09cxsGfc06PEAccUx7e8rjxgP+9Uvll0e3wc4UzmADCjSxkXJVckzvv22KWanD5RuUSO+Uz5W3LEU/Bj8o+/cNSjNTuGkh5AwnU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdZSsCXN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55095C4CEF5;
	Fri, 11 Jul 2025 07:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752218440;
	bh=qjaqR0kSbPDYshLZiiQBS6nGZWK+K9c7EmR0Co1wVUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bdZSsCXN0hU1lu72Na2ybY9udpgGtCrPaHDwuWmTcZIA1FPxgaWutRCBfTg8p4fTw
	 EROCwhSmEt/f24g5Bom8Bl2UPXMLpVNZnWdjjEFyOQR/YzUob3znrXceHMPRhO5gNY
	 YenBTDIxzA+raTu2qIHFo/H6JkIlHSAib+IMISjhMATB7lPfwN+tutb74byYtzgvn0
	 Af7Rp1W5kvuTzMazKgoJei3ykddUkXSskMhFBBCn1IZ2FWHahmtO39psOabcKUoBog
	 dgZSI6HpsquRcGCVFlon1lNegrSYTBP/kb7BqIru+RZa3/BslIp4N1hXKowkNuE5V4
	 H2jpEfetMjd1A==
Date: Fri, 11 Jul 2025 09:20:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Devang Tailor <dev.tailor@samsung.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, faraz.ata@samsung.com
Subject: Re: [PATCH v2 2/3] rtc: s3c: support for exynosautov9 on-chip RTC
Message-ID: <20250711-shapeless-adorable-lobster-d2efbf@krzk-bin>
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
 <CGME20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9@epcas5p4.samsung.com>
 <20250710083434.1821671-3-dev.tailor@samsung.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710083434.1821671-3-dev.tailor@samsung.com>

On Thu, Jul 10, 2025 at 02:04:33PM +0530, Devang Tailor wrote:
> The on-chip RTC of this SoC is almost similar to the previous
> versions of SoC. Hence re-use the existing driver with platform specific
> change to enable RTC.
> 
> This has been tested with 'hwclock' & 'date' utilities
> 
> Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
> ---
>  drivers/rtc/rtc-s3c.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 5dd575865adf..8db24b6360b8 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -384,6 +384,15 @@ static void s3c6410_rtc_disable(struct s3c_rtc *info)
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
> +}

Looks a lot like s3c24xx_rtc_disable()...

Anyway, if you keep ignoring the review, no point to provide reviews
here.

Best regards,
Krzysztof


