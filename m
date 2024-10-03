Return-Path: <linux-rtc+bounces-2096-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE30898F9C5
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Oct 2024 00:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6B262818BD
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2024 22:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F75F1CBE82;
	Thu,  3 Oct 2024 22:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FENknH/N"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179811C9EDF;
	Thu,  3 Oct 2024 22:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727994027; cv=none; b=OnpRv5YVzWkskB1jWWgz00uExI+3dpC1MVpsIA7NhmvOFHPWtXaF0w28Y/2ti0+33WLJ+waknDK5kOie3sIdGhbY9qEOeMjcDZ+H2CNlpN3z8dq/GYnnLaHy5dcTwPXohZ/rhNfogKcwEBRiz7nKQJ9VquuCTpQT1HSy+89/Q5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727994027; c=relaxed/simple;
	bh=7LYQFIDtLFr7d9Q5dyKsMAdOCJcirF1lXxpH0IGSslw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bM9ObPF5k+ezN11sriU22BYBfDHg/hlHh2sic6VnDu4+iKp+A8iuAg7JYR/TP5UHPV7PnNSHDY+hBwu2fJNT9ADoN5uNpJTFyfKJ5cZQBGkm3wXL5sAFXtq95fioqWhfzjT1J4aPd1H8gMb4+XK3r5eoXehdsWB9nM3RnHqG3cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FENknH/N; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 38BB71380116;
	Thu,  3 Oct 2024 18:20:24 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 03 Oct 2024 18:20:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1727994024; x=1728080424; bh=Nbgtrgdb1TWm/96ogBiNPcnGSstA
	nopG1pGhc6/EHeY=; b=FENknH/NahQ1oHjt2iQup7pWk6jkYVXHeLZ4S8Gpxm3I
	H1YW9cba5yOi5z6Rb/rupcV+juScufkHH+6UULivxZBwEo0l9Pxsh7RmFy8GDbp2
	BhXBLPLRVLsKcI+WNFcs6vw27VPNl9rqvW6JJMAGcpVqfYiez+9hAkEbATFv3N1S
	yWAdhE2P08Z4bSMd9R5v7z978qMoGSnKY/6NBClkGII9FpUz+oRjGic5sf+IK8I9
	UANaYVTIXb87InhztTUdH1BhlQf4j5iPDBrJiGX4WXbwXEVdgcC/uqE6PsJxIkQ3
	15KCqFykZXaS3tlh8bxC68Vg01FQNpJGFBAYtUbJ7A==
X-ME-Sender: <xms:pxj_Zr2D7MLqbvydOl9AgrrvfWCzc3s_opx1j8WRFdbC1w2-PMGzTA>
    <xme:pxj_ZqEBQh3HyKS-IW6-XmpndWcAJllNNadT2sn1YmQL1jfOYgbsSrjrWCJSKPp0k
    sPmXv3O_Ived0HgDqU>
X-ME-Received: <xmr:pxj_Zr6vXdhaJ8poSquP3qpX25qzvM3ASapYeWaTTwF6KmlelgSXLafQfJsZzLMhHhV-EM4tmCAW_0mhzmYR0scgUOs6F6l07pw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvvddguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeff
    ffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggp
    rhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtse
    hlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghl
    lhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrnhhivghlsedtgidtfh
    drtghomhdprhgtphhtthhopehprghvohhnvgesrhgvthhrohguvghvrdgtohhmpdhrtghp
    thhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:pxj_Zg3001ewLJtjWL6OrqWdiHFzMeh6lCNO-FowELz_9V8nWiJB6A>
    <xmx:pxj_ZuFbwlBq_s4znTEKwK2MDuvzLcfvbotSZbck2moFv0ORcWr5Kg>
    <xmx:pxj_Zh_hn1NSKMkxNao9tBaWklTay1JUmWXAxjXDMFWihzD9KP633g>
    <xmx:pxj_ZrlFhhytuAKzVdKr_UTXhzYqwR8s3uRJBNL4vVT_cnf3MZUdoQ>
    <xmx:qBj_Zj5SJpSJShCho2ZBBEqr9RNTdz85McyFKRHJ2mMMn-brj3scClvd>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Oct 2024 18:20:20 -0400 (EDT)
Date: Fri, 4 Oct 2024 08:20:26 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Daniel Palmer <daniel@0x0f.com>, Michael Pavone <pavone@retrodev.com>, 
    linux-m68k@lists.linux-m68k.org, linux-rtc@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: m48t59: Accommodate chips that lack a century
 bit
In-Reply-To: <CAMuHMdWkcocokX7fgyt6baQdnr11F9a-apwNCAwTUf9Q2Ypauw@mail.gmail.com>
Message-ID: <0a0888fd-dc82-bc85-e1ad-6aebc9c450ff@linux-m68k.org>
References: <cover.1727925802.git.fthain@linux-m68k.org> <f9eedf61f64906006f57ac88bdc160e55bc40c8a.1727925802.git.fthain@linux-m68k.org> <CAMuHMdWkcocokX7fgyt6baQdnr11F9a-apwNCAwTUf9Q2Ypauw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Thu, 3 Oct 2024, Geert Uytterhoeven wrote:

> Thanks for your patch!
> 

Thanks for your review.

> > --- a/drivers/rtc/rtc-m48t59.c
> > +++ b/drivers/rtc/rtc-m48t59.c
> > @@ -57,6 +57,17 @@ m48t59_mem_readb(struct device *dev, u32 ofs)
> >         return readb(m48t59->ioaddr+ofs);
> >  }
> >
> > +/*
> > + * Sun SPARC machines count years since 1968. MVME machines running Linux
> > + * count years since 1970.
> > + */
> > +
> > +#ifdef CONFIG_SPARC
> > +#define YEAR0 68
> > +#else
>  +#define YEAR0 70
> > +#endif
> 
> This causes a change in behavior on other non-SPARC platforms,
> if any out-of-tree platform exists that uses this driver.
> 

I'm unaware of any need to support out-of-tree code. Do you see think such 
a requirement would be feasible somehow? Is this documented somewhere?

> So I'd rather use:
> 
>     #elif defined(CONFIG_VME)
>     #define YEAR0 70
>     #else
>     #define YEAR0 0
>     #endif
> 

That is a Y2K bug, right?

> > +
> >  /*
> >   * NOTE: M48T59 only uses BCD mode
> >   */
> > @@ -82,10 +93,7 @@ static int m48t59_rtc_read_time(struct device *dev, struct rtc_time *tm)
> >                 dev_dbg(dev, "Century bit is enabled\n");
> >                 tm->tm_year += 100;     /* one century */
> >         }
> > -#ifdef CONFIG_SPARC
> > -       /* Sun SPARC machines count years since 1968 */
> > -       tm->tm_year += 68;
> > -#endif
> > +       tm->tm_year += YEAR0;
> 
> Upon closer look, the driver uses platform data, so a better solution 
> would be to add the year0 offset to struct m48t59_plat_data.
> 

I agree.

> Another suggestion for improvement, not related to this patch, would be 
> to differentiate among M48T59, M48T02, and M48T08 by using 
> platform_driver.id_table and platform_device_id.driver_data, instead of 
> m48t59_plat_data.type.
> 

Yes, that's well out-of-scope I think.

