Return-Path: <linux-rtc+bounces-3541-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14424A661B3
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 23:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F61A3B9429
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 22:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC72205AB9;
	Mon, 17 Mar 2025 22:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kKCRdYob"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCD1204F63;
	Mon, 17 Mar 2025 22:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742250695; cv=none; b=HiLm5a+OWpRfeaSM96Nd1xZT4qsSKQxuAvixDw6qiMpIfniu2L6wntZqHycTWTxoh7MIM4gBkU7PathyVZ91mQ91Q9kt3358Feah5MmJ1CQoXcKuydYq3tpssrMzZeMqQ66k8T+ouVZIe6r/jw+BQYsiGQyQL6y/6PDVtpuL9As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742250695; c=relaxed/simple;
	bh=dZTL6q4hKn96HbNuGu6aE2VYQd+2sdOvLQ0BnLGvvpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehd6E0oj4JbOxzvGEXJGRUdN91NlnJK0MqdgGKDY5KA59TrotcMIwSpd1xkaksdZutj633yjH3ERXub7ZJp6YHL3rtdxxNr8sTwN9Er1ntLYFbPiZ4uWfnGqZ4T/NVbNeSzpIHGKbGmSOHaVFg5xO1rVtfgplJJU9fL3QhXZu08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kKCRdYob; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D4844429D;
	Mon, 17 Mar 2025 22:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742250691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YU0779KJENUVeyZeWnNlXQF7gOntP8FOAH0ypMjaIgI=;
	b=kKCRdYobby0yQWeuFw8AD10wI3b8qaZWooN8ohAhLTZglKBmC9zcBfdCJyFFN6Hy3IzFdq
	ooiIqzRYonhqU0oEI1i/MVWW1sVUMd7jCGsnv5DxU+gg5LZT0shjhT025mlVSTlMeYHL6s
	I0IAr3IRde3ssTMzH7VZWkdqBXjEQtV3BwGP/taaZjLFavKsnI4L+LDw6g/7GvrVdFGNTc
	xH0Z9ejlnqXzyfs6XC+VD0aDYEr12rniVLti+ETGsqb0t+HWwTvfPhOWgRDXNCOMPHOKro
	MowiDAg46ktp7zyuNXrge0YvH3QSBOE0RK7DKE58XfUxvP93lAB38eKTdzl4Wg==
Date: Mon, 17 Mar 2025 23:31:30 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2] dt-bindings: rtc: pcf2127: Reference
 spi-peripheral-props.yaml
Message-ID: <174225068320.1591957.13867881514872468074.b4-ty@bootlin.com>
References: <20250317120356.2195670-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317120356.2195670-1-festevam@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedtjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdou
 ghtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehfvghsthgvvhgrmhesuggvnhigrdguvg
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 17 Mar 2025 09:03:56 -0300, Fabio Estevam wrote:
> PCF2127 is an SPI device, thus its binding should reference
> spi-peripheral-props.yaml.
> 
> Add a reference to spi-peripheral-props.yaml to fix the following
> dt-schema warning:
> 
> imx7d-flex-concentrator.dtb: rtc@0: 'spi-max-frequency' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: rtc: pcf2127: Reference spi-peripheral-props.yaml
      https://git.kernel.org/abelloni/c/6c2b833525eb

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

