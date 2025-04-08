Return-Path: <linux-rtc+bounces-3827-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 351A7A80D3E
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 16:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C5261B643C1
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 14:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4421CAA81;
	Tue,  8 Apr 2025 14:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="agWFaCKz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56601C5F0E;
	Tue,  8 Apr 2025 14:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120824; cv=none; b=bcoVEB82JEoElFQXT6QQOUnPRUsiTO+HUT+2omQywc9/d66R8eoYbz9H3fdX4BEGc6Kedof95jd7ALfdY0xC57vYEJbTJMwaEMqt45qiSiY90PPfE+I0k4hDAlrc3KdmUzjxi3xmfoWxGUUQ5V30JuFHNs2e7de7cbw5+LBuFlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120824; c=relaxed/simple;
	bh=/wWXE3fNrEBDvjgetUA+sZfMPO8BA8VN605MtRqkGR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ib1/YekDze1RwM7ReOlnBlL6qP2MDW7l0ivAE6x7nrzO0QTU0M0cBGp83m1plcjy+MNxyhyg4oJmsT2op8oPKI3fwbjsMi1ZSqGxcmZ4BN1dDt4A1cjn6ngal8k24wHMbt1LQe1KFpl+UfNDouA+uSYRlOOX3PimDfHQjfbTVyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=agWFaCKz; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE5A64439C;
	Tue,  8 Apr 2025 14:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744120820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fBKTIrTR4k7s9CcKR0nOavz7/VdQkJ67KeiXhctPsas=;
	b=agWFaCKz5DYKHJHSwgj6s0srG2h4/llx8UsELbyGK9KPjhh5GevfaIjGVnMpYFyIQjzyCH
	XG3MZfnxdczNeWnWLN/fFFG469PhOTkWJvJksPFgC0pHM7Up5t8ci1Fu+aiHHvRGQWNRy8
	nSJw/xQVSRKfcTXSntgIJx/vjsEyrvM1vxXdcPyKtOsaAFuP2KPD6ZVENkS+6Ahsyyt8KY
	CXtRA84ls1KBj4ODIgtrQE9o08LaabXuDtIZ2deIODaRbJsENl6dx9hU2OFNb6+xdvs8Le
	h/P8Dr5PyezmtCeTfocoFFzYzsVtaD/bde45qNTPGFqcp9j2Yb9BRQ7Wa+8avQ==
Date: Tue, 8 Apr 2025 16:00:20 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org
Subject: Re: [PATCH 0/8] rtc: sh: fight the bitrot
Message-ID: <174412079595.3863545.11271710425205821777.b4-ty@bootlin.com>
References: <20250227134256.9167-10-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227134256.9167-10-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgr
 dgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Thu, 27 Feb 2025 14:42:55 +0100, Wolfram Sang wrote:
> When looking for hardware that supports UIE via alarm irqs, I came
> across the Renesas Genmai board and its rtc-sh driver. The driver
> basically works but there is still a lot of cruft left which is not
> needed since the RTC core now uses the timerqueue.
> 
> Patch 1 is actually a bugfix for DT systems. Without it, alarm
> interrupts don't work. I suggest backporting it to stable.
> 
> [...]

Applied, thanks!

[1/8] rtc: sh: assign correct interrupts with DT
      https://git.kernel.org/abelloni/c/8f2efdbc303f
[2/8] rtc: sh: remove update interrupt handling
      https://git.kernel.org/abelloni/c/c090d390e5ed
[3/8] rtc: sh: only disable carry interrupts in probe()
      https://git.kernel.org/abelloni/c/fb06b6b54b33
[4/8] rtc: sh: remove periodic interrupt handling
      https://git.kernel.org/abelloni/c/a7e7d966ccab
[5/8] rtc: sh: simplify irq setup after refactoring
      https://git.kernel.org/abelloni/c/689602e0609e
[6/8] rtc: sh: remove useless wrapper function
      https://git.kernel.org/abelloni/c/33df0a509dad
[7/8] rtc: sh: use local variables in probe() for mapping IO
      https://git.kernel.org/abelloni/c/ea59ad0ca975
[8/8] rtc: sh: minor fixes to adhere to coding style
      https://git.kernel.org/abelloni/c/8003a5585fc8

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

