Return-Path: <linux-rtc+bounces-2097-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AAC98F9DF
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Oct 2024 00:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 083022824A4
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2024 22:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF241ABEC5;
	Thu,  3 Oct 2024 22:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IZy+sljm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116EE147C96;
	Thu,  3 Oct 2024 22:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727994670; cv=none; b=kWV7959mvMLPeAC7VsgUTxRK7sP6pYRSCmE7gGVhLH1BKen/jWluyRjZ8dbMyDxSxah4XPqpbv2Mc9fUZrBe1NA2q1I1ro8aHCbZIhr/sQ0VeYFNTO6eqGujlLyer00Oq46GEnwTDn805NL5cHDwtxd5wldLXhFF6r7a7y1F+C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727994670; c=relaxed/simple;
	bh=UomqrckekYmaaKM1Y3OC6/qCau794UghQ9fvyH9bZwA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pU8GictHNGluOVdfE2O5fr3IioccoUk0kwFrL8lNsUhYIBdxfCWUUQ3nxk85Rx9SCVrL5BBbRkbxmRNYpu9jfsAUyvKDdo4oFew2P6sb0eDL5588YjxYtTafU/SgtCW4uMGH+uzUDK1/r8k57Mwwg5bhk4EminaTQWv1TC75s+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IZy+sljm; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 264C211401CA;
	Thu,  3 Oct 2024 18:31:07 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 03 Oct 2024 18:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1727994667; x=1728081067; bh=0U//cBAsnUMwdEla3vWcIAmCXavW
	KwxI0V+UV6Sb9xA=; b=IZy+sljm3xxLQnZiOcZfmjtd+/eEMYcsZGy62Qz1E6Ra
	BofxNjfC1lWhuXSgG7cWMcX+UsqFkCxUPtRduF8CQiPs9oCD0E+PutOeoc7Xy7NS
	hFMG+1mVDIwiMqiQrWMR0k0lGvzsADzyq0PsZfptoRJLxjkStSHZ77YC2+CgyYnW
	1aTb3paOLpQhBXyRPkvVBDzGjauTXHhAAGRjR0yPhoFVi2+u963uEULj0bqApU1h
	HgemKQea/oUlJizSo0sRm+7yBbFyQF4GvqGXsykmCXropzK14wxThGfBXzf3pdlJ
	1EFlRNeDjIfdtyul0NW6wWAsz+9AamF5Lyt/14c4yw==
X-ME-Sender: <xms:Khv_Zqxib4rEjO4ev9O12MaW_BBSbxEo48QsFA7V5fykGLBIjOCkAA>
    <xme:Khv_ZmSnmWqV_W1lh_VqhBqto_RSKe0hpJ7rUqTux4DXvOmfOxxber3w4JQ5odd6P
    xmz3Jli-8U2hc3CbC0>
X-ME-Received: <xmr:Khv_ZsV1YG86u7gOy83_3V8IYvQUe_7z_gwVfZYV0_hYtZheLOgMk_FbAem6-v-tx3JrpDcV3BJ17fF8w1AimdVDjoDIT2moIVY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvvddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeff
    ffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggp
    rhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhgvgigrnh
    gurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghgvvghr
    theslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepuggrnhhivghlsedtgidtfh
    drtghomhdprhgtphhtthhopehprghvohhnvgesrhgvthhrohguvghvrdgtohhmpdhrtghp
    thhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Khv_ZgiPYMLT_ySCcV3KDFH4mSaCM7ETtY9mDC6slFoFhCqrcQmLng>
    <xmx:Kxv_ZsDaQYtZuNfeBayztZxrMFlunvXW5pjNoNhaqzRzGdeSZbr2Vg>
    <xmx:Kxv_ZhJAeR_MpGgOPQeFhk-s7-Qxsj87X9yAxJQjkklfX08vhLhjgA>
    <xmx:Kxv_ZjAFZnX74vaADpkzx-Kk3PKFOZrK6iv2jux3d4JNdjEyFHIVqA>
    <xmx:Kxv_Zu3KaubQZN2Y2or5_-pfeJE_m-YjMwBfUmWzbFndDrbYlecI4D-W>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Oct 2024 18:31:04 -0400 (EDT)
Date: Fri, 4 Oct 2024 08:31:10 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, Daniel Palmer <daniel@0x0f.com>, 
    Michael Pavone <pavone@retrodev.com>, linux-m68k@lists.linux-m68k.org, 
    linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: m48t59: Accommodate chips that lack a century
 bit
In-Reply-To: <20241003081015363ed024@mail.local>
Message-ID: <63298bb6-2921-b57d-729d-21e83a945944@linux-m68k.org>
References: <cover.1727925802.git.fthain@linux-m68k.org> <f9eedf61f64906006f57ac88bdc160e55bc40c8a.1727925802.git.fthain@linux-m68k.org> <20241003081015363ed024@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Thu, 3 Oct 2024, Alexandre Belloni wrote:

> On 03/10/2024 13:23:22+1000, Finn Thain wrote:
> > The m48t59 driver is needed by both SPARC and MVME systems. Linux on
> > MVME uses 1970 as "year zero" rather than 1968 that's used on SPARC.
> > Add support for the MVME convention. Otherwise, the RTC on non-SPARC
> > systems can only read and write dates between 1900 and 1999.
> > 
> > Tested-by: Daniel Palmer <daniel@0x0f.com>
> > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > ---
> >  drivers/rtc/rtc-m48t59.c | 31 +++++++++++++++----------------
> >  1 file changed, 15 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-m48t59.c b/drivers/rtc/rtc-m48t59.c
> > index f0f6b9b6daec..e2d882ea5c2f 100644
> > --- a/drivers/rtc/rtc-m48t59.c
> > +++ b/drivers/rtc/rtc-m48t59.c
> > @@ -57,6 +57,17 @@ m48t59_mem_readb(struct device *dev, u32 ofs)
> >  	return readb(m48t59->ioaddr+ofs);
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
> > +#define YEAR0 70
> > +#endif
> > +
> >  /*
> >   * NOTE: M48T59 only uses BCD mode
> >   */
> > @@ -82,10 +93,7 @@ static int m48t59_rtc_read_time(struct device *dev, struct rtc_time *tm)
> >  		dev_dbg(dev, "Century bit is enabled\n");
> >  		tm->tm_year += 100;	/* one century */
> >  	}
> > -#ifdef CONFIG_SPARC
> > -	/* Sun SPARC machines count years since 1968 */
> > -	tm->tm_year += 68;
> > -#endif
> > +	tm->tm_year += YEAR0;
> >  
> 
> I'm super happy to see someone working on this, while you are it, can 
> you use m48t59->rtc->start_secs and m48t59->rtc->set_start_time in probe 
> instead of offsetting tm_year in read_time/set_time so we can later use 
> device tree or any other mechanism to extend the range?
> 

Sure, I will look into it.

> It is super funny because I was telling Geert that I wanted to get rid 
> of this #ifdef CONFIG_SPARC two weeks ago at LPC. That could indeed then 
> come from platform data.
> 

I can't test any patches on SPARC, unless there's some way to do so using 
QEMU that would satisfy maintainers. (I rely on Daniel to test my patches 
on an MVME147 system.)

