Return-Path: <linux-rtc+bounces-2113-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA649993FA6
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 09:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E325F1C23C10
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 07:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8F91FEFA3;
	Tue,  8 Oct 2024 07:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="L+3Xg4M8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D846919A2B0;
	Tue,  8 Oct 2024 07:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728371721; cv=none; b=VagjXEUCY2u/jtx4srqqKrJWnVeSubb7ybN65K1U4UZCYYKuq72v0D48MZ/5qsI4G/WTNi4pBGiZ1IqFSFXpx8voQh/OescNTXtZh2uoBIAJPreZ0wrEKLwD8jH2lq10R+rU+i1A+GkscdFCxkviOOih+XHxeFFHSLvkcwofK80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728371721; c=relaxed/simple;
	bh=8E9AaLmx7fVplfa6u1AfrLqVuG7I6gatuElFtOpr8H4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=R/eEbe3ikWKAznQDUrzioOKHtr/63GiQjsLxjWwGt3tIg/hkc7LBJkxr/dqyi6R745KwNX0gZvu5U/GmDQWu5V7J8Gqs3h9l9NAGu3+CleIbFRwDRgKs6eLZP07+8RmN0PyIRrRALGFF5sBQBltmP9bL3y9PmW0/mNzj/ksA26o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=L+3Xg4M8; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id E00BF138066C;
	Tue,  8 Oct 2024 03:15:17 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 08 Oct 2024 03:15:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728371717; x=1728458117; bh=P+Rn665kS6/Uo8T3gfPmWgMxFRiJ
	JuIwVn2JxtgfWcs=; b=L+3Xg4M8kwQlRFcw+NUWLSW4UFIc7OQrLf1iQmkx0GF0
	Z7VZ9FA92853mbTytpnxyWS0RAL/WNk1CJ7SVci78pS+iikDII02Zlo+nHV+0w2w
	SYqXw1+lbts0WGgsjsrjvsasKiXsc25EDvTXJ+IH0HX4VY5XJJ+KqPsccH2z0gI3
	dStokUTLCHfjrw+Vw4pNbvZvj8Ooonpyhn6fTbs5gA72zjkapFjMvsYfWfhkaNbp
	mNhI0NQGqhuRnxX3thjwiypagYcAHgpi/0AyfcDXFVphzG1jY/ZWrA38jomDP44B
	Wu8P8kTLxbKDyOpK3gMpprJ7MajCCASctgZ2iBzJjA==
X-ME-Sender: <xms:BNwEZzZEzfd7LzVZM7q2_WJzMWn-VfUo7h35cA2L5CwAROjGbrrNgA>
    <xme:BNwEZyarbOvJ3GdNcL3wPWLoZ2a2prCP8VBuoB-56GBANDP2mw7sMcYG2SAhA8MqV
    lBdxx-Wx9PKZEM0p48>
X-ME-Received: <xmr:BNwEZ19bcZHAzRVptkw2WRHMoB8oUdzlgQJKzekz6r_CP3doGEN3GG66ShdmuP_EQUt_VZc4qUTsi6IZqtVbUBpBrIZgSOlxp7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeftddguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesmhdtreertddtjeen
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepleefkeelgffgteekudekveffgfdvueehteff
    keeltdefjeetleeijeetheegleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgs
    pghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrh
    htsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopegurghvvghmsegurghvvghm
    lhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtghomh
    dprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgt
    ohhmpdhrtghpthhtohepuggrnhhivghlsedtgidtfhdrtghomhdprhgtphhtthhopehprg
    hvohhnvgesrhgvthhrohguvghvrdgtohhmpdhrtghpthhtoheplhhinhhugidqmheikehk
    sehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhprghrtghlihhn
    uhigsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:BNwEZ5qt0qdmMPJzctIB2omuB_dyj6AqK2PpjdvyFxV_NwY0RCt7YQ>
    <xmx:BNwEZ-oK6I6B8CU38uWXtjRRxY2CZoKBKGpOK5QojJEE7a2YMetZdg>
    <xmx:BNwEZ_R9Oc-gNs3yTS8H-v9OtLWVynJ5E-KCIDdMEt4XIzI542rQeA>
    <xmx:BNwEZ2pqMQrLD9Xk8WRl06XI341pX-JVTswJbub2yrXeXCJs1pTXBA>
    <xmx:BdwEZ91otshq1GzvqwtdnxU6yxra3PX4dnbwsqv_6nOoG_eH0vl-yY1T>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Oct 2024 03:15:14 -0400 (EDT)
Date: Tue, 8 Oct 2024 18:15:25 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
cc: "David S. Miller" <davem@davemloft.net>, 
    Andreas Larsson <andreas@gaisler.com>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Daniel Palmer <daniel@0x0f.com>, Michael Pavone <pavone@retrodev.com>, 
    linux-m68k@lists.linux-m68k.org, linux-rtc@vger.kernel.org, 
    sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rtc: m48t59: Use platform_data struct for year
 offset value
In-Reply-To: <CAMuHMdXsekSXJOEf6chaMBHiRt_4nNvKYOOmQVC=ODg0qccKKA@mail.gmail.com>
Message-ID: <95dac6fa-a93c-f5ce-355f-eb1ce7640cdb@linux-m68k.org>
References: <cover.1728340717.git.fthain@linux-m68k.org> <fb25eb97521363ab8a18d2fd499cb4c76209cebf.1728340717.git.fthain@linux-m68k.org> <CAMuHMdXsekSXJOEf6chaMBHiRt_4nNvKYOOmQVC=ODg0qccKKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-869706760-1728371725=:12171"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-869706760-1728371725=:12171
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Tue, 8 Oct 2024, Geert Uytterhoeven wrote:

> Hi Finn,
>=20
> On Tue, Oct 8, 2024 at 12:43=E2=80=AFAM Finn Thain <fthain@linux-m68k.org=
> wrote:
> > Instead of hard-coded values and ifdefs, store the year offset in the
> > platform_data struct.
> >
> > Tested-by: Daniel Palmer <daniel@0x0f.com>
> > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
>=20
> Thanks for your patch!
>=20

Thanks for your review.

> > --- a/include/linux/rtc/m48t59.h
> > +++ b/include/linux/rtc/m48t59.h
> > @@ -56,6 +56,9 @@ struct m48t59_plat_data {
> >         void __iomem *ioaddr;
> >         /* offset to RTC registers, automatically set according to the =
type */
> >         unsigned int offset;
> > +
> > +       /* YY digits (in RTC) are offset, i.e. year is 1900 + yy_offset=
 + YY */
> > +       time64_t yy_offset;
>=20
> time64_t sounds like overkill to me...
>=20

A vestige of an earlier experiment. Sorry about that. I shall send v3.
---1463811774-869706760-1728371725=:12171--

