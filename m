Return-Path: <linux-rtc+bounces-4560-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3090BB0FC3D
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 23:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24557188E6D9
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 21:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A867B27056E;
	Wed, 23 Jul 2025 21:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XnUPtqyx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C471DE2DE;
	Wed, 23 Jul 2025 21:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753307053; cv=none; b=IRTi8ZYYV3xnJlO9Z6nJy0vOMkwjVolxsElVLAcyskr9ctBow+Wo38RZobKlm/+kof9LVLBtHHhB51kj5fLAqvhu8IXRfqPe8m5HGNjLMeypuqcbnLTmo7J3HAKE6gD9+6aUbKYMY8IryIhnbp3+n9Oi1Sc8R2n95+VBiAJ5aR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753307053; c=relaxed/simple;
	bh=mGfm/6oPVdyZEJr9YcL74SDBKYnWQhbNPonU2yX6xjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErVd52Voau8Dd4pYillPNvDIMMHuV5rzLePgas46X65mTN4k+TWiFt+yFn6tXLCiWwAjhqTT32NrIuv1cVW0Zi9XLA3dVq0AkW49nPl8T90cKdztuSlfV+VaUJmrgea7cMEKjhHOT+yvEcdojIuJXG18P4X+ea2mSQ7q/NEsW8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XnUPtqyx; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB80343174;
	Wed, 23 Jul 2025 21:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753307049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+ewaN9QdWY1htk3+cEq5mwLDLsxgmkGUUi0mCDecEpA=;
	b=XnUPtqyx1VWKbhqMY3+QdxkkrEDT4NlVqYgZzaqqSEWZXWhdkLbjtDVRuy9GcLuAUpbdGJ
	u7eO1Jq8e9wx6zZufltfACwFYotrkGeZID/dBTP8tTfyAcqKcZbpfemL3BZqdxbI4Ahy+A
	C4g41SPxqyDuW8CMzKYXp4IYjR1ETiyCLPuzJmhoEi9qRx/X0qaJRAFPAreFg7moO4OQR4
	6rk1XSctuj/Rw4/IPLvRTK48b2MdIPk8ssvyFAuL1b4XowuUxzK+cYopTbapsz3XYnAbrd
	6cHsUkw4ZSayZ94qG/MoPLKe5DDH6ONl+RMQADFlDZvodlRgTJUP9/qKOqEQQA==
Date: Wed, 23 Jul 2025 23:44:08 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yiting Deng <yiting.deng@amlogic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 1/2] dt-bindings: rtc: amlogic,a4-rtc: Add
 compatible string for C3
Message-ID: <175330704073.843948.17656447589473217659.b4-ty@bootlin.com>
References: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
 <20250717-rtc-c3-node-v1-1-4f9ae059b8e6@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-rtc-c3-node-v1-1-4f9ae059b8e6@amlogic.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejkeekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohephihithhinhhgrdguvghnghesrghmlhhoghhitgdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 hepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepjhgsrhhunhgvthessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepmhgrrhhtihhnrdgslhhumhgvnhhsthhinhhglhesghhoohhglhgvmhgrihhlrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com

On Thu, 17 Jul 2025 17:38:37 +0800, Xianwei Zhao wrote:
> Amlogic C3 SoCs uses the same rtc controller as A5 SoCs. There is
> no need for an extra compatible line in the driver, but add C3
> compatible line for documentation.
> 
> 

Applied, thanks!

[1/2] dt-bindings: rtc: amlogic,a4-rtc: Add compatible string for C3
      https://git.kernel.org/abelloni/c/db22fd8880a2

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

