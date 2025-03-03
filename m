Return-Path: <linux-rtc+bounces-3372-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4983AA4CDD5
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 23:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68B3B18958BE
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 22:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D971F03FF;
	Mon,  3 Mar 2025 22:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="avUcecqe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B9D2356B1;
	Mon,  3 Mar 2025 22:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741039520; cv=none; b=gVTCAuGg9ySAMtBFr7hv+F7tIb5reZvcC7vTVs4CtcMRTeImEiJsTfIKa88FfXLzthl600kSURZ2VAtfcpy2mB2n5KTZ1zawVlV3PR08yxzq4JsK6aWZ1bkIQTzHMqXtDqbhROIA+XJ/Bw2myeyNz54wKuggJaq9cpkYNhDCi54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741039520; c=relaxed/simple;
	bh=2Q8hSgHskq8iK2gEQ2tvf13oh4SB3vsMyvT5OJIGh8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9VvZyTzUESOvG4vjUfm5xyF9dhKWj5uBossRlKGmX4HD8wD7b+6grKFMC6nsYQD3pJFV4uVQ4CbhDDL1V2EqOOh81ABjVsM+/MscmPnI6584oz8c5CwYFXG6D3WqIt4KK2upMbY5hPLSU590Vd+Iwxvu9ZSDl9oujetoCOk0bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=avUcecqe; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5EB34435F;
	Mon,  3 Mar 2025 22:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741039515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UPXaEZTWHPqvZ/4xe6Vgz0dumrtZ+1aArmqTgcjC60w=;
	b=avUcecqejc2zM9Yl6b0WM9W5Jqe/NKsM1rxAh9j1vG5l67LwViSGKUni8l1YRrvKzZEvB9
	hAXMj6Q/xCYKTLKkWcR5dMVE7vyymRPY6YNgSMoJUIktJk+1s5e5A5vNLhx9iV+fZQv2xS
	ot0rMFAPSPRGhlcUyQv9F8H6F3UoylQ9jpKrFJevwmJihrVlT9B2h6ArZv0pSe2Bhlf/px
	F9TZ2dMfMz4CHdNf+3xwWHIBOLMORP4+fJe28nVwzvJSrtJnQXqbuUuYrHfQlgmJnLCLHq
	kR1lYm+IsUjLHz9/2Vll7U+7tutDokiwoPd7tGeT0BVg+xHNWugtqR4zvPhGxg==
Date: Mon, 3 Mar 2025 23:05:13 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Huisong Li <lihuisong@huawei.com>
Cc: zhanjie9@hisilicon.com, zhenglifeng1@huawei.com, liuyonglong@huawei.com
Subject: Re: [PATCH v2 0/2] Use HWMON_CHANNEL_INFO macro to simplify code
Message-ID: <174103950413.1107781.15545984471360569360.b4-ty@bootlin.com>
References: <20250210054546.10785-1-lihuisong@huawei.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210054546.10785-1-lihuisong@huawei.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddtvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepjeejrdduhedtrddvgeeirddvudehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrdduhedtrddvgeeirddvudehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhhuhhishhonhhgsehhuhgrfigvihdrtghomhdprhgtphhtthhopeiih
 hgrnhhjihgvleeshhhishhilhhitghonhdrtghomhdprhgtphhtthhopeiihhgvnhhglhhifhgvnhhgudeshhhurgifvghirdgtohhmpdhrtghpthhtoheplhhiuhihohhnghhlohhngheshhhurgifvghirdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 10 Feb 2025 13:45:44 +0800, Huisong Li wrote:
> The HWMON_CHANNEL_INFO macro is provided by hwmon.h and used widely by many
> other drivers. This series use HWMON_CHANNEL_INFO macro to simplify code
> for rtc subsystem.
> 
> belonging to the same subsystem.
> 

Applied, thanks!

[1/2] rtc: ab-eoz9: Use HWMON_CHANNEL_INFO macro to simplify code
      https://git.kernel.org/abelloni/c/f432c5d502b4
[2/2] rtc: ds3232: Use HWMON_CHANNEL_INFO macro to simplify code
      https://git.kernel.org/abelloni/c/d659dfec7d35

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

