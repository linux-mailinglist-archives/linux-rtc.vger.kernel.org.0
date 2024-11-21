Return-Path: <linux-rtc+bounces-2594-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA3A9D555A
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Nov 2024 23:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72EFA1F23497
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Nov 2024 22:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC451D14E4;
	Thu, 21 Nov 2024 22:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WrrsqeW7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C642C1ABEB0;
	Thu, 21 Nov 2024 22:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732227855; cv=none; b=t+IgFd96xTuG+Fl8EN9oWfxRxjpmLM5qFM/6SqB5TcJUpG3NTT7Wued23gKXQhVXH1R/T99eFg+BOzV5P2Jj5tWcNGs6w1e+d/4/BuphS0syBsP6wQzaQgW6f63U+1vMiS/gmLzaWFoaTHXsAQzPXYPkmqTkGFXvUCS7Q+d3Q1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732227855; c=relaxed/simple;
	bh=LbRgVvQZxj7aaCo9OJqHQ/d5TAe2/ZIQDNFZtvSaUYw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=h8elCvETyQNOHC9BdvdTb1waTT/XshyMOciBS8kwDH0PW97N40vxFsGfvovi0idt4jr2C4MhtJMlxwvuKSsk4LsDmym2NOzwpf63/IP88V+MOpfT3l7XWM6wyUCOz3FkcRptIU/64+q65Ff+turoCpHaFETCmXosSsj38eCAnnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WrrsqeW7; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 9FF6511401BA;
	Thu, 21 Nov 2024 17:24:11 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 21 Nov 2024 17:24:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1732227851; x=1732314251; bh=MCnFKlB3Mx4i+GXy8Rv7vHneTCChY5/z+QA
	XzxW/ABY=; b=WrrsqeW7OWsHAoyf2UXMusNTBhrmKPtFCxTW+5HrJr+hljCj0qj
	n+Dk5yDtBgzrkwtRx0Lqb0XBT8TcNGRF+sNB1fWqZhjbfA/eCXhW4ZoXvwYsPX39
	lBpfdaRrOaunp/JwpUAWnU8ohZ4FHa6Vt5obsL+hThfCjIVYkAgBnrBwD7RS+FQ1
	wZOL0smneA1AgubhBWmKOdQd0F3gWwxc58VPVh8dLDmXgFwKxD+J6gbAEDL3QlE3
	zAJyZsg/SfwneZU5pzR5EJJmzNU2Z7W1X/l3LNU2etP0/SSDLgnTlTaV6bCwsQng
	t8DP45ioC4DEqXxAvsQIJ5TP0sohPqKVf1A==
X-ME-Sender: <xms:CbM_Z1dJchh0Jm26t8yK9bfDLcbItsqVnK5ItKXrn90wZpn2rOGY_A>
    <xme:CbM_ZzOAt2y9CXYORirjhzT9FIYXVATpRb49nGFL-XPcQcPHygvbjWkMBIwnF-6uo
    P0QjBsr1IRitnKnqyA>
X-ME-Received: <xmr:CbM_Z-i_s4eDrggCfVub5KWzPkbGlaIuN4WGf_htexFCdN96q_3FmGAXf39d0fYM7BAFPHD-CWQOmEvHZget1Evbbyu2OBRNxmI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfeeigdduheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeefieehjedvtefgiedtudethfekieelhfevhefg
    vddtkeekvdekhefftdekvedvueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhn
    sehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtohepuddtpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohho
    thhlihhnrdgtohhmpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorh
    hgpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthho
    pegrnhgurhgvrghssehgrghishhlvghrrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    dtgidtfhdrtghomhdprhgtphhtthhopehprghvohhnvgesrhgvthhrohguvghvrdgtohhm
    pdhrtghpthhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepshhprghrtghlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:CbM_Z--RtqQ1Y4Uj7-OYeVidoaJ8EnZwYBEoJTTe27Bzfpl9L_ARTA>
    <xmx:CbM_ZxuhcC9y9rO-XjiY3EfJldGI6Em_uXpgXyakzMpH-l5VK69Kwg>
    <xmx:CbM_Z9F2fdMJtSosO7BxLX6tIzwtlSP7jb-Rgu7lT6B3Pi8sS7ScFg>
    <xmx:CbM_Z4PudP6kHaJ2TCC8f7ZmWNJsMWDbInLA6qd6BSJJeF5uu3OxJg>
    <xmx:C7M_Z3IM4BwQDYJakFmKQCQBUVNYyi8P3uMVyeMa1mjfvOX10unwvr8X>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Nov 2024 17:24:06 -0500 (EST)
Date: Fri, 22 Nov 2024 09:24:36 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
    "David S. Miller" <davem@davemloft.net>, 
    Andreas Larsson <andreas@gaisler.com>, Daniel Palmer <daniel@0x0f.com>, 
    Michael Pavone <pavone@retrodev.com>, linux-m68k@lists.linux-m68k.org, 
    linux-rtc@vger.kernel.org, sparclinux@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 1/2] rtc: m48t59: Use platform_data struct
 for year offset value
In-Reply-To: <20241121174630cbc6cfa6@mail.local>
Message-ID: <e6dbc3e6-5305-7c00-90e7-3d06b1b5e459@linux-m68k.org>
References: <cover.1731450735.git.fthain@linux-m68k.org> <665c3526184a8d0c4a6373297d8e7d9a12591d8b.1731450735.git.fthain@linux-m68k.org> <173193673970.37302.12055966881506116157.b4-ty@bootlin.com> <8140c873-3456-1469-8bc5-2e94d409cf8a@linux-m68k.org>
 <20241121174630cbc6cfa6@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Thu, 21 Nov 2024, Alexandre Belloni wrote:

> On 21/11/2024 09:13:32+1100, Finn Thain wrote:
> > 
> > On Mon, 18 Nov 2024, Alexandre Belloni wrote:
> > 
> > > On Wed, 13 Nov 2024 09:32:15 +1100, Finn Thain wrote:
> > > > Instead of hard-coded values and ifdefs, store the year offset in the
> > > > platform_data struct.
> > > > 
> > > > 
> > > 
> > > Applied, thanks!
> > > 
> > > [1/2] rtc: m48t59: Use platform_data struct for year offset value
> > >       https://git.kernel.org/abelloni/c/a06e4a93067c
> > > 
> > 
> > Thanks, Alexandre. Would you also take patch 2/2, please? Geert has sent a 
> > reviewed-by tag for that one too.
> 
> I thought Geert would take it as this only touches arch/m68k
> 

That's quite understandable -- I accidentally addressed it "To: Geert". 
Sorry for any confusion caused.

Anyway, would you please pick up patch 2/2 also? After all, patch 2/2 is 
the reason why patch 1/2 exists. Indeed, 1/2 was written several years 
after 2/2, in response to your recent review of 2/2.

