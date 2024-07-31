Return-Path: <linux-rtc+bounces-1650-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4127B942F8C
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 15:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 013C328A3E3
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 13:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D5F1B29B9;
	Wed, 31 Jul 2024 12:58:54 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67741AB52C;
	Wed, 31 Jul 2024 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430734; cv=none; b=OYlF5cE7HqrHAc8hV6rlz1zDuhZfHvvbHmnSPcn0H16A94olifZ7unjIK8zFWZmguCJ2O5CpuEdG26+BkIXaqoMpwB4rWDypLToIIOP62LR+xY1nKP+HR2DprvIfVHtn0+R1PZu1bkBR+fEk8FY+0A/5E40E9QxJMZ5zy3mqt/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430734; c=relaxed/simple;
	bh=Cz9rXVlUuUIx2KdvrKVffZhncBvWWxea9mzmttsi2Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raA7593JR4oKwtvymFx5C1SjZmEWP15zleoFXbsjeaxmKThfyiMPSKUc2iNUUHZMMoMIclnpOLbhvt/zgH4zJB8RbLkYwj9mhpacMjXqz8sBxXbL1x34UcdEOXNhFvQ95xX2RiSKa2bI3JsMkGSGi25tHHLjjufF8eI8a5p/rSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D69881007;
	Wed, 31 Jul 2024 05:59:16 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78EE43F766;
	Wed, 31 Jul 2024 05:58:48 -0700 (PDT)
Date: Wed, 31 Jul 2024 13:58:46 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v6 1/7] dt-bindings: firmware: add i.MX95 SCMI Extension
 protocol
Message-ID: <Zqo1BpZ9i3LC_TIQ@bogus>
References: <20240718-imx95-bbm-misc-v2-v6-0-18f008e16e9d@nxp.com>
 <20240718-imx95-bbm-misc-v2-v6-1-18f008e16e9d@nxp.com>
 <dee6e871-daa3-4886-be57-e4d4b3fa198d@kernel.org>
 <PAXPR04MB84592DE4592FC5D270F0820B88B12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <ZqovdlPcnBbZn0Ue@bogus>
 <PAXPR04MB84599389611E0E789E425FD588B12@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84599389611E0E789E425FD588B12@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Wed, Jul 31, 2024 at 12:49:59PM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH v6 1/7] dt-bindings: firmware: add i.MX95 SCMI
> > Extension protocol
> >
> > On Wed, Jul 31, 2024 at 12:18:28PM +0000, Peng Fan wrote:
> > > > Subject: Re: [PATCH v6 1/7] dt-bindings: firmware: add i.MX95
> > SCMI
> > > > Extension protocol
> > > >
> > > > On 18/07/2024 09:41, Peng Fan (OSS) wrote:
> > > > > From: Peng Fan <peng.fan@nxp.com>
> > > > >
> > > > > Add i.MX SCMI Extension protocols bindings for:
> > > > > - Battery Backed Module(BBM) Protocol
> > > > >   This contains persistent storage (GPR), an RTC, and the ON/OFF
> > > > button.
> > > > >   The protocol can also provide access to similar functions
> > > > implemented via
> > > > >   external board components.
> > > > > - MISC Protocol.
> > > > >   This includes controls that are misc settings/actions that must
> > > > > be
> > > > exposed
> > > > >   from the SM to agents. They are device specific and are usually
> > > > define to
> > > > >   access bit fields in various mix block control modules,
> > > > > IOMUX_GPR,
> > > > and
> > > > >   other GPR/CSR owned by the SM.
> > > > >
> > > > > Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
> > > >
> > > > Why quotes? Which tools did you use?
> > >
> > > I could not recall why have this. I will drop and resend the patchset.
> > >
> >
> > Resend only if you have any other comments addressed, no spin just
> > for this one please.
>
> Sorry, I pushed the button too quick to send out v7(just correct
> this R-b tag and rebased to linux-next) before checking my inbox.
>

Just makes me wonder if I should wait for 3-4 pings + 2-3 weeks after the
last version of any of your patch set without any version bump before I
can look at it. Otherwise it is quite impossible to match your speed of
patch respinning and the whole review process gets complicated to follow.

Also it is bit sad that you thought it needs to be re-spinned just for this
which can be easily fixed when applying. Also I haven't even started looking
at this series for the reason I mentioned above.

--
Regards,
Sudeep

