Return-Path: <linux-rtc+bounces-3343-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B196A49F98
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 17:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF4977A9137
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 16:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3DD1F0987;
	Fri, 28 Feb 2025 16:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kwS5cUkC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64C71F0985;
	Fri, 28 Feb 2025 16:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740761881; cv=none; b=rvWt/QtsdRUXQSQKOrp244NsIXxD8pyq1TiBipWNN1D7J43/hLWMBrfzxVTEMWfXMkcc6QdjdKNetrzRCfM+uPMwgb5rqrJOd+rd27eyvgF0zLyRS7aabgj0gNDm+kgBoPOGxQ9Gsa3ci94ms6Bgr0ZPUL0095Jr3OtBZN3XOA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740761881; c=relaxed/simple;
	bh=GcQIO5T2X8BR3sO+RGdVUXzwPENxvN5NugZ5HeFQ7g0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9QN7ztwtwOHssdUfUzSt4vv5I4ZOv2tEPA+OeB5oJ9N3HxzC5Q7kW/kyWn/shoVy4jPAlm/Ko5UFVIZkq2Ffc1cWnFOS10f5vAd4CTx6PkN3WcAHxufvBghEmka68sbPbW8qNrNQAlA/XF2LQ1EIOkr6nlB//jpsPsDAUMvIew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kwS5cUkC; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AEB0E42E79;
	Fri, 28 Feb 2025 16:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740761876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2F1mWOvIOvmmRpjyWCO/cIFb/CfirKur93FFk/ac3ec=;
	b=kwS5cUkCBzNhXpwumm51/SxS4Ozdl2Sj5wULvKeygX1xWZquY8z9jPc5EOf22uNKkswGcF
	3zSFkdIqERAn3MuCucES1aGTqzTqxUCMT6MhWkQNIoYyWFmd6mzbwvQDPYlPC2cXg8qeU6
	shHGLfkPb7Cbke0jlezDZKBpLEStGwDK4uRTBGEKp0ksWOdBYheGAzgFLEF0pyIrM0vw1b
	fSlh2+dkMajaxPTNc+gk17QzJ2zQSKzZPw7+kLjZ7Yu3je4sCAWFrcXR+Fhq2nrsV8VFnM
	Kcp0Q+RAhx5f1gVGxlZWXsZYSDNUbCXY5BfEhbn8P8ykJViwZW/Xejdn80Qp8w==
Date: Fri, 28 Feb 2025 17:57:56 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] rtc: fsl-ftm-alarm: Mark acpi_id table as maybe
 unused
Message-ID: <174076185914.1014573.2350946288107195834.b4-ty@bootlin.com>
References: <20250222114146.162835-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222114146.162835-1-krzysztof.kozlowski@linaro.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeltdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddtgfehteevtedvteelleefffekhfdthfelgeefueelgeeuueeggfehheelvdegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhisehlihhnrghrohdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Sat, 22 Feb 2025 12:41:45 +0100, Krzysztof Kozlowski wrote:
> For !ACPI builds, the acpi_device_id table will not be referenced
> because of ACPI_PTR:
> 
>   rtc-fsl-ftm-alarm.c:312:36: error: unused variable 'ftm_imx_acpi_ids' [-Werror,-Wunused-const-variable]
> 
> 

Applied, thanks!

[1/2] rtc: fsl-ftm-alarm: Mark acpi_id table as maybe unused
      https://git.kernel.org/abelloni/c/f36d6362c62c
[2/2] rtc: pl030: Constify amba_id table
      https://git.kernel.org/abelloni/c/72ce39bc61fa

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

