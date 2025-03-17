Return-Path: <linux-rtc+bounces-3539-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 797C4A66181
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 23:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC2A31886AF2
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 22:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D2E204F63;
	Mon, 17 Mar 2025 22:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eBXgsaMS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303D81F869E;
	Mon, 17 Mar 2025 22:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742250282; cv=none; b=ilVhZHaQtTdzpbWC9CA+5LtUMYH4SAW7vvRCyYCIjIOzfyQcHoXjgYV+IkssTh00WSMnTLFpkQp9ow9nnPGD1Ccd8b6LWQKGNT2rdw7XEwjtLEw+9mAOVAIppr0HK797dPIFj7ieNL14n+ZNymb66tIpQteysV1U62haZripA08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742250282; c=relaxed/simple;
	bh=l5Rupot/LMVZlcsfabiGNdgECH3hJKhybWRxZsRFbL4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAXCm56dro5bLMgSREicc1SrGzgQ23xClirpRcvypq4sKNLqZQNwvRntbuYNkaySQ4dBMma0XVDnVGO99TmRvesSdFwF9Prp/45PGVXY9/05qapSBHqZyvK+jl8/75OqP1p5oIIB6SV7DSvjlphqyk9K3MXX/lkKUEaIZ3K8D+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eBXgsaMS; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DA654439B;
	Mon, 17 Mar 2025 22:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742250278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M2STKYUhOmDt07N+wZvQQRmRKAJf5qqOn7zGtjiE31E=;
	b=eBXgsaMSEKG5aQdFIyE/wR84CpGzJwcMd3Colat6o4xcVM1gW2ZYCsiMdWuwWUqexYCZY+
	tXFw3R9+h0T87wD2FAOXZT4DbglKLQs8q0841+ZkNjXqpsVdyX7nlWBfqOMp1ZK9gnKgKt
	HTtu9tibJu4LfdsfZJCgsgnamapdlYlymZOanzQDXvYThRYymNkoi2+dQPjc/C7oKRDLA3
	0hCyuq9eYNmO/8bQr0F+x0MmMC3Q13JCNtB4i1kX1vmgp6BuJc73MuQgRv9XgCASKEX8p6
	Oy3ujEd7UdY5BSS7240rPQygGKn+D9cENpOjrhgd3dTsMYui7rTHtLueUBBRHg==
Date: Mon, 17 Mar 2025 23:24:37 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2] rtc: rzn1: implement one-second accuracy for alarms
Message-ID: <20250317222437f14a32f0@mail.local>
References: <20250305101038.9933-2-wsa+renesas@sang-engineering.com>
 <2025030522061502555577@mail.local>
 <Z8qYM2-LQPgIe2JE@shikoro>
 <20250307183817b7747a66@mail.local>
 <Z86f-tvJ42ui9Esv@shikoro>
 <Z86rueNSSps2foF9@shikoro>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z86rueNSSps2foF9@shikoro>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedtjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedutdfgheetveetvdetleelfeffkefhtdfhleegfeeuleegueeugefgheehledvgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhso
 hgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On 10/03/2025 10:07:05+0100, Wolfram Sang wrote:
> Hi Alexandre,
> 
> On Mon, Mar 10, 2025 at 09:16:58AM +0100, Wolfram Sang wrote:
> > 
> > > Yes, you followed the code correctly, I have a series that is removing
> > > RTC_UF that I didn't send yet.
> > 
> > Please CC me when you send this. I am interested.
> 
> Do you also have a series pending simplifying handling of
> 'max_user_freq'? AFAICS this is totally HW independent now, meaning we
> can just deal with the constant max value in the core and remove messing
> with with it in the drivers. If you don't have such a series, I am
> willing to work on this.
> 

Yes, I have something I worked on a few years ago now. I was wondering
about the proper default policy which is 64 Hz right now and which max
value we should allow, this is 4096Hz but we have one RTC setting 8192.

I don't this it matters too much because there seem to be very few
userspace programs using RTC_IRQP_SET and RTC_PIE_ON, muse, tutka,
twclock, tvtime and mplayer. They are all either very old or this is an
optional feature with a better replacement.

While I'm reviewing all your other series, do you mind having a look at
https://lore.kernel.org/all/20250205173918.600037-1-herve.codina@bootlin.com/
It has been submitted a while ago now.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

