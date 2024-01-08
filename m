Return-Path: <linux-rtc+bounces-478-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F8D8266E2
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Jan 2024 01:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61A251C215E7
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Jan 2024 00:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8AB0621;
	Mon,  8 Jan 2024 00:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="P4lNctKP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB367F
	for <linux-rtc@vger.kernel.org>; Mon,  8 Jan 2024 00:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F237A240002;
	Mon,  8 Jan 2024 00:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704673863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e1K3dRXrRHxPlgP3j8btvXxSmOkDEAtHo8Zyws7g0yA=;
	b=P4lNctKP0M5YI8J4gtv7wsaV2pbY7+e7W6f5g6LOp1FtChwi81zKk2WaeCnJduJC3Bqp2K
	2rKzIMHViB4xTGJz44/rOMFQTlxn4H8CSUPyTsnunJJv6ia5oVWuUg2RHbH56Qh13e3Nq7
	YnpnXruPcvxog0Se3RJlRbx4COaG++Ze5a3P2rYY/4IzCwwSko+x9IzCUBb/3h5F6vg96E
	+hrJIRyTTkMftITdY3pcB6H8zx69nANwgN1XgCaWBZThgnK/uufwDxN3mIQPZOeZgTFIkM
	2t+z6Y2im2SwfWplqRZwuiamN3PxiEZ5xEjzXmY8Ge3ZyGaBoLfMRUz0317a9w==
Date: Mon, 8 Jan 2024 01:31:02 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>
Cc: a.zummo@towertech.it, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] rtc: ds3232: avoid unused-const-variable warning
Message-ID: <170467384895.599798.12555021525367967671.b4-ty@bootlin.com>
References: <20231118092200.829808-1-akinobu.mita@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231118092200.829808-1-akinobu.mita@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com


On Sat, 18 Nov 2023 18:22:00 +0900, Akinobu Mita wrote:
> Fix the following warning when CONFIG_I2C is not set but CONFIG_SPI_MASTER
> is set.
> 
> warning: 'ds3232_pm_ops' defined but not used [-Wunused-const-variable=]
> 
> 'ds3232_pm_ops' is only used by rtc-ds3232 i2c driver, so move the device
> PM callbacks inside #if IS_ENABLED(CONFIG_I2C).
> 
> [...]

Applied, thanks!

[1/1] rtc: ds3232: avoid unused-const-variable warning
      commit: 3628d999e31e2e31b51f78b0f68e91275854c179

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

