Return-Path: <linux-rtc+bounces-3371-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6346A4CDB6
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 22:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB8327A3D4E
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 21:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E0A1EFFB6;
	Mon,  3 Mar 2025 21:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mCLyG6hB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB591E5213;
	Mon,  3 Mar 2025 21:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741038796; cv=none; b=dz4RphOxohHhYOACdDIBQA/CINI8yyFqWCBAL6JgzpIhPI5AEw1gq2Eh487D1iFC544cO0Rjh6kCgmYJzfA6GpGvgq/dg40AsQAiZBO5vcu3RGpBtiVjHfhHrBck5uwSOTwaIoT5edGrfK4kK4TLir3MqSsGZbKAYyO8HsCwsPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741038796; c=relaxed/simple;
	bh=WmcVLKQEvOHuv+dHBbFCnwsMqOiusRFYcHbCKfxKTfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1Al/E3Oc8gFxKzyPv9rIHwm4JX7tzJur0ILKxMa+G+P//9vyL3XWdiiOGe6puGq6F+QBkMpBTJN/Ie1q+R+Dm44wx5fMm2ezHp8RQ45HQrKmJ+A3FUATFGG7kXkqhrIJm/nv4M8Jc34zx1QeVriTGUk8nMqEtA9DDruzqZd9Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mCLyG6hB; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B05120457;
	Mon,  3 Mar 2025 21:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741038791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xBOb7oGeYLEpXfq67SR7gONs2pzCSxu5VZhQZhEOe6c=;
	b=mCLyG6hBbbcmuyXpIbTsjYLroVo6Y073oLGc5iIpWunCG6SjJWBZ/AJoHMoWREdxC7S6Nk
	6GgGL/bUWpapqJdoccETbQhHWoy+6n7m1GncwhDEOdRrGasYG2WJe+4qvDbZHSfBctKoaR
	IsWpDs1zNJ66dPivtbwU9WO3bSShsk/t5nRXE+CxdN9MoZV2QXkJeHgCLP+0Y+5E89lNPN
	x7xpc6f0aQ5rlxWQkCn2x6oiITMkS1lzaWEcE6pA3lu1ceCWUEt6hzI3Igt6Ztrj/m386X
	L/bbEVEfh0VlN/Xzm4HV8DwbUkQ3aAwT8WvoX4t9X2Jf6TUfTDE+78Ek8ul8Pg==
Date: Mon, 3 Mar 2025 22:53:09 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Antonio Borneo <antonio.borneo@foss.st.com>
Subject: Re: [PATCH 0/7] rtc: Use devm_pm_set_wake_irq to simplify code
Message-ID: <174103876909.1106916.958645902819103595.b4-ty@bootlin.com>
References: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepjeejrdduhedtrddvgeeirddvudehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrdduhedtrddvgeeirddvudehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpt
 hhtoheptghonhhorhdrughoohhlvgihsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepuggrihhrvgdrmhgtnhgrmhgrrhgrsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepphgvnhhgrdhfrghnsehoshhsrdhngihprdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 05 Feb 2025 08:58:18 +0800, Peng Fan (OSS) wrote:
> This is a pick-up of patch 6-12 from patchset [1]
> 
> Since devm_pm_set_wake_irq is in 6.14, so resend the rtc parts.
> 
> R-b tags from Linus Walleij and Antonio Borneo are still kept.
> 
> [1] https://lore.kernel.org/all/CAJZ5v0jb=0c5m=FeA-W-aG30H4706Ay_xCHTsiC1S-7MuGxqTQ@mail.gmail.com/#r
> 
> [...]

Applied, thanks!

[1/7] rtc: stm32: Use resource managed API to simplify code
      https://git.kernel.org/abelloni/c/04572d18921d
[2/7] rtc: nxp-bbnsm: Use resource managed API to simplify code
      https://git.kernel.org/abelloni/c/6b296dee3eb7
[3/7] rtc: ds1343: Use devm_pm_set_wake_irq
      https://git.kernel.org/abelloni/c/5ad218f101e4
[4/7] rtc: pm8xxx: Use devm_pm_set_wake_irq
      https://git.kernel.org/abelloni/c/e8a0b6e62429
[5/7] rtc: ab8500: Use resource managed API to simplify code
      https://git.kernel.org/abelloni/c/ca36c9301117
[6/7] rtc: mpfs: Use devm_pm_set_wake_irq
      https://git.kernel.org/abelloni/c/d8690ce183bb
[7/7] rtc: pl031: Use resource managed API to simplify code
      https://git.kernel.org/abelloni/c/90e0bcc9392d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

