Return-Path: <linux-rtc+bounces-5793-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB16D3BBAC
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 00:17:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D099530051AE
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 23:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5FE1EA7CB;
	Mon, 19 Jan 2026 23:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gQUEZp2e"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C09C50096E;
	Mon, 19 Jan 2026 23:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768864656; cv=none; b=r+3j/NnZ2fNtiI//owf8ZRizqbJdbpO0lCHcyeVVMUpTG+awA8+ppemoospPmqBWOu8Ht53Fm1C10Gu9NpuemAnnVbnTcOgIzgM62pfLSzCy2QlV7suWxelvVY2grxHXXvz1t7FbIUNo4wPZ+7vdA/4kYhXQanKMwBUFQNED/vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768864656; c=relaxed/simple;
	bh=KQ4oD73dXbJ1Vdx1DSbgnMo8d2MHfs+YbALnBUzrzHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edtMmDzqfuPiF2do6BNAL0tD+SBgS4etuFKmfES76eryk1LlA6T848j9+AIh8KjXp3ZW93+MShE1x8GE+L4AOYGDAFUweiKEsQ5o7zEal97mW9uGwMcGWYbwNLZ7dcLm9zjUx9ZUwuMAdKQgCMcAurxC2evTuIBr3kbGWwVJkQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gQUEZp2e; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 66F22C214DC;
	Mon, 19 Jan 2026 23:17:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A5D660731;
	Mon, 19 Jan 2026 23:17:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3739C10B68D31;
	Tue, 20 Jan 2026 00:17:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768864652; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=AVYLL8OY9mcBYK8CGfkqeySwaijnWakQSi1zyHbGGnU=;
	b=gQUEZp2ecBI8iQqFSUElYf/zW5fSYkTsMpKz4gcG9nKfw1UA84BBf2jP8FfFMOUp3gWopU
	ypEpcdgE9Y/9n94X17enXFDc0R2asm7JOh4vkj6vtmgSR56UuvPiA53wxrnP8sPPiDBpAl
	zSRcd4uIrpSV+eZ8IXMc0j7ZfnuZjFU9TOv1xpdOAcMMzqE4g1plUDkY5U01/sTxrTAz++
	lqEPPczzE5lROPX14EPp5OOV/FtFcbvJa+/BCp/W06DPDsB0Svg8mZOZzyhLmPr+w959OF
	3Lvm5D1tUbeQFB9cPYYo2ZqIqeCk0UR6ZR1WSt9VHpgT0BlmN0OoLd2qYNg6tQ==
Date: Tue, 20 Jan 2026 00:17:30 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, John Keeping <jkeeping@inmusicbrands.com>
Cc: stable@vger.kernel.org, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf8563: use correct of_node for output clock
Message-ID: <176886462036.2629875.17342699295156685066.b4-ty@bootlin.com>
References: <20260108184749.3413348-1-jkeeping@inmusicbrands.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108184749.3413348-1-jkeeping@inmusicbrands.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 08 Jan 2026 18:47:48 +0000, John Keeping wrote:
> When switching to regmap, the i2c_client pointer was removed from struct
> pcf8563 so this function switched to using the RTC device instead.  But
> the RTC device is a child of the original I2C device and does not have
> an associated of_node.
> 
> Reference the correct device's of_node to ensure that the output clock
> can be found when referenced by other devices and so that the override
> clock name is read correctly.
> 
> [...]

Applied, thanks!

[1/1] rtc: pcf8563: use correct of_node for output clock
      https://git.kernel.org/abelloni/c/a380a02ea3dd

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

