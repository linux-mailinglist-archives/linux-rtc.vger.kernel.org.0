Return-Path: <linux-rtc+bounces-2664-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 360FB9E352C
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Dec 2024 09:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7416BB2789F
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Dec 2024 08:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2622818C03B;
	Wed,  4 Dec 2024 08:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="SSt9Ck6r"
X-Original-To: linux-rtc@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0463F1714B3;
	Wed,  4 Dec 2024 08:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733299774; cv=none; b=NFXLQq0hjymgrcVXrN8FVoDTZCY3EO6yg0I3hjF5UgVWXQ89coptTC0Whb69Bn+/87EyR06/ktCe44+8nxp6aRk+9Mk/JvY9/k9r84tAmcXkKv5ks74NJ160XqluoEMTF7jpFXGf5cpNe6+LI/KB48lt0YhmdOkd962ZMB61jqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733299774; c=relaxed/simple;
	bh=+FW2eXT1WDvAA3ouamIbr2wH+2ChUGr+wp8mCetrjfE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GM6bDfw/CQgyy/yPRG8nmxUwI8+ynVimNDHPezeiLevg/6/6BPRfjqcae7wExpF/WQjHQ/4PHYpWo8jjOGImkG6roMvarJLpq3ah+sxwze5Fg1e8mqjWqqFb8GH2Dfe+nwuyG46ztcQPjtq+tSfUqJJ0hT/QmKkukSO9Pmi1myU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=SSt9Ck6r; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=YadcVfReBs2XK7Wp6qew5wyT/6xKrDqXPFq+/V2+s1M=; b=SSt9Ck6rXSe3GL44TdtuQwfFD5
	QJsGr8JSdRzsTF11jrSZ/UX61yTgUff3ext3xzkyh+LZMZ5MBhTlNpWdfkWT/NOC24SMpI4ywpuwO
	4rSS5zFJqF1Os+KQcc8JiDmVk02TBUo6YpXDWIGv4Gu+3glOfM2x4tN0wxOrSaleU/Als43WjQwvP
	NLXQV6Mb/fu1k4WNKUIR7LxiLWx7fHyagZ5Qf2bWnSldxv+35sUbHr6U9sgyvgVF8K1elPJGQkNZF
	6uBpGGttksW6JfgwZhuHhxC7yGtUl+FRsbiS+suuWv4mkrgRMLqOeYNR+jzVfPwo6aAYEF3UuwZTw
	IUEQIyag==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tIkRk-00067Y-46; Wed, 04 Dec 2024 09:09:20 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tIkRj-0002A9-2K;
	Wed, 04 Dec 2024 09:09:19 +0100
From: Esben Haabendal <esben@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  stable@vger.kernel.org,  Patrice
 Chotard <patrice.chotard@foss.st.com>
Subject: Re: [PATCH 0/6] rtc: Fix problems with missing UIE irqs
In-Reply-To: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com> (Esben
	Haabendal's message of "Tue, 03 Dec 2024 11:45:30 +0100")
References: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
Date: Wed, 04 Dec 2024 09:09:19 +0100
Message-ID: <87cyi798eo.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27476/Tue Dec  3 10:52:11 2024)

Esben Haabendal <esben@geanix.com> writes:

> This fixes a couple of different problems, that can cause RTC (alarm)
> irqs to be missing when generating UIE interrupts.
>
> The first commit fixes a long-standing problem, which has been
> documented in a comment since 2010. This fixes a race that could cause
> UIE irqs to stop being generated, which was easily reproduced by
> timing the use of RTC_UIE_ON ioctl with the seconds tick in the RTC.
>
> The last commit ensures that RTC (alarm) irqs are enabled whenever
> RTC_UIE_ON ioctl is used.
>
> The driver specific commits avoids kernel warnings about unbalanced
> enable_irq/disable_irq, which gets triggered on first RTC_UIE_ON with
> the last commit. Before this series, the same warning should be seen
> on initial RTC_AIE_ON with those drivers.

I don't have access to hardware using cpcap, st-lpc or tps6586x rtc
drivers, so I have not been able to test those 3 patches.

/Esben

> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
> Esben Haabendal (6):
>       rtc: interface: Fix long-standing race when setting alarm
>       rtc: isl12022: Fix initial enable_irq/disable_irq balance
>       rtc: cpcap: Fix initial enable_irq/disable_irq balance
>       rtc: st-lpc: Fix initial enable_irq/disable_irq balance
>       rtc: tps6586x: Fix initial enable_irq/disable_irq balance
>       rtc: interface: Ensure alarm irq is enabled when UIE is enabled
>
>  drivers/rtc/interface.c    | 27 +++++++++++++++++++++++++++
>  drivers/rtc/rtc-cpcap.c    |  1 +
>  drivers/rtc/rtc-isl12022.c |  1 +
>  drivers/rtc/rtc-st-lpc.c   |  1 +
>  drivers/rtc/rtc-tps6586x.c |  1 +
>  5 files changed, 31 insertions(+)
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20241203-rtc-uie-irq-fixes-f2838782d0f8
>
> Best regards,

