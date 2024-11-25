Return-Path: <linux-rtc+bounces-2618-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F7E9D8EAC
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Nov 2024 23:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 689C2B27E94
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Nov 2024 22:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F319F1C4A24;
	Mon, 25 Nov 2024 22:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YIhr1ThX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275571CDA19;
	Mon, 25 Nov 2024 22:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732573998; cv=none; b=eqEiz8X4hMQd1PvDRhPsPsk+ftt00iLorq9bhzyH90Zg5EwaTM9O8m26LjM3p3NorB6Lf91zvoL+9M/8qchwGa+heYO1VRQAyUdTGouUhcOBtxVchpD+HZP9RSHDPL0KVkNdJJIR7OiEIda81bBoUz0F2pY1NEZrh0tcAFTFSCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732573998; c=relaxed/simple;
	bh=m/7e5p1SnK6wrS96hAF4vh8avuSxYDRHKoAJ5ayUjMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q1DgtNiflTX/aCcUroewsZFTVH/1DENgB75VXpsFWWfmWVfLqQcXYEDBpbjzYlFt9B4wUNZ+Y4I5qgxg0CgOZkCI76pPvA7DYEq7sAgJyDsibhRq0mzTv0CoP3lxvFeUOGBySTfVizBVTAnZeC1S8+lV3dG2egif6Ho+MwAJ/rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YIhr1ThX; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF3AAFF802;
	Mon, 25 Nov 2024 22:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732573994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BMoBR2+7L3Qck4KxkIjLGr+OAPkW1sVTRCE9MWDyFSI=;
	b=YIhr1ThXwKABGBSoJn03OiNrh762NK6qmNCPTcBhSzeCSDN56U3lyTo5JCoSbwRC6oIv7i
	/FnnHv4iq2dwuJT6WKq1Z/lwfOSXGbyZUl68au0mmE7uupa6wEwv9IYX2z1LPKyb0wrbho
	PRJhPOxCSP0n01Y43qZ2SRWs0E2dEf3+hqyVjcvXuqEVXz7or9LQZFHj14uE8pSK8pduLP
	InH4DpV+lbmS1iG5+WTf1Nlt+ztiqcu9+VOlwDAR9rB0nhfuod2WyR7cmPkA/UbdkD6eAR
	Vm7qo3TaR8y5ndVUGPvPcq2Kz/z6tIfCmx3I5wBCnPVZhGbC7oZuAu6ZuOt1pA==
Date: Mon, 25 Nov 2024 23:33:13 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [RFC PATCH 0/2] rtc: rzn1: simplify driver
Message-ID: <173257398312.538784.9597415364437879251.b4-ty@bootlin.com>
References: <20241122101448.4374-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122101448.4374-1-wsa+renesas@sang-engineering.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Fri, 22 Nov 2024 11:14:46 +0100, Wolfram Sang wrote:
> Here are two patches to simplify the driver for RZ/N1D. They seem to
> work well on my test board. I am still new to this subsystem, so I mark
> the patches as RFC because my tests might have missed something.
> Feedback from the maintainers would be much appreciated.
> 
> Thanks and happy hacking!
> 
> [...]

Applied, thanks!

[1/2] rtc: rzn1: drop superfluous wday calculation
      https://git.kernel.org/abelloni/c/692f983b2dc9
[2/2] rtc: rzn1: reduce register access
      https://git.kernel.org/abelloni/c/3ed345c948ef

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

