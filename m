Return-Path: <linux-rtc+bounces-1941-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2B4975CF9
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 00:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D990E285B22
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 22:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9691B9B45;
	Wed, 11 Sep 2024 22:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QDUaeIFv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7B28F6D;
	Wed, 11 Sep 2024 22:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726093079; cv=none; b=LppHh6xT2GFR3ET79ZUyUrLmVlVQooa3Q++qCg84sZuqDValbZuM8bYCSDIp0nC1LlBPdCj7dRMH3Gu2ToKRykJ/hgVZlmQGGI0q6VmsfMd6Xne9EyW488RPFv+VWkLjkhKliq61q546yZJCzRFN5gVA17HK2EaWc38ARQJf4gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726093079; c=relaxed/simple;
	bh=li9v6yiviwnt3ovdHj3DZYZuBaKKid6ePo/ZNpVli4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKY+QFmi5DvQAiygU2DKy3Cmv7ydROj8ZQr2xLkOA0LcmrfvQ3Wdk9YL4QewRZOyD707Xivtpr/vnATsdCTFxRPqs3wgImOk7vB0XCi4x8rYygKYBs/llMJW9O3d5oQqe5X0jlebipRh8N5vLYrkfgwOxiclsVPjyUVfYQZvddo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QDUaeIFv; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39BAFE0004;
	Wed, 11 Sep 2024 22:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726093074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4/4ea5b68JNPpQkoa0RULHniTfxnkj3aB4lpW/s58/o=;
	b=QDUaeIFvNqDCAAhDfB5zrYg6uCK3f8KemwxBFAImkWY5povnSa4PVoSR5uKHiuyGCzf6JO
	wcMS6tY0VbyzNETqOT2JIf5u/y3DR6xHVbesDkz4MLTkqoRQilIXJW7azoyeWhrVqUP1Sl
	zHe1kYWJsinMSmsy6OOH8uMRoboRfMevFApgYfcbsnCGP/YMK/mo9FumHF1iSTIxphQwi6
	aL32QwGmGWlgW6GUL4kViY25osOZpPk1b+Nfgl3MMHThlhfxRXXfxMRN6OU6WOlT0EuLTn
	x4tZCVGv4bZvQmwYiUmtIPqdjIw03S2A4fJtrN+hhdHsLyxj/K+1AZg4VPFY7g==
Date: Thu, 12 Sep 2024 00:17:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?T=F3th_J=E1nos?= <gomba007@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	=?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 0/3] Add support for the DFRobot SD2405AL I2C RTC
 Module.
Message-ID: <172609305464.1547920.8314811462806286244.b4-ty@bootlin.com>
References: <20240830-rtc-sd2405al-v7-0-2f7102621b1d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240830-rtc-sd2405al-v7-0-2f7102621b1d@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Fri, 30 Aug 2024 10:36:38 +0200, Tóth János wrote:
> This patch series adds a driver and the documentation for the SD2405AL I2C RTC.
> 
> 

Applied, thanks!

[1/3] drivers: rtc: Add driver for SD2405AL.
      https://git.kernel.org/abelloni/c/b4ce83671973
[2/3] dt-bindings: rtc: Add support for SD2405AL.
      https://git.kernel.org/abelloni/c/0eb6d12a2bc1
[3/3] dt-bindings: vendor-prefixes: Add DFRobot.
      https://git.kernel.org/abelloni/c/6894ed34666f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

