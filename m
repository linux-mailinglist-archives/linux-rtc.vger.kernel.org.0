Return-Path: <linux-rtc+bounces-3174-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7056A323C0
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 11:44:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51E55188BCEC
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 10:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10650209F31;
	Wed, 12 Feb 2025 10:43:33 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD22209F24;
	Wed, 12 Feb 2025 10:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739357012; cv=none; b=fGWwXuWG584YCbucGJxIx10j6QWerV+8lG4buwmU2a0n5FKnFhMF1X4Se1PBpho70OuXTeT2CkeVF0TsJRh1ar6eDSV2EQWMiIYItlOFa/lzjgm0B7XfnDe+2tyYcAKhSca5lBMzU7qvYwfc3HucsT51y4H0ib1+XfWHe5w3WB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739357012; c=relaxed/simple;
	bh=HCfswIkRUWqCkSlxznTAVF1bVVQxdphLqoiOwibUgSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sU8+1/vUc0cBbSdBfURtBCVut5yPAWmDKmQMTHay4Kc+SPr71xSWEndhyivDqmFj0tY3ed/1/GGB3CFkTFvoK/Vqb3JRX5V/0ftG347pw8y2KN5xvxrJtIfUmH7n1AN8ZIEVyqbEVu9XUrwLg59+dhsQnavpZslyw6qtPvjBGLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C94312FC;
	Wed, 12 Feb 2025 02:43:51 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE7B23F6A8;
	Wed, 12 Feb 2025 02:43:27 -0800 (PST)
Date: Wed, 12 Feb 2025 10:43:24 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 0/4] rtc/scmi: Support multiple RTCs
Message-ID: <Z6x7TBSjBFBxGo77@bogus>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120102117538ef59b@mail.local>
 <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z6uCCeG2d395ZGDS@bogus>
 <20250212063532.GB15796@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212063532.GB15796@localhost.localdomain>

On Wed, Feb 12, 2025 at 02:35:32PM +0800, Peng Fan wrote:
> On Tue, Feb 11, 2025 at 04:59:53PM +0000, Sudeep Holla wrote:
> >On Tue, Jan 21, 2025 at 02:31:55PM +0000, Peng Fan wrote:
> >> 
> >> It is the i.MX SCMI Protocol exports two RTCs using one protocol.
> >> 
> >> Two RTC devices are created, but share one parent device.
> >> 
> >> Do you mean each RTC device should have a unique parent device?
> >>
> >
> >Can you point where is this check for unique parent ? I am not so familiar
> >with RTC but I couldn't find myself with quick search.
> 
> The RTC ops takes the rtc parent as input parameter
> https://elixir.bootlin.com/linux/v6.13.2/source/drivers/rtc/interface.c#L94
> "err = rtc->ops->read_time(rtc->dev.parent, tm);"
> 
> So in the rtc device driver, there is no way to know which rtc it is just
> from the parent device.
>

If that is the expectation, you could create a platform or normal device
per instance of RTC on your platform and slap them as parent device.

IIUC on any pure DT based system, a device node exists per RTC and hence
platform device associated with it. And the RTC devices are created with
parent pointing to unique platform device.

> However i.MX SCMI BBM exports two RTCs(id: 0, id: 1), so to make it work for
> current RTC framework, we could only pick one RTC and pass the id to BBM
> server side.
>
> I am not sure whether Alexandre wanna me to update the code following each
> parent could only support one RTC or else.
>

I assume something like my suggestion above.

--
Regards,
Sudeep

