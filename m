Return-Path: <linux-rtc+bounces-5221-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57663C253DC
	for <lists+linux-rtc@lfdr.de>; Fri, 31 Oct 2025 14:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2DB71A63FA2
	for <lists+linux-rtc@lfdr.de>; Fri, 31 Oct 2025 13:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FCAE34846E;
	Fri, 31 Oct 2025 13:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FpDouCZZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E483A1B142D
	for <linux-rtc@vger.kernel.org>; Fri, 31 Oct 2025 13:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761916835; cv=none; b=CYqxUcGZyodRfcNLTF/jB3nGfmXYEFcQj/VOfCt4wMW4fBMkx8SIjLGgPks/p5lLGgqIMxJobH7OMYgold1UIDliLpq8PexCthoJQ0fQ5DFoGxKnmqnd8WFwjr39sr1fqabjciH1A2sz9iHV5ZQwBIi3AU6QOAEW5yU2jdHdnnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761916835; c=relaxed/simple;
	bh=yDqDRvzv3OtD+szei2xgYdMKC3DFuSYolugAskX0cqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3WZySIjqjSkidaG+QZXypZgcLP9ABDzByCOY/pfUqzmm1EMrsoOhbMn3IWqVY2p3n0aFrj4xXvM3PP1bLrNtC2FGlYz9euNfjajnmbuJO4/rtru4nyI53WNffsXIYKOygrEnBozfQYLrs3uaJXIrQCzgGJg5DxY8EiA5gDLekQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FpDouCZZ; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A85E5C0E954
	for <linux-rtc@vger.kernel.org>; Fri, 31 Oct 2025 13:20:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A90960704;
	Fri, 31 Oct 2025 13:20:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2EDA11818021;
	Fri, 31 Oct 2025 14:20:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761916829; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=v88FKoOIQ1Lp1eDWBJS2CBsC53ZzxeBQiwrj/87GQDM=;
	b=FpDouCZZE+kLp1w9G3/2tiWdI4iX1Q6LZaYVCeGHa2Y3eEx0MqkYUfFfrKP6V4RCqoWnst
	YR4JLDV4nDDzOv5c9mYK07DUpD6YdU7JJQS8N5C75MSRLLlSRP6vWTzCJPPEmo9rHeQ44R
	Jz6BczJYsK3TtZgv8QtaaQFOFRsT36jAgqxEE9JfcNhMb7GSC7exa3CTJ+Xo6WqREsiwpd
	ZwMXMHm4vkAzIvMdk8QfV9dnw8pkBc6KTAWvGEZzDyRSLCf5xCZzoxCk5UZHh9oQ2+s6M+
	jLeQNZRof3hZliiZ8H+j/VmtOlGcf3XDtKPZyfR0dQOr+TnNb48IF5Ch83MeIA==
Date: Fri, 31 Oct 2025 14:20:27 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Esben Haabendal <esben@geanix.com>, Jon Hunter <jonathanh@nvidia.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "rtc: tps6586x: Fix initial
 enable_irq/disable_irq balance"
Message-ID: <176191106316.588156.9101100273340077755.b4-ty@bootlin.com>
References: <20251031103741.945460-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031103741.945460-1-jonathanh@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 31 Oct 2025 10:37:40 +0000, Jon Hunter wrote:
> Commit 1502fe0e97be ("rtc: tps6586x: Fix initial enable_irq/disable_irq
> balance") breaks the wake-up alarm for the tps6586x. After this commit
> was added RTC wake ups from suspend stopped working on the Tegra20
> Ventana platform.
> 
> The problem is that this change set the 'irq_en' variable to true prior
> to calling devm_request_threaded_irq() to indicate that the IRQ is
> enabled, however, it was over looked that the flag IRQ_NOAUTOEN is
> already set meaning that the IRQ is not enabled by default. This
> prevents the IRQ from being enabled as expected. Revert this change to
> fix this.
> 
> [...]

Applied, thanks!

[1/2] Revert "rtc: tps6586x: Fix initial enable_irq/disable_irq balance"
      https://git.kernel.org/abelloni/c/b1c9390f0a44
[2/2] Revert "rtc: cpcap: Fix initial enable_irq/disable_irq balance"
      https://git.kernel.org/abelloni/c/0d510778c2f4

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

