Return-Path: <linux-rtc+bounces-2619-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDCB9D8E9B
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Nov 2024 23:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC8ABB28A79
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Nov 2024 22:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58AFC1CCEF8;
	Mon, 25 Nov 2024 22:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LmWiQRZ2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0212A1C1AA9;
	Mon, 25 Nov 2024 22:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732574085; cv=none; b=VysAtgqd19LgKfF7cqR/K6H0TEA7LMOIvr+8I1ZHYPTvm53dI1ilfspYuCWliZ3v61AN5oaHqqjmPwuGsrCdnQ7+KERIQvyXR+TaLYyLIvmKPb4SunRsPGHs3w8p736ZnSoXj6yY3zRss2Jk7zi+aV3kjxcNPzhQZ8eVyzSIY4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732574085; c=relaxed/simple;
	bh=vqyncEBIYiRi0COSKlA1L1Hk9eHMvSxMECWWfu+xJzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2izdBlUbaL1Iw45zTWTTpKWH2N01dojIPn3QphKbjGLEA/M0BTe3HDhXdD7mr5LZh/xOGWdQ6x3Ap5ODUdGMjB8AWV1lViH2wr/DfOBGjCjenNbL50uiq5W05Wi9tzNCl387AH1vZTtgf3ggVeFYjLu+UvkP0kXrsYgoByuIkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LmWiQRZ2; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 138E9FF803;
	Mon, 25 Nov 2024 22:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732574080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uI1dNXH3aiw55RQEZ/xnxboM8MwVX8hRRtzJRBdnsJI=;
	b=LmWiQRZ2ib9XD0pGKJ+Q/EJozNffaxC7IfToC4x9+HYTlZsPQ7L/6SBtbT3wdcwkfjWrTO
	x7EqxxKvCG4oSuP0zUHGXdE8WrzOSfPKFhDfzXcpDtrmSVG8kqKxSgTOOCsVm6x6pfBU7Q
	0ca9KbzW864Dkaz3/jkotNwQOFCrgQNo090P6vhAwuexj7gS4QKcf3soxGAzv/dSwPvq0F
	TlOJh0kzIMHrtOu4+lq0GWkSw4viLBgRA5F64RI/KHkYvNGeWzQP7NuhPqvt0AQQdRZ3vB
	JIcyuvabWS3cWbmHZ468P1hcApizymzPmsoFWzlhWNf2UHe2eEfH11axfWYizw==
Date: Mon, 25 Nov 2024 23:34:39 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Artem Panfilov <panfilov.artyom@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	thomas.petazzoni@bootlin.com
Subject: Re: (subset) [PATCH 2/2] rtc: ab-eoz9: don't fail temperature reads
 on undervoltage notification
Message-ID: <173257407061.539183.6925243121054400738.b4-ty@bootlin.com>
References: <20241122101031.68916-1-maxime.chevallier@bootlin.com>
 <20241122101031.68916-3-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122101031.68916-3-maxime.chevallier@bootlin.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Fri, 22 Nov 2024 11:10:30 +0100, Maxime Chevallier wrote:
> The undervoltage flags reported by the RTC are useful to know if the
> time and date are reliable after a reboot. Although the threshold VLOW1
> indicates that the thermometer has been shutdown and time compensation
> is off, it doesn't mean that the temperature readout is currently
> impossible.
> 
> As the system is running, the RTC voltage is now fully established and
> we can read the temperature.
> 
> [...]

Applied, thanks!

[2/2] rtc: ab-eoz9: don't fail temperature reads on undervoltage notification
      https://git.kernel.org/abelloni/c/e0779a0dcf41

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

