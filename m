Return-Path: <linux-rtc+bounces-1695-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F2495B36C
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 13:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2960FB2170B
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 11:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B3E181BA8;
	Thu, 22 Aug 2024 11:03:14 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE9D148841;
	Thu, 22 Aug 2024 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724324594; cv=none; b=Quo3B1+t56caCze1+gZP9GN2iNyiDI94CiP2B7msqWNtgZoMC0ZeBkjMzMArLud4lq6UwlcEo+nLdKmdt844BxaSgCOQO7BoLqSr8tEUUnqC0BiPsf2wARix5a1cNUQ+PW1r+ZAMs3XRrIKbQt9iNT2gKwBIS2m9/8zYmZPKC2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724324594; c=relaxed/simple;
	bh=QcvlALG8K7OqmQiS0wFQWiP9IuevNmp4OpyP2LoMZfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/UXsYXr/L+jR5Ps8TFlfDGcMLE7fRPoWuI9gc8H9vn1rzRayRLYJjaP/eD/ZHcfd/2NLrjjV19J2+WvZqCAgieMixXjYMRrF5RV3quqQzNzSynFqQ0ObgCL51bsFRo0iSN1JOEqDY0Sp9O6lMwry3ZQC4eIYvz4bPYQmFxdcCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 015ECDA7;
	Thu, 22 Aug 2024 04:03:39 -0700 (PDT)
Received: from bogus (e107155-lin.cambridge.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EAFF3F58B;
	Thu, 22 Aug 2024 04:03:08 -0700 (PDT)
Date: Thu, 22 Aug 2024 12:03:05 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH v7 0/7] firmware: support i.MX95 SCMI BBM/MISC Extenstion
Message-ID: <Zsca6aqY861q0bOm@bogus>
References: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
 <PAXPR04MB84591BA31D74C164E59A3B9688812@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB845947383F2F5469B04E92C4888F2@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB845947383F2F5469B04E92C4888F2@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Thu, Aug 22, 2024 at 06:02:05AM +0000, Peng Fan wrote:
> Hi Sudeep,
> 
> > Subject: RE: [PATCH v7 0/7] firmware: support i.MX95 SCMI BBM/MISC
> > Extension
> 
> With Cristian's transport patchset applied, there a minor conflict in Makefile
> with this patchset. Please let me know if I need to send v8 to address
> the Makefile conflict or you could help.
> 

Sorry, I previously delayed reviewing your patches for reasons mentioned
before(non technical) and was planning to start looking at it this week.
But I haven't so far, so go ahead and post the v8. If possible, please move
all the imx files under a new "vendors" directory.

	drivers/firmware/arm_scmi/vendors/imx/....

--
Regards,
Sudeep

