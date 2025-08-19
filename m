Return-Path: <linux-rtc+bounces-4728-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 690FFB2C4FA
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 15:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDD837AE4F8
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 13:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631071D5146;
	Tue, 19 Aug 2025 13:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="VvS4YukK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="O0kPoH7D"
X-Original-To: linux-rtc@vger.kernel.org
Received: from flow-b8-smtp.messagingengine.com (flow-b8-smtp.messagingengine.com [202.12.124.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B50C38F9C;
	Tue, 19 Aug 2025 13:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755609326; cv=none; b=cDl850o7z9K/LMgh9UfRyhPmDk1/9rQVDWLINygiJ+czy0Ey9uPSvhGjLsDiQRfDq0P6VedBAGs1WHSHPOPWyI6bpvzwan/SfUXUpqWsXYJr1kHw2OvwSUf0rLgj1T3t5JrbCbaKivLancSk7bpOfnuYj0Nd+rpCgnhCRAV65+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755609326; c=relaxed/simple;
	bh=pRUD+z3Dg/Y+TYQjbh09xIKPaVeXQ5sSKNu7b/ZFK+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBX4sV2RoigKFmM3/F7IcEOhMn9oHfECplcxdC1ASfCEvAJERABaRTfj3+1ad5K3S//MI/+vuvPEvOOzADApFESIL9WCCXZvNBtkpvQW+SOma4T6Bd/OIQ3zKrj8j9SOXexe98c7cutuA099fLmDyVIOHnHWf68X9rTwUHulGFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=VvS4YukK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=O0kPoH7D; arc=none smtp.client-ip=202.12.124.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailflow.stl.internal (Postfix) with ESMTP id 1E3741300BBE;
	Tue, 19 Aug 2025 09:15:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 19 Aug 2025 09:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1755609322; x=1755616522; bh=r4GlBd/XIg
	WVfoO1w0sqiwXzx+ia4mrInLsy+TcTWQw=; b=VvS4YukKQYMH/apUX9we3gFDei
	4s0vaH1zyjZ2gTgEX0aNLFZ5zAH/yJQdkRP9JqZf/C5/8yvkCgyXcewYqGvqVh1k
	t8ghXmsmdm4nG9EKR23e6T5FKKlGgfv82q4dvAh4aSfx7kpB3d+2yYptSCM3Cirp
	FZXdyzDSlxW7PF+3oqaOfOZL5osz+HKj5QTo9Dhe50mYJiJqDpeK7JSxZNLrDzHb
	0D3UB2ErQEJmgS5D2UwVaiBHKTAH8OFirYDTauw6mANf8iElvinXZloF51YIKla6
	6ylueSzpQC0AEt7S2hxe37JgH5TwcfqMdbLiG2kZ8fT+zzvcRwtn+n7DduPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755609322; x=1755616522; bh=r4GlBd/XIgWVfoO1w0sqiwXzx+ia4mrInLs
	y+TcTWQw=; b=O0kPoH7DYLugERKZTUOaLyT5PkCatuc23MpbL/OGI6Ah8Slh6bk
	+A7QVJ+A9m1BREMeLGrYLxx/V9uF9YqqtDN8LyxZRVHmDFUeakG3hhDhM0ddo7Ym
	SPKbjH0KdAhCHswH4a1I2ILkbzva1UhjMWUXIMplFRtz6tdQY/FovLy89DHqAmru
	3qSsPUv+ar9W0FUdz8Tk6W0ir+zEuutbLhQk4+0klO8vVZHX8oK2H7yT1yI9n4ZC
	j1fTcSm04DGtc5Vt0i34kcpavMm6lhHREOUzMFcB8vGruYY+tNCFEYuCMeLzwlVz
	BJRkQsXVV/oEMdC2eP8gDsga6T9sMOR0Wig==
X-ME-Sender: <xms:6XikaCMDmqUs282iAXgUcaeJzI5pq11MHvZJkliABpkPBE0yKns7zg>
    <xme:6XikaHQLZ_T34kYWzQtyUOzpszOvy_BWdj7udoJm4XrF_riRjP83d_2TAHLNZE3RN
    -P4IiRzEkq0VxsOhL8>
X-ME-Received: <xmr:6XikaF9vUuFjDX_zC1pPX6yyx36NYC-3e2UaJh1UC3qa2traPIGEpKD_DWQQReIlOlijQdDaK7byjO8Iw0lw3OPgYHFIFUKJ56s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheehheelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehfnhhklhdrkhgvrhhnvghlsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhgvvg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgtrghllhhighgvrhhoshelleesghhm
    rghilhdrtghomhdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheprghlhihsshgrsehrohhsvghniiifvghighdrihhopdhrtghpthhtohepnhgvrghl
    sehgohhmphgrrdguvghvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhn
    ohhrodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:6XikaBU-dAXIl6uuV44Gyb6UVvUAq_L4Mr6v_8LbiK65G-sOpNkHSQ>
    <xmx:6XikaDNUakmE8TkZ-wvqycdSV4I_NvnLyc9a41Hocc29bjf9LO89Uw>
    <xmx:6XikaBeRsQm8kB79Qp-yCO6U_tpxxGsbdxJB_N0L35GG_FozvguRxg>
    <xmx:6XikaKwXOyJ-sNXnGEV1Dmjuofdkh5YvIBRIFQYmok41ObktspQHQA>
    <xmx:6nikaL39rxNFN4E9UD0BxjWzewn--tY-WSa4Ru3fH5zn6un6axbaLyMr>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Aug 2025 09:15:21 -0400 (EDT)
Date: Tue, 19 Aug 2025 15:15:19 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, James Calligeros <jcalligeros99@gmail.com>,
	Sven Peter <sven@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 5/8] input: macsmc-hid: New driver to handle the Apple
 Mac SMC buttons/lid
Message-ID: <20250819131519.GB1270980@robin.jannau.net>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-5-57df6c3e5f19@gmail.com>
 <20250819123505.GC7508@google.com>
 <CAMT+MTQvMnv4Zj3A8hskU1JW3zys0diKxWUzK5ScerxeSmgPjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMT+MTQvMnv4Zj3A8hskU1JW3zys0diKxWUzK5ScerxeSmgPjw@mail.gmail.com>

On Tue, Aug 19, 2025 at 02:49:49PM +0200, Sasha Finkelstein wrote:
> On Tue, 19 Aug 2025 at 14:39, Lee Jones <lee@kernel.org> wrote:
> > Separate patch please.
> >
> 
> Per the discussion in the thread linked from the cover letter, the dt
> maintainers have requested the bindings for all subdevices to be added
> together. Do you want a separate series with just the dt bindings and dts
> changes and the actual drivers in separate series or how do you prefer it?

I think it's asking for patches with the drivera and then separate
single line patches to wire up the drivers in drivers/mfd/macsmc.c

Janne

