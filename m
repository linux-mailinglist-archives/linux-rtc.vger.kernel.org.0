Return-Path: <linux-rtc+bounces-4626-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFA2B19159
	for <lists+linux-rtc@lfdr.de>; Sun,  3 Aug 2025 03:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFB9117B00B
	for <lists+linux-rtc@lfdr.de>; Sun,  3 Aug 2025 01:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B37BE65;
	Sun,  3 Aug 2025 01:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="me7oGRjP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33D62F29;
	Sun,  3 Aug 2025 01:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754182918; cv=none; b=YbdSikrX2un2xhskD9+05kDHvEVDEU+OcP0mAZUYQc7VLxTSv+UmL6/l7vruPs9y/wUo1ibJbRb7Jxy3a/mrupjI2UUeNy1zoV80ltDmOtynxbS1c50bLgm4fa8DB0Kc9zZGKsHzB/EKXzUQiYsn9CxokrTG7xnFYhwvjFcK8Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754182918; c=relaxed/simple;
	bh=wbhG94bTOLli9sAnU1nb+7xW3n983Xe2P9tkf4FiPtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jM4a27zt23/nlHxcbMyqxT87qrrsU/GS6yfTcgfa3lspGF1REdMJk1aJAH6iLB+l+DL6vQAHNnM4n/bhayuFSn8d2WBYBb0bq297efekR5EueYWrhmQjS/+gS1SqkqF+93j5GAkEKx5rGQvlUxAY6PyOqIsQzzDrcTr5R0cqAyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=me7oGRjP; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BC4E43390;
	Sun,  3 Aug 2025 01:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754182907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xbH8hOkjMz5i59oT3KbdPFr9gL61/+cWeH+sH8L1hf4=;
	b=me7oGRjPlj9OSgUS7mP2TCViY2896IWqAGfAc6dIhlrLfGj2780LVpIoFSAQpq/rQkj7p+
	Wp0e8NbM8aNFESGRby0PxDH+xwt/RumYvtZwipFDkrhwKOt/Z3FN1K4pyAABjZF9XkqxLn
	d7xxNlwjI4c7xs4AJEC/q+LTyTS3CONLCpWmGl/tp0EWaQ/qeM/oFmiSvP2cBsN4gSz+Zn
	nw5f1R4bafZ3F8U3mDNgmiv4wvgf+tInw4n9AdjnT+4cnnvKcyGWS+vbS2qLBbKvEvebQF
	WhJ74TcfbIYLJd789PNtto8/q3ZTqoVgSjeEhdv66zgyXBa6uD32JyJ7rH2bYg==
Date: Sun, 3 Aug 2025 03:01:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akinobu Mita <akinobu.mita@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Mia Lin <mimi05633@gmail.com>,
	Michael McCormick <michael.mccormick@enatel.net>,
	Heiko Schocher <hs@denx.de>, Parthiban Nallathambi <pn@denx.de>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 00/15] rtc: convert from clk round_rate() to
 determine_rate() and fix a few bugs
Message-ID: <175418267001.2341527.14209599648775421774.b4-ty@bootlin.com>
References: <20250710-rtc-clk-round-rate-v1-0-33140bb2278e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-rtc-clk-round-rate-v1-0-33140bb2278e@redhat.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdektdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopegrkhhinhhosghurdhmihhtrgesghhmrghilhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmp
 dhrtghpthhtohephhgvihhkohesshhnthgvtghhrdguvgdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprghvihhfihhshhhmrghnjedtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhmrghimhhonhejjeesghhmrghilhdrtghomhdprhgtphhtthhopehtrghlihdrphgvrhhrhidusehgmhgrihhlrdgtohhmpdhrtghpthhtohepvhgvnhhtuhhrvgesghhoohhglhgvrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com

On Thu, 10 Jul 2025 11:20:20 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the rtc subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.
> 
> I also noticed that in some of the drivers that if round_rate() is
> called with a requested rate higher than the highest supported rate,
> then the clock is disabled. According to the clk API, round_rate()
> should instead return the highest supported rate. This series also
> updates the functions to return the maximum supported rate.
> 
> [...]

Applied, thanks!

[01/15] rtc: ds1307: fix incorrect maximum clock rate handling
        https://git.kernel.org/abelloni/c/cf6eb547a24a
[02/15] rtc: hym8563: fix incorrect maximum clock rate handling
        https://git.kernel.org/abelloni/c/d0a518eb0a69
[03/15] rtc: nct3018y: fix incorrect maximum clock rate handling
        https://git.kernel.org/abelloni/c/437c59e4b222
[04/15] rtc: pcf85063: fix incorrect maximum clock rate handling
        https://git.kernel.org/abelloni/c/186ae1869880
[05/15] rtc: pcf8563: fix incorrect maximum clock rate handling
        https://git.kernel.org/abelloni/c/906726a5efee
[06/15] rtc: rv3028: fix incorrect maximum clock rate handling
        https://git.kernel.org/abelloni/c/b574acb3cf75
[07/15] rtc: ds1307: convert from round_rate() to determine_rate()
        https://git.kernel.org/abelloni/c/31b5fea399d5
[08/15] rtc: hym8563: convert from round_rate() to determine_rate()
        https://git.kernel.org/abelloni/c/394a4b920a72
[09/15] rtc: m41t80: convert from round_rate() to determine_rate()
        https://git.kernel.org/abelloni/c/e05d81b75efd
[10/15] rtc: max31335: convert from round_rate() to determine_rate()
        https://git.kernel.org/abelloni/c/9e0dfc7962b3
[11/15] rtc: nct3018y: convert from round_rate() to determine_rate()
        https://git.kernel.org/abelloni/c/1251d043f764
[12/15] rtc: pcf85063: convert from round_rate() to determine_rate()
        https://git.kernel.org/abelloni/c/ad853657d791
[13/15] rtc: pcf8563: convert from round_rate() to determine_rate()
        https://git.kernel.org/abelloni/c/e6f1af719ea1
[14/15] rtc: rv3028: convert from round_rate() to determine_rate()
        https://git.kernel.org/abelloni/c/c4253b091441
[15/15] rtc: rv3032: convert from round_rate() to determine_rate()
        https://git.kernel.org/abelloni/c/35d6aae85b36

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

