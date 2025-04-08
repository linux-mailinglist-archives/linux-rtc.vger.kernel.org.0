Return-Path: <linux-rtc+bounces-3831-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F093FA80EB7
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 16:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BBDB19E5F14
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 14:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DA41DEFEC;
	Tue,  8 Apr 2025 14:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Fk9eUpWN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06431C5D61;
	Tue,  8 Apr 2025 14:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123443; cv=none; b=hwAfILKyIZcoKidR/5NeBhFKLxmxuHkLMnr1rIwr2jEgDIw2x9cc+fXDuC62mcAfjCHZTLPO78J8UEY/vQ+HR/U+hloTKg8PPN7Dah00DrIYv/o4dlARjnrs6lNh2ryJOdbqfiY9d/xNgGWUOt9apQF1++kpURs3ejCh7wDxGx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123443; c=relaxed/simple;
	bh=xfLcJNkuBnN6kwaBiznYDqI00f/R1xZUhX8REYIpYkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0hLoY1KdjD7hid+kc2rGc5D7fERVjpnZrBZaLj8kCcjALj+YkIBCs4kgiq9W9UHVlRVN1yN4cVR8A45/qEnlXy1N9vTF1mu2iCQp3MzqUPKWmchkJQ2qETqHM2x4ey6aq1ht4z4tKCO9WyKOG5upmfdaQvozsnw0n0QIJf1Tv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Fk9eUpWN; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB713442A4;
	Tue,  8 Apr 2025 14:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744123440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+oXDoWy8UkLqSww5vKMKmjKQxlmXubzb0JTyozGE7/o=;
	b=Fk9eUpWN8HnlD2lCEx4noDUyHgPspMVpXAIQQ6o0czDjVFdEmq8gu6t5UWRibfKN5PMSbE
	/p4dIjKvrNMqID3KxZkTJoriTBKbDszhw6bvYHZlh4W0ZGXfXrE0gzLlVOICmi3aLIKci5
	FGJfHqGA+z3i5+lC2rUTnRsv9MJOVh0zk5heDSpgG7Ng6Jl2qjcfsWy++BW5H6+0KTOl3u
	t2cM7BpmsP9nYEhj1nQyPcDRZzKY5DCw9gB92oeKI2TRAQyxyoj2qewOBYIuB7gW0Zx1B3
	by2GACLjmhMNGH4yAUi6rXQ/k4QySeQPy9cBle4nS5E04XUAo4Bg9o3imbEuWg==
Date: Tue, 8 Apr 2025 16:43:59 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: da9063: simplify irq management
Message-ID: <174412343168.3870296.10193279534543944923.b4-ty@bootlin.com>
References: <20250320102218.10781-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320102218.10781-2-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeffeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegrugdtfeemgehflegtmeeffeejfhemfheffegunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegrugdtfeemgehflegtmeeffeejfhemfheffegupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeifshgrodhrvghnvghsr
 ghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehsuhhpphhorhhtrdhophgvnhhsohhurhgtvgesughirghsvghmihdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On Thu, 20 Mar 2025 11:18:49 +0100, Wolfram Sang wrote:
> The code for enabling and disabling the irq is so similar that it can
> easily be handled by one function. Like in most other RTC drivers. Save
> the duplicated code and one layer of indirection.
> 
> 

Applied, thanks!

[1/1] rtc: da9063: simplify irq management
      https://git.kernel.org/abelloni/c/d37058674646

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

