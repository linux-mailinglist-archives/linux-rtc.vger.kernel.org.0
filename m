Return-Path: <linux-rtc+bounces-4724-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CFEB2C3DD
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 14:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 438611881866
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 12:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4AE53043AB;
	Tue, 19 Aug 2025 12:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPxFOX/I"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B19B202C3A;
	Tue, 19 Aug 2025 12:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755606912; cv=none; b=haIL59rYdtE/Wz301M7nX6ULV1CRstQcceiv8DvVCvzJ8OkKkTOOsRPh5YMrlVQ5j5rX8Pu3Itz2H40zZCiP8y2Yd4IVyuf8jtWJ9Mf9a/R6R9BnDrWXPPUgEOuvi6ITVTPAXGWOwtN+a/IY4jrSo4tzG+/XoJf5Zfsy1XgkNiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755606912; c=relaxed/simple;
	bh=/B14jPtqrr9C4Z5zVJbaqvRmr2grzAZ6lWE1PNr5tW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQBQsQqQodIgveApZkkcIsF4qnhgVAbIAudFxgEhQPXa/Z06uAtWWv3SlL2ssk2bkmO3d5GvWoyiT1fYzSgidonyN4b+E4zKcWmAKrW4k0/OXgZ8QXxWJ/wVYcGY48y9dsuSeaUbcnpeTI1VN18yXiIDHxeSFzW6KPZWZbIYLk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPxFOX/I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EA0C4CEF1;
	Tue, 19 Aug 2025 12:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755606912;
	bh=/B14jPtqrr9C4Z5zVJbaqvRmr2grzAZ6lWE1PNr5tW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPxFOX/IPeSTRYa+D1kZKCAX/YP/a3nREN8GQ9IaGWTLyIpbZ/0Lhyz0eODa8yyO0
	 wV0tW89wkj5Q/tiwnWG4QVi4oQvn4knYjlS/q8GbVniQNPPp3IkpETlqZIwtI0EEL1
	 ItmA5O62hhF/33/JIv1Aifyv2BKwXW6C00R8Lify4Wg245jWJBR4OBbK+r1uHx84bZ
	 bm4H7sbYTuuTaGcI7mF86/4XQuxoYVFzD8mWFa0TQ2mW36JOZuh67BICnlIYrYaTwV
	 jZMvbYOeU9ghElSeviDg9iDv5pZkMPaoZ5BVISJ4NhMK7dGmhldxIAU8xftjj5z7DV
	 f6Xli9h23PT8g==
Date: Tue, 19 Aug 2025 13:35:05 +0100
From: Lee Jones <lee@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 5/8] input: macsmc-hid: New driver to handle the Apple
 Mac SMC buttons/lid
Message-ID: <20250819123505.GC7508@google.com>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-5-57df6c3e5f19@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819-macsmc-subdevs-v1-5-57df6c3e5f19@gmail.com>

On Tue, 19 Aug 2025, James Calligeros wrote:

> From: Hector Martin <marcan@marcan.st>
> 
> This driver implements power button and lid switch support for Apple Mac
> devices using SMC controllers driven by the macsmc driver.
> 
> In addition to basic input support, this also responds to the final
> shutdown warning (when the power button is held down long enough) by
> doing an emergency kernel poweroff. This allows the NVMe controller to
> be cleanly shut down, which prevents data loss for in-cache data.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Sven Peter <sven@kernel.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  MAINTAINERS                     |   1 +
>  drivers/input/misc/Kconfig      |  11 ++
>  drivers/input/misc/Makefile     |   1 +
>  drivers/input/misc/macsmc-hid.c | 210 +++++++++++++++++++++++++

>  drivers/mfd/macsmc.c            |   1 +

Separate patch please.

>  5 files changed, 224 insertions(+)

-- 
Lee Jones [李琼斯]

