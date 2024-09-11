Return-Path: <linux-rtc+bounces-1949-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4982975D60
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 00:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D73751C22350
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 22:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D8817C200;
	Wed, 11 Sep 2024 22:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gHAsIhjm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AAA383B1;
	Wed, 11 Sep 2024 22:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726094969; cv=none; b=BwItgDD02/turPLhrJB+1gOju7+TVhjCOScOVHqphe8eNvlUZDhjjhz3bFoV3hwDFqUR4nCPTu0y8g5klTy3TDPIzlNp96zY40ju/G+y+igucjI5dHAGDsDlbm+RhobRTXX4Wcf9D7UphgUOH1o9RxA/7ZmG68/MC2+oNaO/zUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726094969; c=relaxed/simple;
	bh=OXUQXUpLdD82PoL0H0ysJsAEVyqb6IeigzdKnbw+L84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+PUcrhMhxNyNXgnFQLDjMXdEjKw9R91YhPA06lP7GjEbQV5EUBqzUZEXNHRy9cqkesH5CwT5mEq13p6QkDpHQLCYyBkvXwpaxNTm8xphwwmaJ4i/fxM2/QwuEO/SvE7KIcCHdvqeK4nnD42c+w249s+JGqoWTLGL9QYA/L5kCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gHAsIhjm; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A884FF802;
	Wed, 11 Sep 2024 22:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726094957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qyNislHaCUJw7mzyf1B4jvIcfhaPLsCGQhSJYjqzSrI=;
	b=gHAsIhjmz32JvHLP/2aJsUBRuppIbeLZPhnYHLSQ1ZG4WJAkw3+EtkdsMNp/KbBw8GaQF+
	Jn69IEeKa7ICi3wjNLRVj9a2U9ipqnJF8psnYeX3ZcfbogkQ5UYxQRrXwwFbzJb5afD4hz
	Rpw0EHpSHMNuEZSfN2H8TNlPfO01G9YXuRPBzhK9qCWK9ROPinr2uramTLfb21wKXXJ1HK
	1ZMqyCAlDv7lR4+4lRsdq5Beq5HqXjFlFbG1eJzGRXWgkGTX7p/rpS3lLeV4CBszhjEh4o
	19QXH7ODI7K5bJHKSUUMDTfuUStHCXq7eF3hVnjx3TMeR4pkwfPPX7X9F9+nog==
Date: Thu, 12 Sep 2024 00:49:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] rtc: m48t59: Remove division condition with direct
 comparison
Message-ID: <172609494901.1572134.91739607625534933.b4-ty@bootlin.com>
References: <20240809155631.548044-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809155631.548044-1-abhishektamboli9@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Fri, 09 Aug 2024 21:26:31 +0530, Abhishek Tamboli wrote:
> Replace 'year / 100' with a direct comparison 'year >= 100'
> in m48t59_rtc_set_time() function. Improve the code clarity
> and eliminate division overhead.
> 
> Fix the following smatch warning:
> drivers/rtc/rtc-m48t59.c:135 m48t59_rtc_set_time() warn:
> replace divide condition 'year / 100' with 'year >= 100'
> 
> [...]

Applied, thanks!

[1/1] rtc: m48t59: Remove division condition with direct comparison
      https://git.kernel.org/abelloni/c/60a06efc56d7

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

