Return-Path: <linux-rtc+bounces-4554-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0868CB0F883
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 18:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2E451C83C32
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 16:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BE7204588;
	Wed, 23 Jul 2025 16:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SBB1vYPo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41A217A2E8;
	Wed, 23 Jul 2025 16:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753289704; cv=none; b=bt8zpvqrK7p0BmILwuDlc3h7ij71ieCCyq7zj9P5WM8S8mPQ1y78nvUzcJCBP3Pku3WrT6K8RrdgihmWO8iUXsvroccFA3YpHI/7cNS32d+FIlnoGFWLxX+wGZTI0SXU/yku1DE12nAyHte5/EwGmy1gT7ksoTBJqCx1lP3c/1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753289704; c=relaxed/simple;
	bh=dVojNLEQbEC0lqiL/eFv2YVmsnpMSdiZOmiE5/KeOqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOGoQqoQWdokB4KRZT6nMBfi3/1zIDEKY2mDCO94ExzkHXqlhZBPjYszuzemOqKqCXKoHhC1HCXvKePmIpsZ9Qs5D8Z5YKkfhsuSKkYuKF2njhclmVShZBYgUrn+NWH9qGqQco9kTLhwmU/YzHP96Yra992YOAV3oUlzsL9z9sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SBB1vYPo; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD000441CB;
	Wed, 23 Jul 2025 16:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753289694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R8e0eU7Xw9BCsKbEQNq8n6BijK5ViFZ16EDffkZW/o4=;
	b=SBB1vYPoKgmfQF8kgSeP1aqkv33UW+qSfGRPpEIVxg9AtWeg8M/TmUfgcWs7MAajHKHe5f
	RnHPcLmxdQ47Ulmv0FuKUI9qQyAGNWhcTCTrZpiuZTVf5vHlzJg3cjm3MGznbMoTGumoG5
	p8oLMzxkGF05yknV82OxiexwGc2NnJRvWAaaysN7PBLiaDNfitQCsD9Z2Hs6o1rbb42GxY
	G1GXrzDNK/Y6ztMEOFu1okYNeb7PkI1TRC2JUIH0EF4pfKQxVKx4eSCEFiIUVm+WGXQHQe
	id4oKwsQvwnope1alTxnLrVQf6NysqXP4z/LmUcPIXTefbnbeAPN0ToTOrFQ7Q==
Date: Wed, 23 Jul 2025 18:54:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH] rtc: sh: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <175328962921.785597.15864724066910267201.b4-ty@bootlin.com>
References: <396d4a769b8d3c6fec43c65022cdfd8a6854524a.1752086758.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <396d4a769b8d3c6fec43c65022cdfd8a6854524a.1752086758.git.geert+renesas@glider.be>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejkeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehli
 hhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhshhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 09 Jul 2025 20:47:52 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas SuperH On-Chip RTC driver from SIMPLE_DEV_PM_OPS()
> to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets us drop the
> __maybe_unused annotations from its suspend and resume callbacks, and
> reduces kernel size in case CONFIG_PM or CONFIG_PM_SLEEP is disabled.
> 
> 

Applied, thanks!

[1/1] rtc: sh: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      https://git.kernel.org/abelloni/c/e92eda97f8c5

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

