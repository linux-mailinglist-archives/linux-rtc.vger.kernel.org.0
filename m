Return-Path: <linux-rtc+bounces-2592-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0599D5215
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Nov 2024 18:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 890801F225AD
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Nov 2024 17:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C820718BB9A;
	Thu, 21 Nov 2024 17:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Chu2yLaY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8448D1482E2;
	Thu, 21 Nov 2024 17:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732211201; cv=none; b=tu2k2LUiFdVwyZdreFOPj/3dsM28IafSdnoM0JnoTwxlRGcymGkexE+hzcOss0PkpjL4eQgoEwQz5SNizMR0lMu+Doqz7b5xum2dPiIpxhRak5rE8MH7i1Rmx1o8eMau1EjTVZSeDfaoVxn5fZd5FO754xL3NQOyk88PZklrQic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732211201; c=relaxed/simple;
	bh=S43Mq/gZ58PAeUpK3Kr5oIpsndIsTPDPFJ68onZvPuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdCLqjeC9De106HvGTdkpqLtGTvNkL/LTyYAV8r8p25KeG+JBqDKVdS5rLPbttYpbNtvjmfEU7lnt0pyUm7u/uzJlV4/T4g+knR7KKxLNDyPwACHIht1dQB/BEvqqCnaD/n9MItyAmn25kZV/fa7FztE21gbLEfrXw+9sKYQVbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Chu2yLaY; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38DC160011;
	Thu, 21 Nov 2024 17:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732211192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L3SwyqwafSAOqsWPPRTD47TFcNVAitnw7DSiwOQ868Q=;
	b=Chu2yLaYwK3bT1H75qjMKmKgMUMryBXxDJunSuyzQbW385w2epw4RgTZkJZoq7z/og9g2U
	35k6LcjYgbvEY0PnBEyQbBPXvAS0ll2cqeBhCym2H0y/ypO3ywybt12M2h4cAM+ETUhcmy
	3TZDAAAvFb/fHidf+GNbp5DUlFDcMD7HS2Fn0rNEzMfOOiqbVaLE2oncbehuS9g/fE98ok
	xExKWWkEOMgBi0Kkh6iBsHeDR+cNuibreglV4Lm4jrZ61lPD+eFtD2rHJp/t9A9wSieQJE
	2qK9TiQvKWKvyjVm/efCRbVaP1qm7Jmi2pOriiuMFnNnUQW6yaF/KZC+WcAfjg==
Date: Thu, 21 Nov 2024 18:46:30 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Daniel Palmer <daniel@0x0f.com>,
	Michael Pavone <pavone@retrodev.com>,
	linux-m68k@lists.linux-m68k.org, linux-rtc@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 1/2] rtc: m48t59: Use platform_data struct
 for year offset value
Message-ID: <20241121174630cbc6cfa6@mail.local>
References: <cover.1731450735.git.fthain@linux-m68k.org>
 <665c3526184a8d0c4a6373297d8e7d9a12591d8b.1731450735.git.fthain@linux-m68k.org>
 <173193673970.37302.12055966881506116157.b4-ty@bootlin.com>
 <8140c873-3456-1469-8bc5-2e94d409cf8a@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8140c873-3456-1469-8bc5-2e94d409cf8a@linux-m68k.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 21/11/2024 09:13:32+1100, Finn Thain wrote:
> 
> On Mon, 18 Nov 2024, Alexandre Belloni wrote:
> 
> > On Wed, 13 Nov 2024 09:32:15 +1100, Finn Thain wrote:
> > > Instead of hard-coded values and ifdefs, store the year offset in the
> > > platform_data struct.
> > > 
> > > 
> > 
> > Applied, thanks!
> > 
> > [1/2] rtc: m48t59: Use platform_data struct for year offset value
> >       https://git.kernel.org/abelloni/c/a06e4a93067c
> > 
> 
> Thanks, Alexandre. Would you also take patch 2/2, please? Geert has sent a 
> reviewed-by tag for that one too.

I thought Geert would take it as this only touches arch/m68k

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

