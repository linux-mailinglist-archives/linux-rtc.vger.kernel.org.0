Return-Path: <linux-rtc+bounces-3542-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 361C3A661B8
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 23:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BE4E3AF3D2
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 22:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D85E1EB5D6;
	Mon, 17 Mar 2025 22:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BSPVlcfk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB3617BBF;
	Mon, 17 Mar 2025 22:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742250818; cv=none; b=u3I2PEEgl4Bu7fv9d5leFCS9UOCzrf+IOhcgJqxBrlBNXODIvqS+UabnFz4cezcqn5keAxhY3+KpUdrz9MW+lysb5qU8TaLxdFHdN8josrF9M9bPZFhWI1yzXi3VrxS2GKCpbDtkHtr0P5ORexnNLMfCzbMejCe7ykpbaznxut4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742250818; c=relaxed/simple;
	bh=5evH5hxDSJYzkVboZ6IFWK0TA54VK7B3YDyzYALK7b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcjcdIhRGLcO89VCy9D2PxDDEmc231eAQTEv0//vgxSHhEpwQAl+kl2TtNgms1mwgtIwczy/B83nDDV05ONZy0VxqP+8yqx5LkTvAXLNEPF8F/lyUS/HQ6+E4t1xrugXqgFU1NhB22youEmtcaOoSCWjb0nKwffSAh87EYkJ9Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BSPVlcfk; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8526432EB;
	Mon, 17 Mar 2025 22:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742250815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1JkgyP3NSZUKGIiR5ww73hdF3uIzJbl4G8VkBozlivs=;
	b=BSPVlcfkPVxjFJGXRC1NsqzJMXzgoP/fRPVW368UrHhRDC0Waq1KeJcOAkYAFX3fW10ji0
	bo4j+K7ypK3rA0ouALu85iZT2eMocGOgFqebY3S2/iOx/6nUuv01l/EqhMbQ/f3z60Galb
	EZkDDrQslhY7/gPA/CpBYRc2ygcgi/Tp4SDWdiNf8DIEmtxpOqUXXmu/n5w0V1rVtLwNla
	0puoaAKOKb4yJv7MTgU3LPiK0alDUlbHijalZKpsC9ZXNEFHxjv8P9bx3y1le79/JbXtfm
	OKRxIypX68t6vpwiEnBTJLlLrbQYjL6Dm0y6ihOm6XBsmCzKw7DekBapGDH5pg==
Date: Mon, 17 Mar 2025 23:33:33 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2][next] rtc: Avoid a couple of
 -Wflex-array-member-not-at-end warnings
Message-ID: <174225080420.1592452.18415523185009670787.b4-ty@bootlin.com>
References: <Z9PpPg06OK8ghNvm@kspp>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9PpPg06OK8ghNvm@kspp>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedtjeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepsghlvghunhhgsegthhhrohhmihhumhdrohhrghdprhgtphhtthhopehgrhhovggtkhestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtohept
 hiiuhhnghgsiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhushhtrghvohgrrhhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghhrhhomhgvqdhplhgrthhfohhrmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhhrghruggvnhhinhhgsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On Fri, 14 Mar 2025 19:00:54 +1030, Gustavo A. R. Silva wrote:
> Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
> a flexible structure where the size of the flexible-array member
> is known at compile-time, and refactor the rest of the code,
> accordingly.
> 
> So, with these changes, fix the following warning:
> 
> [...]

Applied, thanks!

[1/1] rtc: Avoid a couple of -Wflex-array-member-not-at-end warnings
      https://git.kernel.org/abelloni/c/0176188220a7

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

