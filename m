Return-Path: <linux-rtc+bounces-3936-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3111A85F6D
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 15:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8F9E1769AB
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 13:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B951C863E;
	Fri, 11 Apr 2025 13:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CNjnPAJt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8281AA786;
	Fri, 11 Apr 2025 13:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378782; cv=none; b=gfze7UHCljLutbWgjLW/6QrBwMezUAVYWuYU61dnTcVzsJa0mq/ZF0k7mahbArPHgFgdk/pbHbG+3bmQBdMrrHkZoSCJxyHdoM3EzdZTyHiVVwZZglMgHDVS6WMyWbfx0i5XS51Besg3mNWQVE1jtxd6QR8IfBPU3++WsBOkp7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378782; c=relaxed/simple;
	bh=sSUCYKLy6uMKqdzRFqwuKnQE0QQdd2NpVGK6fARcRac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gofrFn0y2ZiCA65B5lmoUXFNPFWgV9V2rsy8OloQQq7UWUy+S0QOeZa0VlS5OpTV4UtY8i5YM4md1oQDKO3pwMZoKtMGH1+4/rfhxQpw7XjSxJfuCkXOA6ZZhx7+H7lCWI8ma5XIfQenwqzZ92AiPiVlhrlkPOmxGGeA7kdbZH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CNjnPAJt; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 410D543ACA;
	Fri, 11 Apr 2025 13:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744378777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GpvRFI7Lupv3VnoBPyaTus7ezMzs20Cw8F5IJ0eXs8g=;
	b=CNjnPAJtiIAabTH47iVvCgZgdT36qu1LViodDMR7ZbxHKAjEG7Coyxc6SFNrpJD6vY9XB6
	H3rxQ+t52eu6TMzbYfUa2NtFCBVFeYnzPSD62It4IVifSchigZnUALNbF9R6lWWW4JImKg
	wRvkYvbyYAcF6QmIyEg9diR16jW2DoKu93VsmE1gyZn6voLteWiJQ2Iwzx6dZSaVVaUirY
	KiKNc4dPZg9JJqO1WAb9KcN40H7hV34PkN2Lgdds7nRyTsH3kYRlDPFuXuk+aBKkIX6Mmx
	PXzmHlR0otwBm+pxL/57zO6T9m5prKgJCssS6YMyiw0WCuAxdgPhxPNocy+OGQ==
Date: Fri, 11 Apr 2025 15:39:35 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/5] rtc: mt6397: Remove start time parameters
Message-ID: <202504111339359e840246@mail.local>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-4-f003e8144419@baylibre.com>
 <20250411133609a1295543@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411133609a1295543@mail.local>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheprghmvghrghhnrghtsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegvugguihgvrdhhuhgrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhop
 ehsvggrnhdrfigrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On 11/04/2025 15:36:12+0200, Alexandre Belloni wrote:
> On 11/04/2025 14:35:57+0200, Alexandre Mergnat wrote:
> > The start time parameters is currently hardcoded to the driver, but
> > it may not fit with all equivalent RTC that driver is able to support.
> > 
> > Remove the start_secs and set_start_time value setup because it
> > will be handled by the rtc_device_get_offset function using the
> > start-year DTS property.
> > 
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
> >  drivers/rtc/rtc-mt6397.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> > index 692c00ff544b2..d47626d47602f 100644
> > --- a/drivers/rtc/rtc-mt6397.c
> > +++ b/drivers/rtc/rtc-mt6397.c
> > @@ -291,8 +291,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
> >  	rtc->rtc_dev->ops = &mtk_rtc_ops;
> >  	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
> >  	rtc->rtc_dev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
> > -	rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);
> > -	rtc->rtc_dev->set_start_time = true;
> >  
> 
> This is going to break the time for people upgrading their kernel, you
> are unfortunately stuck with this.
> 

To be clear, the breakage will happen when upgrading the kernel but not
the device tree with 5/5

> >  	return devm_rtc_register_device(rtc->rtc_dev);
> >  }
> > 
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

