Return-Path: <linux-rtc+bounces-2492-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7BD9C3C68
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 11:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EA9FB21962
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 10:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61CB17C9BB;
	Mon, 11 Nov 2024 10:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Xve/oJ8E"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD96C176FB6;
	Mon, 11 Nov 2024 10:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731322162; cv=none; b=cpjRlBW1jXXu4xCFqVEWoPJFUflcEWErUQ3s2oTHYHU0ALhWc15KLgupY4RwPPcbSYAk75D03h4kdGNk34rk5gMex7IFh5399iWo40w90ov2H81msWHXhCEYBUggEdY3uPT0MrAwACi664VFg3KivTAOJA7TVj97XXOLcZvQTdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731322162; c=relaxed/simple;
	bh=2hh2/5PaFvajXn39fca9bB/7SzVPhjn3OhCw2uh7Ps0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGUckXKzyPX4pfLsH7XebctcxIOHG8EtdlizAjrQmlDV6kyTEdQ+mXbLFxUeS2BEE6SerWxKLTV8ayQNXMRsCOoLxDSsp3YMrTEXutQuCGmLaYMzHx4NWv1K3jYKA5lvbMeF6N4GEa6oMWnWUBCLZtMq1gKMO4fz9I+cexgi8ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Xve/oJ8E; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A90201BF203;
	Mon, 11 Nov 2024 10:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731322158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BJhaJ0Ok0QpEVSAFjq5ejE7TD5JVpsHeffs3rcxiAzw=;
	b=Xve/oJ8E5YxF0C9rbLVR/1F0QSBXO7zT7P+nwZd/QS18Ho91EVxP9DuY7vJSx55gk6aaZB
	6P/SIirku/dp9mUpigYDJip8mFQOlh9ZIKlWh2hkMGF/8042JbagFg81z5NWnx0WJ/FFc3
	0LG+zoCMoFf2VVTP9n/p4orpzHd0V+q1SrCNSq4I1f4tcNjwuiNzMYLp+ymM0GmRL21W/J
	kS+luSmG0h3DLWwqWaDJsIV7/w9UqVPMx8A5M3X8gM+IlfGLWRMKTm38QO9g7ToPyg8Rj4
	VFWXcoZWxjCSv/p/GI1rvTueNyNm/liD1FKLj9BkNC3ew3vCy12XAH8epGFgyQ==
Date: Mon, 11 Nov 2024 11:49:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: Re: [PATCH V3] rtc: bbnsm: add remove hook
Message-ID: <173132212746.3171399.14416390089495408560.b4-ty@bootlin.com>
References: <20241111071130.1099978-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111071130.1099978-1-peng.fan@oss.nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 11 Nov 2024 15:11:30 +0800, Peng Fan (OSS) wrote:
> Without remove hook to clear wake irq, there will be kernel dump when
> doing module test.
> "bbnsm_rtc 44440000.bbnsm:rtc: wake irq already initialized"
> 
> Add remove hook to clear wake irq and set wakeup to false.
> 
> 
> [...]

Applied, thanks!

[1/1] rtc: bbnsm: add remove hook
      https://git.kernel.org/abelloni/c/60f0108bccc8

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

