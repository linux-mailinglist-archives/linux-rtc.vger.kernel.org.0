Return-Path: <linux-rtc+bounces-1420-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C68D791B769
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 08:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8D101C2324E
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 06:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1569613DDDA;
	Fri, 28 Jun 2024 06:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="QLV6Dsbf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c2g88xZA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B3247796;
	Fri, 28 Jun 2024 06:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719557658; cv=none; b=qEUFhnXqiGgYkZcro8rsqXMzZNZ0F48aQElAeFDyKWOt1Fp+Bo8LrdOpOjqLdxFA/V82HYtyDQhR0+1bRgmUlgURAvv9HxrkvFhrtLSeCZm5cOlg/JcXg1AZ9FeXmzyG5zGOSSrXGcQpEmDntYv/oRkGN4Yk/ODIAkXY4pweYvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719557658; c=relaxed/simple;
	bh=zfSz0is5O+7z7nHbjgK/76i8gGG86XfaLJlF2LxWdf8=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=RIdrIWAo9CnnZrAPSZeYXxkPggCgpSmifGbGWglwEiDhX35OkVE8dZWWFd+HVNnJIhnwwr/95v26zsJe8ge2ffDS1FPnNO3MHs9WY8iKTD/CtQMMTKpZ7U0eTxwAXGSKtUdHPseeWdKMnb6Epg8vJok0k1lf5sc9US9hciqxTj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=QLV6Dsbf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c2g88xZA; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 17AF11140339;
	Fri, 28 Jun 2024 02:54:15 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 28 Jun 2024 02:54:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1719557655;
	 x=1719644055; bh=nZ3XT1IJ0SGMSHVRm52lVFtFhYOgmeNJRzfxLuObfqg=; b=
	QLV6Dsbfhn/Dt6mSG3jwW4hAqGAAKL8ocRRYh3EIBW1Wwjq+zf4/XqpD4PntaWrq
	2BOFHCZaxdoxEIF3oJTg05PB3asKGDCkrrzQkmy0w54VBtoAJO3c0J98BU3A0qb7
	RHjsiaBzKcN4qJxYMG8NUUSkMTRssq5vYzuu97BtOJUx1hKPpPAUJf8BNNhR76J2
	/b9ahtRxBDCn9jI6yysi+2D1eZLXRsmNwP5+017SbNDBuIrpa6OFG7lk1M56FAFQ
	jIMj6PILgFkF8FZlo7I0GEiYkX7VkPCRqbur1Ha896HkRzzRGATR5IUzhA6m9Cr/
	JOykbioNevwrXu5wEqi3LQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719557655; x=
	1719644055; bh=nZ3XT1IJ0SGMSHVRm52lVFtFhYOgmeNJRzfxLuObfqg=; b=c
	2g88xZAkUAFAOOoQ0dh2YPpcnFmRw/OYJtk3WOAsLox8E2SilRn3KC7GBe3nhhZV
	ihnIUc/JeFAH4slSinhvW6ZYMuywIMXG5+CjZYbmEceUELaO3TJD+K/PMYpNaM5h
	X6coPxyH7DdrsM70gK0kRcEda7iEwLgMP5gsgVqPGClh0xu6uAnfZdjZ4WaMvTzx
	E2EtBKRjzCufNPftajk+D1Cz/LDyPqU7g8SQN9ciXdgfFDc+MB4NK2Iq9P7q0nIh
	KI7W5Otw+BG65E2DCb3V6MzPb9cYa6Fa3YqY6v5sxYB7h7eboKSVKDgyYD2fppyg
	ytWIiFMzkcqkurpdDRxXQ==
