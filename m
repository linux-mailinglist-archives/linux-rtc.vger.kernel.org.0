Return-Path: <linux-rtc+bounces-4485-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F83B01465
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Jul 2025 09:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 361691CA1098
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Jul 2025 07:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9651221FD6;
	Fri, 11 Jul 2025 07:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SR7VvVLm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7523E1F3BBB;
	Fri, 11 Jul 2025 07:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752218330; cv=none; b=hOcZW5uPiHnrEtYjCT1/f7pLOOIKp1pPPQTZcsVLOBgxKrxqJ5lI3ZPSLd++bq9W2rTZ9H6lkzRH9unGPewibERubCyEOP8HSz9O0n5+eREfTM/Qav6UiSWzSPGCZXbU3yA4rTxXbS1B8mHV/GivFBHj1euEBzB1hRvXwvKc//Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752218330; c=relaxed/simple;
	bh=ShP/GEws3F/Xu4CDdBl2pJANZePb6Hhgh1YDAXnYmF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdKX7YprZUn+biSEjdUpzklLJY9dNlvbNrIPObdL9ANFoKVTitvXgcjk4Pamu7a26BScSTUqrM8RGdZ1LRngoaZJvQ3EvLdDJTCb13igJRCxzehBk4j578t0JM+zSbKCB7JoHR4o4lgu7q11zDsAxJDzEoNHagw4Hah4JQ/sl90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SR7VvVLm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B67C4CEED;
	Fri, 11 Jul 2025 07:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752218330;
	bh=ShP/GEws3F/Xu4CDdBl2pJANZePb6Hhgh1YDAXnYmF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SR7VvVLmsgpvKcfH6j88LGLYp5FOHNoAYvu61OXcQ6IHEFQo42mfJGjToRC2rYl+W
	 1BZdMGfEFqmqZYXvP3Oeguc7jbozkY+7FRVoxZlzUB9HuUd7pB/JtudX0gd3WEU3PX
	 yYsl8VZNXozDIpheEfYjCqJ2f3rhJChNxensOUop9nP+/RXQGGMjQm+l96EuI0XXCg
	 5H0ufFAZA7sE8Ha5GUNAS0r0iWl8VbgzYoDjzrHEghmEAEZRK7r7SUx6rO2QYfG70i
	 5zZr3vn/Hc8fn68kuSvzt8i2WkjNTdavny94tmwc8t+KDqWSItiGtQpNeW38izvlYu
	 IU0m78xaLR+iw==
Date: Fri, 11 Jul 2025 09:18:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Devang Tailor <dev.tailor@samsung.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, faraz.ata@samsung.com
Subject: Re: [PATCH v2 1/3] dt-bindings: rtc: s3c-rtc: add compatible for
 exynosautov9
Message-ID: <20250711-nebulous-emu-of-defiance-f9f8a1@krzk-bin>
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
 <CGME20250710082534epcas5p40b49f5662ff36306349e6721fa9811fe@epcas5p4.samsung.com>
 <20250710083434.1821671-2-dev.tailor@samsung.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710083434.1821671-2-dev.tailor@samsung.com>

On Thu, Jul 10, 2025 at 02:04:32PM +0530, Devang Tailor wrote:
> Add "samsung,exynosautov9-rtc" dedicated compatible for
> on-chip RTC found in ExynosAutov9 SoC.
> 
> Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
> ---
>  Documentation/devicetree/bindings/rtc/s3c-rtc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


