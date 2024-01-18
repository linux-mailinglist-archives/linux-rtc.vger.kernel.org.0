Return-Path: <linux-rtc+bounces-555-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 015BC83107B
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jan 2024 01:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADCF8289004
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jan 2024 00:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CD319A;
	Thu, 18 Jan 2024 00:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CXJtT2Sq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC61D17D3
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jan 2024 00:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705537626; cv=none; b=kmvH6xDaAmwUG/Bq5amDPoexcah2IvFSW69Nu/mLwoOD7TbJiXxfM0XxbKwJY7dChONZkfPHUHi7r7d+emJIw3taH//ycH4dQhSZ222sKRLGT90Wt+9CRZZMgovi5I/DgRMQpygPeYRyfMb5UQkaIDNXwEuNRaIYGayS8/YdPqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705537626; c=relaxed/simple;
	bh=i8tp2IRo1+f8B3KuhmURbdF3zhGs6dTqBE+Ys6DpxXo=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-GND-Sasl; b=X3SWQ4yLMePHJ7NTjs9NpmTG3iPazDwE6b4YcE+4al0XIglkUUOPiPIuE3D4ryMsx8XjzBw+GgpgYLEm6WC6iGIp9FdwH6CRAzThydW+HVQuMDDnLln7gBoLgINGsgOLVYVDht4NIhCVXRV+F4eQQGXMUn7pkZJdo+yZDvZZmUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CXJtT2Sq; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 954761C0004;
	Thu, 18 Jan 2024 00:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705537623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GJYxJj1BMGAEhv39cjwySgv7x8weZk0WEURK6S45SHw=;
	b=CXJtT2Sq/mDOaSjs5FzF0bT9uELxEJe8kCwwmbC++CRezaT+dFqgA7UGDUhBome5jH5Mob
	hgks101lWxpubrk1Rjeesh7oYPF7/hpU5+icxWNqSIAlQeCm8Wpsx8sLnySG3EFt0Ckv/X
	cfN+7opdvLBsHaLeJRY27nhbLbGtd681y7iRFvrR92WUPgsUOuFyELGxZ1R90Fj2jAOMw7
	tK/Uf7kwLtaUE+PlCmCkMBqNReztmr6RX6zZ00r2hOOcRjZ8Fr+zIgnE76QaV9kXakrXBY
	jpht3wNSci0itZmQLOdU82K2/uE7aGpFgu8hfrUJrCMfd6fMYaLZPD4eygjE/w==
Date: Thu, 18 Jan 2024 01:27:02 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: antoniu.miclaus@analog.com, Nathan Chancellor <nathan@kernel.org>
Cc: linux@roeck-us.net, linux-rtc@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH] rtc: max31335: Fix comparison in max31335_volatile_reg()
Message-ID: <170553758511.493564.15561211254142326576.b4-ty@bootlin.com>
References: <20240117-rtc-max3133-fix-comparison-v1-1-91e98b29d564@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240117-rtc-max3133-fix-comparison-v1-1-91e98b29d564@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 17 Jan 2024 10:54:16 -0700, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y):
> 
>     drivers/rtc/rtc-max31335.c:211:36: error: use of logical '||' with constant operand [-Werror,-Wconstant-logical-operand]
>       211 |         if (reg == MAX31335_TEMP_DATA_MSB || MAX31335_TEMP_DATA_LSB)
>           |                                           ^  ~~~~~~~~~~~~~~~~~~~~~~
>     drivers/rtc/rtc-max31335.c:211:36: note: use '|' for a bitwise operation
>       211 |         if (reg == MAX31335_TEMP_DATA_MSB || MAX31335_TEMP_DATA_LSB)
>           |                                           ^~
>           |                                           |
>     1 error generated.
> 
> [...]

Applied, thanks!

[1/1] rtc: max31335: Fix comparison in max31335_volatile_reg()
      https://git.kernel.org/abelloni/c/dd7fe5d9fd6a

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

