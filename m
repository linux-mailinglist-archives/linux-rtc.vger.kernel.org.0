Return-Path: <linux-rtc+bounces-1479-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EEB92EA3B
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 16:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DA971F2294C
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 14:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CC416130C;
	Thu, 11 Jul 2024 14:05:51 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0763514BFA2;
	Thu, 11 Jul 2024 14:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720706751; cv=none; b=Mhd/VXxKWvBHHPS57vkteWuKACwwrkho+13zUEfol8sDMWQ42LR9oag4gGdDFH5l/fEeRXVHTTPJ0EFI65nkgrxCcrFdNc2Ih4nSRIPWB7NskNenEf5uTMRTFX/b2i1vEedwW5iSUB3jd18hFLNHzL854BQwVfSHuDx8emKUB54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720706751; c=relaxed/simple;
	bh=PhHroz5/iQCubztv7+fwgm7+eMtiP9Lp0KUxRWIxtXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFQRnLZ+0dp5BDZY2IFSJKZ9DI1dTV8STu9DA85IK7oxCU3D9DGPYWrtSqRQi71VnsXAHt4eTvB98J+xEB/4MtHPf/rX1Ui4cdEk57v6MhiQzCcbmbXuGUMm/DMp6iSvsgKpXwoLz6gJyEzSPC5PakQ+6xNvHMxpcptBFXoxtY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F328FEC;
	Thu, 11 Jul 2024 07:06:13 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EEFC3F766;
	Thu, 11 Jul 2024 07:05:45 -0700 (PDT)
Date: Thu, 11 Jul 2024 15:05:42 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v5 0/7] firmware: support i.MX95 SCMI BBM/MISC Extenstion
Message-ID: <Zo_mtiEI_79F9wit@pluto>
References: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>

On Fri, Jun 21, 2024 at 03:04:35PM +0800, Peng Fan (OSS) wrote:
> i.MX95 System Manager Firmware source: https://github.com/nxp-imx/imx-sm
> To generate html from the repo: make html
> 

Hi Peng,

thanks for upstreaming this Vendor protocol.

LGTM, beside minor nitpicks I mentioned.

Please run checkpatch.pl --strict on series before next rebase, though,
that I spotted a few minor not-so-stylish things :D

Thanks,
Cristian

