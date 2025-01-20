Return-Path: <linux-rtc+bounces-2951-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF213A16AA7
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 11:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF89C16579E
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 10:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339351B413E;
	Mon, 20 Jan 2025 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CpvkaGTX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39C6188938;
	Mon, 20 Jan 2025 10:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737368483; cv=none; b=TgoSpxDDXPAfUDhCRDZkcUoFITihrn5DwP3AdYjPYG4FBNL6mp4SzFQHgci9eIMob76F+oPvwzfWuqe1lvRcQtA8o4pb2qXhV4mBZrPFwMi4rcDzxWDpK/b74lBbjvgvOKVy3S5FPKlVYXJRm3OmavPC0mgcnEbZOSqg/6aeJi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737368483; c=relaxed/simple;
	bh=Xqs8/c2crgNvrXPRWU9PaaEgrFF7yD7OP3+3a61m01A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEE2uE6kJIxp6KV7Rtoq+Z5CKYNtqWLmXIdoZvomLRhuq0UIWpg84ZsQ90q8jJYaRbY7jwLIwIEq8jzafezSu1z2fYd6q0uw10M7RDF44kBufCoCC83E1g5vCCMQ14auHxNd2K2GQoRTTJd9rAKIQyVgWNDAFgNmkQ21Q0V1kKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CpvkaGTX; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DC916000C;
	Mon, 20 Jan 2025 10:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737368479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zkzZNKW8eL7DBqP7Z2NDJ6Qfzrf1J+jLV5t9JUsOcrc=;
	b=CpvkaGTXv9QdI+B4g/m2HOTohSbLJ2NKlZPezKb46S9Rvvse2jHEFCOlfIVfSWNvPr37yy
	9jZCkNcmVGS+yETVPjub0NDcGqK9HAdOYJGFHRKmN1NllEsZaCis71mTRBQywG32rvefpq
	bGwYaZjHO3lTdeftSB2AXHDzj+bwBvXoDfwG1vF9XaZXxwfxzHl2YzQCMCuvQ5jPnhGbn1
	gh4SGIei5u7rua7NR6ArWuOOmg6voBPWFKtmzXBu+SCf7Bcn87SrEYQUxHGsVxOc7+cLfE
	kDbSZjmL5XiN8NBm/ho57/23I4dhYPTLXM4BW6Nh0ND549sArIse7As4aI49cQ==
Date: Mon, 20 Jan 2025 11:21:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/4] rtc/scmi: Support multiple RTCs
Message-ID: <20250120102117538ef59b@mail.local>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

On 20/01/2025 10:25:32+0800, Peng Fan (OSS) wrote:
> i.MX95 System Manager(SM) BBM protocol exports two RTCs for EVK board.
> one RTC is SoC internal RTC, the other is board RTC.
> 
> The current driver only use the 1st RTC. With this patchset, both RTCs
> could be used in Linux. To achieve this:
> 
> 1. Support more event sources for BBM protocol
> 2. Add bbm_info hook to let users could query the number of RTCs
> 3. Introduce devm_rtc_allocate_device_priv to support setting rtc device
>    private information
> 4. Update rtc-imx-sm-bbm.c to register both RTCs
> 

I'm sorry but no, you have to register two RTCs like any other system
would do.

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (4):
>       firmware: arm_scmi: imx: Support more event sources
>       firmware: arm_scmi: imx: Introduce bbm_info hook
>       rtc: Introduce devm_rtc_allocate_device_priv
>       rtc: imx-sm-bbm: Support multiple RTCs
> 
>  drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c | 33 ++++++++++-
>  drivers/rtc/class.c                                |  9 ++-
>  drivers/rtc/dev.c                                  |  8 ++-
>  drivers/rtc/interface.c                            | 16 ++---
>  drivers/rtc/proc.c                                 |  2 +-
>  drivers/rtc/rtc-imx-sm-bbm.c                       | 69 ++++++++++++++--------
>  include/linux/rtc.h                                |  2 +
>  include/linux/scmi_imx_protocol.h                  |  2 +
>  8 files changed, 100 insertions(+), 41 deletions(-)
> ---
> base-commit: e7bb221a638962d487231ac45a6699fb9bb8f9fa
> change-id: 20250116-rtc-3834e01786a8
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

