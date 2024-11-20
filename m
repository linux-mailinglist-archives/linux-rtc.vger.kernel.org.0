Return-Path: <linux-rtc+bounces-2579-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7181B9D43D4
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Nov 2024 23:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37F4928309B
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Nov 2024 22:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2EF41BC061;
	Wed, 20 Nov 2024 22:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kBThlPvy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEBF13C3D3;
	Wed, 20 Nov 2024 22:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732140791; cv=none; b=qS7py6i1PaSvR1uAT8w3GHfnru7ULTFjK6kj5Ytde/Wube4j/LGHdYYULPB1zPdEV9dBGg0yX/ZZ8raqKJEOQjbt2NvjiasxMa1mYrwaHEwN5FoTh9iwGtM5yAcWV1NoOHxBinUBs/gx7ESWrrslf6B17yIdRl5t7Bl1k+F0rSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732140791; c=relaxed/simple;
	bh=+jYr99kgIwGKAChE/kXX2oMx4HkeCBcqe3sYX6Nq9+U=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QGOJLjfdh5NTcFYN3hU6JyQn1N2Ils7g5nSD2g/3h/He26WTMMBeI9jWaAXMbi3KgLugjvp3Dilp+xTpE1v06wJpyX2lNCSNntISey+w/dsikcA7hRHiOwwWipi/rYXVZgmZjGVFNUnbEJUM3jFatCblNrDLJs61LpMSzDTL2T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kBThlPvy; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 4149C1140160;
	Wed, 20 Nov 2024 17:13:08 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Wed, 20 Nov 2024 17:13:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1732140788; x=1732227188; bh=uMjFyXdDEF2OdP6Uyzjv1RKYNI4wBqQvwHY
	YDfBysQQ=; b=kBThlPvylNJYa27uj4TOOWP7UE/8wI5QU6//4j1CHg7u0S3Aqu4
	sbCEyNV+oZ3vvS12vPR+Me3obJz23+soRW7AXG/H/zicHOEyLS+jT1XLLNyAsMp/
	iaPVNciKXpMMeXLfrcbWqwJWIPahtVwpwIpO4T2eKW77qDk3HWBFb/k7tfomI1K8
	h3C0CymQaEHW6knt6womlnsaMF9hVn5w0aVqZEegrMaD3Ji4SGx55AvxtcJBKoYn
	h2rWL9yPqukFztfv61tf/UG/YrckePXSCmFsnhbQqUvbKxlxAmj0FnkBLNqQgT3V
	zadnWOKg1zOY66MFB4DdbLe5/OBNYCwV2oA==
X-ME-Sender: <xms:8l4-ZzNv0sMNKc6x0cqErTjqsIYtKmXagStViS2taDzyB4agwd4V0Q>
    <xme:8l4-Z99Ge3X3wWFv1CE5BLwGkRtI3I9kelpFDqdxKCutY6LggNeM8CTPQhWJGHiqc
    lJs2i_KVwo06OZZdrs>
X-ME-Received: <xmr:8l4-ZyTfHXaUhLVjsg8rY1r2C32kqvKEeozM8B_HRi09OMnuKNbgURpB4rZiGK7GxZDfRjWWi9dm6x5Utrs_vjP3SnA_EIdY2I4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfeeggdduheeiucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:8l4-Z3vGRVPUIUZs1s6-mKlVOQJnjgylWywUZUqJv4glC3Cy_Cvwnw>
    <xmx:8l4-Z7fIrwT7Deirs53qPYdiJL-a1QSkOcPOoo1C3OtbCQxG2IeXZA>
    <xmx:8l4-Zz18xyg1rI4rGxF7nyMyxDbGtfgN4OxPzgHVgaqVpRs1jNuZvg>
    <xmx:8l4-Z39FaHe2v4QzSL9y1JcIDXsREXS65HboVgBOX6hpCidQKHJCAA>
    <xmx:9F4-Z_57Fd1vKEmimFSHMSs4kESqvvfmVWrgZC5wMYWjvjs1rdO0AM12>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Nov 2024 17:13:03 -0500 (EST)
Date: Thu, 21 Nov 2024 09:13:32 +1100 (AEDT)
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
In-Reply-To: <173193673970.37302.12055966881506116157.b4-ty@bootlin.com>
Message-ID: <8140c873-3456-1469-8bc5-2e94d409cf8a@linux-m68k.org>
References: <cover.1731450735.git.fthain@linux-m68k.org> <665c3526184a8d0c4a6373297d8e7d9a12591d8b.1731450735.git.fthain@linux-m68k.org> <173193673970.37302.12055966881506116157.b4-ty@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Mon, 18 Nov 2024, Alexandre Belloni wrote:

> On Wed, 13 Nov 2024 09:32:15 +1100, Finn Thain wrote:
> > Instead of hard-coded values and ifdefs, store the year offset in the
> > platform_data struct.
> > 
> > 
> 
> Applied, thanks!
> 
> [1/2] rtc: m48t59: Use platform_data struct for year offset value
>       https://git.kernel.org/abelloni/c/a06e4a93067c
> 

Thanks, Alexandre. Would you also take patch 2/2, please? Geert has sent a 
reviewed-by tag for that one too.

