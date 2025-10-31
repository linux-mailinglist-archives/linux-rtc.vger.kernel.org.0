Return-Path: <linux-rtc+bounces-5224-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D2326C27288
	for <lists+linux-rtc@lfdr.de>; Sat, 01 Nov 2025 00:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E5F664E92CA
	for <lists+linux-rtc@lfdr.de>; Fri, 31 Oct 2025 23:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF32328614;
	Fri, 31 Oct 2025 23:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pR43qD0B"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4477B34D3A0
	for <linux-rtc@vger.kernel.org>; Fri, 31 Oct 2025 23:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761951751; cv=none; b=DDK0S0sNbSiKI9iXY4NL9J+VTIYLahTkSSzWZFNEf0gEs65pOP/WuqtK0+lVB5L/i4ov/VhkF/kwjvD77/Rtl1gnLUjJLl2FypF2RjERJLv9Dh/uVOHVBt+MSyaPdSgVy2zeJpfEzBc9Jfrn1+ho/HlrqBdVJYmfsZglR5Yekc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761951751; c=relaxed/simple;
	bh=57VhmDuRHUjc3IkHGp90TyMTM6KeK3PpQ5w86E7h4TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C63CXNk0lEyu5c5TbpscbkhHdrn8Iz8yCwe8OWoljo2DhQqo0qhk4P6GsVlncK2HGW1HeOMoGwib4NcmtIuIbkdPsBGicQPDg0czKmRJODNGqjCCCN8KfbX23jEAx1ikLkPpH0GC708M0RX9AJfVFoySFFVezo1lj5zY+A68IcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pR43qD0B; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AFB2AC0E960
	for <linux-rtc@vger.kernel.org>; Fri, 31 Oct 2025 23:02:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3855D60704;
	Fri, 31 Oct 2025 23:02:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 764B91181ABA6;
	Sat,  1 Nov 2025 00:02:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761951743; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=c/QaNAx1tRBSa9Ke44ALpXrcuaXoJLXMTXTJpcGjHng=;
	b=pR43qD0BQgfP2bk4bYk+XmgscS7dA2yTNheJrMQw8mK57QQYyJYxjbTX9JrpdKi++ikKiu
	rixYJlcEDH/0/GQvMh3/w01XOrLwwLeNL0fIkp59kQZljtLsKW7zbSEhf1ixzfuIlgRJ5p
	UC/AjLyR3WvshhamV4AUqGdkgfVhlMRSH0Qy6aIJemH7BlF+O6WMYJpIO2giF60DYV34nv
	6Yyzog30SnzvftR1YaBNEmiGoLbPaOdgxAVFspvSlEKwpUr/NZtDm7NLLIGw3El2YDjPa8
	0TGdm8x3NbuiYUr/n1bG0YPGdW2h6Kuz4o9v6PAQfXGaFqCn5zsIKfI0jzGTIg==
Date: Sat, 1 Nov 2025 00:02:19 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: yiting.deng@amlogic.com, xianwei.zhao@amlogic.com,
	Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rtc: amlogic-a4: fix double free caused by devm
Message-ID: <176195170903.843198.16395014691314193568.b4-ty@bootlin.com>
References: <20251020150956.491-1-vulab@iscas.ac.cn>
 <20251021103559.1903-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021103559.1903-1-vulab@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 21 Oct 2025 18:35:59 +0800, Haotian Zhang wrote:
> The clock obtained via devm_clk_get_enabled() is automatically managed
> by devres and will be disabled and freed on driver detach. Manually
> calling clk_disable_unprepare() in error path and remove function
> causes double free.
> 
> Remove the redundant clk_disable_unprepare() calls from the probe
> error path and aml_rtc_remove(), allowing the devm framework to
> automatically manage the clock lifecycle.
> 
> [...]

Applied, thanks!

[1/1] rtc: amlogic-a4: fix double free caused by devm
      https://git.kernel.org/abelloni/c/384150d7a5b6

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

