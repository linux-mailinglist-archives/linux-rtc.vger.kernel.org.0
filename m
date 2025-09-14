Return-Path: <linux-rtc+bounces-4901-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC261B56CF3
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Sep 2025 01:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C02C93BCE82
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 23:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E2926E6FE;
	Sun, 14 Sep 2025 23:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qTU8QY/I"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AD620C463
	for <linux-rtc@vger.kernel.org>; Sun, 14 Sep 2025 23:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757891934; cv=none; b=n2I8FNCa+IpVicVEj5WbQQNeh1N/N/gaRhBBQyMZ6O8u2D2DFVs/s7Uf2Yw/GT9Il7ZXIutQ/yz3tYcjV4hnhgWzKhYZDxcKp6uuYElusAtYa998HA0EaWVrqQx1JPVsgXyUf+9hpgQGkZymSTJ5WVH7ky1+ehJXViM3qtMVmAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757891934; c=relaxed/simple;
	bh=qAq6Lc5Iqy1GrNphttxdNVICa5kFfD/Hsy9BGeFvDcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUyvR2YiSglDXdMFxO+294FHhpzOyDhBMXURxIiJTN2zi9Lks+ehQjQ/GMjR4i0KryLGs/1eOMK1rIQPJdklI7nloTW9SNWnv7ZelYTIkbcHXZECw24MxU/9pgZnwnSL99s/22Vla39hFSRA+MvCm8dhJxGqjFzzUfMqJ6iLpXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qTU8QY/I; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D1D921A0DFE;
	Sun, 14 Sep 2025 23:18:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A762C6063F;
	Sun, 14 Sep 2025 23:18:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 41428102F2A84;
	Mon, 15 Sep 2025 01:18:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757891931; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Kz/TYiAiFScWT9Eog/3uaFprqjRgxDp0fqtkMBbjrK8=;
	b=qTU8QY/IcW9PdJdHfnnSnriw55iAxbvX/V0HYJzDwh9/ccxZMgctDY3iHtACLrEG0uKRSf
	ojX3S7JMYpfZKVXND4tgQ0SSFRVG/ypARvwv8/B36uV2FTCRDOBYED4p+Msp08qcktnH9Z
	em8OKo2BPBenm6uJzIjPI0E+y6mJkWqaoDugILwJjIfjQoPTr34627ybfkL2Ks2RSxBt+1
	ynSQVUJayQm+YuY14kNVSfjnej6KYOJGGyvoiZfPE9Q7DBcbM4tXjw00qsJNvZATeIPRqs
	CwpCsDeGS4koA54fo591RbH3mvLfq+2HJlDecORy/pOaI/WgJdrGKxlEF+QhqQ==
Date: Mon, 15 Sep 2025 01:18:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Mark Brown <broonie@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: (subset) [PATCH 17/21] rtc: remove unneeded 'fast_io' parameter
 in regmap_config
Message-ID: <175789183742.411954.10264880654023329075.b4-ty@bootlin.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-18-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813161517.4746-18-wsa+renesas@sang-engineering.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 13 Aug 2025 18:15:03 +0200, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> 

Applied, thanks!

[17/21] rtc: remove unneeded 'fast_io' parameter in regmap_config
        https://git.kernel.org/abelloni/c/c90c7ebf8f73

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

