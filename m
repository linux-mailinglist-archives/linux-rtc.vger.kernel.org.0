Return-Path: <linux-rtc+bounces-1475-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 937D192E96E
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 15:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 496531F241FD
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 13:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653C715ECE8;
	Thu, 11 Jul 2024 13:24:46 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8544615E5CD;
	Thu, 11 Jul 2024 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720704286; cv=none; b=Lq7KbPCT5dLXlN/ykZzAz4stsO8oNcNB5VdbGpXg86DmQFq1kYTtrKZrsgJioYgIms8+wSr2pnjssgq1vfA3cPIJd+oBasOK8ZafGgbURv8F5iY0Gu3uYijC4XckcG2V/9TrNPeNnvZaQhGdHLm/9If3k+2+668RsP41WPeJPWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720704286; c=relaxed/simple;
	bh=NbE9x6Xf/jq9TnQJ4Rb5fku1CzVanp9X9CpEqwMhFwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVhmbk+Ut3y6kDLyKfBlctVlDUZRuH5jP9jDuyMIGIGkxEtBnPnP7U03pnNBn8BTzTU4Xxw/WEJdejABd2WMzdf5yQK4aPB7BUslifMMCHPHmFSrSAqzWqApinmc2xA7uwP/bLXGleK8XgwVVUCO2PeDJtB/5U8GvgfWfE8D2Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26760FEC;
	Thu, 11 Jul 2024 06:25:09 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3792E3F766;
	Thu, 11 Jul 2024 06:24:40 -0700 (PDT)
Date: Thu, 11 Jul 2024 14:24:37 +0100
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
Subject: Re: [PATCH v5 4/7] firmware: arm_scmi: add initial support for i.MX
 MISC protocol
Message-ID: <Zo_dFcoBkC8X6u44@pluto>
References: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
 <20240621-imx95-bbm-misc-v2-v5-4-b85a6bf778cb@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621-imx95-bbm-misc-v2-v5-4-b85a6bf778cb@nxp.com>

On Fri, Jun 21, 2024 at 03:04:39PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX95 System Manager(SM) firmware includes a SCMI vendor protocol, SCMI
> MISC protocol which includes controls that are misc settings/actions that
> must be exposed from the SM to agents. They are device specific and are
> usually define to access bit fields in various mix block control modules,
> IOMUX_GPR, and other General Purpose registers, Control Status Registers
> owned by the SM.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Hi,

LGTM,
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

