Return-Path: <linux-rtc+bounces-3540-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD1AA6618D
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 23:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE2C03A6978
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 22:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F621FFC55;
	Mon, 17 Mar 2025 22:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="T4L5/ISe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE77F202C40;
	Mon, 17 Mar 2025 22:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742250414; cv=none; b=ThBDJ3C41U4/NfFDJU11IIj7N+TkFUwIcHjcVB4xejrx2cZB71M47nu64S798YwlXgoOt2N0eQOXF9cwgyLkHMBJCSruxqRneu4O/loBRWbkeZBnr0My71AQ6Q+ZdHD+l423zsMUqEDVQmMAybe2E3Tdy9ZVjz7ODUd69uDJycI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742250414; c=relaxed/simple;
	bh=ryUtsymoxkw3/+d+abEHybhqUf15NQACUZeUjOtPVAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNQ49jsY8qDroTrihyCSeHBMeevlZVMFthR54qlI/bJB0vwzPtnR84r2tkzOBTg3PVhKb4gZUpzk2IDrYZ9bR1gEQbY3XVDn1vizIqmvwG8DBmEUxNWNjD6+r+8WJryhwEEAOKyxpvyrI5ru1mcnyhWv5Z97mNqK5IT01qyvU68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=T4L5/ISe; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9239D4438B;
	Mon, 17 Mar 2025 22:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742250403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uEYm6vD+Jcj53w8fZgUNeO+10L4mNC0lfADSf+WkbLg=;
	b=T4L5/ISe67RmGOy4XLdmcUVb5NnVkmV3nOizbVRhO6GogbwyCrbAS2ZUXLCVlzEmR4k5A8
	9rt25u91FwXGLNWBd6dwz90OCID6TbRVR/4Z29gbVNShoRGZu2w63vdnX4yyYU89UY8yYl
	83IO4eC4ciMNz1qmqvv9yeb6ZJ7KMfP/q83LqgKDHJr0khBs0b8afIDRKVHg5r1BC3/q5g
	wsUkLnFQIJxB3taJF+uhNNV2FGEprI/pTl3pbKEn5XFeZRMYZmO1JqgbzrdGmmRQmV2TaI
	v3yhAXQlRQX0qLTfQM0Mezh2/vICehgcm1jxDt4IrYbz4iPEAChXHQNZmzsy/g==
Date: Mon, 17 Mar 2025 23:26:43 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2] rtc: rzn1: implement one-second accuracy for alarms
Message-ID: <174225038962.1591334.4770863145484486122.b4-ty@bootlin.com>
References: <20250305101038.9933-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305101038.9933-2-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedtjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsr
 ghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 05 Mar 2025 11:08:16 +0100, Wolfram Sang wrote:
> The hardware alarm only supports one-minute accuracy which is coarse and
> disables UIE usage. Use the 1-second interrupt to achieve per-second
> accuracy. It is activated once we hit the per-minute alarm. The new
> feature is optional. When there is no 1-second interrupt, old behaviour
> with per-minute accuracy is used as before. With this feature, all tests
> of 'rtctest' are successfully passed.
> 
> [...]

Applied, thanks!

[1/1] rtc: rzn1: implement one-second accuracy for alarms
      https://git.kernel.org/abelloni/c/eea7791e00f3

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

