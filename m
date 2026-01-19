Return-Path: <linux-rtc+bounces-5795-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAAAD3BBAF
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 00:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F50F300A85D
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 23:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0576223DC6;
	Mon, 19 Jan 2026 23:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vY+GwzjX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954CD2690D5;
	Mon, 19 Jan 2026 23:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768864671; cv=none; b=KNDFI/ThC6DHAyZQ0p8XPhjx1PgIvKh01GDZha3gqF0y4+UuaB/1TMH6BTSVsr4IAWKkA0kWFSPB6apEqCEcbeAEJFvU5Pl7MA3btdzPwHqqrxW9L2VBOYnI1Lj1pPRaN20fC5OTBTTTnUCqt90WwQ6NSJNt4V1EU/r1kjod3mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768864671; c=relaxed/simple;
	bh=/RPUQc7E6UC4KMuhXrGYJypcrbzLPn3DOwpVkoL73Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJRb8aOwTTVX7z4BHsa6FFqDkx8p8CwBiazmkzOAs4Fueoyv9lilgopSC+cvxaAFXLqJZXVueKkvJhhzkqW18VdbX9KDC1uYsyXksdiamoOd/RhbCICpWlaeqYSASAU1Zsyj64dOVGkR9Zy2P10MFjPx3HdQupWHxv0SQbKQxWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vY+GwzjX; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3E6241A29A7;
	Mon, 19 Jan 2026 23:17:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 14EE360731;
	Mon, 19 Jan 2026 23:17:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 719C910B68D38;
	Tue, 20 Jan 2026 00:17:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768864668; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=vqGuNcITXl5bFQYSvm+VCOJY4mQxAX+eR8Lj+wHFrXg=;
	b=vY+GwzjXn4fjycPzWU7IHxx+cI0VLlG/DdriVe+Z01EQ2ABrLUvphTgDy2bSwmNgb+Uz+8
	/OKhbJoxMXgMVz8Ik6ks1ZsQ/RQpMwW7FjDUaG5zyeyGSK4Yz003TCfJ06N+DQUOjaCKUM
	0qY35/Uv8V3Mh780AWZD8PJTquSrpL4vNIdnDxWhiQvZ3PN4scKimKvBo7hqJn7DFtypHG
	HjSoJbIOQYdaay8mzoBHkrqR1EGNMdtoIlwRGwg3/QOvUrP7AqtDDJWa0J2bapl+YW8fRF
	Oci7u9RyZLuzy5pwt8VQnkoBEJXizPLqXsBhjhkYu5PP6sI/UC749GOAr3BP6g==
Date: Tue, 20 Jan 2026 00:17:46 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: max31335: use correct CONFIG symbol in
 IS_REACHABLE()
Message-ID: <176886462035.2629875.8964112913912377835.b4-ty@bootlin.com>
References: <20260108045432.2705691-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108045432.2705691-1-rdunlap@infradead.org>
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 07 Jan 2026 20:54:32 -0800, Randy Dunlap wrote:
> IS_REACHABLE() is meant to be used with full symbol names from a kernel
> .config file, not the shortened symbols used in Kconfig files, so
> change HWMON to CONFIG_HWMON in 3 places.
> 
> 

Applied, thanks!

[1/1] rtc: max31335: use correct CONFIG symbol in IS_REACHABLE()
      https://git.kernel.org/abelloni/c/d5aca9a17f6d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

