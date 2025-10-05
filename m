Return-Path: <linux-rtc+bounces-5053-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BB5BBCC97
	for <lists+linux-rtc@lfdr.de>; Sun, 05 Oct 2025 23:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 382804E700B
	for <lists+linux-rtc@lfdr.de>; Sun,  5 Oct 2025 21:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49614191F98;
	Sun,  5 Oct 2025 21:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="o+FZOJxz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB53F34BA5C;
	Sun,  5 Oct 2025 21:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759699939; cv=none; b=fM3jPuJ+UyM4UWYy1aXGaoJFBkcQhis2thEDHVi3CFvkv1cEfSa5uqJKK1qJZcJUBAWPrZqfpm7usVGvkTcKIoS8+WU2u992R+7vk29UjTvQsI9nU6Fy8YAkJPkU+g02zZ3DnBmiBRXCoVzqwbeOtgeMLV9AyLkU3Qf6hIuZ8PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759699939; c=relaxed/simple;
	bh=+uKNmLpucmWwe2Vzf1mQp9pO1dNkOvcCEXDbQ57wyOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXs5P+zac+0xRCJCjvgEQENxg7YZmBJxzRRWg5ztQqSTFbeezdB2Xea+NFBGieSKjwcjz1GkEGoKCZbXUdv6yoxvH7jFmyowdIgyyMWtYXmAuksvF4hqMH151TPMBZvapgWCqVsrXewamCgBKLfdK01emq3nDVMxSpJUxLshocI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=o+FZOJxz; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2B30C1A1122;
	Sun,  5 Oct 2025 21:32:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9D5D6065F;
	Sun,  5 Oct 2025 21:32:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38AEA102F1CFA;
	Sun,  5 Oct 2025 23:32:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759699932; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=2vCDKrYg3LQu8I7bys91CIvuqsX6gSpX0Ji2S1M6E8w=;
	b=o+FZOJxzNgDaBN9YhZEwlkqkLAQ/YwnBsyWTS2Kyql0GImmYvwaL7bhiREvs96h1brlmKZ
	lDVrNGNvx7sQJMwW25LN6ZSYxzgEc6s3m5HT3L3L5Mk/ra9SsjXfKX8j4kGQ1DoFMHKZfP
	8l2Ae/zxhvPTRcPWf2MseO5zDJRMN617McOwQNTR1fZ7Aunxi2XWbA4ieVZecP9N3o5Od8
	op3Fqx1M94sSH1uinlis3a25feWgxZMEucfqlPq1czKGlVrB5O9JsLEgphAjKVkp75768j
	0tVUCiLq11qJIzJkiAWhNCh9AC4eCMuDVOPNGZmh/K8g7C4Zev/4v4TCGPg0+w==
Date: Sun, 5 Oct 2025 23:32:09 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH] rtc: pcf2127: fix watchdog interrupt mask on pcf2131
Message-ID: <175969992286.3798446.13780186680660235056.b4-ty@bootlin.com>
References: <20250902182235.6825-1-bruno.thomsen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902182235.6825-1-bruno.thomsen@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 02 Sep 2025 20:22:35 +0200, Bruno Thomsen wrote:
> When using interrupt pin (INT A) as watchdog output all other
> interrupt sources need to be disabled to avoid additional
> resets. Resulting INT_A_MASK1 value is 55 (0x37).
> 
> 

Applied, thanks!

[1/1] rtc: pcf2127: fix watchdog interrupt mask on pcf2131
      https://git.kernel.org/abelloni/c/87064da2db7b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

