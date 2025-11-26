Return-Path: <linux-rtc+bounces-5463-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CB480C89850
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Nov 2025 12:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BD3ED4E5441
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Nov 2025 11:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7A3320A20;
	Wed, 26 Nov 2025 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3sDv/Fd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEFB31ED81;
	Wed, 26 Nov 2025 11:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764156582; cv=none; b=NsrQ4qVovIeuC+Fshf2f167ZgYiKem+WwFd5jKiGWAazSUWr7GGfCHebuLJ6QUEO6ntfc1QYMVgWHw1KDfKbIMLI+ICYknMkZuzS6Gw3ThRibvb3FtyMl3cEcaoIsM5ZnfebWBGKPtSAIUJzL+ETbgLGrJcYxrv/mse9UfX6X4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764156582; c=relaxed/simple;
	bh=Rv36ldC1sp4jcPeSJa5adn3sTqPjM81EnfbmQDGmLfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qclBRbz4rYdx0fwyIKA+SnO0NbSsLNsy8MCm3QTILH76guJgdNiRKvMD9BM3P1VAOXg3j9sgS08lB0XYxh9UXNrvNODdv5W7E9eSGem6BqEJB5uFssLsgWsNTm+3d4ne3Vkm1ffouG5qfo5hGCWR4F5a8q56HQdlKxzQMqYZ/+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3sDv/Fd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94846C113D0;
	Wed, 26 Nov 2025 11:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764156581;
	bh=Rv36ldC1sp4jcPeSJa5adn3sTqPjM81EnfbmQDGmLfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o3sDv/FdElKHmG+88H/8dE0uw0vNFy5gDV8s2HpjEJ2IM4PBR+uyvcvjcSCvvgbUH
	 XSh+EkCICeJfG20Hmyku/fxtVMnC5sgDdvcieQZiBZzPXR0nw/WvVrfYj2+j/m+xxY
	 ocCP25WWH/iTy5Epo2lsQZ9RTcUnFkYlPY3fOsrPygdSM3Fo7s5D6N8reWNtH2BNBy
	 h7JZGPTiyEeQLdD7LXyBzRTZHIdk3IVYaHOXhWmoPMn3KJmwnxQPtj0h3KoxgFYfzQ
	 8xvyZYZ3MYJ/twubGpf01HMamTaVroY4nR+GfY+sHgAHS7oQFv5lxafgZ5qe8DZ5m/
	 Lc0ZpDMoSqY5w==
Date: Wed, 26 Nov 2025 11:29:35 +0000
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
Message-ID: <20251126112935.GA3070764@google.com>
References: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>

On Thu, 20 Nov 2025, André Draszik wrote:

> Hi,
> 
> With the attached patches the Samsung s5m RTC driver is simplified a
> little bit with regards to alarm IRQ acquisition.
> 
> The end result is that instead of having a list of IRQ numbers for each
> variant (and a BUILD_BUG_ON() to ensure consistency), the RTC driver
> queries the 'alarm' platform resource from the parent (mfd cell).
> 
> Additionally, we can drop a now-useless field from runtime data,
> reducing memory consumption slightly.
> 
> The attached patches must be applied in-order as patch 2 without 1 will
> fail at runtime, and patch 3 without 2 will fail at build time. I would
> expect them all to go via the MFD tree. Alternatively, they could be
> applied individually to the respective kernel trees during multiple
> kernel release cycles, but that seems a needless complication and
> delay.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
> Changes in v2:
> - rebase on top of https://lore.kernel.org/r/20251114-s2mpg10-chained-irq-v1-1-34ddfa49c4cd@linaro.org
> - return struct regmap_irq_chip_data * in sec_irq_init() (Lee)
> - collect tags
> - Link to v1: https://lore.kernel.org/r/20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org
> 
> ---
> André Draszik (3):
>       mfd: sec: add rtc alarm IRQ as platform device resource
>       rtc: s5m: query platform device IRQ resource for alarm IRQ
>       mfd: sec: drop now unused struct sec_pmic_dev::irq_data
> 
>  drivers/mfd/sec-common.c         | 45 ++++++++++++++++++++--------
>  drivers/mfd/sec-core.h           |  2 +-
>  drivers/mfd/sec-irq.c            | 63 ++++++++++++++++++----------------------
>  drivers/rtc/rtc-s5m.c            | 21 +++++---------
>  include/linux/mfd/samsung/core.h |  1 -
>  5 files changed, 71 insertions(+), 61 deletions(-)

The MFD parts look okay to me.

Once we have the RTC Ack, I'll merge this and send out a PR.

-- 
Lee Jones [李琼斯]