X-ME-Sender: <xms:Fl5-Zq8Rq6ssd0hSLkSFljZ6nGKLh8ZYEgIhK4Vst3Y2ozcDo7NZjA>
    <xme:Fl5-ZqvdAyHIxUy93X4xgrPBPvgrT2j98OJuBv7_ncTmk-za2sG2EPqiBb9UcKmA4
    KG03aZ76VqTuWS_Aoc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtdehgdduudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:Fl5-ZgBc0SJBH5-_y-2QsXWaLhsD5NjedIolCZHsNILLvjFys9nyPw>
    <xmx:Fl5-ZieYrwAXxNwsRb0R28vgDkw-erLHNLXtxURddGTjs9prMJ_OFA>
    <xmx:Fl5-ZvOWrl_WWAVL38xGlOy-H3TmlQr_TRcewpgzgy427vV9yTDk2g>
    <xmx:Fl5-Zskz3_sbwxJBv4Mi-KUO0OAS0Jb7cvwZpeiFzsJ5LNUc0VoPDQ>
    <xmx:F15-Zq1AW5dzcXMmbvIC8HIC3DpxbKGx6Z8znh4C3Api3CnhCoXedEFp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C7583B6008D; Fri, 28 Jun 2024 02:54:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <67ae5c7b-18bb-47c4-b0ee-ceaf397ffe8d@app.fastmail.com>
In-Reply-To: <d8dea6f3123face56bf36d7df3a8eb1975ac214c.camel@phytec.de>
References: <cf6ac9542f58a33b146ad7b0f5577e1dff3becab.camel@phytec.de>
 <20240627224321db4557b2@mail.local>
 <1d82ecbb-c9fa-49e0-8432-7fd152e01440@app.fastmail.com>
 <d8dea6f3123face56bf36d7df3a8eb1975ac214c.camel@phytec.de>
Date: Fri, 28 Jun 2024 08:53:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Stefan_M=C3=BCller-Klieser?= <S.Mueller-Klieser@phytec.de>,
 "Leonard Anderweit" <L.Anderweit@phytec.de>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "upstream@phytec.de" <upstream@phytec.de>
Subject: Re: Question about [PATCH] [RFC] rtc: y2038: remove broken RTC_HCTOSYS
 workaround
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024, at 08:33, Stefan M=C3=BCller-Klieser wrote:
> Am Freitag, dem 28.06.2024 um 08:01 +0200 schrieb Arnd Bergmann:
>> On Fri, Jun 28, 2024, at 00:43, Alexandre Belloni wrote:
>> > On 24/06/2024 11:41:41+0000, Leonard Anderweit wrote:
>> > > Hi,
>> > >=20
>> > > I found this patch [1] which is necessary for a project I'm curre=
ntly
>> > > working on. I'm using phyboard-wega [2] with an am335 ARM SoC whi=
ch I
>> > > want to make y2038 proof.
>> > > Is there any reason it was never accepted?
>>=20
>> Sorry for not having replied earlier. I'm definitely interested
>> in helping to make this work better, having spent a lot of time
>> on the kernel side of the y2038 work.
>>=20
>> Which combination of distro, libc and init system are you using
>> in your work?
>
> We have a Yocto scarthgap with glibc 2.39 and systemd 255.4.

Ok

>> Are you running with COMPAT_32BIT_TIME disabled? This is something
>> you probably want in order to better test for corner cases that
>> still use time32 kernel ABIs somewhere, but it still requires
>> adding a few more workarounds in libc and other userspace
>> sources.
>
> We wanted to, but this still keeps systemd from booting. We are
> debugging this currently.

My guess is that this is still an issue with glibc still relying
on time32 system calls to be present. I have not looked at it
in a while, but the most common time32 syscall that everyone
relies on is futex(). With COMPAT_32BIT_TIME disabled, you
need to call futex_time64() instead even if there is a NULL
timeout. There may also be other time32 syscalls in use here.

The way I would debug this is to run a 32-bit scarthgap
userspace in a chroot on a 64-bit kernel with COMPAT_32BIT_TIME=3Dn,
to see what kernel interfaces are missing while still being
able to run normal 64-bit debugging tools.
You can do this either on an arm64 or x86_64 host, whichever is
easier for you to get set up.

I don't see anything in systemd itself that relies on time32
syscalls, it does not appear to directly call futex or any
of the other ones, and the seccomp filters in there look like
they take time64 syscalls into account correctly.

       Arnd

