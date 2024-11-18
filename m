Return-Path: <linux-rtc+bounces-2576-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD799D1272
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2024 14:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66AEA285958
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2024 13:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5E5192B79;
	Mon, 18 Nov 2024 13:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gti0D6R6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEB541C77;
	Mon, 18 Nov 2024 13:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731937725; cv=none; b=gMfh8+8ITUZSUcx7z5+RcPRakvYYMOFljF2a8J2Ggy2rnz2Quqqrv71LWqEXv7wLJ62I84nQbntzR2gP0OsZFEEJFb6rdOw0YV+UOCg5RA3bGOKbLNjxwRbWXZaFMtHU7Lqdt8OluDRu1fXeAr5k4vTpQnE5LyZaCmcLKL138Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731937725; c=relaxed/simple;
	bh=WKTUs0IhED2ktSdRkiUNwb2ooYdSYFJzD/OZEuRtdUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GevyLf+pj1K1aRe0XnXJ0NNe8icIGFrqp/MjFSgKOFwB7npL2gHZMCLVI7WUvYzwBymGI4kIuVc4Xk4LmqIAc/RBfQbg/fDtaHIQSmP8QI6wLLVatud9QsOODBUjhKrwhkj7wU0ILtisWaxl9fM+7awMFd8+sAUcFCDvDg9Wo+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gti0D6R6; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F35D120008;
	Mon, 18 Nov 2024 13:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731937716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5KedvWKey5BPekgZ33QSyGqNhec7IAEYxlEO+HyVNno=;
	b=gti0D6R6RJzfhukjTit9/jNRZNer8Wc4I47CfHEBwOOA123LT7sGMvinzRVJauSjPR+RCb
	1XWl7zuKskAltxCHTnjiqJiBhqF34CzOMoTL+eZxi51LOQddbV0u2djRZAdPXsJJe6gRzB
	QWWjmwv0WOa3JIIv1I4ikRTzlYuxcf8/68j5qB0ABpAPiFkkZCbaPOhw2z4EJBZ6G0pBDN
	q/HTMvmAJN5YM4jssLf4ekSJ3IUS64p9f5vMJ5rXFQhBPcVwQTCgn6gxlxk/2sXaF1nZFo
	PRARuM8G0jSjRzv9BAbytPIk11jloDG0Rv608QXUzs0WLxZR6Nbr5Z4+kd7TLQ==
Date: Mon, 18 Nov 2024 14:48:35 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 13/15] rtc: brcmstb-waketimer: don't include
 'pm_wakeup.h' directly
Message-ID: <173193770578.39194.10840695643775625403.b4-ty@bootlin.com>
References: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
 <20241118072917.3853-14-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118072917.3853-14-wsa+renesas@sang-engineering.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 18 Nov 2024 08:29:12 +0100, Wolfram Sang wrote:
> The header clearly states that it does not want to be included directly,
> only via 'device.h'. 'platform_device.h' works equally well. Remove the
> direct inclusion.
> 
> 

Applied, thanks!

[13/15] rtc: brcmstb-waketimer: don't include 'pm_wakeup.h' directly
        https://git.kernel.org/abelloni/c/5b42edefd733

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

