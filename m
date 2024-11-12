Return-Path: <linux-rtc+bounces-2539-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CD79C5D8E
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 17:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99F71280BE5
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 16:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D491C20B204;
	Tue, 12 Nov 2024 16:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCJH36Mi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6145206E6D;
	Tue, 12 Nov 2024 16:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731429608; cv=none; b=IP5V1JzJvSSKQC6QeQnzamnYOJL71J3jyoD5ROi0bkg6A+cljHJ/wxAF2k8ZSPDLYVGsEGDS8ZfGLN7xFp8VOuaUoCNlYtaUpKBHLR+YPCF8/9giPmU58UaV476RjN+6+NmqdXQNIFQcFvXOtgwV+zec5mtfpYhoRQLSeTTSvbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731429608; c=relaxed/simple;
	bh=+N04U2p3GcrP7jjyn/1KyLgQIjlLCtQTvmCsowADuRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJAhnOEBeMkGoOTHaEGzhvUE1u8rbitlbxseK9Yhvl/SDxJ7CSw/bIte6OV7qM4J08qgPz3kPnkADc1c5TKJPe/Pcy3krEJLI2qM0Qank1LnU7aDxlfUJKwJbmD5oYY1xR04WG96LOGGbokvev6Ynit9iXJXYRsgaSjYjqQkHwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCJH36Mi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09DF3C4CED0;
	Tue, 12 Nov 2024 16:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731429608;
	bh=+N04U2p3GcrP7jjyn/1KyLgQIjlLCtQTvmCsowADuRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eCJH36Mi8e7jO8g+WVpsNKgNfzMbd3yRYCNaY2xVCeVD4usfn5c4OJcB5H4oZJWmd
	 lvkRtWEcjmPRVSYVx6NYe8Ouz4rkg5wDR7CaA/fyjQ+lnggWpv6lOj8XyxluSUzoj/
	 j5PUguFa7uYrKSQ29rwcL9/V04vKtmOOvtwMsz4dOjxsfYXUR/95LpJUopZlanXp9o
	 5CN2clEVAb7QEXil4Q2caH8W5v2GrKuTyx5EuADJcLW1OoAIvIqsiN+jag2QtYgwZD
	 ExRXqKIX6TRF65F74PBfgjwNK6JPO6++2mfFVVwrXngfW2ySVD10Kod59W/XsAAdqi
	 n0oOmdtdQArWQ==
Date: Tue, 12 Nov 2024 10:40:06 -0600
From: Rob Herring <robh@kernel.org>
To: Philipp Rosenberger <p.rosenberger@kunbus.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Thomas =?iso-8859-1?Q?B=F6hler?= <t.boehler@kunbus.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: rtc: pcf2127: Add nxp,battery-backed
 flag
Message-ID: <20241112164006.GB1151895-robh@kernel.org>
References: <20241111154144.163604-1-p.rosenberger@kunbus.com>
 <20241111154144.163604-2-p.rosenberger@kunbus.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111154144.163604-2-p.rosenberger@kunbus.com>

On Mon, Nov 11, 2024 at 04:41:43PM +0100, Philipp Rosenberger wrote:
> This commit introduces the nxp,battery-backed property to the
> nxp,pcf2127 Device Tree bindings. This flag indicates that the
> RTC is battery-backed and forces the driver to enable the
> battery switch-over function, but only if no other mode is already
> configured.
> 
> With the PCF2131, the battery switch-over is disabled by default.
> If the battery switch-over is not enabled by the bootloader or
> firmware, this property ensures that the RTC can function correctly
> when powered by the battery.
> 
> Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
> ---
>  Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> index 2d9fe5a75b06..87ba16346fb4 100644
> --- a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> @@ -30,6 +30,13 @@ properties:
>  
>    reset-source: true
>  
> +  nxp,battery-backed:
> +    description: |
> +      Indicates that the RTC is battery-backed. This property forces
> +      the driver to enable the battery switch-over function, but only if
> +      no other mode is already configured.
> +    $ref: /schemas/types.yaml#/definitions/flag

Seems like something that would be a common property? I didn't find any 
prior art though.

Rob

