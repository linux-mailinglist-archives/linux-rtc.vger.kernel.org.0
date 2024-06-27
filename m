Return-Path: <linux-rtc+bounces-1412-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F9091B22A
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 00:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1208E28245A
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Jun 2024 22:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6EC1A2C3A;
	Thu, 27 Jun 2024 22:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JVyPk31/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114CF1A2572;
	Thu, 27 Jun 2024 22:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719526972; cv=none; b=pvww03BcyQ1uq9opdK+tLFf1U8zO6vMxmUvoogwD1JiUE/jlmJb3xwhsqqPGlbbcVjN6ZfXhOWNHArR6dFMLrWZMJHrHxlS81RIkPWSN5AL3SHYXA8KBKSCRtU5u6DZz8OzrSYFxMQthnh2DWCTNaBjRuRh8God5Qy3DCSJ1eRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719526972; c=relaxed/simple;
	bh=P/R/XclvRTQG9UOj5wLHoY4ELYddOw315pivumemjKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDD1qZqZST8hZRYXR/ddOeaIvN2+UFCuD67RRcPTANO92p8k6QrrxqOQ9l93DyBiRIH+kaUiEBF5GclLaBJUlM65dXvBPsLHOt4WDO3BLoGrfhJ4P3GQy6gjfI20vtOXjAhd6UJaqcSaJt+SfDeFT1SE5N4aO8Q12gVy+5fnt54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JVyPk31/; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F899FF803;
	Thu, 27 Jun 2024 22:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719526968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WxKgGfDQehzp1iUgUUGOCUkEwku2cVfuL5zbBLx3j0M=;
	b=JVyPk31/pm8Xu2mnaPsuukmL8vt+083cuM3QQr40cV+y6KxSpMEfMHn1luJoh1O+asMTvX
	6ar4ljlyZ7OqT5KzMjkXojfJYZzuqMpjxeHMGOjw4T8umdkLcUTYJCaliKT/5zX/Zlq7Yh
	iZcdVgM9jRm/34YZ6LiIwu7jI7+IJ7I4u+/QCBC6Bwm98Tm9Hn6WT4MgcNayI4PJLsHpSM
	WHeC4I2QCLc5DNlFOEbJripfvjfa6zMM1BsCUDle5zpjodE2bR80Cd2E85AvKG7Eko119V
	7HbaGMIS/GLWgtmtaa2nWoSmj3Mt1wOqfCV/nEE5PI+To6wJ39pDn58BAIdBIg==
Date: Fri, 28 Jun 2024 00:22:47 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Esteban Blanc <eblanc@baylibre.com>, linux-rtc@vger.kernel.org,
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] rtc: tps6594: Add power management support
Message-ID: <171952691796.520431.13640268921597343270.b4-ty@bootlin.com>
References: <20240618141851.1810000-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618141851.1810000-1-richard.genoud@bootlin.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 18 Jun 2024 16:18:48 +0200, Richard Genoud wrote:
> This series add power management support for tps6594_rtc.
> 
> The 1st patch fixes a memleak found in the probe()
> The 2nd patch simply introduce a private structure as drvdata that will
> be used in the 3rd patch. (no functionnal change)
> The 3rd patch introduce the power management support.
> 
> [...]

Applied, thanks!

[1/3] rtc: tps6594: Fix memleak in probe
      https://git.kernel.org/abelloni/c/94d4154792ab
[2/3] rtc: tps6594: introduce private structure as drvdata
      https://git.kernel.org/abelloni/c/29bf97586f18
[3/3] rtc: tps6594: Add power management support
      https://git.kernel.org/abelloni/c/c88014c7aa5c

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

