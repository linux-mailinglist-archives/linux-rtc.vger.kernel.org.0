Return-Path: <linux-rtc+bounces-3413-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B20CA50E59
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Mar 2025 23:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 546651888E88
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Mar 2025 22:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6A42661B8;
	Wed,  5 Mar 2025 22:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BURAVwy3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C3C2E3373;
	Wed,  5 Mar 2025 22:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741212608; cv=none; b=tOwsOO14upkv/Lsc9GAhGlGv8F5p/r1BxS8BrtsAVN64RAxtnHKOJBLS8w1RtOnS6Bx9z9yN0CepaNLgjq2CGq5PDJwx10QeWPaJvobL9GiR/FZcYcMMIxRsHH+9O9Zy6BBdpTlmzv3HRARtGwOcE39vLOlqTdu4S8pnC9p3jCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741212608; c=relaxed/simple;
	bh=hBZBxTEgtDt23D4tUG+xQtrqWjao2dZor4U0b7bBpwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFCp+umKcILQ9gcw/6YT05YnC6qevheEtAQeVYEdtYRh96034vYwLFSd5Q066BlYcFjmDs83JMvuLF7ER59jfKE3JvhPjOKrso4WlB6OtxIcpYTazLuvKGB2wNQhS9koVCbRMkZ4JoEhErXhtVMZWKHU03v+QpPYY1if3Go/1Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BURAVwy3; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AA2D44469;
	Wed,  5 Mar 2025 22:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741212604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AIx1VQixGZHJpDEIrcnLOu+mYSZBxUUbpmpOdkPkxX8=;
	b=BURAVwy3hip3jon9IM98b5vAbuZx8dmIVhljcBdpP9XPooBB9x17yAD7mn/0M2kAn1p8By
	woFRKzD245+DnNCjtQ7o6LF0PX0S+BASIoZ3EG9eHGaSS6+ZEBYcAQJ78thkXVkUtB3BzK
	1fd6X+OUiIUBCG3V5Ht/wQ7VyXWg3QLgNXNCUgj5cfxx673xa69fxR4P/SB0QwSK51Vnbk
	43t7fjIwRIkYEyQt3ZAkt9kg4DaTd2AJ5hZycFk8ZNUVahz0ml0z7nJE20eLLgLqkFMu9H
	PUen+OK6ikHnvbPugQHCGpZSoR9V6SsZM+DOwn8jbGVfSNi2odFfmCi09ey7bw==
Date: Wed, 5 Mar 2025 23:10:01 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
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
	Dianlong Li <long17.cool@163.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-amlogic@lists.infradead.org, llvm@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 00/16] a few rtc driver cleanups
Message-ID: <174121255394.1152777.11765502116426784970.b4-ty@bootlin.com>
References: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdeitddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgffeiiefffeefvdegtdejvdfhvdehfedtuddtteeffedvleehieevkeeguedtudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeejjedrudehtddrvdegiedrvdduheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeejjedrudehtddrvdegiedrvdduhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdehpdhrtghpthhtoheptgiftddtrdgthhhoihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhrtghpthhtoheprghnughrvgifsegtohguvggtohhnshhtrhhutghtrdgto
 hhmrdgruhdprhgtphhtthhopehulhhlihdrkhhrohhllhesghhoohhglhgvmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 04 Mar 2025 17:05:28 +0000, André Draszik wrote:
> While looking at RTC, I noticed that various drivers are keeping
> pointers to data that they're not using themselves throughout their
> lifetime.
> 
> So I took the liberty to drop these pointers and this series is the
> result.
> 
> [...]

Applied, thanks!

[01/16] rtc: max77686: drop needless struct max77686_rtc_info::rtc member
        https://git.kernel.org/abelloni/c/6c9405fd2581
[02/16] rtc: s5m: drop needless struct s5m_rtc_info::i2c member
        https://git.kernel.org/abelloni/c/afe5f9f94d11
[03/16] rtc: aspeed: drop needless struct aspeed_rtc::rtc_dev member
        https://git.kernel.org/abelloni/c/d19111dff9c2
[04/16] rtc: ds2404: drop needless struct ds2404::rtc member
        https://git.kernel.org/abelloni/c/1b625aaf335a
[05/16] rtc: ep93xx: drop needless struct ep93xx_rtc::rtc member
        https://git.kernel.org/abelloni/c/5d0ad519f503
[06/16] rtc: ftrtc010: drop needless struct ftrtc010_rtc::rtc_dev member
        https://git.kernel.org/abelloni/c/a55d44807b63
[07/16] rtc: m48t86: drop needless struct m48t86_rtc_info::rtc member
        https://git.kernel.org/abelloni/c/013df5bdf8b4
[08/16] rtc: meson: drop needless struct meson_rtc::rtc member
        https://git.kernel.org/abelloni/c/a0470062748f
[09/16] rtc: meson-vrtc: drop needless struct meson_vrtc_data::rtc member
        https://git.kernel.org/abelloni/c/38c7aaeab8b8
[10/16] rtc: pl030: drop needless struct pl030_rtc::rtc member
        https://git.kernel.org/abelloni/c/3d5d0fe1cb82
[11/16] rtc: rx8581: drop needless struct rx8581
        https://git.kernel.org/abelloni/c/3b87c6872aed
[12/16] rtc: s35390a: drop needless struct s35390a::rtc member
        https://git.kernel.org/abelloni/c/cd2a7052482e
[13/16] rtc: sd2405al: drop needless struct sd2405al::rtc member
        https://git.kernel.org/abelloni/c/d94bc2bbf8d9
[14/16] rtc: sd3078: drop needless struct sd3078
        https://git.kernel.org/abelloni/c/6158c6b82444
[15/16] rtc: max77686: use dev_err_probe() where appropriate
        https://git.kernel.org/abelloni/c/e6403ae59ce1
[16/16] rtc: s5m: convert to dev_err_probe() where appropriate
        https://git.kernel.org/abelloni/c/0c57c2e72c5d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

