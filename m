Return-Path: <linux-rtc+bounces-4893-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A50B56C5C
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 23:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 594183B423F
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 21:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3860822D7A5;
	Sun, 14 Sep 2025 21:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2MxMQQlc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C521D27B6
	for <linux-rtc@vger.kernel.org>; Sun, 14 Sep 2025 21:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757884623; cv=none; b=AqRsXJKYftcY8f9NpeZWE0PA/Lf+I0AfApwpvO9IvrzGbU9v+walOrjhsq/opINqYO32FmHyZ7wVnRgmlGsvd8XPnAlmtHPzyIV6Ff/A4wYAe0FySLt7fu9Q0rFJyKxGcq656qj1A23/VKHNTYh17oEWUGc8/+snPePH7IfI2RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757884623; c=relaxed/simple;
	bh=tr89oCiMhO5571iF0ExMJ9MkihS2atdpGkwlqvhso5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uc6YgojwZnh/V3RWKTzxM6FOYeXLu4V7PYUgMlzAqrFQmu/hffrTlMJxSgRSnLVrs8mLDEBmmySm8poDwmUvQ4P2Vrj72Hzr/ilKWxg1W9aZYmLaKk73RZZSfVSlXlwrMUmfStUAM9wMSbbszQRNVmV9w9priC7CWRT1PhGep+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2MxMQQlc; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0DB874E40BD1;
	Sun, 14 Sep 2025 21:17:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D72636063F;
	Sun, 14 Sep 2025 21:16:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC42E102F2A78;
	Sun, 14 Sep 2025 23:16:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757884619; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=hGMElI/WGlDZApqBGkLsN2d0Bdu0tJazMj/fn9s0+XY=;
	b=2MxMQQlczm/sCdygcuRbZnSgDNqahJL2DA0Qsx4oSMi/k9lP2LReNOxMDduAjRHwIysi6B
	mfY0F62uZ77NfDXLZpt/0sfmHYz77wfiHCzdKPxfaChKftjc9eUQFAczJUCijyMxXIaLSH
	AbeHtgJk+2MPBKCaf36xsubnLaIti8tP43I3DaMmwoPfR8MwCFRs/ssVz9pEL9FNhfytNs
	jiyyq/dUeSHTdrK1qLAV7P1g/+GRfx2aQOkEcJCqe1nFknuKVmvWhwJto0dMligU1pEis0
	9anemYCSfSqORbAWw8W3qY0QKER0hGXKxAkI0dST49O6h26wzXOaNsDBkJMBlw==
Date: Sun, 14 Sep 2025 23:16:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: rtc: pcf85063: remove
 quartz-load-femtofarads restriction for nxp,pcf85063
Message-ID: <175788449951.388732.4064789472878878966.b4-ty@bootlin.com>
References: <20250903191128.439164-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903191128.439164-1-Frank.Li@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 03 Sep 2025 15:11:27 -0400, Frank Li wrote:
> Original TXT binding doc have not limitition about quartz-load-femtofarads,
> which only allow 7000 for nxp,pcf85063.
> 
> So remove it to fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: rtc@51 (nxp,pcf85063): quartz-load-femtofarads:0: 7000 was expected
>         from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf85063.yaml#
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: rtc: pcf85063: remove quartz-load-femtofarads restriction for nxp,pcf85063
      https://git.kernel.org/abelloni/c/b4bcfbfb1f0f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

