Return-Path: <linux-rtc+bounces-3262-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0BEA43C24
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Feb 2025 11:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCC957A3DAC
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Feb 2025 10:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FCE266EE5;
	Tue, 25 Feb 2025 10:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UF1e9ecA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93761E2838;
	Tue, 25 Feb 2025 10:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740480469; cv=none; b=gyFr9AzntMOJmJnxm1FkbbaHzbbMC0JkBfu/3ImO6o0h6TNSRaMXVumKIIjqT9Jvy+m07gQH1I+2RQNAIfTweIMFGcIHKiL5CquN3MRIAesznVtFeoQAn0nvGJLT+UKs7sDLtJVoG0RV3TlMJzHicKt8y5xLP5YXzrthgmYvs0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740480469; c=relaxed/simple;
	bh=nOfIb6SRwWjv5OSEeijcCLrfsF7qsz/eoHmAcF9kEo0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=utekFCJVYYKQqHwv5D26YkGN3lf/AIXzrehj8szyWaKb1VOMe0IAWHRsF8gO0ApUEQ1dSGbsZEzTTfdKdttcSF8+mkPYszD2GIhbXKZ/Gn0fG7YXhtshHeJJR2ipVy8bggF3FHL94SZTEFvXoLtYB/+qN1n8kUfVRBHBWj1VZog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UF1e9ecA; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F0FE44285;
	Tue, 25 Feb 2025 10:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740480464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3UvC4IrEBwwkJME3tH9r6VftaVUIu3H58N1v7T4N2p0=;
	b=UF1e9ecAOl3smd4Z+8aJ9lD0lZ/P39Hoy4sEn5FzuLAgcFuEYLtN1jsD+ClIC4w3aqBCZs
	HCslemJS3Km5NL9JA6yDM5wgjWpA7uQFGhd+3cMvItfInvT+SsYC+xbqK0yPTKZwY+jNTg
	abGsvWLYe3EjeKgbDVne68xSvKCiPhOpQ55ac5jgbFFDSOprExgFnz3P12URVJtrFlh0sq
	sooXekdjxhJfsKr8pLEZaTZ/81GTRwnhVYb2awRWLn3kZrT/7bNfItd8dFOy1bVCH1e/BN
	a2velo2WNlfNDwG0KvM+r0B4CjIEwe54tU9FmTi8yYZoTSEmQtPp9dH1reCfig==
Date: Tue, 25 Feb 2025 11:47:44 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: Q: use 1s irqs to overcome alarm minute granularity?
Message-ID: <2025022510474487653067@mail.local>
References: <Z72ZFf-3Z78O44nm@ninjato>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z72ZFf-3Z78O44nm@ninjato>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeltddtudeujeffkeffhfffteektdeguddtveegleekueekudejveefjedukeehnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhor
 hhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com

Hi,

On 25/02/2025 11:19:01+0100, Wolfram Sang wrote:
> so alarms of the Renesas RZ-N1 RTC can only have one-minute-granularity.
> However, it does have a one-second-interrupt. Has it been tried already
> for some driver to use such an interrupt to emulate second-granularity
> of the alarm? My searches did not yield results so far.
> 
> So the idea is, of course, to the let the alarm fire on the minutes.
> Then, enable the second-update irqs until reading the seconds matches
> the requested seconds of the alarm.

I'd say this is probably useless because you will already be awake
anyway so I don't see the clear benefit.

> 
> It would not only gain us a better resolution for alarms, but also
> allows for enabling UIE.

This is already something you can do. I admit this has become super
convoluted since Jon switched UIEs to be handled using the alarm
interrupt...


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

