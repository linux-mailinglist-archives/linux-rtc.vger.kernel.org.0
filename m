Return-Path: <linux-rtc+bounces-4212-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A499ACA09D
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Jun 2025 00:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B76147A5C94
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Jun 2025 22:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1F71C7015;
	Sun,  1 Jun 2025 22:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="egUJasPs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB4428EC;
	Sun,  1 Jun 2025 22:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748816768; cv=none; b=ul98VfOseW4R2/B9YaKi6AlDazzuQR5MLyL5f/YBs7lViXHpIZ/zFHQOvaDLwA6FHvd75mddbmiGb9KaWnrVZrHk4MPOuOKMseWLgytufGDpJsBId8QYKfe6/mqihflQz8EBcIfsRKBqX/Vfn+fDCZhgHu9SKX/fwRoPVIhnmrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748816768; c=relaxed/simple;
	bh=A+7040m0+SoBFHSOiDUQanhyf7+8+i/99VbayHPtBDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6E2hw/zL7nVmXhbjOSjdGjXdEqsqGtgVNRaMUZTI8/xtpkajnG/yjl8yGVDy2Xtc/7L+WyhHi4LwjO7w7yLbTn/3hAqtjDQWOPYGlpuWryIKH24SPjInrv9gHR6748KvhmNlLzJ2Z1APmk6RnDXc9EYieJZ44d+GbzYDZZmOb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=egUJasPs; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3764432FA;
	Sun,  1 Jun 2025 22:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748816756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g9XdcBVBnhp8c8ZBsriCHLzr8nNacrDzZNd3KKWw4W8=;
	b=egUJasPsaefuid6MU0YZfsaXVy9wCo6z0IX5RgBCW7xW5LFbOYx/w/uXQ98qKu62jowkRc
	Sq6dxkuNutMbtl2vWqt2OucUB22bvNkvB9NQiPJTbT8x3r353bAKKL4K9X7cg2JggADzL/
	jqUTrs9z+W1C9Zmhr10DUVmcw6JYWj1SCmOl9v6DktnVsCtbbSUd5jkDGRd+oU+cHdp8Ga
	ByIoEyA2gOOfv6uoBCRxK0a6G8KQlCCVC9uSf+HrTCyPTVV1pxeHee6kiI7xdApUd0FVa/
	GD+YsF652mX0khfIY9rLEFrcIgRJChf4SppnNcwCJMJLU7aGPijpvl0aahpaEQ==
Date: Mon, 2 Jun 2025 00:25:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: mt6359: Add mt6357 support
Message-ID: <174881674471.460857.8494829036544139744.b4-ty@bootlin.com>
References: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefheelkeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepvgguughivgdrhhhurghnghesmhgvughirghtvghkrdgtohhmpdhrtghpthhtohepshgvrghnrdifrghnghesm
 hgvughirghtvghkrdgtohhmpdhrtghpthhtohepmhgrthhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopegrmhgvrhhgnhgrthessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnhhighessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 28 Apr 2025 16:29:55 +0200, Alexandre Mergnat wrote:
> The MT6357 PMIC contains the same RTC as MT6358 which allows to add
> support for it trivially by just complementing the list of compatibles.
> 
> 

Applied, thanks!

[1/1] rtc: mt6359: Add mt6357 support
      https://git.kernel.org/abelloni/c/3d8b44b104fb

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

