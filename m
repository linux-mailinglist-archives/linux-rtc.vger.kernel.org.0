Return-Path: <linux-rtc+bounces-2482-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 044139C34FA
	for <lists+linux-rtc@lfdr.de>; Sun, 10 Nov 2024 23:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF8E51F21458
	for <lists+linux-rtc@lfdr.de>; Sun, 10 Nov 2024 22:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84153157487;
	Sun, 10 Nov 2024 22:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CVBsWRHZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94BB450EE
	for <linux-rtc@vger.kernel.org>; Sun, 10 Nov 2024 22:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731276384; cv=none; b=rgi/acYOybLFszLdUpuNvqPjwMYtleo7Pw7iG1wPAUXSWFx7T1Yl8e78s/Ru6GyKmvRwC+LEFDggEIfMB+2O1d1k1ZCiHlqohjSCFAH59SmoS5QUBuEY4QesaseKHfRU4rIfsd69wMwFE9qM4KjK70yZNdNoJgNea2VADotmbgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731276384; c=relaxed/simple;
	bh=jtjVj7uEVkTPuyl0/UBjs82HBG/dxnpUk936HbGnmfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjCQFun9S9EHL8YK6mIlwVFv31UeqpchZSvg8LcvfPNTxWtydkmGcJwxfdHD1wGJg/brTnW2PgM8kGXZUSQetKBLHYBl0IGETPauyDNA19UzvH3yBgPwwxFMCNp3bpz+rYH06+qDkCSrYuP8NG3FkWzd2l2BWLH2DoflmFJxHi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CVBsWRHZ; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFC2A1BF203;
	Sun, 10 Nov 2024 22:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731276381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bQz1lihayK/eUgdbYXt5xn8yjeP46uSwZN1igxYJxl4=;
	b=CVBsWRHZuQKkvgmi11xzcwP7SONMMPU3mNNOGv+n8eIRt28c5YquPdrCek6AxHgy6FMUK4
	YT8eXthh5ZAAkdwSH0hOapxcQZSamThEZWkQCfrrocJHYgC6iXLybQgqaYXDFVx44qZIGO
	AoEkRTlsnYlh4SpwGPHG17y+NVMgJh2yW8KJir7JLxhR6g/0JULqjU5FOpTKCeRdwDwTqx
	16mc12zGCo/rUoWxVwpPO4YqdzjQcaiVI4Y+RU7TCko7+Ymm0vkllZcc6tC0CY/tRGKzLK
	4w9l/VsUsMxXOIibdE8q9nep1zq69nY7XWfi9NoqT21Dafvehx/+PJRBsV33mA==
Date: Sun, 10 Nov 2024 23:06:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: Switch back to struct platform_driver::remove()
Message-ID: <173127618342.3020900.5275304849577747153.b4-ty@bootlin.com>
References: <20241007205803.444994-6-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241007205803.444994-6-u.kleine-koenig@baylibre.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 07 Oct 2024 22:58:03 +0200, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/rtc to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> [...]

Applied, thanks!

[1/1] rtc: Switch back to struct platform_driver::remove()
      https://git.kernel.org/abelloni/c/e5eab1aeae76

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

