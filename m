Return-Path: <linux-rtc+bounces-761-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A137F86D60A
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Feb 2024 22:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42A8C1F24855
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Feb 2024 21:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B481F16FF47;
	Thu, 29 Feb 2024 21:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LUlcmn2o"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3831216FF21;
	Thu, 29 Feb 2024 21:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709241732; cv=none; b=L4vAnWAPsa1uv1N2SXQkJq2mu5r5w9day19e9yWxwnLTgUasFbDtYCleS4vjcXWI/yXGSJ5Oh7rqworUbrNz2Ob93EOfJjq0pYzQ5tsoBvsGKc1DysBtzHh0wnVJ6cfvz8/oK3UEvCd5GIlwsuSXFqZgn33UhSeN849+ReYc5OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709241732; c=relaxed/simple;
	bh=5gb5ojAmd26v5CXVoFuSJdh7RPFQFa4LA7g4u4H18ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RiAReWn4C6DH2JYSDlNln2v10d5z/vQz9nTsh/t0l/TjzMHYbHeNkiYQ6+CFMpsDqdCB/keKTsFC6xxxHGBsOc2t5MYzjaalOmfk0T2DSLP4B8KBn95CaFIw3427PVx8RVBzBsfx4HxL9ixFZfogcvdSpcZ+oLUXkd027OqvKis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LUlcmn2o; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C69F1C0002;
	Thu, 29 Feb 2024 21:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709241722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uFfmStaqobzdqjhMe7Rij7Gosy32QSdSszw0WDuDHvI=;
	b=LUlcmn2osmvrma3LnoQXI+1bc1HwyrjNo85AoI8dm7cu6YsqdbO3fMsHBuagZSJ3/Ja7LM
	Yb8AGGKwGJGZJFO6llYMR0/8Cnw+UwGB5aihpV5nqilveZUrxzoe+kIYLHYYMMmoJo0NxP
	0FYicsmA+6qjCL+A0B553IMEAQCLziBkSPCuIPGwg5WQgG5Hmy+N+gwjdLXk/au4FN7TA1
	+9PFVFzmf0+gj3yaIBBeVEbeHOohx+lojZEdZkapgN2S9cqhaeqJOq70SDeK+Nvm/kX8E0
	jk19IGeBaj5HKcSQkJ7mT+7hattIDFv5nlCqA7ZYRmpu07+w8pIrHUGP6Rtigw==
Date: Thu, 29 Feb 2024 22:21:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: rtc: convert MT7622 RTC to the json-schema
Message-ID: <170924169921.1873482.7668745042028473030.b4-ty@bootlin.com>
References: <20240123125043.27192-1-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123125043.27192-1-zajec5@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 23 Jan 2024 13:50:43 +0100, Rafał Miłecki wrote:
> This helps validating DTS files. Introduced changes:
> 1. Reworded title
> 2. Dropper redundant properties descriptions
> 3. Added required #include-s and adjusted "reg" in example
> 
> 

Applied, thanks!

[1/1] dt-bindings: rtc: convert MT7622 RTC to the json-schema
      https://git.kernel.org/abelloni/c/aef3952ec13f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

