Return-Path: <linux-rtc+bounces-1450-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E43AE9295AA
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Jul 2024 00:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15AFB1F217FF
	for <lists+linux-rtc@lfdr.de>; Sat,  6 Jul 2024 22:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B2F1CD35;
	Sat,  6 Jul 2024 22:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PULOaKQS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858333E479;
	Sat,  6 Jul 2024 22:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720305308; cv=none; b=BFxARyLbwjQP79jlYSBf1QGa47oCv46YLacN/bny5s7zl+A8LEbHVI/1szgsK23nSZwiqqoPYSw7nw9bVctzZKf2NjfaVtSSXPNKoW2N0wlCFBMQqbGcaQcUGgldSoSyXtkAY2U+rvKtVMbpDyfzMxdSEZuZ86fWGD+0gGSJhHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720305308; c=relaxed/simple;
	bh=fJ/sf48HocFwUcY3So9cb4YshCtbFNBwBTaTvo5q1eM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbSm3jbCYPHhg7D12xT1T6ICJK+y9uDl62jUUtUjnJd1qll0hfaLacU2bp0O6aSZ0aLCOuvJEQrFc+YdhQOrWnjX3vgyDZ7HPBLcoZy3FixiHgIIPPlgQXNmAD8hI9f4utZHpOef3UKzCB1WB8J3keCrOj+3FmC+PlnwSNmC3GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PULOaKQS; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1E8160002;
	Sat,  6 Jul 2024 22:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720305297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qWKCmA8DTwbOiClAVyl72FhbmfynouxnFBSzFwd7/5U=;
	b=PULOaKQSIxfbBdhg7efyxk2gVyKVPY0n3ja1W/o12qYhpsyquktb1CkaNc/GGRYeX4JWpw
	a+DzICLCA4difrFAsQZ0zZ/0OowD0U91i3jFLp6ixw6E8FFBmNymakqUj6BuW2ki0hU+Jj
	wZ3mK2C+lQ0DWFNC8umxi7f5PSdRZBPm+vQoVOyu3Nb7yozLMZZphDeVo9jxnToqONkszX
	+QVO0daW7fZJD9J3YCwrqRgfGYv3bdO9prVk3Oo18vQvSHWucm006cZNWwheeBIv2myJCy
	AeymQlylM5u9tjCIFFtUMPUBnak1F4rEWUt+tGBffuRNVYaAr933NKiBP9oChQ==
Date: Sun, 7 Jul 2024 00:34:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Subject: Re: [PATCH v2] rtc: interface: Add RTC offset to alarm after fix-up
Message-ID: <172030527564.498069.12939975883855273654.b4-ty@bootlin.com>
References: <20240619140451.2800578-1-csokas.bence@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240619140451.2800578-1-csokas.bence@prolan.hu>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 19 Jun 2024 16:04:52 +0200, Csókás, Bence wrote:
> `rtc_add_offset()` is called by `__rtc_read_time()`
> and `__rtc_read_alarm()` to add the RTC's offset to
> the raw read-outs from the device drivers. However,
> in the latter case, a fix-up algorithm is run if
> the RTC device does not report a full `struct rtc_time`
> alarm value. In that case, the offset was forgot to be
> added.
> 
> [...]

Applied, thanks!

[1/1] rtc: interface: Add RTC offset to alarm after fix-up
      https://git.kernel.org/abelloni/c/d506042ddcc8

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

