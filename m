Return-Path: <linux-rtc+bounces-1786-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F105965C74
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 11:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 827F5B24B36
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 09:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9090414BFB4;
	Fri, 30 Aug 2024 09:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Hn0o1+zg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87A616F0E6;
	Fri, 30 Aug 2024 09:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725009178; cv=none; b=bPilpVKR/v/glE8rXipmAS8iJyIEAVTkvFynvs/2O3Dap9rbztPLoDwydR8mekc7TdW/A+dVSCi4GYvl1F+QkXmdgphSLRRcf9HPkDgDZP/pZcCkwG3JD9JTfFazCDWpTG+gYtiH6PZgANIPn0X60R6AUsB9TdvUMOM916lTysc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725009178; c=relaxed/simple;
	bh=GcMYJ3PIwRsIy8xGQ2nMsRWc8HyxLcC69tALdqQ+RKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxs4y/ntwhBQbFmYo6sj7D6pX+oD3BVKiDIgGckfKXaSNLOy0ETtg2bCfIzmKVb7a6wLNJpj2BDRd9Jx0jcLzrmD42FzcgwS9Jtsb0S3jsX7kbJpXGtV7tRjEXXwI8+LsKhd0DPHr0+8mJ+bWo8VN+Sj7YJNMhBTPcQeWdHwIik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Hn0o1+zg; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B11BFF806;
	Fri, 30 Aug 2024 09:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725009168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vUwX4cXKvuh9t8yohr6KHZCZg/xLuyYvuM4zKl+6Mc=;
	b=Hn0o1+zgcikDEMZQngQ1Q+yHtR3R3ZB5xkDV1r4JObOTxLvJF7YUyyJcZ4pWvJNXkOQDxi
	+xoT4fQOIqD/+A+Gx6hRNDTHBtxLl0LhN8j9Qirofr8Rhot4pOryoXT9uW/6/wiGp0I27Y
	merMFuSJzBX9tZhh/9OM2UsQ09Iz3HruapoDErCQph1wUPvagIebqB0Hi8GTk3GVjZBEsD
	IQ8E1U1uuPRgXtc4HurxifyGBb3Xmv7+lH51NtG6fwEswNKnxSNGq3BmImj9UhYUJuOuFZ
	AShfWLqFRFphza95ytMMKdHNdYHX53DCSQWbGmtYbz+PBO/oYqcuqky+P3dtRA==
Date: Fri, 30 Aug 2024 11:12:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
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
Message-ID: <20240830091246fce62c34@mail.local>
References: <20240823-imx95-bbm-misc-v2-v8-0-e600ed9e9271@nxp.com>
 <20240823-imx95-bbm-misc-v2-v8-6-e600ed9e9271@nxp.com>
 <Zs2rz1FT1UsKQBj6@bogus>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zs2rz1FT1UsKQBj6@bogus>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 27/08/2024 11:34:55+0100, Sudeep Holla wrote:
> Hi Alexandre,
> 
> On Fri, Aug 23, 2024 at 05:05:22PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> > 
> > The BBM module provides RTC feature. To i.MX95, this module is managed by
> > System Manager and exported System Control Management Interface(SCMI).
> > Linux could use i.MX SCMI BBM Extension protocol to use RTC feature.
> > 
> > This driver is to use SCMI interface to get/set RTC.
> >
> 
> Are you fine if I take this along with dependent SCMI changes via SoC tree ?

Sure, please do.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

