Return-Path: <linux-rtc+bounces-3961-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 845B0A88EA8
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Apr 2025 00:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B73B8189BA06
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Apr 2025 22:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221D91F3BB6;
	Mon, 14 Apr 2025 21:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="A9surNlw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044C51BE23F;
	Mon, 14 Apr 2025 21:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744667894; cv=none; b=ofFkNUd2E0jnkiPCGVWZogS+TBGychzyERxqaLa2Ro2Hi5dg2f3/jQ7Sb2Sh/zvNJz4Sg8HoaLzWuJPQEJOCiQgr+MqYdOlVy/MySB0faP/zMHjH9mkq1X4A9YDP4IB13nFt/7eWp3o4RTpL+7qx4IR4OHAtjKWiULVbCy/bAuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744667894; c=relaxed/simple;
	bh=RHUquyOtqABkuvgbGR7rh7/n9TrlEFwyuSBpSmEkwaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohS1+GSoinKKrF7i3iWeb/l7Lq/mOA6+eYfM1TZFuqqJ+dzB0KpHYyISwYWAn5Bj8HB5D6zU5hLzOh4UYmncE3avAs1eJ8ofdJ3M97pNsh9+vYdMU1bSkoAMjN2FiMCMSMHpUlKYeu16VxfEgiW7kcTOWEP10KNAObA5mcUfU/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=A9surNlw; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E1AF41CFD;
	Mon, 14 Apr 2025 21:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744667888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mKkSHxlGKWwLAVWzC2ngK+QD6aN8k+ksqhaW6x0BrfQ=;
	b=A9surNlwNl1Sh8hothZthwuoJ54i2YTw7bQLtr8+Bn2tspofyF/qkhK7uqKMIdV58CI4YW
	L3CJt5cceI3qZa6lPgOGcIJgqLBaTKTz/wMVv8n2ajk5j3knnabov2GzGWKZ3mJ1OHs6Df
	XIMZocbJFiJu+GW/cy6AFBEc0nmpxTcN+rT9Z4tHDaw1sAttHD29ZYzyGtU+iK9qCMFqAG
	95ohkEw3+zhdwt2Eiu41rsBqlGhvc5tgSHOMDTlXcXF3uFKGXV7O0m0T5iyQQ6BZHcprwP
	jNdRXL+pab7xYClw6jJU1NJx5kblCxghvSzsL9aEkXYWfEGjf1Z4Qpz8b6KnLA==
Date: Mon, 14 Apr 2025 23:58:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/5] rtc: mt6397: Remove start time parameters
Message-ID: <20250414215807b1b6b008@mail.local>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-4-f003e8144419@baylibre.com>
 <20250411133609a1295543@mail.local>
 <202504111339359e840246@mail.local>
 <968001f7-96d1-4ad5-8c36-28cac5dc30f1@collabora.com>
 <97cfeafe-7044-4f06-b2e6-e4a158419473@baylibre.com>
 <vpf4apahhpovhrqje4i647nldszen2pglbm5fdmar7bsyg7uao@3ymuod45ftlj>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <vpf4apahhpovhrqje4i647nldszen2pglbm5fdmar7bsyg7uao@3ymuod45ftlj>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdduieelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevudevhfdvheelgfeileefteduuefghefguefgkeeljeeufeeutedtffeuteeivdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegrmhgvrhhgnhgrthessggrhihlihgsrhgvrdgtohhmpdhrtghpthhto
 heprghnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopegvugguihgvrdhhuhgrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhopehsvggrnhdrfigrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On 14/04/2025 23:34:48+0200, Uwe Kleine-König wrote:
> > > Yes, you're stuck with this. Devicetree has to be retrocompatible.
> > > 
> > > Besides, this start_secs is what gets used by default, and the start-year
> > > devicetree property should take precedence and effectively override the
> > > start_secs default.
> > > 
> > > Just keep it there.... :-)
> 
> It would work to keep setting start_secs but allow overwriting that
> value in the device tree. But see below.
>  

This is already the case.

> > When you boot your board for the first time, is the date January 2nd 1968 ?
> > If not, that mean it is used as a finetune offset year.
> > IMHO, mktime64(1968, 1, 2, 0, 0, 0) is a workaround for the rtc framework
> > issue we try to solve in this serie because start_secs is negative (1968 <
> > 1970). Now framework handle the negative value properly, even if you keep
> > mktime64(1968, 1, 2, 0, 0, 0) , the device time will change. I prefer to
> > notify you.  :)
> 
> I don't understand everything you wrote here, but as far as I see it,
> rtc_time64_to_tm() not being able to handle dates before 1970 is the
> main issue here. This is of course only relevant, because your hardware
> occasionally contains such a date. The technically right fix is to
> extend rtc_time64_to_tm() to work for dates >= 1900-01-01. (An
> alternative would be to assume that a hardware read returning a date
> before 1970 is invalid. If you refuse to write dates before 1970 that
> should give a consistent behaviour. But the original approach is the
> nicer one.)
> 

Yes, the assumption is that dates before 1970 are definitively invalid.
I still believe we live in a world were the time doesn't go back ;)

Android *was* the only OS requiring to be able to set 01/01/1970. This
changed after they realized that some hardware is not able to do that.

> > TBH, it's hard to follow the logic, so I've a question:
> > If I push in my V4 a framework fix that drivers using year < 1970 will need
> > to have a new start_secs or start-year value to stay aligned with there
> > previous value, do you will accept it ?
> 
> Doesn't the need to shift the start year simply goes away once
> rtc_time64_to_tm() is fixed for negative time values?
> 
> So I would expect that going forward with just patches #1 and #2 should
> result in a fixed driver regarding the breakage you're seeing. (I'm
> unsure about patch #3, I'll address that in a reply to the respective
> mail.)
> 

This is also what I think but I don't think I'm going to allow the
rtc_valid_tm() change. It shouldn't matter as the check should always
happen after offsetting/windowing.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

