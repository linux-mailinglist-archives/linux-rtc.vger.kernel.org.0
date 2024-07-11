Return-Path: <linux-rtc+bounces-1489-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C21492F000
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 21:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04E391F2168A
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 19:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F62D19E822;
	Thu, 11 Jul 2024 19:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="K5G/oX9X"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60BC16D321;
	Thu, 11 Jul 2024 19:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720727689; cv=none; b=tIYmExgtRZ+z+UjQAZLy0E844R2DMgtlHpIwPGqPgIWedZ7Pnab1ivqKeJzUZpxRZVvqnUKijGP4ikULohu8nAqlUbRglOUO3kmqc58IF3MXyMGRV5KyTBHdgvAUlCtt2NjhFrNT/uwd1Vdiy7TdSGmvxFfWx9P2Bxo1pT5l2y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720727689; c=relaxed/simple;
	bh=eb2XTM60P1GKiWmUTG1BsJBQL1uhhw4Ufa2Yrlupk8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chT9TLBNUwmYZcHJM1psDUeQqOQ2I160L8xHwcDK4Tn/C9jVAyfDzTHk45U4KsbfnEkODIpl239Mw1FqhWt+p8lKTG0Fh/xy7MLTnlf+4nm5U9nmq15lxiZBtL5nTVFQJv4uPqQ/D3d9b52ZN+zWRl/jqATG5OCUilR5BqCYEN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=K5G/oX9X; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2735E1BF207;
	Thu, 11 Jul 2024 19:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720727685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tP8uB1Ycknn1gl2f7mpvX49JyyFCFmpbSw1uwJlmMoM=;
	b=K5G/oX9XIwlEHGkouP9B4RwcnyLTQe7xEvks0jkm0ybE/PXEo4QOjAz36PbCTo2TbAGMak
	wDwfdkB4OAnp+vm96agOIYUkVmddAuFWgkjHcHwGakKZdJswjbqgokcndNaTz43JK5JAzX
	Wb+ulVIR5A90VTpWoyh85eej+kvK6D7o9nJnckVzYBMvMqQkznm6AWLvlKuf5f+g3GxRwP
	JjbCaYqNe1Wz2epfgn3fzZOpxZZs42eGJsI6IVWDJh/V9DMgMzxzwvEEppV8HXs/VQ4L5i
	mmoh7fOFo2DumIbC5HOwrXEDy0oPdjdIevFhRxlPtMJgvbzL1J8BQzGfFMP2HQ==
Date: Thu, 11 Jul 2024 21:54:42 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v5 0/7] firmware: support i.MX95 SCMI BBM/MISC Extenstion
Message-ID: <20240711195442c18a3689@mail.local>
References: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
 <Zo_mtiEI_79F9wit@pluto>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zo_mtiEI_79F9wit@pluto>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 11/07/2024 15:05:42+0100, Cristian Marussi wrote:
> On Fri, Jun 21, 2024 at 03:04:35PM +0800, Peng Fan (OSS) wrote:
> > i.MX95 System Manager Firmware source: https://github.com/nxp-imx/imx-sm
> > To generate html from the repo: make html
> > 
> 
> Hi Peng,
> 
> thanks for upstreaming this Vendor protocol.

The question being when are they going to reuse the protocols, we
already have two just from nxp:

rtc-nxp-bbnsm.c
rtc-imx-sc.c



> 
> LGTM, beside minor nitpicks I mentioned.
> 
> Please run checkpatch.pl --strict on series before next rebase, though,
> that I spotted a few minor not-so-stylish things :D
> 
> Thanks,
> Cristian

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

