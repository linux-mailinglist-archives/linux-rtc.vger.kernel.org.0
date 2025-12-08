Return-Path: <linux-rtc+bounces-5512-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1CCCAE474
	for <lists+linux-rtc@lfdr.de>; Mon, 08 Dec 2025 23:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3167C301AD1B
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Dec 2025 22:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2847B2E2F05;
	Mon,  8 Dec 2025 22:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jOPKh91L"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60F02E3360;
	Mon,  8 Dec 2025 22:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765231772; cv=none; b=M8rxKg0RRwqM8Aaz+bl9RCBKN22wKc9MZTSZ1mVUMyr+ccNwIA28wtI+w7GRfdMp/aejMzWw7i/Q/Mf3QpRH0e7TO9XRTglQRIfsXLQEgbDbGqLNMtNlI2G0Tawsr9H8SxrhqaNsY9Ej/lRqjTDpWy/KNQucb7AOYgeTIz+MT4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765231772; c=relaxed/simple;
	bh=FZIY2015+PcTN71SuPyWQDTTOlYHa/IVXue3XUtC02A=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YsDngytrBu1fL+8KJC+b7M8Q1NcU9UeB38TygP7L5Wech+o5MgN4HBwiz2YFwFFqG72nfKWBJK7EfUVFOEqTijYwptg7O5j8y4lcB3Cnb5COuGRzjD2WlVNtSAIyXTEqMSSUMI+GLWg0LTdUA925jS/jnVg1wMUSrcwOGECE+ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jOPKh91L; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3EBCE4E41AF3;
	Mon,  8 Dec 2025 22:09:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 13EE7606DD;
	Mon,  8 Dec 2025 22:09:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D420103C8D5C;
	Mon,  8 Dec 2025 23:09:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765231767;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=MH5d/r9/2Li+GcYfPxj7uUI3fygR2Z4Oyvep40CJHag=;
	b=jOPKh91LSXc0L9GHU3V3sIYkj2pRyCfegqKuh962TCCstKCdvW/XinhpeZvRp90rzRZjM+
	35Zd5yE58AW+jt5f4gHpvjj0KpdPcgN79ZfKv//XPIy+ROI/GwBCMHR8UUyrQ1XUBu/9eX
	irHw7+ReBISJWoIw+RuUQ5IJKbl/FVHVIk/Rj5w9G2DUDWDIxzsEMQ9wFQx5J5UYgrRBSp
	aToD4bjOGiQsasGE5gbJ8AZa1VxW79WmPXUjppTEFe0sHPlUfHgv6zy4OrDKobIoYHhcms
	nVq5UbhJhDlSalgcE+FCXVwehvhjNAZy53mxF0IrtQukbVFbXpqhriNIYuuREg==
Date: Mon, 8 Dec 2025 23:09:25 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com,
	andriy.shevchenko@linux.intel.com, linux-rtc@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kartik Rajput <kkartik@nvidia.com>
Subject: Re: [PATCH v4 1/3] rtc: tegra: Use devm_clk_get_enabled() in probe
Message-ID: <176523152339.342815.6379043998525935778.b4-ty@bootlin.com>
References: <20251024064952.775883-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024064952.775883-1-kkartik@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 24 Oct 2025 12:19:50 +0530, Kartik Rajput wrote:
> Simplify clock management by replacing devm_clk_get() and manual clock
> enable/disable with devm_clk_get_enabled(). This also simplifies the
> error handling logic. Also remove tegra_rtc_remove() as the clock will
> automatically be disabled when the device is unbound from the bus.
> 
> 

Applied, thanks!

[1/3] rtc: tegra: Use devm_clk_get_enabled() in probe
      https://git.kernel.org/abelloni/c/b665c1b620e7
[2/3] rtc: tegra: Add ACPI support
      https://git.kernel.org/abelloni/c/0a293451030b
[3/3] rtc: tegra: Replace deprecated SIMPLE_DEV_PM_OPS
      https://git.kernel.org/abelloni/c/bf5ef3ce42da

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

