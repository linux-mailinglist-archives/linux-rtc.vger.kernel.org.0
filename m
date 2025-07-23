Return-Path: <linux-rtc+bounces-4561-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BABB0FC4F
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 23:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E95D5189A28E
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 21:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F702309B5;
	Wed, 23 Jul 2025 21:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PglB46k8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4A4226D03
	for <linux-rtc@vger.kernel.org>; Wed, 23 Jul 2025 21:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753307369; cv=none; b=sL/CkUZMJ+csxIcRj8JZg1ckxrFlh7RWSv3VFEezrXrqeR+hDssLbSv+9ibct6uyUYZH/r4J5bJfDlj4c1vo+oB/UrqGMYoi5AEA+bRoKBBBqKNuupsnwuf/0QlVY9uBb37/qWACuecVHhs0s0Gjv9OlHHi2A8FvpBym3oeBTrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753307369; c=relaxed/simple;
	bh=lRRQBKzbKiWEbpP7Wq0Acyg2QKWcxVXL7/Bt1yJRMSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uK8wPAvOt9TfMT88AMfdm4TnSzU9iDLHzIDK23FiKLxx27mgAbKtX5Fp0BPHjRZ7iHs+R6ef/v7w5hjK5A5kDVDPA5q1Lqr4gKD8uwOWa72biJgE4TtsmmMvapReLvae96uYwdqhs+etLCA0HAIZledbi+Jmpe8K+EkCJeisfvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PglB46k8; arc=none smtp.client-ip=217.70.178.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9FD043885;
	Wed, 23 Jul 2025 21:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753307365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k13bmk/PtWCz/oinfOdGSNXf3OqVqfO/LdFbLgImhdQ=;
	b=PglB46k87PsAzI1JiioqJgcyCmxKJN6+ZMgRCQ7KbI0MIXrJ7m3nU8ED8Pks0Sd5vNeNOx
	QOJYneQcKeER2TqRjQhmTEn6G9kuf8rjs8cGYF48q996cZhElqFojyfN1syMX9Ymtk0Ofh
	ZZqkhvr4jeJ+mKFSKybbycxOMxElKn4xu84843VVxHpZI0YFZ9gglSlP9V+1eXRM9WVw09
	3pcygAn2w8Es47ItsGCndk9p8k2jqSDMMkUH4gISVBGiNMrSSzOoPK2583OaQC2/sHZUMy
	/tuag9wLqoZUZkZXcBLunPZUDxIiJmZu5ZB8YMRM4IKLyqDBKWcD3jgcDAWXaA==
Date: Wed, 23 Jul 2025 23:49:25 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Cassio Neri <cassio.neri@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: Optimize calculations in rtc_time64_to_tm()
Message-ID: <175330735529.845241.2673561465261369740.b4-ty@bootlin.com>
References: <20250613142405.253420-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613142405.253420-2-u.kleine-koenig@baylibre.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejkeeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfffieeiffeffedvgedtjedvhfdvheeftddutdetfeefvdelheeiveekgeeutddunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnhhighessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheptggrshhsihhordhnvghrihesghhmrghil
 hdrtghomhdprhgtphhtthhopegrmhgvrhhgnhgrthessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrgh

On Fri, 13 Jun 2025 16:24:05 +0200, Uwe Kleine-König wrote:
> Recently (in commit 7df4cfef8b35 ("rtc: Make rtc_time64_to_tm() support
> dates before 1970")) the function rtc_time64_to_tm() was repaired for
> times before 1970. This introduced two if blocks. Cassio Neri pointed
> out that to be not neccessary and suggested an adaption that allows to
> drop the two branch points again.
> 
> This is implemented here.
> 
> [...]

Applied, thanks!

[1/1] rtc: Optimize calculations in rtc_time64_to_tm()
      https://git.kernel.org/abelloni/c/ae48d3542783

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

