Return-Path: <linux-rtc+bounces-4344-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DBFAE5764
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Jun 2025 00:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 256191C24E3E
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Jun 2025 22:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85259224B07;
	Mon, 23 Jun 2025 22:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FYJETrGT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248C71F4628;
	Mon, 23 Jun 2025 22:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750717771; cv=none; b=ezaRj846fP8Vsds7PLecpEZWTzwVDrfu8FdSZI4ofcf5qtrErqgMjPnX9Dx51Hk67V5sXwi6eUOvh9HMjZpyplYxv7MMQCA3dsByMtkgXWACHRvWWfm8ZQKw7o4Ws/3bAYZxmIHi6ZfllYR8uE2TnudU6ZLsq0T/H/1HhiImLXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750717771; c=relaxed/simple;
	bh=nG0pwO0WDQwgZRRtoVdMq6gbLGb8KezJaQseqijHiMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5zBtfcbjVSg4rTgASl+DK5Clhj1y/swDEE3qCWMQIFVZn2avtH+hynUqV0vGHjia/DtIXdjj5pmk/x2zM3XorR6ngxUHuE6QjWmsbvgOt3uMQEImdv6ID1Xx820k8Si/9oRgvRysGG8F3/PHq0sWlsrvvm6rJgQRbx1t49vxvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FYJETrGT; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B63C3433CF;
	Mon, 23 Jun 2025 22:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750717767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6MFU6AiOUmI9A18SBqoOokJUpFmnmc/7USU/z1tLHe4=;
	b=FYJETrGT7JjUffd3lF1KwyltEfT3pfq6VP5a538CnvGgXo9KKKg7+/4niw3z5udrGkVSFQ
	4raD7CJaWXSxrGxpBJK5d8VERD2B8pKEjJAbt17dTY7mW6bZxFiTtr11Y4ZPZ8PvyxBEgw
	emOfdoflWSgPUZ5lfSBMXvDFsPw7Hc6GdOUH97jqOmnCDL3x+W0vZ+hloRqsGULFj05WeM
	lI8ZyroUTKB6m26iQ9CBAOKlqBbGYDvxzFIDXHADEr3xtLWhghD5rIsYrhyL26kNYeTHMn
	1DKppMI8RUz+ZPOPhqd79EXMqjpas7UYE3/evLniiJuIylgSwG81yb1JYKosuQ==
Date: Tue, 24 Jun 2025 00:29:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	linux-rtc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Xiaofei Tan <tanxiaofei@huawei.com>, stable@vger.kernel.org
Subject: Re: [PATCH] rtc-cmos: use spin_lock_irqsave in cmos_interrupt
Message-ID: <175071769977.1313689.17031304195809982055.b4-ty@bootlin.com>
References: <20250607210608.14835-1-mat.jonczyk@o2.pl>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250607210608.14835-1-mat.jonczyk@o2.pl>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddukedvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdeigfehvdevhfehveejgfehudejkeefuedvhfegudffudevhefgvdegjeehjedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehmrghtrdhjohhntgiihihksehovddrphhlpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepsghps
 egrlhhivghnkedruggvpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehfrhgvuggvrhhitgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheptghhrhhishdrsggrihhnsghrihgughgvsehgmhgrihhlrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com

On Sat, 07 Jun 2025 23:06:08 +0200, Mateusz Jończyk wrote:
> cmos_interrupt() can be called in a non-interrupt context, such as in
> an ACPI event handler (which runs in an interrupt thread). Therefore,
> usage of spin_lock(&rtc_lock) is insecure. Use spin_lock_irqsave() /
> spin_unlock_irqrestore() instead.
> 
> Before a misguided
> commit 6950d046eb6e ("rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ")
> the cmos_interrupt() function used spin_lock_irqsave(). That commit
> changed it to spin_lock() and broke locking, which was partially fixed in
> commit 13be2efc390a ("rtc: cmos: Disable irq around direct invocation of cmos_interrupt()")
> 
> [...]

Applied, thanks!

[1/1] rtc-cmos: use spin_lock_irqsave in cmos_interrupt
      https://git.kernel.org/abelloni/c/00a39d8652ff

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

