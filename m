Return-Path: <linux-rtc+bounces-1410-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB3991B222
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 00:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A54D2282ACC
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Jun 2024 22:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22041A0B16;
	Thu, 27 Jun 2024 22:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b9FffNX2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F252837F;
	Thu, 27 Jun 2024 22:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719526954; cv=none; b=ChAgDRRHWkLvXBI1nT6fD2dSitAs8Lzl1F4ctXXvi+ZYFIqCT7OiPIHzvV5GMmWyUcTQn11yD37JMY62Q1h84cyIxfxS52sjF215AIKNREojXrAjMkn/OZxuF5EJAvncKvuaewDJ/Po4BhHyVZntNCqxhcAmreycZiDQlpNtFyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719526954; c=relaxed/simple;
	bh=n3wO7AoUo59xpwHgmufGIar/00EzjFwcHQ3rwt2GjvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C34tVCjPfQLei6aGNPt/e8YSyxQOJ93K+B/HecsITL6jDThgxi7Bm9E4d/EFUvRMe58tyhm8ci6giiBqhuDMllu31wWw6amy8bc02f/54bATAiuZpjEtybN2hkABrY+Z9OzwiMLS4yOzc2XuQztFd3ieHCxQss5raf7TGYE6wN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b9FffNX2; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49C3CFF804;
	Thu, 27 Jun 2024 22:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719526949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6OjlPjjpI2vqASmOuBlcTzFmaNSCeWkkiLPGmxrzABw=;
	b=b9FffNX2uGLm+nb0LxfNOI6h9Av4ENCK4owIXquv5n/9YH3b8AXXNiNVHfEowz1d3/h8rs
	XjRMQCTcjRJDzD/LfpRwL8Hd8kWPA82RPYTt4/rkarhGqD/EUBkj5PuC8zsuBt2BDJsQ2m
	34t5xxaZSI6OJkP3TNKdIOfr/l4YVs4Bx8Q0o93hTgkCjrjuu+SkMvcEAK2Iol9bI2hBVM
	Y8j7vvfXO5D2Qg/LfFXdEqo4VkgwtU+1MkgpE9DqiqxEnL2aoGFW7D+BVSc7mv5JAwcPXp
	e3ETEMO57GTRhxuAg1kMMHB1Y9C5EDGgcwFy72SilIvYMUQ6dfilDDTRgTvIRA==
Date: Fri, 28 Jun 2024 00:22:28 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Trent Piepho <tpiepho@impinj.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Joy Chakraborty <joychakr@google.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] rtc: isl1208: Fix return value of nvmem callbacks
Message-ID: <171952691797.520431.6269186934815641313.b4-ty@bootlin.com>
References: <20240612080831.1227131-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612080831.1227131-1-joychakr@google.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 12 Jun 2024 08:08:31 +0000, Joy Chakraborty wrote:
> Read/write callbacks registered with nvmem core expect 0 to be returned
> on success and a negative value to be returned on failure.
> 
> isl1208_nvmem_read()/isl1208_nvmem_write() currently return the number of
> bytes read/written on success, fix to return 0 on success and negative on
> failure.
> 
> [...]

Applied, thanks!

[1/1] rtc: isl1208: Fix return value of nvmem callbacks
      https://git.kernel.org/abelloni/c/70f1ae5f0e7f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

