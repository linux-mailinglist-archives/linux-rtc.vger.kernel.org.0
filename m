Return-Path: <linux-rtc+bounces-5707-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 23318D0500B
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 18:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D1A48300441A
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 17:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428302C11C9;
	Thu,  8 Jan 2026 17:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OcO32ZHR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4601C3BFC;
	Thu,  8 Jan 2026 17:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767893638; cv=none; b=P+PHQtuNlaTECtLYXBwLMCZ6Qlsuz2TAVQUAS5zj18BwdecmxTOIMeLUwgcAU6lhxB7C7kwrul/5magR1Qmav6EhDgXn2dt823jbt7nRkJi8CyCxVMDcXf/QrhQfWGNxFSRKirZSS2wl0zYPKOSTH63JTTDgtkuuZE3HJvuTjFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767893638; c=relaxed/simple;
	bh=YfdOM3X+dex2GwYPDQAVwZhy1TpxzRQTxxNf8pg3MnA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UFFbElTRk0ti3nF0EWohIiRj0YWserMiDto4Myig1Sx1oJQLvGuK5UfZvYOBbkIh6DH6dM82NdIpP3zyNlWYTxuq/JA5LwKfd1H3fh+w7FgCQLhG93p600YmMGLEI42t3QYTQEAxk/AVip5I9QN2Di+oKvNUdQmlzKUa55M4O3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OcO32ZHR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4428C116D0;
	Thu,  8 Jan 2026 17:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767893638;
	bh=YfdOM3X+dex2GwYPDQAVwZhy1TpxzRQTxxNf8pg3MnA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OcO32ZHR/2IhxRSLh73aJSqfw4ev5w92PgmyVkS9acY6s1BNqiCddFZlIMKHwLVm7
	 E5wvykFVKq4LNCipDJ5PzpOWxIFuFb9aH9TwYNK6Gehhdc7ofszL9H0HeGafNdcwuh
	 2YpjVUdWrXMjZ9RBm7bS2mme7ftRAH6e1Tj5+fN/D5vTv89OaW5hd1FIel6lEbSshK
	 BR/XETisXLw4KzHJaiDgufVQ74MgEUmYN/dfsSJ2kRrJE5hhy9r7fvCLrkK9W6VBge
	 VhLjMdVDgJEA2IdvJDRdZUB8ipVF7E4HGiS/8a+pWpEOg6oQEOAfVpLT6y6mCczPG9
	 xFk5Dw5fKnRvQ==
From: Lee Jones <lee@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 Hector Martin <marcan@marcan.st>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
Subject: Re: (subset) [PATCH v6 0/7] mfd: macsmc: add rtc, hwmon and hid
 subdevices
Message-Id: <176789363340.1116194.12135010190762961915.b4-ty@kernel.org>
Date: Thu, 08 Jan 2026 17:33:53 +0000
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

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

Applied, thanks!

[2/7] mfd: macsmc: Wire up Apple SMC RTC subdevice
      commit: a13cc4981449b9108921981a5e7c8824eaaa7604
[3/7] mfd: macsmc: Wire up Apple SMC hwmon subdevice
      commit: fb90c90aec3a9b7212a243f383f73a01bc653672
[5/7] mfd: macsmc: Wire up Apple SMC input subdevice
      commit: 3e9271dcb2dfdc4a98e9f6dc35c9be13276c3cfd

--
Lee Jones [李琼斯]


