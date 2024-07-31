Return-Path: <linux-rtc+bounces-1649-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC79942F73
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 14:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7FBA1C23A0B
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 12:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4EF11B4C2A;
	Wed, 31 Jul 2024 12:54:09 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217211B3F37;
	Wed, 31 Jul 2024 12:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430449; cv=none; b=tp8WOacCBWrTp2WQnwOrj5aLRBDFkzxqQ5LhIB3MkRC9qfqbazj5rItUUF3h8gfz0nhknX55HnC34t4eAdKCBR3yA/Fab0M6bZqDgOzvmeWsvMzgG2EaFwGxzhgD78qunYzvA3ZFPKcO5KjiIyPWpXtNonT74zx3/3YfkdfQofE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430449; c=relaxed/simple;
	bh=am7KJVl9wrDRT1DPp9yRFXK4Hr35jYnU3OMg5geB5jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smKpK6rT0q2JymDVl+QyFzPqVLtlLu7P2mgh57T283uBTk25XKjONgSfMAjjCRVAzm3dH9+2Pk+xYiWGKQupf+Fgz7ARaH7qRx9YthKqnyAeMwLoKl2QgybItML92CUi6fhkNhnyl2rHt8uPLfddhQ2OnXWRJcoQz3TdEjAVqes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20EE01007;
	Wed, 31 Jul 2024 05:54:33 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D51C3F766;
	Wed, 31 Jul 2024 05:54:04 -0700 (PDT)
Date: Wed, 31 Jul 2024 13:54:01 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-rtc@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v7 0/7] firmware: support i.MX95 SCMI BBM/MISC Extenstion
Message-ID: <Zqoz6RVcvNLEh2UT@bogus>
References: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>

On Wed, Jul 31, 2024 at 08:56:04PM +0800, Peng Fan (OSS) wrote:
> i.MX95 System Manager Firmware source: https://github.com/nxp-imx/imx-sm
> To generate html from the repo: make html
>
> i.MX95 System Manager Firmware support vendor extension protocol:
> - Battery Backed Module(BBM) Protocol
>   This protocol is intended provide access to the battery-backed module.
>   This contains persistent storage (GPR), an RTC, and the ON/OFF button.
>   The protocol can also provide access to similar functions implemented via
>   external board components. The BBM protocol provides functions to:
>
>   - Describe the protocol version.
>   - Discover implementation attributes.
>   - Read/write GPR
>   - Discover the RTCs available in the system.
>   - Read/write the RTC time in seconds and ticks
>   - Set an alarm (per LM) in seconds
>   - Get notifications on RTC update, alarm, or rollover.
>   - Get notification on ON/OFF button activity.
>
> - MISC Protocol for misc settings
>   This includes controls that are misc settings/actions that must be
>   exposed from the SM to agents. They are device specific and are usually
>   define to access bit fields in various mix block control modules,
>   IOMUX_GPR, and other GPR/CSR owned by the SM.
>   This protocol supports the following functions:
>
>   - Describe the protocol version.
>   - Discover implementation attributes.
>   - Set/Get a control.
>   - Initiate an action on a control.
>   - Obtain platform (i.e. SM) build information.
>   - Obtain ROM passover data.
>   - Read boot/shutdown/reset information for the LM or the system.
>
> This patchset is to support the two protocols and users that use the
> protocols. The upper protocol infomation is also included in patch 1
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>
> Changes in v7:
> - Just correct R-b tag from Rob to drop quotes "", and rebased
> - Link to v6: https://lore.kernel.org/r/20240718-imx95-bbm-misc-v2-v6-0-18f008e16e9d@nxp.com

I specifically asked you to avoid re-spinning just for this reason within
20 mins from your response, yet you managed to churn it within that time 🙁.
I must respond at flash speed to avoid such things in the future 😢.

--
Regards,
Sudeep

