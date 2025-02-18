Return-Path: <linux-rtc+bounces-3221-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 241F3A3A087
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Feb 2025 15:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E384517508D
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Feb 2025 14:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF31626AAB0;
	Tue, 18 Feb 2025 14:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="AXOM7TQM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jhxo2lzX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACD226A0F4
	for <linux-rtc@vger.kernel.org>; Tue, 18 Feb 2025 14:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739890309; cv=none; b=FML0OTLtqfbhnVYrQN3fhdjSXurinWDUIbcmnoSoaPnvFhPD5EoO8oJrtrEawPna4+mB2ySkXprtvdtgF6/uXgvRMbRO43mdhELn+5GkFOdqZnR628x0/rhK7FFVHInT/+lpHUs4ewoQF8FPm2naZf6vLzofrg0/e+oiCh15Gvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739890309; c=relaxed/simple;
	bh=3XJZWNwBHCmQhrISr7GbRbwHEIH+voJxNvd93Nnu6SE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bbu1XEY3VDTqkY3x9fM+uh5GEgce6Da03uwgtr6zWVUKT7HgqUE213vLBSNUcT1OloYWhTCdwe041jq232U8Bw4u4qqyI3oc/8MgDtvy8q9A5LCwnZdnuEoQOLtGv8V7Zppj/xKKXFg8sRJgG4G+C5kdn3pE+uCZa8hbxSJbTYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=AXOM7TQM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jhxo2lzX; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id E5FCF1380DFE;
	Tue, 18 Feb 2025 09:51:44 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Tue, 18 Feb 2025 09:51:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1739890304;
	 x=1739976704; bh=oh0xb9l8zNtQAtYfXHavEPeG67AhcVqsA7AEXiCLDjA=; b=
	AXOM7TQMk9y4RHGqanUmSCeC4bXF7mVFJlGpjm1WD/+TS2eaMCPzQmuJykLLq83p
	tR/WDKAZrGrnnFxmFrrBIWGENzZBClGRAx1jNvQzHMn3TgLk2qarHiCUjn6c2h9w
	LO6OCVH7peKzaRs2BNIGL7zvFOzrOR/L58qe1Yyoqrpg4kdX8gGWfO4T6DzDI5Az
	+xO5Ee6OCM17m4e4xdmFfoWBXQ8RgUyVazL/0hzifUE7APjwvbeB/9EXnc375llF
	tE5m/L/ORkQF65ZwTrQHnJE5FI45lxuTRCt5PZ3L2OAIPuzGxObCxQJIq/hzEVJW
	7a2JevSnfUgLCa8RaKbV9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739890304; x=
	1739976704; bh=oh0xb9l8zNtQAtYfXHavEPeG67AhcVqsA7AEXiCLDjA=; b=j
	hxo2lzXvo2LJJuDMMcqYEiSyZU83AZtWz8QZ2wqyOT7Lal9vaDIORlSnjpQZ3HLF
	JW5nUlgTjw2PG+mNjRthyARDx+dJA9LSxY01wYZI/wghO+DHX/cD+zEch5WOpfpj
	mmJbwD9X/Q8oV+icBqxeHYqFXkiA4B8QKz0HtWCpv9PPVPg2EUn/fmLS6uRbzMCz
	ccjDMuSgUs6QXOeZQv0XJb975AddNdKCFS/wJFU1nMrWbjU3xZwjuwNfO5jQd9wF
	sWpvgCgLADlbQa+yjIabpgEGwvEtGVZxTulOU7fDuJQ5X4pzYrKBNxtwLEyCyUkT
	CDlRup4Y9A0se9c7lGyFw==
X-ME-Sender: <xms:gJ60Z7Ju4FbLXz1P6Aecbbi_0HXbwqqsivB-FR0sjFYUa1zGyVOYlA>
    <xme:gJ60Z_IpEVEuSEzsETsWLTL8mF2OcPFCb4N8bfUDZRUapQFYHhcjtfyl1KHvZ6V9g
    5zWG-dSXuhA8BF5vvo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiudehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeekvdeuhfeitdeuieejvedtieeijeefleevffef
    leekieetjeffvdekgfetuefhgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdp
    rhgtphhtthhopehtohhlvhhuphhoshhtuhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    eplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:gJ60Zzugdm6uODk_xlsCqMghNrVjHdH9cCPk10jWMgAfk81O_4b3ug>
    <xmx:gJ60Z0anvsFb7PqdQPe4T4gGOrUGQaVwqxFIj6Xhilebj2rPDYDu2g>
    <xmx:gJ60ZybhQe1twyKHRO7dE57XWS7nKLoeNYzpDgX8e-5mbpA9ZXX08A>
    <xmx:gJ60Z4CdQzm-0kVxCeOKg5VKWiB1-Y-77iIAJO_PlNCnJ3BcArtf6A>
    <xmx:gJ60ZxmtnWH6tMcYsnXwxzN9RRcItrsb751MIeJMfUqIRfczYaCqInT->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 87DC32220072; Tue, 18 Feb 2025 09:51:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 18 Feb 2025 15:51:24 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Cc: linux-rtc@vger.kernel.org
Message-Id: <8163c8e0-58d6-44a9-a5a2-6478fe4b0ff8@app.fastmail.com>
In-Reply-To: <20250218133039de7b063d@mail.local>
References: <20250218111150.3024-1-tolvupostur@gmail.com>
 <CABhNV21ZptxH9d4NyPo1xivS0GAXNsoLMLpPSRAsT8h5CX9hDw@mail.gmail.com>
 <20250218133039de7b063d@mail.local>
Subject: Re: [PATCH] rtc: class: Fix max epoch in rtc_hctosys on 32-bit systems
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025, at 14:30, Alexandre Belloni wrote:
> On 18/02/2025 13:45:56+0100, Einar J=C3=B3n wrote:
>> Hello again
>>=20
>> On second thought, removing is too general.
>> But it's still very much broken. Is there any reason why this was not
>> merged?
>> https://lore.kernel.org/all/c5e8ab50-aacb-4651-8893-a6dd9edcd155@app.=
fastmail.com/T/
>>=20
>> Any thoughts on how this should be handled?
>
> The first step is to convince Lennart that mandating RTC_HCTOSYS xwas a
> bad idea, the second step is to let userspace set the time instead. The
> kernel can't take the proper decision because it simply doesn't know
> whether userspace is TIME64 ready or not.

It's been seven years since the you added the workaround, and
there are a few things that have changed in the meantime:

- most distros that use systemd have stopped supporting
  32-bit targets
- most distros that still support 32-bit have moved to a
  64-bit time_t
- 2038 is only 13 years away instead of 20, adding to the
  urgency of having future-proof default behavior.

I don't know how many 32-bit machines are affected by the bug
where they return a random time, or if they are more or less
common than in the past.

Probably some variant of my old patch is still appropriate
now.

     Arnd

