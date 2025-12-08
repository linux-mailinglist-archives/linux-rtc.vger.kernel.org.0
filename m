Return-Path: <linux-rtc+bounces-5519-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AF506CAE4BE
	for <lists+linux-rtc@lfdr.de>; Mon, 08 Dec 2025 23:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C424300A8CD
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Dec 2025 22:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40AB2EB87F;
	Mon,  8 Dec 2025 22:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ggDn/rnL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6722E88B6;
	Mon,  8 Dec 2025 22:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765231858; cv=none; b=CrB0Ak71g9KSJDrmX4i863VYjWzk4AmgvWwAUEByPDu2TKTxmU9xtbvFwLKUNhZDzDwYMl9y1jzG/1nI9STodT/9WHanPYJZdVjoxO6h4byORpTuTHYogaYQ5RG+Tejo3igcldqzUBF5i65S6JW2BvAfPRItrZRWyhZdNDHhRtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765231858; c=relaxed/simple;
	bh=tYG0ev/805t8raUBIgXnCQT76WsHBFMY/evP8eExsPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8AMjq0MrMIefxVj6xDi4An2GvMFNJGWa3OFAb90s18nWnQ45UNEduZTnQFxBhWrRF3tsulcVosmxtaQ0eNPZeQ3d4MHuf1pLEF/7xWrp7JlIZ6Cqoi4lMWGNaZhpTCPnUWS2ILBGLCfqtQIr86KNU/66G/DChZz5S2cvxHx0Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ggDn/rnL; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 989521A202D;
	Mon,  8 Dec 2025 22:10:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FA66606DD;
	Mon,  8 Dec 2025 22:10:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD3F9103C8D5C;
	Mon,  8 Dec 2025 23:10:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765231855; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=rtM8dTg0tDTYUxwrLTcHk85q7E11JbwCfI6KupRikvw=;
	b=ggDn/rnLHqs9KoqiJ0sGGaGg2JNIPTcOLwBOUtVLQvAQ+wh0aDYQLowVjWApjUQEx3HG71
	wSCXWsaDo0wgAQS5NYTv3vXRpg256NifH5NkdzHR/AzfjDu6bPQP73mY3IvZFFIZxes632
	1dAExiFFxHCzkDqDTdM2RbjbHRVXLir0Z5Uuw1NsrUIKf8NhdTXxhxlG5q2bZF2SiuriIt
	NIXy8s0t9AsSFxs7GX4ogt047m9YkDbyFeOZ9yrGaejFWbBat1r5TbP3NC83snzrQzVOOQ
	O9SL//AY6e3mQEFWNO4rQjJA7mmBqPyw+Ny9xHKWzxzjxRjPVUG3V0AYk+WIDg==
Date: Mon, 8 Dec 2025 23:10:53 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: ABI: testing: Fix "upto" typo in rtc-cdev
Message-ID: <176523152355.342815.5871048283105258945.b4-ty@bootlin.com>
References: <20251112113759.2953758-1-weibu@redadmin.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112113759.2953758-1-weibu@redadmin.org>
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 12 Nov 2025 20:37:59 +0900, Akiyoshi Kurita wrote:
> The word "upto" is a common typo for "up to". Correct this.
> 
> 

Applied, thanks!

[1/1] Documentation: ABI: testing: Fix "upto" typo in rtc-cdev
      https://git.kernel.org/abelloni/c/22a6db422537

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

