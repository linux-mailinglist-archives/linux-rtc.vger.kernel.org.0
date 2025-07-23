Return-Path: <linux-rtc+bounces-4552-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFF8B0F880
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 18:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A733FAC3A30
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 16:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E28202C5D;
	Wed, 23 Jul 2025 16:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iWv1AMAV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DF717A2E8
	for <linux-rtc@vger.kernel.org>; Wed, 23 Jul 2025 16:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753289691; cv=none; b=td2i+Mng5PRnzxmyS3y5izr7TO+dtC3Xt5Q7urXwav7tXJfuDsG+4kdATesr1uVGC253a0r8Z3UGn/fSv6xtBXnCLnfdZgz7tsylQ4e0M1eCz6CZGA3uZOMtX+j5SrEN6qDsnxOQDmOeEjmG2gsM7DVut/f1fdwwDuwx4Fzsmsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753289691; c=relaxed/simple;
	bh=dLZb/SvGATrdjTaYdtPad2fWVNCVZ++5UosQWO6aIkA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAAk5wMeeW8c4X4ERAW19FzG3U/w7VvSz04psQ+7zq/91cb1iDp8wLwVnCbyfBzEan92y3OXM/MYipQ2C1xgUGWNVP8iU9SG7RsczxiZ+OFXViFCxNLxARbK1xWNG5wuygSEtxxcAzMiZV1FVM2SXF2DkfwuVCWdz3tllzAVxZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iWv1AMAV; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A43EB444F0;
	Wed, 23 Jul 2025 16:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753289681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=82OKXSabBzQ5of6DfbLoXOt9Nkr8C/Vt4+3UIRk93Z4=;
	b=iWv1AMAVniIQ8je/6yVqUxHF7Ysm7ld0IGEV1mcvH8m3iiqpps56KAhwItHlmd8oCeNLrO
	gs6QHAc3w/GHVouwLw3P2++0AMoH9Ujvejb47U7JSVoGh/+5yympXdjvbAZM0GPavZbN3B
	5LmmEZm2W9ow9jKAdz5YBzVxMVxynW431KCdcOpFQmrESNpdx1a9bg1h0TofLPEBxYpgLP
	4h+XNLBpFIOwB6S7ck/1/vR4/DLoiwbiBzkC/2gMg0M0ozISzDLrxDXwimcos2uaxMfKXc
	GaL3ZAl8zikgAvzp0HloSZlc0HcGicpTmwFATsuhkN5OR3mtJA0DRvNCXUia8Q==
Date: Wed, 23 Jul 2025 18:54:41 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: Re: [PATCH] rtc: m41t80: remove HT feature for m41t65
Message-ID: <175328962923.785597.10987425789103592643.b4-ty@bootlin.com>
References: <20250704091144.45389-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704091144.45389-1-eagle.alexander923@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejkeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedutdfgheetveetvdetleelfeffkefhtdfhleegfeeuleegueeugefgheehledvgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvggrghhlvgdrrghlvgigrghnuggvrhelvdefsehgmhgrihhlrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com

On Fri, 04 Jul 2025 12:11:44 +0300, Alexander Shiyan wrote:
> The M41T65 device does not support the "Halt Update Bit" (HT) feature
> as per its datasheet.
> This aligns the driver with the actual hardware capabilities.
> 
> 

Applied, thanks!

[1/1] rtc: m41t80: remove HT feature for m41t65
      https://git.kernel.org/abelloni/c/289642767c2e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

