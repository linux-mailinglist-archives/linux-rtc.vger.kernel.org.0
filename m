Return-Path: <linux-rtc+bounces-3354-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B03EA4ADD3
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Mar 2025 21:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 634B37A3157
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Mar 2025 20:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73071E5B97;
	Sat,  1 Mar 2025 20:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j0W8ax/u"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EE1182D7;
	Sat,  1 Mar 2025 20:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740861434; cv=none; b=MRRC/JLqTWAxj9SJDDmv1VaQFHov0QWhPe+Yg9kv1dKSL4DAb+Kk7lGBjZwEeiPG77lmXoQsgST01EwqEEEaKq8VPICLPUHbVtIhlinjtM2yV4vvMn4NWbQA0yrjHBtLmWsNzKQ6g5mt0HZglAyYT7S/KJJQQN/FB1/h3zpmCv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740861434; c=relaxed/simple;
	bh=bS075K6RDLoIA2kHkCsy0JdsUrdTU7jF2LvyzphOjsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7u0ZDJOAvo3IE1FnSrzxq3Oy6DR2t/ZL2iALZxqIFwcu30JlsFDKZNRu6teK8OOK+PhslePKP4vlTmdU8FKPJoSSckmz6QHb8XUXt8dkRs7zASbK5ROaKaOIu6wH0k5wz8A+FUDpE2JHHvI+8akNTYPgnfVvDzLJ46waFy2Ips=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=j0W8ax/u; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9EDE20453;
	Sat,  1 Mar 2025 20:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740861424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Acc0tGYBakmOPZLGuJmU2rnhFl+Tc281npjtzbe/74=;
	b=j0W8ax/uRquO/giWNgJhf4H4p4dxfIxzFW6MO4OZsXaQhJo+e7YlrfmfwuwO8z8CykjSQD
	0U7Afy7/Ba2WJ6ueUqpasO3bhRsmWK8p1CSKWQJLxASlHZTVaGb200Xak05pxb0hXPgbBk
	sT9SJIRG4qLHlanaDO5mFlJjeg4NV4xNVcAt6A5IcLajDdg4v3tw1PgIh8R9k5YlEQBuhG
	dfXSaVruN9RLuzUSlpcs4F7JA1n4iAXoEgtPn0uxly/CwiwCzgGYpZ/+vFDZKpgSjsOMi0
	+ATKulcM1AzPZZmNwSQMXP1nZ5IL536rUVUy1TzC5EytwvQM/AGNSzQr14PTEA==
Date: Sat, 1 Mar 2025 21:36:58 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	=?iso-8859-1?Q?T=F3th_J=E1nos?= <gomba007@gmail.com>,
	Dianlong Li <long17.cool@163.com>, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 00/18] a few rtc driver cleanups
Message-ID: <20250301203658839d5482@mail.local>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelgedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveduvefhvdehlefgieelfeetudeugfehgfeugfekleejueefueettdffueetiedvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeejjedrudehtddrvdegiedrvdduheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeejjedrudehtddrvdegiedrvdduhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtoheprghnughrvgdrughrrghsiihikheslhhinhgrrhhordhorhhgpdhrtghpthhtoheptgiftddtrdgthhhoihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhrtghpthhtoheprghnu
 ghrvgifsegtohguvggtohhnshhtrhhutghtrdgtohhmrdgruhdprhgtphhtthhopehulhhlihdrkhhrohhllhesghhoohhglhgvmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On 28/02/2025 14:07:13+0000, André Draszik wrote:
> Hi,
> 
> While looking at RTC, I noticed that various drivers are keeping
> pointers to data that they're not using themselves throughout their
> lifetime.
> 
> So I took the liberty to drop these pointers and this series is the
> result.
> 
> The last two patches also convert two drivers to using dev_err_probe(),
> as I looked slightly closer into those two. They don't exactly fit the
> general subject of removal of unneeded pointers, but I wanted to share
> them anyway, since they're ready.
> 
> All of this was compile-tested only.
> 
> Cheers,
> Andre'
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
> André Draszik (18):
>       rtc: max77686: drop needless struct max77686_rtc_info::rtc member
>       rtc: s5m: drop needless struct s5m_rtc_info::i2c member
>       rtc: aspeed: drop needless struct aspeed_rtc::rtc_dev member
>       rtc: ds2404: drop needless struct ds2404::rtc member
>       rtc: ep93xx: drop needless struct ep93xx_rtc::rtc member
>       rtc: ftrtc010: drop needless struct ftrtc010_rtc::rtc_dev member
>       rtc: m48t86: drop needless struct m48t86_rtc_info::rtc member
>       rtc: meson: drop needless struct meson_rtc::rtc member
>       rtc: meson-vrtc: drop needless struct meson_vrtc_data::rtc member
>       rtc: pl030: drop needless struct pl030_rtc::rtc member
>       rtc: rx8581: drop needless struct rx8581::rtc member
>       rtc: s35390a: drop needless struct s35390a::rtc member
>       rtc: sd2405al: drop needless struct sd2405al::rtc member
>       rtc: sd3078: drop needless struct sd3078::rtc member

My main concern with this is that as soon as we introduce irq support,
we are going to need the rtc pointer back in the struct. But I guess
that most of them are old enough to say that nobody is interested in irq
support.

>       rtc: rx8581: drop needless struct rx8581
>       rtc: sd3078: drop needless struct sd3078

I guess you could squash those two with the previous ones touching the
respective drivers because you are the one removing the last remaining
struct member.

>       rtc: max77686: use dev_err_probe() where appropriate
>       rtc: s5m: convert to dev_err_probe() where appropriate
> 
>  drivers/rtc/rtc-aspeed.c     | 16 ++++-----
>  drivers/rtc/rtc-ds2404.c     | 14 ++++----
>  drivers/rtc/rtc-ep93xx.c     | 16 ++++-----
>  drivers/rtc/rtc-ftrtc010.c   | 17 +++++----
>  drivers/rtc/rtc-m48t86.c     | 14 ++++----
>  drivers/rtc/rtc-max77686.c   | 37 +++++++++----------
>  drivers/rtc/rtc-meson-vrtc.c | 12 +++----
>  drivers/rtc/rtc-meson.c      | 16 ++++-----
>  drivers/rtc/rtc-pl030.c      | 14 ++++----
>  drivers/rtc/rtc-rx8581.c     | 85 +++++++++++++++++++-------------------------
>  drivers/rtc/rtc-s35390a.c    | 22 ++++++------
>  drivers/rtc/rtc-s5m.c        | 58 +++++++++++++-----------------
>  drivers/rtc/rtc-sd2405al.c   | 16 ++++-----
>  drivers/rtc/rtc-sd3078.c     | 71 +++++++++++++++---------------------
>  14 files changed, 183 insertions(+), 225 deletions(-)
> ---
> base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
> change-id: 20250228-rtc-cleanups-12c0b5123ea4
> 
> Best regards,
> -- 
> André Draszik <andre.draszik@linaro.org>
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

