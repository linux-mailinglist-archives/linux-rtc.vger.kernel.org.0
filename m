Return-Path: <linux-rtc+bounces-1787-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE30B965EE7
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 12:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A9DF288FF8
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 10:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA56019341A;
	Fri, 30 Aug 2024 10:19:17 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93C3192D95;
	Fri, 30 Aug 2024 10:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725013157; cv=none; b=J6lnsN0IiFdFYka47M5sovPbe1gJ5ddHST03Dq6mQOX4n5fT4l0qhZ/nMY5NVy9JdeD0y4m5pjzMQk8ckkJk8okW93M5dTGaJhDBSvKulcBqjhPSiqIc9qRfwv5I/9gw56REdteNAw2J8bj4cpIQ801lZsPrOdcKx1H0arlhCCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725013157; c=relaxed/simple;
	bh=vzleYBf8VBpQAaH+oPojEUNbBndhfbTL2F8q37iES2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhxWxtjSD+0mxTWy7SyOSeb39ouDk1PMJYlfgTitDVFe2VBANQng3T1awL/lAVjj3Sd+qK+0qji4dQe0ChpHjiWz8uAuevdgY6htCC675p1EQhAPBWy2DSSOSTB8VloLwQPuMIaLJ1N725cTc7avgenNCY7pIjyJnM6T2wZy+ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC2EF1063;
	Fri, 30 Aug 2024 03:19:40 -0700 (PDT)
Received: from bogus (e107155-lin.cambridge.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B5FC3F762;
	Fri, 30 Aug 2024 03:19:12 -0700 (PDT)
Date: Fri, 30 Aug 2024 11:19:09 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
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
Message-ID: <ZtGcnTYlGlZ8eC-6@bogus>
References: <20240823-imx95-bbm-misc-v2-v8-0-e600ed9e9271@nxp.com>
 <20240823-imx95-bbm-misc-v2-v8-6-e600ed9e9271@nxp.com>
 <Zs2rz1FT1UsKQBj6@bogus>
 <20240830091246fce62c34@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830091246fce62c34@mail.local>

On Fri, Aug 30, 2024 at 11:12:46AM +0200, Alexandre Belloni wrote:
> On 27/08/2024 11:34:55+0100, Sudeep Holla wrote:
> > Hi Alexandre,
> > 
> > On Fri, Aug 23, 2024 at 05:05:22PM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > > 
> > > The BBM module provides RTC feature. To i.MX95, this module is managed by
> > > System Manager and exported System Control Management Interface(SCMI).
> > > Linux could use i.MX SCMI BBM Extension protocol to use RTC feature.
> > > 
> > > This driver is to use SCMI interface to get/set RTC.
> > >
> > 
> > Are you fine if I take this along with dependent SCMI changes via SoC tree ?
> 
> Sure, please do.
> 

Thanks!

-- 
Regards,
Sudeep

