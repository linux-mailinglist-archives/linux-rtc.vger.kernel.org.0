Return-Path: <linux-rtc+bounces-5287-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FB7C3DB3E
	for <lists+linux-rtc@lfdr.de>; Thu, 06 Nov 2025 23:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EF87188B74F
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Nov 2025 22:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A593376AC;
	Thu,  6 Nov 2025 22:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Dj7Gcqpm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAF0305064;
	Thu,  6 Nov 2025 22:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762469772; cv=none; b=FoXMPYak7Mutc2CfpUJ+m598GgrNgcTDRUqyK1RmWPZ6o8vO/Sffjt6dpLN4kKVM6d2AmC7IzaNoY8pHw89Pn8rizPZBC5cdLhym1+KLE2hqVeFMAmSQDXqTWwIvgayMXsp6J1RErqrKxc/zUYd8H6C8CghXQUg2WXbQ4IT6eQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762469772; c=relaxed/simple;
	bh=yDW+6iF8Yzkae8WSUMTM3Nr0MGnEr6imOIRCSWbmD0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpAXrZvh+VGip6CnsyvY49spT/PMFD2UanQtInM5dESfJEGqWwiOF25T8H5zpFEf+bRewan0sEaW+00VEVpjajUGZWD/YhCo+5w9bbsGd1L4O/8FKe0LxbupqBevDgLicMOrqkwPOz+RT2Y3+7aXYl0cp8csckHyf5fUxiZR24Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Dj7Gcqpm; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3B105C0FA94;
	Thu,  6 Nov 2025 22:55:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C61E606EE;
	Thu,  6 Nov 2025 22:56:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98F6211850912;
	Thu,  6 Nov 2025 23:56:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762469767; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=9okIbnnWMA5fCtNaXf3R/J2fcIUUcAk0NufM6vDgTSQ=;
	b=Dj7GcqpmhnNmvdn6K1QHbb7+pFpotHX4MIc8+PJ+oyONcZ1zhYtigX8k6Cpx4UiQkixO4g
	vIuFHWvbvLkdqs0ZfLnjO+HImF918P2X6Y9U/2n1TN+s5acjpRHKBc0mu0uNOn7mu809RS
	ZpuHDVVmKRpklIQmlyVBS1+unkRwimukD97rBuuqv0Ce2S7Eo2nSZFa60qAl5/3U5Zl9XX
	XcDufbpCmyUfZeInheYvcVwtd+rf3Zz0JzD68K/x+A73n4zLsX7EPIMjxjP+/L/fcagLaF
	axYqyma8P8gkpCI3zCFmBtJOzqOtSCGThl1CneRDwrE/OnXqRfqzKscBLDtCNw==
Date: Thu, 6 Nov 2025 23:56:04 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Shubhi Garg <shgarg@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: (subset) [PATCH v7 0/4] Add NVIDIA VRS RTC support
Message-ID: <176246954836.40627.4534725186662447569.b4-ty@bootlin.com>
References: <20251007135738.487694-1-shgarg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007135738.487694-1-shgarg@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 07 Oct 2025 13:57:34 +0000, Shubhi Garg wrote:
> This patch series adds support for NVIDIA's Voltage Regulator Specification
> (VRS) RTC device. It provides following features:
> - read/set system time
> - 32kHz clock support with backup battery input to retain system time
>   across boot
> - alarm functionality to wake system from suspend and shutdown state
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: rtc: Document NVIDIA VRS RTC
      https://git.kernel.org/abelloni/c/4c03653f19ae
[3/4] rtc: nvvrs: add NVIDIA VRS RTC device driver
      https://git.kernel.org/abelloni/c/9d6d6b06933c

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

