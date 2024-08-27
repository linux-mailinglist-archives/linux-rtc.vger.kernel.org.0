Return-Path: <linux-rtc+bounces-1745-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D355596078B
	for <lists+linux-rtc@lfdr.de>; Tue, 27 Aug 2024 12:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92AA1283A10
	for <lists+linux-rtc@lfdr.de>; Tue, 27 Aug 2024 10:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CBC19D8A2;
	Tue, 27 Aug 2024 10:35:02 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F41182B2;
	Tue, 27 Aug 2024 10:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724754902; cv=none; b=hYPLSv0yJve3f77hMrLr1Rpytms/LsP8q/3HPbFk0ndn2GSSQDZuHMIHN8ZihW+H3fD/ZTpzMmITUZuZ81Ry/fpVtMRhZIzRo8/P3Sop3rO01TpXJ48gf880bkIyr04Mwm3aQOP1V1arFWQVhJq97hFj7BZwl2iQye39puG1qIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724754902; c=relaxed/simple;
	bh=A83IJeB3jYoRENx+Y1h+o+5Dn5r2/7TbxwXp0TDOOHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORq0iPOzqub9+YA9mjUaKDs6G2ZZzflM9CyS7RF9gd3sbpRJcjDsu5tvDWX/NF1QyI0Sv0hoZkqYG+1bhUT75Kmyo90FBgG7q+lXlpzUx71w/K8E025q4dc4gla/1Cn5bmXndmlhVEN7xZyC29oRqYSZTZY3EmlSqmLjdmYrkxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58622DA7;
	Tue, 27 Aug 2024 03:35:26 -0700 (PDT)
Received: from bogus (e107155-lin.cambridge.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E59733F66E;
	Tue, 27 Aug 2024 03:34:57 -0700 (PDT)
Date: Tue, 27 Aug 2024 11:34:55 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-rtc@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v8 6/7] rtc: support i.MX95 BBM RTC
Message-ID: <Zs2rz1FT1UsKQBj6@bogus>
References: <20240823-imx95-bbm-misc-v2-v8-0-e600ed9e9271@nxp.com>
 <20240823-imx95-bbm-misc-v2-v8-6-e600ed9e9271@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823-imx95-bbm-misc-v2-v8-6-e600ed9e9271@nxp.com>

Hi Alexandre,

On Fri, Aug 23, 2024 at 05:05:22PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The BBM module provides RTC feature. To i.MX95, this module is managed by
> System Manager and exported System Control Management Interface(SCMI).
> Linux could use i.MX SCMI BBM Extension protocol to use RTC feature.
> 
> This driver is to use SCMI interface to get/set RTC.
>

Are you fine if I take this along with dependent SCMI changes via SoC tree ?

-- 
Regards,
Sudeep

