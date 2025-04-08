Return-Path: <linux-rtc+bounces-3828-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAC4A80DAA
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 16:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 031544C69DE
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 14:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004971C3BEA;
	Tue,  8 Apr 2025 14:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YzQ2ffu9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881241DDA17;
	Tue,  8 Apr 2025 14:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744121880; cv=none; b=Tj6yMKEzJMLlFQxPM5thZZbhgiOx8ifSJHZSRvDdL/xIHpIve87m3HzLn/Q2HHRTH+diGk9TlfyvKgkFvVeI3rlYCau9EZxV+xpTsnQ7RnmcyagwzY/fG17QdAz86CMZ0oc6vQHmsvYt288CiG0gvQ3botHgJuKyry2Gz5L6QrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744121880; c=relaxed/simple;
	bh=ctLkU87Jkq6WG5WxGTkQ99XsSNoNGttCD09A8o/Swnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WE6Yq6CZohQz4uHGuag4rAjuJhCmtNHwqeOCs1CyJ/Mw9R/8x0IZNb2J8QbMQSf/2dSa9Lg9neEFg2H7K6P568sa/jQawZ1k2udJ3Zlg8715Hs8aiLypn4lPKiz4O/Nf8cq4R6f9K3E3307Bc7fufCsiGB8ByjGW+bXnQloMsgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YzQ2ffu9; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4FAE444414;
	Tue,  8 Apr 2025 14:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744121876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c+Cb+aIlULQ/FYakn7QUuXBWyPfnSFNok+e6ag8qrsM=;
	b=YzQ2ffu9ya2eSSonc3FVz3jzGExc5cWOKWC+WHQuVdnWIpUw2+UhvY1Nh0aR0p5H0N5yHX
	c3wiJ2w3Ul9A0V/QbycUvlyDwg+r599ibvvFpXsbxqYtVEC1wm6TbmQECLZPuVMQUpaDxv
	KZbu6VpuR7DKrgGiIVr19myzoKTfk6aEMjRcyRDwfebOiJNUOMmYGdSWbUSqLtwNRMr9RJ
	56Fq/EWHIT+psjU+iB1dDUuIGSp6a9iI8grEnEo59NiaFgtpuGc/xQ8Iw60CQaERi+1wJL
	RJ7HwD2ZhFrj4D7QOlKEBFSYu5XnxYCdWPiOeYR1LhVVntP5mN2WQCyRAfFRAQ==
Date: Tue, 8 Apr 2025 16:17:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2] rtc: rzn1: clear interrupts on remove
Message-ID: <174412186955.3866278.3634790646611505192.b4-ty@bootlin.com>
References: <20250312100105.36767-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312100105.36767-2-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeffeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegrugdtfeemgehflegtmeeffeejfhemfheffegunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegrugdtfeemgehflegtmeeffeejfhemfheffegupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeifshgrodhrvghnvghsr
 ghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 12 Mar 2025 11:00:00 +0100, Wolfram Sang wrote:
> It is good practice to clear running interrupts before removing the
> driver. This is not really a bugfix because on current systems RuntimePM
> will disable the module clock, so interrupts won't be initiated. The
> dependency on that behaviour is subtle, though. Better be self-contained
> and clean up when removing.
> 
> 
> [...]

Applied, thanks!

[1/1] rtc: rzn1: clear interrupts on remove
      https://git.kernel.org/abelloni/c/0bddd060a6a3

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

