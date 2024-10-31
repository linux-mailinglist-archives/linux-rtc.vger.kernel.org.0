Return-Path: <linux-rtc+bounces-2405-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 812489B8122
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 18:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44772282B66
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 17:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554F31B654A;
	Thu, 31 Oct 2024 17:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PUunbCFr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754D21386C9;
	Thu, 31 Oct 2024 17:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730395514; cv=none; b=hjvFoEjorBq/TMks+rFhpdOG9XHyqf3F4mzcPUFVYhUWXWmJk5YRvismgVyRNlriEEYNXIhcmxFXmtmdT66APF2GqtyzyfFyyzVve6ctfTicstBer1f9TFWBreCsItYLaWDtBSzJWs8W0rJU/HvgXAvwYNo6huockKC4r51LhcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730395514; c=relaxed/simple;
	bh=2cLJvZxTbrISr1tA+K8X2KQ4111AiUraG7Zj/gKCsM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yb28M73xQxBsDilY+Os7WRiIZZrESTWq4phRJ1AyiJPmOOpBSzQcNK8gY2BRF9LrDcOh9rvqy5WMSSaYSbsV/4ReUkizJIX+9UK5Nmg4YviUueVyozX9VecuWQckuQ4aQUr/GUCeLS8dL/WmBfub9TZEbTxqP2b0hc8x8sIGmUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PUunbCFr; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay3-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::223])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id B893AC018E;
	Thu, 31 Oct 2024 17:25:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0433260007;
	Thu, 31 Oct 2024 17:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730395496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KiKI67UhXbYKoP9AKaDP+SpWLvcVFNqyksY5P+mdC2A=;
	b=PUunbCFrG/Z9WuONmUXFWmILS0BsqKio5QLZgvp+0cn5wg9UixGX2+FR3Jp8CpCNl7nIyA
	hYplzYL+1S/GVqzMbFZAZF33TLBNdcG/YkJG9xCp/mQQlpOTWHCg/dDTwqUrRzH99MEdwv
	+iKsd+7TC4iKQAOiNZPm4QyWRbnalcpxhiejxXOi8IHOMFB6+hQ5R0GveSp2pvj3rsaOzY
	vAa1Apqt8D6sZ4gPStvuiwpvfEPp2s1DsPr/Nemo0NoziseZlMpmBNGLzBqpSQcYDXQOdF
	xsm7yDOrDn+tvwpLPs136v32XIeNRjFRP2MaEr39DmZHTQ2akIGw1RxciKV+uQ==
Date: Thu, 31 Oct 2024 18:24:55 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: shunxi zhang <ot_shunxi.zhang@mediatek.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	lee@kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] rtc: mediatek: Add mt6685 RTC driver
Message-ID: <20241031172455faa7688a@mail.local>
References: <20241031135807.31605-1-ot_shunxi.zhang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031135807.31605-1-ot_shunxi.zhang@mediatek.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 31/10/2024 21:58:02+0800, shunxi zhang wrote:
> +/* we map HW YEA 0 (2000) to 1968 not 1970 because 2000 is the leap year */
> +#define RTC_MIN_YEAR            1968
> +#define RTC_BASE_YEAR           1900
> +#define RTC_NUM_YEARS           128
> +#define RTC_MIN_YEAR_OFFSET     (RTC_MIN_YEAR - RTC_BASE_YEAR)

I will not take another driver with this. mt6397 needs to be fixed
first.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

