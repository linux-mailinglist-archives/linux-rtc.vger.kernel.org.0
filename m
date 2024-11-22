Return-Path: <linux-rtc+bounces-2611-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 709BC9D6631
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Nov 2024 00:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31C322812A0
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2024 23:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7BB189B86;
	Fri, 22 Nov 2024 23:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IqAzKgO5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1449750285;
	Fri, 22 Nov 2024 23:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732316621; cv=none; b=demhUdKyQXikadISZkzAIDCmIddqxIUj6kY9Uq5As22GrmwY+V8xO0GpOH1N8Ggi67orodK6oVpltU3BnM2UA00t8+j13nYPZBFBdSTYBk05/mRiVuSAOgf3PuYwwccdKELP5Qn8ft1xr8/32iW9BJ1pejPuPna1pvuMwrNLDrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732316621; c=relaxed/simple;
	bh=J7/SCpSmCjmhHvzCpvmulKjpJC4J84S29Rs0RZQr+PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YX6NPKmR2bjzisOZfZ1xg85J4re85HiQUfKWo1WweD9fku9X+jRq799XeMotUjWYO1Of+ROrlqrejXW13INo3P5pXLAkonRNS9lltORscBxEQHZS0J4jt4nFEbAxupGc0Y74mAjjSenG09XH7kWgWDh8Woj1qnA4jxTK44i+5Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IqAzKgO5; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB2E760003;
	Fri, 22 Nov 2024 23:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732316610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JUXKXaBWyak1Ovx48ZLm1Tp4ygFFPbjUy27VTJe6Uic=;
	b=IqAzKgO5pOmPzflHIs1J1k8Zsfj1GIGNWNInfEUBW13hfmgVuOmX8g1gpC5auPemL7YNGz
	vmqjV1WTxJkekM6huSNqPLBOyhcpXV1yfLMEibSqMzbYt1C9utFSvGg66h895rAXeziLXo
	pbFt7S1q27AVr0hUYX90T1Cpw9hfTy3cPfcXrvQSgzStvoWr22c1q6Syh58qdXJmEyJVZ6
	/ehLBJcdI0NG30NwJNJ9vpzjtCrsj0Oc5Z0VO9upY6jE63OVLvuac2t+ZOofvYnj1GRU7t
	g/bXvoUBI+NBTRnd1r68y98jHiEkoggwdDyrX7sWVUGPhPaj30AbKzOIRwqZcg==
Date: Sat, 23 Nov 2024 00:03:29 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Daniel Palmer <daniel@0x0f.com>,
	Michael Pavone <pavone@retrodev.com>,
	linux-m68k@lists.linux-m68k.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] m68k: mvme147, mvme16x: Adopt rtc-m48t59 platform
 driver
Message-ID: <20241122230329128df024@mail.local>
References: <cover.1731450735.git.fthain@linux-m68k.org>
 <19a16bcc94c42ea9c5397b37b1918c2937e3faab.1731450735.git.fthain@linux-m68k.org>
 <CAMuHMdVuv7wRud4jNt=t4Ac_s4ze6YYguUKLRt0hQ4gTqEWpEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVuv7wRud4jNt=t4Ac_s4ze6YYguUKLRt0hQ4gTqEWpEg@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 22/11/2024 15:44:33+0100, Geert Uytterhoeven wrote:
> On Tue, Nov 12, 2024 at 11:51 PM Finn Thain <fthain@linux-m68k.org> wrote:
> > Both mvme147 and mvme16x platforms have their own RTC driver
> > implementations that duplicate functionality provided by the rtc-m48t59
> > driver. Adopt the rtc-m48t59 driver and remove the other ones.
> >
> > Tested-by: Daniel Palmer <daniel@0x0f.com>
> > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > This patch depends upon the m48t59 driver changes in the preceding patch.
> >
> > Changed since v1:
> >  - Initialize yy_offset in struct m48t59_plat_data.
> >
> > Changed Since v3:
> >  - Re-ordered defconfig symbols.
> >  - Added reviewed-by tag from arch maintainer.
> 
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> so it still can make it into v6.13-rc1 via RTC?

It is now applied, it is going to conflict with your tree as it didn't
cleanly apply. I don't think this is going to cause issues but I'll let
it sit in linux-next for a few days before sending to Linus.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

