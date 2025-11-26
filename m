Return-Path: <linux-rtc+bounces-5465-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC4AC8A248
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Nov 2025 15:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C045F3AE987
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Nov 2025 14:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC8D23D288;
	Wed, 26 Nov 2025 14:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AuheOCRQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5133B226D18;
	Wed, 26 Nov 2025 14:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764165856; cv=none; b=dJ4xKsw6Af7N8u7gOxvpP05AYiN0ReBj9JSPsi0q6DN/pd1ow345DBzYqe5mkZMn2lHUd9/WILrPhH/yKfpaMLNmgnN24wA4EjG1iDaS67v5iBg5wy7Jaw25AlqFNLQx5DLrsP82o5cM2qtJWFi3evJvP2MvIJKtha9AClJp7mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764165856; c=relaxed/simple;
	bh=VPmCkBmHVbnQSyw5rVIXMyekfyFv/rZ6v9FE9H3vaAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUPwr0fqDw6pjdQPP7xCCTx+3d3L3TQ3qyAPax+YGcakO+dycwaAExxP092DPnoLG7H40n1FdRoyy6JMrfyLtSkE0rQGzG3P7KNUoPkB7C9Fr6c1s9vDwarj2HMmIA17Pin2JOnlOWSnnt3j288CVXXbqSc/lrQSFE4lv3rlUCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AuheOCRQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0182EC4CEF7;
	Wed, 26 Nov 2025 14:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764165855;
	bh=VPmCkBmHVbnQSyw5rVIXMyekfyFv/rZ6v9FE9H3vaAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AuheOCRQw/odFhQKa/Zlw2Qf1GkftDtjOaDfVa42umzx04FYy8gd1jJ9cfal3klra
	 uYPu5YbEdQhc/mCPjKTtu/Zi+vjUFeBneVbghpf4Ga48tvWnwAwdfDcjDBM0zxKxKR
	 lIqgBsSN+fS66PGgoxGsrtb7Q5A+vJehlB7ZO517cv8MPMHlF8RKYTMBhI3rwSfJTX
	 XkmUoGLSiySO8CIUGydlqeoEh4DfOO+iuWY01ZjzMpAAEx2tAHbe2W71wCVcLQOD5k
	 YN5bo0ETtxX480BWnm32y43O32WXQ/3ujj4XcSlvOb7aYL/DHO9v2Q60R8cMJ8spU/
	 ZzPFe/6bYOTFQ==
Date: Wed, 26 Nov 2025 14:04:09 +0000
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>,
	Douglas Anderson <dianders@chromium.org>, kernel-team@android.com,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Samsung mfd/rtc driver alarm IRQ simplification
Message-ID: <20251126140409.GC3070764@google.com>
References: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
 <20251126112935.GA3070764@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251126112935.GA3070764@google.com>

On Wed, 26 Nov 2025, Lee Jones wrote:

> On Thu, 20 Nov 2025, André Draszik wrote:
> 
> > Hi,
> > 
> > With the attached patches the Samsung s5m RTC driver is simplified a
> > little bit with regards to alarm IRQ acquisition.
> > 
> > The end result is that instead of having a list of IRQ numbers for each
> > variant (and a BUILD_BUG_ON() to ensure consistency), the RTC driver
> > queries the 'alarm' platform resource from the parent (mfd cell).
> > 
> > Additionally, we can drop a now-useless field from runtime data,
> > reducing memory consumption slightly.
> > 
> > The attached patches must be applied in-order as patch 2 without 1 will
> > fail at runtime, and patch 3 without 2 will fail at build time. I would
> > expect them all to go via the MFD tree. Alternatively, they could be
> > applied individually to the respective kernel trees during multiple
> > kernel release cycles, but that seems a needless complication and
> > delay.
> > 
> > Signed-off-by: André Draszik <andre.draszik@linaro.org>
> > ---
> > Changes in v2:
> > - rebase on top of https://lore.kernel.org/r/20251114-s2mpg10-chained-irq-v1-1-34ddfa49c4cd@linaro.org
> > - return struct regmap_irq_chip_data * in sec_irq_init() (Lee)
> > - collect tags
> > - Link to v1: https://lore.kernel.org/r/20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org
> > 
> > ---
> > André Draszik (3):
> >       mfd: sec: add rtc alarm IRQ as platform device resource
> >       rtc: s5m: query platform device IRQ resource for alarm IRQ
> >       mfd: sec: drop now unused struct sec_pmic_dev::irq_data
> > 
> >  drivers/mfd/sec-common.c         | 45 ++++++++++++++++++++--------
> >  drivers/mfd/sec-core.h           |  2 +-
> >  drivers/mfd/sec-irq.c            | 63 ++++++++++++++++++----------------------
> >  drivers/rtc/rtc-s5m.c            | 21 +++++---------
> >  include/linux/mfd/samsung/core.h |  1 -
> >  5 files changed, 71 insertions(+), 61 deletions(-)
> 
> The MFD parts look okay to me.
> 
> Once we have the RTC Ack, I'll merge this and send out a PR.

Ah, I see it.  Apologies.

It's too late in the cycle to take this now anyway.

It's on my radar for when -rc1 is released.

-- 
Lee Jones [李琼斯]

