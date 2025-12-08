Return-Path: <linux-rtc+bounces-5511-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F51CAE488
	for <lists+linux-rtc@lfdr.de>; Mon, 08 Dec 2025 23:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8382C30601A4
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Dec 2025 22:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1595C2E4258;
	Mon,  8 Dec 2025 22:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZIFFayhW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233762E1C6B;
	Mon,  8 Dec 2025 22:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765231761; cv=none; b=W0ESmSknOh7GdyUIW3mYEEWWIjMsml7XDBpYxsuerOU1O03nI3HOPmMEtIuTPW0Ky+tu26Pho0PSSdzDTh2E/Xoo+VUGOgwix/MUpSAEL7TGUzIXGl1cAts3jhWJU09iuSJ/zEpMuOdDYM0HyTk4wJFPLakawJZ1aj3Y/ralxP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765231761; c=relaxed/simple;
	bh=MbE1bv1r91ojRBbAgd8sSdkFaVll/H4wSmg6gbMWeGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlZ8kVXs5uhptdPPFV6hkOZMj/Gekaam4SX3LQq4Zoye2ifYqj0Yb+XfhB+3EyeVCj4jfIJWjjQNSc+LJR6hy4eEHoQPOktqqs4cSEJinNnf+HAwq/vEn4ba5iLCM/RPzkfNrsTYC1yZu55MSHf5rAt6mlX6iLHgQQy9fh58P3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZIFFayhW; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B3C89C180D1;
	Mon,  8 Dec 2025 22:08:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78604606DD;
	Mon,  8 Dec 2025 22:09:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13D07103C8D5C;
	Mon,  8 Dec 2025 23:09:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765231755; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=txJRuHrrwV2ADW2a0LZ396P8T6DrwxOBcVmxIdFH5mY=;
	b=ZIFFayhWWluy/Qms43QysyKzVEzgYbV0fvLPjTvuqBXZkXZsh477ayBau29XgKXhEO/9jp
	nEVCYk0l9aNSPfiD9uDM7jbB3+NJ2uoMpn0IvxIpRa64dDpRe/CdYLNVVPA01tiZio5rjn
	Hqv5AqlwlWViU+/fM4A9kiylenR3TeEpf3HZUayLznN/o0vtEr8D0wSDnxwgfmBBlrLYzd
	6n5F7gVHJkqmvik2uMYPuY/rgnIESqxELcep1iZYvDMXwDUIssjWka7VQJLwbX4xMN2iIZ
	eBpGAyA2siQARTp01ckbQm41jtJfqCuYSopaHjdIvT3sbRk2BVzHp2duiPTBog==
Date: Mon, 8 Dec 2025 23:09:08 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
	Mark Kettenis <kettenis@openbsd.org>,
	Hector Martin <marcan@marcan.st>
Subject: Re: (subset) [PATCH v5 00/11] mfd: macsmc: add rtc, hwmon and hid
 subdevices
Message-ID: <176523152354.342815.17888940507252789645.b4-ty@bootlin.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 12 Nov 2025 21:16:46 +1000, James Calligeros wrote:
> This series adds support for the remaining SMC subdevices. These are the
> RTC, hwmon, and HID devices. They are being submitted together as the RTC
> and hwmon drivers both require changes to the SMC DT schema.
> 
> The RTC driver is responsible for getting and setting the system clock,
> and requires an NVMEM cell. This series replaces Sven's original RTC driver
> submission [1].
> 
> [...]

Applied, thanks!

[01/11] dt-bindings: rtc: Add Apple SMC RTC
        https://git.kernel.org/abelloni/c/07049187e830
[03/11] rtc: Add new rtc-macsmc driver for Apple Silicon Macs
        https://git.kernel.org/abelloni/c/49a51df427db

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

