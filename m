Return-Path: <linux-rtc+bounces-2858-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE629A07EC2
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 18:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD82E3A2250
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 17:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D739218FC9F;
	Thu,  9 Jan 2025 17:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GA3oKBxz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A94194147
	for <linux-rtc@vger.kernel.org>; Thu,  9 Jan 2025 17:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736443683; cv=none; b=QkEBv18cdjE8Rgw3yDX2PXZldyww5qRs/QIU7Nc2e5s5eE4oVuGSwza/LdlEVuMaGTKuzkun7gfYEeA0y1KuN/+Vun4TDCWGoHu0X6QDAysymxS4kn/DQxiXgdZNSoWlyZy7Lp5Me2ttQncH2i1VZomzlqVgEIpX53y2V4RHgE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736443683; c=relaxed/simple;
	bh=WRLccj4m47eAWrzeGFvMtkhV0q/l/rlUk0rIvXyDxx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JnznZLFacakxv3przs8E0g3YLliNlTl1otQsdAO6NG37Z+01TO4Z3EsIiZ9cTnHqpPwlrFhW4kHpe8aPqH59cSkc2AmSJwHpygmRphvz0a15Fhfu+SX3DCcQ6IJXNYJA+R6d/I5c2Ul5Z7uDbAaP4BdDRiTvjxhb2KenowBv5aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GA3oKBxz; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51DC4C0007;
	Thu,  9 Jan 2025 17:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736443678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9LnVr4bxrvtoXoEOBMXGA2ni36HYL7NPNwzBYEkZTL8=;
	b=GA3oKBxzwyfIoCO1TYSsL+nmnU+grFvxGwgS92PmehDXAo1r9lDjO8QPJ1vlrNfVlhGzAb
	tCuDyS6bAuSHgFeq5LrG4w1Hm10hipPyT0/OCwLSNODaLuzlfh12uPNfU+mhAf5V+jzldf
	UOCGDgzquSxyI4uQF9GCA8VILc4zoKoxKy/jaiq4tZgM/gB2OqMI6bisNQdk2GIaYF2b/F
	VN/EsOzUlzcEHALtbpEQ1K95VPKziU/B6k7pvlb3Diqz1jYk7+J/YtFAY2vqWqwUMtW8hW
	00VFHHCeXeb1uAE77PpHBKpj/QcKR4qIO2V9mF213dz1aSBJLlNPk3NvoRFC0A==
Date: Thu, 9 Jan 2025 18:27:57 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: RTC_DRV_SPEAR should not default to y when
 compile-testing
Message-ID: <173644288927.1016566.1170628492518027690.b4-ty@bootlin.com>
References: <7b8eefe3b0150101ba01c3ea55e45aa3134059ba.1733243007.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b8eefe3b0150101ba01c3ea55e45aa3134059ba.1733243007.git.geert+renesas@glider.be>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 03 Dec 2024 17:25:05 +0100, Geert Uytterhoeven wrote:
> Merely enabling compile-testing should not enable additional
> functionality.
> 
> 

Applied, thanks!

[1/1] rtc: RTC_DRV_SPEAR should not default to y when compile-testing
      https://git.kernel.org/abelloni/c/7158c61afdcf

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

