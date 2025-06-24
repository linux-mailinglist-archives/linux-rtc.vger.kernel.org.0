Return-Path: <linux-rtc+bounces-4347-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A18AE67DA
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Jun 2025 16:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 844AD1882719
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Jun 2025 14:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFCD627C179;
	Tue, 24 Jun 2025 14:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KFay5AHa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBD227C16A;
	Tue, 24 Jun 2025 14:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774066; cv=none; b=s4t9TBCTIpwm+i/7qtNQ3s5JMWutKveIN7pQF4VCN+2/lQALfC6b039hrhyMA4o4jwPmpKD33A2LmE0xfb/mXMUJyHSIE9dmrzfO+kiZP+8Zd6oqwnFRKtgZ9mMFIygTevQlFQLDLZyarZmu5JeRkfBscxiWcg/x/NgX880n6ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774066; c=relaxed/simple;
	bh=l26u7fe6XZwogKC7pz253TI2kCmTeArf6XKTPxFmgVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQWU5AV7LR3XqCdfNUIB2uFpZ9bL5F0t55yfLl4cMX27yQdfpVS7l41SPy0MZcr14VXvZYtfFNxhPO658t5IYZwj2pvWGvT6j0ocjquDZWOyRB6uS/CwZH5H4XdCrB7WitLFr8BFKzA1jFtTEqzFkepzGC8MYTD1b2zYU+JStXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KFay5AHa; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEA5B4393B;
	Tue, 24 Jun 2025 14:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750774056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EAi9YvJDgyLMQbX6+CpOAgJDtw0t1bzXA0aNUcbN6B8=;
	b=KFay5AHaVGvIsQS4surnHeBlWIAVr0OIWDnrvpEZxWa01DP3MGENSd6qIWbMJFAW/Xiy1S
	RNezVsaXeYFqVWanJZZsJC97L9zUpskki1whvCbHX0IOxvPH5x/bBsgYh/rOjIi7/eIzCS
	P/q1NDsPVracLw8JmUJqXeWETEcrLUWKc8HRdGe5F/5ydx2y4Cal40jHMcolXyNs6jB1ri
	ZBx6NismTnFrn7uNE9HQOfishLHLMNTW+z8r3WNWStISTjVYskpxNrdGx5L0DDNtXDP9K3
	8xBCQ0iEZAd84eskVdKSv4EV2ZT5CBl9MOPDja9TRUvGbL30ZnPvNFYrm/jm4g==
Date: Tue, 24 Jun 2025 16:07:35 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: hvilleneuve@dimonoff.com, r.cerrato@til-technologies.fr,
	Elena Popa <elena.popa@nxp.com>
Cc: linux-rtc@vger.kernel.org, stable@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/2] rtc: pcf2127: fix SPI command byte for
 PCF2131
Message-ID: <175077404650.1448614.13035536331751813714.b4-ty@bootlin.com>
References: <20250530104001.957977-1-elena.popa@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530104001.957977-1-elena.popa@nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvtddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemvgdtfhgvmeegfhdvfhemvdelvgegmeehudejtgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemvgdtfhgvmeegfhdvfhemvdelvgegmeehudejtgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehhvhhilhhlvghnvghuvhgvseguihhmohhnohhffhdrtghomhdprhgtphhtthhopehrrdgtvghrrhgrthhosehtihhlqdhtvggthhhno
 hhlohhgihgvshdrfhhrpdhrtghpthhtohepvghlvghnrgdrphhophgrsehngihprdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Fri, 30 May 2025 13:40:00 +0300, Elena Popa wrote:
> PCF2131 was not responding to read/write operations using SPI. PCF2131
> has a different command byte definition, compared to PCF2127/29. Added
> the new command byte definition when PCF2131 is detected.
> 
> 

Applied, thanks!

[1/2] rtc: pcf2127: fix SPI command byte for PCF2131
      https://git.kernel.org/abelloni/c/fa78e9b606a4

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

