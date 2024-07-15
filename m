Return-Path: <linux-rtc+bounces-1503-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FB4931545
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jul 2024 15:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97A60B23B72
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jul 2024 13:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA6E18D4D6;
	Mon, 15 Jul 2024 12:59:38 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D95918C341;
	Mon, 15 Jul 2024 12:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721048378; cv=none; b=Fzh/PGSa4BEe/Z9DWDUyLZzNtBSxgdDNLM3ihFoK+wTVAbhJBf+JFtE2d9DrkcY1ORh/sjih1z0Yv8c05YVa2oqbUnl5ZhQBb43Y4iD9P9UmoJhBz0k0xR+OAPvarQ8528Bd2Edt+LnjocVaDltV8bm8TSkVABqiFYAAs+6kq0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721048378; c=relaxed/simple;
	bh=tCAUoz16SFgMtRJJXCi3TzLWuHeXMPwnhI3T1kOUIJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpH3daOH9B+Ik8dwKzoXl799EkgbPHc+XsLSDZCsHeHefsnn8/k0gTtgeEiHGL+AlZvI8ZUC169kWABZ3fIkZ/C2YFyFIG/rhgu0TyslMr2gaXgOAP2FsmKO6MQTIyypyigdUXiKwWmDWrylXo48pJCcJploJNElNtygkOttVps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC521DA7;
	Mon, 15 Jul 2024 06:00:00 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11C1A3F73F;
	Mon, 15 Jul 2024 05:59:32 -0700 (PDT)
Date: Mon, 15 Jul 2024 13:59:30 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH v5 1/7] Documentation: firmware-guide: add NXP i.MX95
 SCMI documentation
Message-ID: <ZpUdMmvucei9lLPI@bogus>
References: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
 <20240621-imx95-bbm-misc-v2-v5-1-b85a6bf778cb@nxp.com>
 <Zo_bFnjWixZF6seV@pluto>
 <DB9PR04MB8461684315E753DAFDDBACA788A12@DB9PR04MB8461.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9PR04MB8461684315E753DAFDDBACA788A12@DB9PR04MB8461.eurprd04.prod.outlook.com>

On Mon, Jul 15, 2024 at 11:47:56AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH v5 1/7] Documentation: firmware-guide: add NXP
> > i.MX95 SCMI documentation
> > 
> > On Fri, Jun 21, 2024 at 03:04:36PM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Add NXP i.MX95 System Control Management Interface(SCMI)
> > vendor
> > > extensions protocol documentation.
> > >
> > 
> > Hi,
> > 
> > beside the final location of this file in the tree, and a few nitpicks down
> > below.
> 
> Thanks for reviewing the patches. Except Documentation/firmware-guide,
> I not have good idea where to put the API doc.
> 
> Sudeep,
>   Do you have any suggestions?
>

Not really. But I am OK to keep it under drivers/firmware/arm_scmi/vendor/docs
or something similar.

--
Regards,
Sudeep

