Return-Path: <linux-rtc+bounces-1415-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0CD91B245
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 00:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B8E228177D
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Jun 2024 22:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346161A2577;
	Thu, 27 Jun 2024 22:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="G1pd9ZOQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C239C1A255F;
	Thu, 27 Jun 2024 22:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719527720; cv=none; b=TtNAEwDbyBgJYsPJ4Hv8L399cnsR0kfRrSoL3QSYv/nWoR6DDO4DYDyGN25QEeXVQ8S+CM2M6jXoX1z7AkrBFc7AZFhSN+bP9W/Z+i6dgz12raT5yihYjaC9NBXajAjLEzeis3tfSdAzqHRuwE5kwje8y+xoutuRi+7QhbM764k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719527720; c=relaxed/simple;
	bh=yPwMKQNj4dAoFLYak969z04Q6O+CMMLIJwetuTJgLKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nq5i7SBDRGLFNbX4C1a/wW7Yy1jjRRJd6bTqEUi75qju3oeIGcPIBkEgx6MoWAf+imcA236jhroJfGa8RqSmeJ5K4jhQ0vWJKRAzLvmMXF08Cbq2lVHRHAqHP+op3ImucFZ5i90Q/IVOUY1LOLbf4Y7rD8u++xbmyA9m1eyzwJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=G1pd9ZOQ; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 180FB60003;
	Thu, 27 Jun 2024 22:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719527716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IeT/dL1HxME6TiyoCjNQwli1fo+sUhVo7A3qxwHUl1w=;
	b=G1pd9ZOQcOBEmfFyiboBhqVgCtRSGUVKiKUGQHiVZMQqvGhUMZFsho3JvSPKvg8VcCi+FL
	gvlOcwZyl9mDZ4udngZCBxDcQ3ljrEVLGVSKTEgFXMn1BRBC+cx7otytfgWQKpjOPZH/OE
	OYOazr0KYWI1xmeE5aPHAxjx97XdMiMCE1WSgdv5dlvyBDbX/cuGBybJ5APMX4p7HOGNU/
	i9HeqZfxVAC0vDsZm/ocf5gQdBxL2Z6+eI5QDnYHnV5/5lx1RBcSwFSaNNHLkI5grGGODm
	PoO5l78j3cFRw5i2xc9DZB4l0WnQ9/wDfAo7sDGocAUXHB/s5Ox0lstXfgGbSA==
Date: Fri, 28 Jun 2024 00:35:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rtc: add missing MODULE_DESCRIPTION() macro
Message-ID: <171952768197.522224.11784543057394259843.b4-ty@bootlin.com>
References: <20240608-md-drivers-rtc-v1-1-5f44222adfae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240608-md-drivers-rtc-v1-1-5f44222adfae@quicinc.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Sat, 08 Jun 2024 22:52:03 -0700, Jeff Johnson wrote:
> On x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/lib_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-goldfish.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-omap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-rc5t583.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-tps65910.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-twl.o
> 
> [...]

Applied, thanks!

[1/1] rtc: add missing MODULE_DESCRIPTION() macro
      https://git.kernel.org/abelloni/c/86e9b5085d75

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

