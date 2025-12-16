Return-Path: <linux-rtc+bounces-5575-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC63CC2DFD
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Dec 2025 13:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 324423042507
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Dec 2025 12:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160FD39B6B7;
	Tue, 16 Dec 2025 12:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aR3wVGMD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1C739B6AA;
	Tue, 16 Dec 2025 12:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765888653; cv=none; b=BIfdhy7U8k52VMNhQ91oTOgvYgN47nsS3FN/FI9EI0CRxXw901cnl/V9FtgAqQ2ZvBas6B2NfClINYYdIuW2VDAQLlBDgwrIb9wuKQ532aRqj282e1zKo3CB6lBZcpMISKkjN9DVL39pvYeOsaPJRVE0y8QfHoqolTpX1jZM6zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765888653; c=relaxed/simple;
	bh=w1qYW2xmXgVfXXGeFISdHirQ14dBGp+01Z84bmcAoxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L5tai7oNR1bLeue4Lfm16EVXy4VdHfmWAsvnjF8jnoOthLk1pYs8Gc4mRNUTS3ApU/EY47GnSpql3kGXiABC2wos9wjBcqBnyEY5kpI625ZJz/ywcSrWKq5QtxpZCQWF8tjgR+ODuSZrWRH819VNboxZQJq5c49LNViMqnbMBu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aR3wVGMD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD50CC4CEF1;
	Tue, 16 Dec 2025 12:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765888652;
	bh=w1qYW2xmXgVfXXGeFISdHirQ14dBGp+01Z84bmcAoxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aR3wVGMDzNnIcKBOOE+/MF8FuwhIksnbhTapQBBhtqZTjhlO6x+KDxt4u7wGbRWBR
	 uIQGNnaOL1iJ6rj+u9ahs7nPsz7TyD8OD5xoRWm556DnhXi6uqhHyv48g19GovYZyf
	 +m7r7OrR/U5DziC0c02H5N4W7n3tho9s9qFCJoJxtaxgD3zmjAEPlDVhjC2pUX+I3W
	 TPeor9o3wMi6y0HglB/kEQLUwwqu9oenAfdpokaG5IjzfCfuUPTait/g8wp7lr5UdT
	 LnPVTqwgHpBylqiT3FYlEG3wede2hrslhhEgkl3t7efJEDN+YTgBP1+GZXhSeukbtM
	 hKJnAm77V8CXQ==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: (subset) [PATCH v6 0/7] mfd: macsmc: add rtc, hwmon and hid subdevices
Date: Tue, 16 Dec 2025 13:37:12 +0100
Message-ID: <176588840252.31586.16326303552542183142.b4-ty@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 15 Dec 2025 19:37:44 +1000, James Calligeros wrote:
> This series adds support for the remaining SMC subdevices. These are the
> RTC, hwmon, and HID devices. They are being submitted together as the RTC
> and hwmon drivers both require changes to the SMC DT schema.
> 
> The RTC driver is responsible for getting and setting the system clock,
> and requires an NVMEM cell. This series replaces Sven's original RTC driver
> submission [1].
> 
> [...]

Applied to local tree (apple-soc/dt-6.20), thanks!

[6/7] arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC node
      https://github.com/AsahiLinux/linux/commit/faf317d4c705

Best regards,
-- 
Sven Peter <sven@kernel.org>


