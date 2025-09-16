Return-Path: <linux-rtc+bounces-4918-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF54FB59B1B
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Sep 2025 16:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9331918823FB
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Sep 2025 14:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37508340D90;
	Tue, 16 Sep 2025 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="B7aOeUXj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3CC3376A6;
	Tue, 16 Sep 2025 14:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034687; cv=none; b=GFnmq/+9DpLSmw7LYj7y/GCqqhhleX9W8acQwWCjxO+PDNN3LC5OesBNNkbY6fx6EeTcQdWehMjhn8ionkldZD3B0ceJZ3fF5AQnW+Z2FCiiEWcc/F7SV/L1GfBjeZ4OkiO+0dwfwvOP61lVDJZ27uD4DutX0g99VQgD5Nn8zDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034687; c=relaxed/simple;
	bh=45aAFCCLP5+JpH8+fy7Pi266rTzdrVa3fEsLjKr4y4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsuhxNaoTbisSp34EshfCn5hz1uNMI/7UhOTheFs0AZYGmqwYL718Gz/WTEaZ8yeTb3kd0gVV9dgqcqc5BsC85qWUUb9DdcttxdABbq50BCYNwrAULfU71GShYEgUQnCJ99lff7YIFb0v31QlwznFZZ5FP9VMsHtqSIP7a0Rlkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=B7aOeUXj; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A0F9DC8F46E;
	Tue, 16 Sep 2025 14:57:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F1BA16061E;
	Tue, 16 Sep 2025 14:58:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 449F8102F179E;
	Tue, 16 Sep 2025 16:57:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758034682; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=bG7jqwDvwnMc7LKOXfefsfuPcEBkoTgIfTnNQ5xb3R0=;
	b=B7aOeUXjfCsW+Dlii7CJAjRoXF0N21Pde2jHkNplWhvSErBR/Il15KgX8NlYo4+wUlwu9D
	Pc4PlN7ZXRRZzxQQ+vho3mpz0TSvleSyoSnbSsTcYjWFbDo1ulhxIcOza9vBZaMzrUiZAG
	6r/+gV4y8GUOLMrltPg6hASqSECE133GI0FBxDJ+69bPLEElb0ZSt/mIVJpWwoD31Ggdl1
	gN2pOO8PjrtsP/n0XLe8q6X++2crVhZAeD7jdBo8CGOVHBwnWfxOJxm8gbbzbmYxv2yq5q
	wsuT7Om98eOUTGy/v6uWC5DH4GzLluuKDB4cwJI4daWKeIsTNt+rMNr3mTe7JQ==
Date: Tue, 16 Sep 2025 16:57:48 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Alex Elder <elder@riscstar.com>
Cc: mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v13 4/7] rtc: spacemit: support the SpacemiT P1
 RTC
Message-ID: <175803465665.231523.13284487487341532209.b4-ty@bootlin.com>
References: <20250825172057.163883-1-elder@riscstar.com>
 <20250825172057.163883-5-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825172057.163883-5-elder@riscstar.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 25 Aug 2025 12:20:53 -0500, Alex Elder wrote:
> Add support for the RTC found in the SpacemiT P1 PMIC.  Initially
> only setting and reading the time are supported.
> 
> The PMIC is implemented as a multi-function device.  This RTC is
> probed based on this driver being named in a MFD cell in the simple
> MFD I2C driver.
> 
> [...]

Applied, thanks!

[4/7] rtc: spacemit: support the SpacemiT P1 RTC
      https://git.kernel.org/abelloni/c/c96433f4806f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

